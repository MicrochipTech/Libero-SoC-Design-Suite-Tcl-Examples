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
// Title       : <axi4dma_init>
// Created     : <June 2017>
// Description : This module implements the AXI4-Lite master to initiate
//               the CoreAXI4DMAController dma transfers.
// Hierarchy   :
//               axi4dma_init            <-- This module
//                           
//-------------------------------------------------------------------------

module axi4dma_init( 	
//global signals
input             clk_i,
input             resetn_i,

//core dma controls from pcie
input      [2:0]  coredma0_start_pcie_i,
input      [2:0]  coredma1_start_pcie_i,
input      [24:0] dma_size_pcie_i,

//core dma controls from uart
input      [2:0]  coredma0_start_uart_i,
input      [2:0]  coredma1_start_uart_i,
input      [24:0] dma_size_uart_i,
input      [1:0]  coredma_int_i,

//dma start signals to start throughput counters
output reg        coredma_ch0_start_o,
output reg        coredma_ch1_start_o,
output     [15:0] coredma_status_o,

//AXI Master IF
// Write Address Channel 
output     [15:0] awaddr_o, 
output reg        awvalid_o,  
input             awready_i,  
// Write Data Channel  
output     [3:0]  wstrb_o,
output reg        wvalid_o,
output reg [31:0] wdata_o, 
input             wready_i, 	
// Write Response Channel   
input             bvalid_i,	
output reg        bready_o,
// Read Address Channel 	
output     [15:0] araddr_o, 
output reg        arvalid_o, 
input             arready_i, 
// Read Data Channel   
input      [7:0]  rdata_i,     
input             rvalid_i,
output reg        rready_o
);

localparam [31:0] LSRAM_ADDR_BASE  = 4'h3,
                  DDR3_ADDR_BASE   = 4'h2,
                  DDR4_ADDR_BASE   = 4'h4;

//0x1 -- DDR3 to LSRAM 
//0x2 -- LSRAM to DDR3
//0x3 -- DDR4 to LSRAM
//0x4 -- LSRAM to DDR4
//0x5 -- DDR3 to DDR4
//0x6 -- DDR4 to DDR3

///////////////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////////////
//dma status
reg        [7:0]  dma0_status;
reg        [7:0]  dma1_status;
//dma type
reg               coredma0_start;
reg               coredma1_start;
reg        [24:0] dma_size;

//dma address
reg        [3:0] ch0_src_addr /* synthesis syn_preserve=1 */;
reg        [3:0] ch0_dest_addr /* synthesis syn_preserve=1 */;
reg        [3:0] ch1_src_addr /* synthesis syn_preserve=1 */;
reg        [3:0] ch1_dest_addr /* synthesis syn_preserve=1 */;

//to perform axi4-lite writes
reg        [31:0] reg_wdata /* synthesis syn_preserve=1 */;
reg        [7:0]  awaddr_reg;
reg        [7:0]  reg_waddr /* synthesis syn_preserve=1 */;
reg               axi_write;
wire              axi_write_ch_ready;

//to perform axi4-lite reads
reg        [7:0]  reg_rdata;
reg        [7:0]  araddr_reg;
reg        [7:0]  reg_raddr /* synthesis syn_preserve=1 */;
reg               axi_read;
wire              axi_read_ch_ready;

//to get dma status
reg               dma_int0_status_read;
reg               dma_int1_status_read;
wire              dma_int0_read;
wire              dma_int1_read;

//axi r/w states
reg        [1:0]  axi_write_state;
reg               axi_read_state;

//to initialize coreaxi4dma ip
reg        [3:0]  dmainit_state;
reg        [1:0]  dma_status_state;
reg        [3:0]  reg_count;
wire       [39:0] dma_reg_init[15:0];

