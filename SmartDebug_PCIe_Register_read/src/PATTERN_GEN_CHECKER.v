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
//-------------------------------------------------------------------------
// Title       : <pattern_gen_checker>
// Created     : <August 2017>
// Description : This module initilizes the memory with AXI interface with
//               different patterns and checks the memory against the 
//               selected pattern. It performs 256 beat burst AXI read/write 
//               operations  
//
// Hierarchy   :
//               pattern_gen_checker.v            <-- This module
//                           
//-------------------------------------------------------------------------

module pattern_gen_checker( 

//global signals
 input              clk_i,
 input              resetn_i,

//mem test signals
 input       [16:0] mem_size_i,//size in multiples of 2KB
 input       [2:0]  pattern_i,//pattern type
 input              mem_init_i,
 input              mem_test_i,
 input       [31:0] mem_address_i,
 input       [31:0] offset_data_i,
 input              mem_read_i,//to read from DDR3/4
 output reg         mem_init_done_o, 
 output reg         mem_test_done_o,
 output reg         mem_test_err_o,
 output reg  [31:0] err_loc_o,     
 output reg         mem_read_status_o,
 input       [11:0] ram_addr_i,//to read from buffer
 output      [7:0]  ram_data_o,//buffer data to UART

 //AXI Master IF
 // Write Address Channel 
 output      [3:0]  awid_o, 
 output reg  [31:0] awaddr_o, 
 output      [7:0]  awlen_o, 
 output      [1:0]  awsize_o, 
 output      [1:0]  awburst_o, 
 output reg         awvalid_o,  
 input              awready_i,  
 // Write Data Channel  
 output      [7:0]  wstrb_o,
 output reg         wlast_o,
 output reg         wvalid_o,
 output reg [63:0]  wdata_o, 
 input              wready_i, 	
 // Write Response Channel
 input      [3:0]   bid_i,
 input      [1:0]   bresp_i,  
 input              bvalid_i,	
 output             bready_o,
 // Read Address Channel 
 output     [3:0]   arid_o, 
 output reg [31:0]  araddr_o, 
 output     [7:0]   arlen_o, 
 output     [1:0]   arsize_o, 
 output     [1:0]   arburst_o, 
 output reg         arvalid_o, 
 input              arready_i, 
 // Read Data Channel
 input      [3:0]   rid_i,
 input      [63:0]  rdata_i, 
 input      [1:0]   rresp_i,
 input              rlast_i,
 input              rvalid_i,
 output reg         rready_o
 );

///////////////////////////////////////////////////////////////////////////////
// pattern types
///////////////////////////////////////////////////////////////////////////////
// 1. Incremental
// 2. Decremental
// 3. All 0's
// 4. All 1's
// 5. All A's
// 6. All 5's

///////////////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////////////
//AXI write/read channel states
reg [2:0]  waddr_state;
reg [2:0]  wdata_state;
reg [2:0]  raddr_state;
reg [2:0]  rdata_state;
//AXI write burst,transaction counters
reg [16:0] wburst_cnt;
reg [16:0] wdburst_cnt;
reg [7:0]  wdata_cnt;
//registers for AXI write data
wire [63:0] wdata_int; 
reg [32:0] wdata_int_u /* synthesis syn_preserve=1 */; 
reg [32:0] wdata_int_l /* synthesis syn_preserve=1 */;
//registers for comaparing AXI read data
reg [63:0] rdata_int;
reg [32:0] rdata_int_u /* synthesis syn_preserve=1 */;
reg [32:0] rdata_int_l /* synthesis syn_preserve=1 */;
//AXI wriread burst,transaction counters
reg [16:0] rdburst_cnt;
reg [16:0] rburst_cnt;
//to buffer AXI read data
reg [63:0] wdata_ram;
reg [8:0]  waddr_ram;
reg        wen_ram;

