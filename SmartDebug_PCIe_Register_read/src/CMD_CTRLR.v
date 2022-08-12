///////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------
//                                                                 
//  Microsemi Corporation Proprietary and Confidential
//  Copyright 2017 Microsemi Corporation. All rights reserved.
//                                                                  
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
//  ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
//  IN ADVANCE IN WRITING.
//
//--------------------------------------------------------------------------
// Title       : <cmd_ctrlr>
// Created     : <June 2017>
// Description : This module receives commands from UART, initiates  
//               CoreAXI4DMAController and transmits clock cycles taken
//               to  complete the dma transfer. This module also initiates
//               the pattern generator and checker logic to initialize or
//               check the memory with the selected pattern.
//
// Version     : June 2017  , Intial version
//               August 2017, added Memory pattern gen/check logic interface
//
// Hierarchy   :
//               cmd_ctrlr            <-- This module
//                           
//--------------------------------------------------------------------------

module cmd_ctrlr( 

//global signals
 input             clk_i,
 input             resetn_i,

 //UART IF
 input      [7:0]  uart_data_in_i, 
 input             uart_rxrdy_i,
 input             uart_txrdy_i,
 output reg        uart_oen_o,
 output reg        uart_wen_o,
 output reg [7:0]  uart_data_out_o,

 //Memory Pattern genretor/checker interface
 output reg [2:0]  pattern_o,//pattern to generator logic
 output reg        mem_init_o,
 output reg        mem_test_o,
 output reg        mem_read_o,
 output reg [16:0] mem_size_o /*synthesis syn_preserve=1 */,//multiples of 2KB size
 output reg [31:0] mem_address_o /*synthesis syn_preserve=1 */,
 output reg [31:0] offset_data_o,
 input             mem_init_done_i,
 input             mem_test_done_i,
 input             mem_test_err_i,
 input      [31:0] err_loc_i,     

 //Memory read interface
 input             mem_read_status_i,
 output     [11:0] ram_addr_o,    
 input      [7:0]  ram_data_i,

 //DMA clk count for throughput
 input      [63:0] clk_count_i,

 //COREAXI4DMA control signals 
 input      [1:0]  coredma_int_i,    //interrupt from CoreDMA
 output reg [24:0] coredma_size_o /*synthesis syn_preserve=1 */,//number of bytes
 output reg [2:0]  coredma_ch0_type_o,
 output reg [2:0]  coredma_ch1_type_o /*synthesis syn_preserve=1 */
);

localparam [31:0] LSRAM_ADDR_BASE  = 4'h3,
                  DDR3_ADDR_BASE   = 4'h2,
                  DDR4_ADDR_BASE   = 4'h4;

///////////////////////////////////////////////////////////////////////////////
// uart comands
///////////////////////////////////////////////////////////////////////////////
//0x31 -- DDR3 to LSRAM 
//0x32 -- LSRAM to DDR3
//0x33 -- DDR4 to LSRAM
//0x34 -- LSRAM to DDR4
//0x35 -- DDR3 to DDR4
//0x36 -- DDR4 to DDR3

///////////////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////////////
reg [7:0]  uart_cmd;
reg [7:0]  clk_cnt[7:0];
reg [2:0]  data_cnt;
reg        error_flag;
reg [7:0]  dma_size_4k;
reg [4:0]  uart_state;
reg [4:0]  uart_nxt_state;
reg [12:0] ram_addr_reg;

assign ram_addr_o = ram_addr_reg[11:0];
///////////////////////////////////////////////////////////////////////////////
// uart state machine encoding
///////////////////////////////////////////////////////////////////////////////
localparam [4:0]   uart_rx0       = 5'b00000,
                   uart_tx0       = 5'b00001,
                   uart_rx1       = 5'b00010,                
                   uart_tx1       = 5'b00011,
                   uart_dma_init  = 5'b00100,
                   uart_dma_wait  = 5'b00101,
                   uart_clk_freq  = 5'b00110,
                   uart_clk_count = 5'b00111,
                   uart_wait0     = 5'b01000,
                   uart_wait1     = 5'b01001,
                   uart_rx2       = 5'b01010,
                   uart_mem_type  = 5'b01011,
                   uart_mem_addr  = 5'b01100,
                   uart_mem_op1   = 5'b01101,
                   uart_mem_op2   = 5'b01111,
                   uart_mem_done  = 5'b10000,
                   uart_mem_read  = 5'b10001,
                   uart_wait2     = 5'b10010,
                   uart_mem_err   = 5'b10011,
                   uart_send_data = 5'b10100,
                   uart_wait3     = 5'b10101,
                   uart_user_data = 5'b10110,
                   uart_rx_wait   = 5'b10111;