assign wstrb_o    = 4'hF;
assign awaddr_o   = {8'b0,awaddr_reg};
assign araddr_o   = {8'b0,araddr_reg};
assign coredma_status_o = {dma1_status, dma0_status};

///////////////////////////////////////////////////////////////////////////////
// dma control state encoding
///////////////////////////////////////////////////////////////////////////////

localparam [3:0]    dma_init          = 4'b0000,
                    dma_ch0_ch1_op    = 4'b0001,
                    dma_ch0_int_clear = 4'b0010,
                    dma_ch0_size      = 4'b0011,
                    dma_ch0_config    = 4'b0100,
                    dma_ch0_start     = 4'b0101,
                    dma_ch1_int_clear = 4'b0110,
                    dma_ch1_size      = 4'b0111,
                    dma_ch1_config    = 4'b1000,
                    dma_ch1_start     = 4'b1001,
                    dma_idle          = 4'b1010,
                    dma_int_clear     = 4'b1011,
                    dma_start         = 4'b1100;

///////////////////////////////////////////////////////////////////////////////
// dma reg 32-bit address and 32-bit bit values
///////////////////////////////////////////////////////////////////////////////
//{32'h addr,32'h data}
assign dma_reg_init[0]  = {8'h14, 32'h1};               //ch0 int mask
assign dma_reg_init[1]  = {8'h18, 32'h1};               //ch0 clear interrupt
assign dma_reg_init[2]  = {8'h68, ch0_src_addr,28'b0};  //ch0 src addr
assign dma_reg_init[3]  = {8'h6C, ch0_dest_addr,28'b0}; //ch0 dst addr
assign dma_reg_init[4]  = {8'h70, 32'h0};               //ch0 next descriptor
assign dma_reg_init[5]  = {8'h24, 32'h1};               //ch1 int mask
assign dma_reg_init[6]  = {8'h28, 32'h1};               //ch1 clear interrupt
assign dma_reg_init[7]  = {8'h88, ch1_src_addr,28'b0};  //ch1 src addr
assign dma_reg_init[8]  = {8'h8C, ch1_dest_addr,28'b0}; //ch1 dst addr
assign dma_reg_init[9]  = {8'h90, 32'h0};               //ch1 next descriptor
assign dma_reg_init[10] = 0;                            //reserved - to avoid lintin error
assign dma_reg_init[11] = 0;
assign dma_reg_init[12] = 0;
assign dma_reg_init[13] = 0;
assign dma_reg_init[14] = 0;
assign dma_reg_init[15] = 0;

//ddr to lsram start from uart/pcie
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin        
      coredma0_start            <=   0;
      ch0_src_addr              <=   DDR3_ADDR_BASE;
      ch0_dest_addr             <=   LSRAM_ADDR_BASE;
   end
   else
   begin
      if(coredma0_start_pcie_i || coredma0_start_uart_i)
      begin
         coredma0_start         <=   1;
         //selecting ch0 source address
         if(coredma0_start_uart_i == 3 || coredma0_start_pcie_i == 3)
            ch0_src_addr        <=   DDR4_ADDR_BASE;
         else
            ch0_src_addr        <=   DDR3_ADDR_BASE;
         //selecting ch0 destination address
         if(coredma0_start_uart_i == 5 || coredma0_start_pcie_i == 5)
            ch0_dest_addr       <=   DDR4_ADDR_BASE;
         else
            ch0_dest_addr       <=   LSRAM_ADDR_BASE;
      end
      else if(coredma_ch0_start_o)
         coredma0_start         <=   0;
   end
end

//lsram to ddr start from uart/pcie
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      coredma1_start            <=   0;
      ch1_src_addr              <=   LSRAM_ADDR_BASE;
      ch1_dest_addr             <=   DDR3_ADDR_BASE;
   end
   else
   begin
      if(coredma1_start_pcie_i || coredma1_start_uart_i)
      begin
         coredma1_start         <=   1; 
         //selecting ch0 source address
         if(coredma1_start_uart_i == 6 || coredma1_start_pcie_i == 6)
            ch1_src_addr        <=   DDR4_ADDR_BASE;
         else
            ch1_src_addr        <=   LSRAM_ADDR_BASE;
         //selecting ch0 destination address
         if(coredma1_start_uart_i == 4 || coredma1_start_pcie_i == 4)
            ch1_dest_addr       <=   DDR4_ADDR_BASE;
         else
            ch1_dest_addr       <=   DDR3_ADDR_BASE;
      end
      else if(coredma_ch1_start_o)
         coredma1_start         <=   0;
   end
end

//dma_size from uart/pcie
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      dma_size                 <=   0;
   end
   else
   begin
      if(coredma0_start_pcie_i || coredma1_start_pcie_i)
         dma_size              <=   dma_size_pcie_i;
      else if(coredma0_start_uart_i|| coredma1_start_uart_i)
         dma_size              <=   dma_size_uart_i;
   end
end
            
//coreaxi4dma ip initialization and ch0/ch1 control        
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      reg_wdata                <=   0;       
      reg_waddr                <=   0;
      axi_write                <=   0;
      reg_count                <=   0;  
      coredma_ch0_start_o      <=   0;
      coredma_ch1_start_o      <=   0;
      dmainit_state            <=   dma_start;
   end
   else
   begin
      case(dmainit_state)

      //start dma initialization
      dma_start:
      begin
         axi_write             <=   1'b0;
         coredma_ch0_start_o   <=   1'b0;
         coredma_ch1_start_o   <=   1'b0;
         if(coredma0_start || coredma1_start)
            dmainit_state      <=   dma_init;
         else if(dma_int0_status_read)
         begin   
            reg_waddr          <=   8'h18;
            dmainit_state      <=   dma_int_clear;
         end
         else if(dma_int1_status_read)
         begin
            reg_waddr          <=   8'h28;
            dmainit_state      <=   dma_int_clear;
         end 
      end

      //coreaxi4dma ip initialization
      dma_init:
      begin
         if(axi_write_ch_ready)
         begin
            reg_waddr          <=   dma_reg_init[reg_count][39:32];
            reg_wdata          <=   dma_reg_init[reg_count][31:0];                        
            axi_write          <=   1'b1;
            reg_count          <=   reg_count + 1'b1;
            if(reg_count == 9)
               dmainit_state   <=   dma_ch0_ch1_op;
         end
         else
            axi_write          <=   1'b0;
      end

      //selecting dma ch0/ch1
      dma_ch0_ch1_op:
      begin
         axi_write             <=   1'b0;
         if(coredma0_start)
         begin            
            dmainit_state      <=   dma_ch0_int_clear;
         end
         else if(coredma1_start)
         begin
            dmainit_state      <=   dma_ch1_int_clear;
         end       
      end

      //start ch0 dma transfer
      dma_ch0_int_clear:
      begin        
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   32'h1;   
            reg_waddr          <=   8'h18; //clear interrupt
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch0_size;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_ch0_size:
      begin
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   {7'b0,dma_size};            
            reg_waddr          <=   8'h64; //num bytes
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch0_config;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_ch0_config:
      begin
         if(axi_write_ch_ready)
         begin            
            reg_wdata          <=   32'hE005;             
            reg_waddr          <=   8'h60;//config reg 
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch0_start;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_ch0_start:
      begin
         if(axi_write_ch_ready)
         begin
            coredma_ch0_start_o<=   1'b1;
            reg_wdata          <=   32'h1;             
            reg_waddr          <=   8'h4; //start_op
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_idle;
         end
         else
            axi_write          <=   1'b0;
      end

      //start ch1 dma transfer
      dma_ch1_int_clear:
      begin        
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   32'h1;   
            reg_waddr          <=   8'h28; //clear interrupt
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch1_size;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_ch1_size:
      begin
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   {7'b0,dma_size};            
            reg_waddr          <=   8'h84; //num bytes
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch1_config;
         end
         else
            axi_write          <=      1'b0;
      end

      dma_ch1_config:
      begin
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   32'hE005; 
            reg_waddr          <=   8'h80; //config reg
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_ch1_start;
         end
         else
            axi_write          <=   1'b0;
      end 

      dma_ch1_start:
      begin
         if(axi_write_ch_ready)
         begin
            coredma_ch1_start_o<=   1'b1;
            reg_wdata          <=   32'h2; 
            reg_waddr          <=   8'h4;//start_op
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_idle;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_int_clear:
      begin
         if(axi_write_ch_ready)
         begin
            reg_wdata          <=   32'h1; //clear interrupt
            axi_write          <=   1'b1;
            dmainit_state      <=   dma_start;
         end
         else
            axi_write          <=   1'b0;
      end

      dma_idle:
      begin
         axi_write             <=   1'b0;
         if(axi_write_ch_ready)
            dmainit_state      <=   dma_start;
      end

      default: 
      begin
         dmainit_state         <=   dma_start;
      end
      endcase
   end
end
      

///////////////////////////////////////////////////////////////////////////////
// axi write state encoding
///////////////////////////////////////////////////////////////////////////////
localparam [1:0]  axiw_idle  = 2'b00,
                  axiw_wait  = 2'b01,
                  axiw_wdata = 2'b10,
                  axiw_wresp = 2'b11;
                
assign axi_write_ch_ready = (axi_write_state == 2'b0 && axi_write == 1'b0)? 1'b1:1'b0;
//AXI write
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      awaddr_reg               <=   0;
      awvalid_o                <=   0;        
      wvalid_o                 <=   0;
      wdata_o                  <=   0;
      bready_o                 <=   0;
      axi_write_state          <=   axiw_idle;
   end
   else
   begin
      case(axi_write_state)

      //write address phase
      axiw_idle:
      begin  
         if(axi_write)
         begin     
            awaddr_reg         <=   reg_waddr;
            awvalid_o          <=   1;
            wdata_o            <=   reg_wdata;
            axi_write_state    <=   axiw_wait;
         end
      end

      axiw_wait:
      begin
         if(awready_i)
         begin
            awvalid_o          <=   0;
            axi_write_state    <=   axiw_wdata;
         end
      end

      //write data phase
      axiw_wdata:
      begin        
         wvalid_o              <=   1'b1;
         bready_o              <=   1'b1;
         if(wready_i)
            axi_write_state    <=   axiw_wresp;
      end

      //write response phase
      axiw_wresp:
      begin
         wvalid_o              <=   1'b0;
         if(bvalid_i)
         begin
            bready_o           <=   1'b0;
            axi_write_state    <=   axiw_idle;
         end
      end
 
      default:
      begin
         axi_write_state       <=   axiw_idle;
      end

      endcase
 end
end

//trigger dma status read
assign dma_int0_read = coredma_int_i[0] & (~dma_int0_status_read);
assign dma_int1_read = coredma_int_i[1] & (~dma_int1_status_read);
///////////////////////////////////////////////////////////////////////////////
// dma reads state encoding
///////////////////////////////////////////////////////////////////////////////
localparam [1:0]  dma_get_status  = 2'b00,
                  dma_wait_status = 2'b01,
                  dma_read_status = 2'b10; 
                 
//getting coreaxi4dma status
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      dma0_status              <=   0;
      dma1_status              <=   0;
      reg_raddr                <=   0;
      axi_read                 <=   0;
      dma_int0_status_read     <=   0;
      dma_int1_status_read     <=   0;
      dma_status_state         <=   dma_get_status;
   end
   else
   begin
      case(dma_status_state)

      //initiate reading dma ch0/ch1 status
      dma_get_status:
      begin
         if(dma_int0_read)
         begin
            reg_raddr          <=   8'h10;            
            dma_int0_status_read<=   1;
            dma_status_state   <=   dma_wait_status;
         end 
         else if(dma_int1_read)
         begin
            reg_raddr          <=   8'h20;            
            dma_int1_status_read<=   1;
            dma_status_state   <=   dma_wait_status;
         end
         else 
         begin
            if(coredma_int_i[0] == 1'b0)
               dma_int0_status_read <=   0;
            if(coredma_int_i[1] == 1'b0)
               dma_int1_status_read <=   0;
         end
      end

      //wait
      dma_wait_status:
      begin
         if(axi_read_ch_ready)
         begin
            axi_read           <=   1;
            dma_status_state   <=   dma_read_status;
         end
         else
            axi_read           <=   0;
      end

      //get the status
      dma_read_status:
      begin
         axi_read              <=   0;
         if(axi_read_ch_ready)
         begin            
            dma_status_state   <=   dma_get_status;
         end

         if(dma_int0_status_read)
            dma0_status        <=   reg_rdata;
         if(dma_int1_status_read)
            dma1_status        <=   reg_rdata;
      end

      default:
      begin
         dma_status_state      <=   dma_get_status;
      end
      endcase
   end
end


///////////////////////////////////////////////////////////////////////////////
// axi read state encoding
///////////////////////////////////////////////////////////////////////////////
localparam  axi_raddr = 1'b0, 
            axi_rdata = 1'b1;
assign axi_read_ch_ready = (axi_read_state == 1'b0 && axi_read == 1'b0)? 1'b1:1'b0;

//axi read
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      reg_rdata                <=   0;
      araddr_reg               <=   0;
      arvalid_o                <=   0;
      rready_o                 <=   0;
      axi_read_state           <=   axi_raddr;
   end
   else
   begin     
      case(axi_read_state)

      //read address phase
      axi_raddr:
      begin              
         if(axi_read)
         begin     
            araddr_reg         <=   reg_raddr;
            arvalid_o          <=   1;     
            rready_o           <=   1;
            axi_read_state     <=   axi_rdata;
         end
      end

      //read data phase
      axi_rdata:
      begin
         if(arready_i)
         begin            
            arvalid_o          <=   0;            
         end

         if(rvalid_i)
         begin
            rready_o           <=   0;
            reg_rdata          <=   rdata_i[7:0];
            axi_read_state     <=   axi_raddr;
         end
      end    

      default:
      begin
         axi_read_state        <=   axi_raddr;
      end

      endcase
   end
end


endmodule