///////////////////////////////////////////////////////////////////////////////
// AXI state machine encoding
///////////////////////////////////////////////////////////////////////////////
localparam [2:0]  axi_idle    =   3'b000,
                  axi_valid   =   3'b001,
                  axi_done    =   3'b010, axi_mem_read = 3'b010,
                  axi_next    =   3'b011, axi_pattern  = 3'b011; 

//AXI fixed assignments
assign  awid_o    =   0;
assign  awlen_o   =   8'hFF; //256 burst length
assign  awburst_o =   1;     //INCR burst
assign  awsize_o  =   2'b11; //64-bit write
assign  wstrb_o   =   8'hFF; //256 burst length
assign  bready_o  =   1;     //AXI write response channel is always ready
assign  arid_o    =   0;
assign  arlen_o   =   8'hFF; //256 burst length
assign  arburst_o =   1;     //INCR burst
assign  arsize_o  =   2'b11; //64-bit read

assign wdata_int = {wdata_int_u[31:0],wdata_int_l[31:0]};
//write address channel
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      awaddr_o               <=   0;
      awvalid_o              <=   0;
      wburst_cnt             <=   0;
      waddr_state            <=   axi_idle;
   end
   else
   begin

   case(waddr_state)

   //wait for memory init command/signal
   axi_idle:
   begin
      awaddr_o                <=   mem_address_i;
      wburst_cnt              <=   0;
      if(mem_init_i)            
         waddr_state          <=  axi_valid;
   end

   //Initiate AXI write 
   axi_valid:
   begin            
      awvalid_o               <=  1'b1;
      if(awready_i)
      begin
         wburst_cnt           <=  wburst_cnt + 1'b1;
         waddr_state          <=  axi_done;   
      end
   end

   //wait for AXI write completion
   axi_done:
   begin
      awvalid_o               <=   1'b0;
      if(bvalid_i)
      begin
         //Address for next 2KB AXI write
         awaddr_o             <=   awaddr_o  + 12'h800;
         waddr_state          <=   axi_next;
      end
   end

   //perform next AXI write if selected memory size 
   //initialization is not completed
   axi_next:
   begin
      if(wburst_cnt == mem_size_i)            
         waddr_state           <=   axi_idle;
      else
         waddr_state           <=   axi_valid;
   end
    
   default:
   begin
      waddr_state            <=   axi_idle;
   end

   endcase

   end
end