//receiving commands from uart and transmitting clk count
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      uart_oen_o               <=   1'b1;
      uart_wen_o               <=   1'b1;      
      uart_cmd                 <=   0;
      uart_data_out_o          <=   0; 
      coredma_ch0_type_o       <=   0;
      coredma_ch1_type_o       <=   0;
      data_cnt                 <=   0;
      dma_size_4k              <=   0;
      coredma_size_o           <=   0;
      pattern_o                <=   0;
      mem_init_o               <=   0;
      mem_test_o               <=   0;
      mem_read_o               <=   0;
      mem_address_o            <=   0;
      mem_size_o               <=   0;
      offset_data_o            <=   0;
      uart_nxt_state           <=   0;   
      error_flag               <=   0;
      ram_addr_reg             <=   0;
      uart_state               <=   uart_rx0;
   end
   else
   begin    
      case(uart_state)
    
      //get first byte of command
      uart_rx0:
      begin
         uart_wen_o            <=   1'b1;
         if(uart_rxrdy_i == 1'b1)
         begin
            uart_oen_o         <=   1'b0;
            uart_cmd           <=   uart_data_in_i;
            uart_state         <=   uart_tx0;
         end
      end

      //send acknowledgement 
      uart_tx0:
      begin
         uart_oen_o            <=   1'b1;
         if(uart_txrdy_i == 1'b1)
         begin
            uart_wen_o         <=   1'b0;
            uart_data_out_o    <=   8'h61; //'a' char - ack            
         end
         uart_state            <=   uart_wait0;  
      end

      //wait
      uart_wait0: 
      begin
         data_cnt              <=   0;
         uart_wen_o            <=   1'b1;
         if(uart_cmd[7:4] == 4'h3)
            uart_state         <=   uart_rx1;       
         else if(uart_cmd[7:4] == 4'h4)
         begin
            if(uart_cmd[3:0] == 4'h4)
               uart_state      <=   uart_user_data;
            else
               uart_state      <=   uart_rx2; 
         end
         else
            uart_state         <=   uart_rx0; 
      end

      //get dma size
      uart_rx1:
      begin        
         if(uart_rxrdy_i == 1'b1)
         begin
            uart_oen_o         <=   1'b0;
            dma_size_4k        <=   uart_data_in_i;
            uart_state         <=   uart_tx1;       
         end
      end

      //send acknowledgement
      uart_tx1:
      begin
           uart_oen_o          <=   1'b1;
           if(uart_txrdy_i == 1'b1)
           begin
               uart_wen_o      <=   1'b0;
               uart_data_out_o <=   8'h61; //'a' char - ack
               uart_state      <=   uart_dma_init;
           end
      end

      //dma size * 4KB 
      uart_dma_init:
      begin
         uart_wen_o             <=   1'b1;                    
         coredma_size_o         <=   {5'b0,dma_size_4k,12'h0};
         uart_state             <=   uart_dma_wait;
         if(uart_cmd == 8'h31 || uart_cmd == 8'h33 || uart_cmd == 8'h35)
            coredma_ch0_type_o  <=   uart_cmd[2:0];
         else if (uart_cmd == 8'h32 || uart_cmd == 8'h34 || uart_cmd == 8'h36)
            coredma_ch1_type_o  <=   uart_cmd[2:0];
      end

      //wait for dma completion
      uart_dma_wait:
      begin
         coredma_ch0_type_o    <=   0;
         coredma_ch1_type_o    <=   0;
         if(coredma_int_i[0] || coredma_int_i[1])
         begin
            uart_state         <=   uart_clk_freq;
         end
      end

      //send design clk freq
      uart_clk_freq:
      begin  
         data_cnt               <=   0;
         if(uart_txrdy_i == 1'b1)
         begin
            uart_wen_o          <=   1'b0;
            uart_data_out_o     <=   8'd200;//clk
            uart_state          <=   uart_wait1;
            end
      end        

      //send clock counts
      uart_clk_count:
      begin
         if(uart_txrdy_i == 1'b1)
         begin
            uart_wen_o          <=   1'b0;
            uart_data_out_o     <=   clk_cnt[data_cnt];
            data_cnt            <=   data_cnt + 1'b1;
            if(data_cnt == 3'b111)                            
               uart_state       <=   uart_rx0;              
            else
               uart_state       <=   uart_wait1;
         end
      end

      //wait
      uart_wait1:
      begin
         uart_wen_o             <=   1'b1;
         if(uart_txrdy_i == 1'b0)
            uart_state          <=   uart_clk_count; 
      end

      //get pattern
      uart_rx2:
      begin        
         if(uart_rxrdy_i == 1'b1)
         begin
            uart_oen_o         <=   1'b0;
            pattern_o          <=   uart_data_in_i[2:0];
            uart_state         <=   uart_rx_wait;  
            uart_nxt_state     <=   uart_mem_type;
         end
      end

      //get mem type
      uart_mem_type:
      begin       
         data_cnt              <=   0;
         if(uart_rxrdy_i == 1'b1)
         begin
            uart_oen_o         <=   1'b0;
            if(uart_data_in_i == 8'h31)
               mem_address_o[31:28]   <=   LSRAM_ADDR_BASE;//LSRAM
            else if(uart_data_in_i == 8'h32)
               mem_address_o[31:28]   <=   DDR3_ADDR_BASE;//DDR3
            else
               mem_address_o[31:28]   <=   DDR4_ADDR_BASE;//DDR4
            uart_state         <=   uart_rx_wait;  
            uart_nxt_state     <=   uart_mem_addr;      
         end
         else
            uart_oen_o         <=   1'b1;
      end

      //get mem addr offet
      uart_mem_addr:
      begin        
         if(uart_rxrdy_i == 1'b1)
         begin
            data_cnt                   <=   data_cnt + 1'b1;
            uart_oen_o                 <=   1'b0;            
            if(data_cnt == 4)
            begin
               mem_size_o[16:9]        <=   uart_data_in_i[7:0];
               uart_state              <=   uart_mem_op1;
            end
            else
            begin
               if(data_cnt == 3)
                  //UART input is multiples of 4KB;
                  //multiply by 2 - for 2KB AXI bursts
                  mem_size_o[8:0]      <=   {uart_data_in_i[7:0],1'b0};
               else
                  mem_address_o[8*data_cnt[1:0] +: 8]  <=   uart_data_in_i;

               uart_state              <=   uart_rx_wait;  
               uart_nxt_state          <=   uart_mem_addr;
            end  
         end
      end    

      //initiate memory operation
      uart_mem_op1:
      begin
           uart_oen_o          <=   1'b1;                                
           if(uart_cmd[3:0] == 4'h3)
           begin
              uart_state       <=   uart_mem_read;
              mem_size_o       <=   2;//4KB mem size
              mem_read_o       <=   1'b1;  
           end
           else 
           begin
              uart_state       <=   uart_mem_op2;
              if(uart_cmd[3:0] == 4'h1)
                 mem_init_o    <=   1'b1;
              else if(uart_cmd[3:0] == 4'h2)
                 mem_test_o    <=   1'b1;
           end                        
      end

      //wait for completion of memory inialization/check
      uart_mem_op2:
      begin           
           mem_init_o          <=   1'b0;
           mem_test_o          <=   1'b0;
           if(mem_init_done_i || mem_test_done_i)
           begin
              error_flag       <=   mem_test_err_i;
              uart_state       <=   uart_mem_done;
           end                
      end

      //send acknowledgement
      uart_mem_done:
      begin
           data_cnt            <=   0;
           if(uart_txrdy_i == 1'b1)
           begin
               uart_wen_o      <=   1'b0;
               uart_data_out_o <=   8'h61; //'a' char - ack
               if(error_flag)
                  uart_state   <=   uart_mem_err;
               else
                  uart_state   <=   uart_rx0;
           end
      end

      //send error address
      uart_mem_err:
      begin
         error_flag            <=   0;
         if(uart_txrdy_i == 1'b1)
         begin
            uart_wen_o         <=   1'b0;
            uart_data_out_o    <=   err_loc_i[8*data_cnt[1:0] +: 8];
            data_cnt           <=   data_cnt + 1'b1;
            if(data_cnt == 3)                            
               uart_state      <=   uart_rx0;              
            else
               uart_state      <=   uart_wait2;
         end
      end

      //wait
      uart_wait2:
      begin
         uart_wen_o            <=   1'b1;
         if(uart_txrdy_i == 1'b0)
            uart_state         <=   uart_mem_err; 
      end

      //start 4KB memory read operation
      uart_mem_read:
      begin
         uart_wen_o            <=  1'b1;
         mem_read_o            <=  0;
         ram_addr_reg          <=  0;
         if(mem_read_status_i == 1'b1)
         begin
            uart_state         <=  uart_send_data;
         end    
      end

      //send read data
      uart_send_data:
      begin
         if(uart_txrdy_i == 1'b1)
         begin
            uart_wen_o         <=   1'b0;
            uart_data_out_o    <=   ram_data_i;
            ram_addr_reg       <=   ram_addr_reg + 1'b1;
            uart_state         <=   uart_wait3;
         end
      end

      //wait
      uart_wait3:
      begin
         uart_wen_o            <=   1'b1;
         if(uart_txrdy_i == 1'b0)            
         begin
            if(ram_addr_reg == 4096)                                       
               uart_state      <=   uart_rx0; 
            else
               uart_state      <=   uart_send_data; 
         end
      end

      //get 32-bit initial data for incremental/decremental pattern
      uart_user_data:
      begin
        if(uart_rxrdy_i == 1'b1)
         begin
            data_cnt           <=   data_cnt + 1'b1;
            uart_oen_o         <=   1'b0;
            uart_state         <=   uart_rx_wait; 
            offset_data_o[8*data_cnt[1:0] +: 8]  <=   uart_data_in_i;
            if(data_cnt == 3)            
               uart_nxt_state  <=   uart_rx0;    
            else                
               uart_nxt_state  <=   uart_user_data;  
         end
         else
            uart_oen_o         <=   1'b1;
      end

      //wait
      uart_rx_wait:
      begin
         if(uart_rxrdy_i == 1'b0)
         begin
            uart_oen_o         <=   1'b1;
            uart_state         <=   uart_nxt_state;
         end
      end

      default:
      begin
         uart_state            <=   uart_rx0;
      end

      endcase
   end
end

reg [31:0] clk_count2;
reg [31:0] clk_count1;

//register clock counts on dma interrupt
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      clk_count1                <=   0; 
      clk_count2                <=   0;
   end
   else if( coredma_int_i[0] || coredma_int_i[1] )
   begin
      clk_count1                <=   clk_count_i[31:0];
      clk_count2                <=   clk_count_i[63:32];
   end
end

//clk count byte alignment to send to uart
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      clk_cnt[7]                <=   0;
      clk_cnt[6]                <=   0;
      clk_cnt[5]                <=   0;
      clk_cnt[4]                <=   0;
      clk_cnt[3]                <=   0;
      clk_cnt[2]                <=   0;
      clk_cnt[1]                <=   0;
      clk_cnt[0]                <=   0;        
   end
   else
   begin 
      clk_cnt[7]                <=   clk_count2[31:24];
      clk_cnt[6]                <=   clk_count2[23:16];
      clk_cnt[5]                <=   clk_count2[15:8];
      clk_cnt[4]                <=   clk_count2[7:0];
      clk_cnt[3]                <=   clk_count1[31:24];
      clk_cnt[2]                <=   clk_count1[23:16];
      clk_cnt[1]                <=   clk_count1[15:8];
      clk_cnt[0]                <=   clk_count1[7:0];
   end
end

endmodule