//write data channel     
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      wlast_o                  <=   0;
      wvalid_o                 <=   0;
      wdata_o                  <=   0;
      mem_init_done_o          <=   0;
      wdata_cnt                <=   0;
      wdburst_cnt              <=   0;
      wdata_state              <=   axi_idle;
   end
   else
   begin
    
   case(wdata_state)

   //wait for AXI IF ready
   axi_idle:
   begin
      wdata_o                  <=   wdata_int;
      wdburst_cnt              <=   0;
      wdata_cnt                <=   0;
      mem_init_done_o          <=   1'b0;
      if(awvalid_o && awready_i) 
         wdata_state           <=   axi_valid;        
   end

   //perform AXI burst write
   axi_valid:
   begin        
      mem_init_done_o          <=   1'b0;
      wvalid_o                 <=   1'b1;
      if(wready_i)
      begin
         wdata_cnt             <=   wdata_cnt + 1'b1;
         if(wdata_cnt == 8'hFF)
         begin
            wlast_o            <=   1'b1;
            wdburst_cnt        <=   wdburst_cnt + 1'b1;
            wdata_state        <=   axi_done;
         end
         if(pattern_i == 3'b001)//incremental data
         begin
            wdata_o[63:32]     <=    wdata_o[63:32] + 2'b10;
            wdata_o[31:0]      <=    wdata_o[31:0]  + 2'b10;
         end
         else if(pattern_i == 3'b010)//decremental data
         begin
            wdata_o[63:32]     <=    wdata_o[63:32] - 2'b10;
            wdata_o[31:0]      <=    wdata_o[31:0]  - 2'b10;
         end
         else
            wdata_o            <=    wdata_o;
      end
   end

   //generate memory initialization complete
   axi_done:
   begin 
      if(wready_i)
      begin
         wvalid_o              <=   1'b0;
         wlast_o               <=   1'b0;
         if(wdburst_cnt == mem_size_i)
         begin
            mem_init_done_o    <=   1'b1;
            wdata_state        <=   axi_idle;
         end
         else
            wdata_state        <=   axi_next;
      end
   end

   //next AXI burst write operation
   axi_next:
   begin
      if(awvalid_o)
         wdata_state           <=   axi_valid;
   end

   default:
   begin
      wdata_state              <=   axi_idle;
   end

   endcase

   end
end

///////////////////////////////////////////////////////////////////////////////
//pattern selection
// 1. Incremental
// 2. Decremental
// 3. All 0's
// 4. All 1's
// 5. All A's
// 6. All 5's
///////////////////////////////////////////////////////////////////////////////
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      wdata_int_u              <=   0;
      wdata_int_l              <=   0;
   end
   else
   begin
      case(pattern_i)

      3'h1://incremental
      begin
         wdata_int_u[31:0]     <=   offset_data_i - 1'b1;
         wdata_int_l[31:0]     <=   offset_data_i - 2'b10;
      end

      3'h2://decremental
      begin
         wdata_int_u           <=   offset_data_i + 1'b1;
         wdata_int_l           <=   offset_data_i + 2'b10;
      end

      3'h3://0's
      begin
         wdata_int_u           <=   0;
         wdata_int_l           <=   0;
      end

      3'h4://1's
      begin
         wdata_int_u[31:0]     <=   {32{1'b1}};
         wdata_int_l[31:0]     <=   {32{1'b1}};
      end

      3'h5://A's
      begin
         wdata_int_u[31:0]     <=   {8{4'hA}};
         wdata_int_l[31:0]     <=   {8{4'hA}};
      end

      3'h6://5's
      begin
         wdata_int_u[31:0]     <=   {8{4'h5}};
         wdata_int_l[31:0]     <=   {8{4'h5}};
      end

      default:
      begin
         wdata_int_u           <=   0;
         wdata_int_l           <=   0;
      end

      endcase
   end
end

//read address channel
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      araddr_o                 <=   0;
      arvalid_o                <=   0;
      rburst_cnt               <=   0;
      raddr_state              <=   axi_idle;
   end
   else
   begin
    
   case(raddr_state)
   
   //start AXI burst read operation
   axi_idle:
   begin
      rburst_cnt               <=   0;
      araddr_o                 <=   mem_address_i;
      if(mem_test_i || mem_read_i)
         raddr_state           <=   axi_valid;
   end

   //monitor read memory count
   axi_valid:
   begin
      arvalid_o                <=   1'b1;
      if(arready_i)
      begin
         rburst_cnt            <=   rburst_cnt + 1'b1;
         raddr_state           <=   axi_done;   
     end
   end

   //next AXI read operation
   axi_done:
   begin
      arvalid_o                 <=   1'b0;      
      if(rburst_cnt == mem_size_i)            
         raddr_state            <=   axi_idle;
      else if(rvalid_i && rlast_i)
      begin
         //Address for next 2KB AXI write
         araddr_o               <=   araddr_o + 12'h800;
         raddr_state            <=   axi_valid;
      end
   end

   default:
   begin
      raddr_state               <=   axi_idle;
   end

   endcase
end
end

//read data channel
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      rdata_int                 <=   0;
      rdata_int_u               <=   0;
      rdata_int_l               <=   0;
      rready_o                  <=   0;
      rdburst_cnt               <=   0;
      mem_test_err_o            <=   0;
      mem_test_done_o           <=   0;
      mem_read_status_o         <=   0; 
      err_loc_o                 <=   0;    
      waddr_ram                 <=   0;
      wdata_ram                 <=   0;
      wen_ram                   <=   0; 
      rdata_state               <=   axi_idle;
   end
   else
   begin

   case(rdata_state)

   //start memory test
   axi_idle:
   begin        
      rdburst_cnt               <=   0;      
      mem_test_done_o           <=   0;
      mem_test_err_o            <=   0;
      mem_read_status_o         <=   0;
      err_loc_o                 <=   mem_address_i;
      waddr_ram                 <=   {9{1'b1}};//RAM last location
      wen_ram                   <=   1'b0;       
      if(mem_test_i)//memory pattern check
      begin         
         rready_o               <=   1'b0;
         rdata_state            <=   axi_pattern;
         if(pattern_i == 3'h1)//incremental
         begin
            rdata_int_u         <=    wdata_int[63:32] + 2'b10;
            rdata_int_l         <=    wdata_int[31:0]  + 2'b10;
         end
         else if(pattern_i == 3'h2)//decremental
         begin
            rdata_int_u[31:0]   <=    wdata_int[63:32] - 2'b10;
            rdata_int_l[31:0]   <=    wdata_int[31:0]  - 2'b10;
         end
         else
         begin
            rdata_int_u[31:0]   <=    wdata_int[63:32];
            rdata_int_l[31:0]   <=    wdata_int[31:0];
         end
      end
      else if(mem_read_i)//memory read
      begin
         rready_o               <=   1'b1;
         rdata_state            <=   axi_mem_read;
      end
   end

   //initial data as per pattern
   axi_pattern:
   begin
      rready_o                  <=   1'b1;
      rdata_int[63:32]          <=   rdata_int_u[31:0];
      rdata_int[31:0]           <=   rdata_int_l[31:0];
      rdata_state               <=   axi_valid;
   end

   //check AXI read data against selected pattern
   axi_valid:
   begin
      if(rdburst_cnt == mem_size_i)
      begin
         mem_test_done_o        <=   1'b1;
         rdata_state            <=   axi_idle;
      end
      else
      begin
         if(rvalid_i)
         begin
            if(rdata_i != rdata_int)
            begin
               mem_test_err_o   <=   1;
               mem_test_done_o  <=   1'b1;
               rdata_state      <=   axi_idle;
            end
            else
            begin
               err_loc_o        <=   err_loc_o + 4'h8;
            end
            if(pattern_i == 3'h1)//incremental
         begin
            rdata_int[63:32]    <=    rdata_int[63:32] + 2'b10;
            rdata_int[31:0]     <=    rdata_int[31:0]  + 2'b10;
         end
         else if(pattern_i == 3'h2)//decremental
         begin
            rdata_int[63:32]    <=    rdata_int[63:32] - 2'b10;
            rdata_int[31:0]     <=    rdata_int[31:0]  - 2'b10;
         end
            else
               rdata_int        <=   rdata_int;
         end
      end
      if(rlast_i && rvalid_i)
         rdburst_cnt            <=   rdburst_cnt + 1'b1;
   end

   //read memory and write to LSRAM 
   axi_mem_read:
   begin
      if(rdburst_cnt == mem_size_i)
      begin
         mem_read_status_o      <=   1'b1;//mem read status
         rdata_state            <=   axi_idle;
      end
      else
      begin
         if(rvalid_i)
         begin
            wdata_ram           <=  rdata_i;
            waddr_ram           <=  waddr_ram + 1;
            wen_ram             <=  1'b1;
         end
      end
      if(rlast_i && rvalid_i)
         rdburst_cnt            <=   rdburst_cnt + 1'b1;
   end

   default:
   begin
      rdata_state               <=   axi_idle;
   end

   endcase

   end
end

//4k LSRAM to store read data to display on GUI
tpsram tpsram_0(
    // Inputs
    .CLK(clk_i),
    .R_ADDR(ram_addr_i[11:0]),
    .W_ADDR(waddr_ram),
    .W_DATA(wdata_ram),
    .W_EN(wen_ram),
    // Outputs
    .R_DATA(ram_data_o)
);

endmodule