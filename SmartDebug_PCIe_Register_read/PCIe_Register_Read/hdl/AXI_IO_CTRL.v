///////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------
//                                                                 
//  Microsemi Corporation Proprietary and Confidential
//  Copyright 2017 Microsemi Corporation. All rights reserved.
//                                                                  
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
//  ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
//  IN ADVANCE IN WRITING.
//
//-----------------------------------------------------------------------------
// Title       : <axi_io_ctrl>
// Created     : <June 2017>
// Description : This module implements the AXI slave logic to receive the 
//               commands from PCIe AXI master and to control LEDs and to 
//               get DIP switch status. It also implements counters to return  
//               the number of cycles taken to complete the DMA transfers.
// Hierarchy   :
//               axi_io_ctrl            <-- This module
//                           
//-----------------------------------------------------------------------------

module axi_io_ctrl(    
//global
input             clk_i,
input             resetn_i,

// AXI Slave interface
input      [5:0]  awid_i,
input      [10:3] awaddr_i,
input             awvalid_i,
output reg        awready_o,
input      [31:0] wdata_i,
input             wlast_i,
input             wvalid_i,
output reg        wready_o,
output reg [5:0]  bid_o,
output     [1:0]  bresp_o,
output reg        bvalid_o,
input             bready_i,
input      [5:0]  arid_i,
input      [10:3] araddr_i,
input             arvalid_i,
output reg        arready_o,
output reg [5:0]  rid_o,
output reg [63:0] rdata_o,
output     [1:0]  rresp_o,
output reg        rlast_o,
output reg        rvalid_o,
input             rready_i,

// DMA interrupts
input      [1:0]  coredma_int_i,
input             pcie_int_i,

//coredma start signals for throughput calculation
input             coredma_ch0_start_i,
input             coredma_ch1_start_i,

//axi write channel signals from pcie axi master
input             dma_wvalid_i,
input             dma_wready_i,

//coreaxi4dma control signals
output reg [24:0] coredma_size_o,
output reg [2:0]  coredma0_start_o,
output reg [2:0]  coredma1_start_o,
input      [15:0] coredma_status_i,
output     [63:0] clk_count_o,

//LEDs and Switches
output reg [7:0]  led_o,
input	   [3:0]  dip_switch_o		
);

///////////////////////////////////////////////////////////////////////////////
// Demo control registers
///////////////////////////////////////////////////////////////////////////////
                                      //address
localparam PCIE_RW_REG        = 8'h00;//16'h0000;
localparam LED_ADDRESS        = 8'h01;//16'h0008;
localparam DIP_SWITCH_REG     = 8'h02;//16'h0010;
localparam DMA_CNTRL_REG      = 8'h03;//16'h0018;
localparam CLK_COUNT_REG      = 8'h04;//16'h0020;
localparam PCIE_DMA0_SIZE     = 8'h07;//16'h0038;
localparam COREDMA_SIZE_REG   = 8'h08;//16'h0040;
localparam COREDMA_STATUS_REG = 8'h09;//16'h0048;
localparam CLK_FREQ_REG       = 8'h0A;//16'h0050;
localparam DEMO_TYPE_REG      = 8'h20;//16'h0100;

///////////////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////////////
reg [7:0]  waddr_int;
reg [7:0]  raddr_int;
//axi r/w states
reg        rstate;
reg [1:0]  wstate;

//scratch pad register
reg [31:0] pcie_reg;
reg [7:0]  dma_start_reg;

//pcie dma monitor signals
reg        dma0_inprogress;
reg        dma1_inprogress;
wire       pcie_dma0_start;
wire       pcie_dma1_start;

//dma0 length  registers
reg [23:0] dma0_data_cnt;
reg [23:0] dma0_size;
wire       pcie_dma0_end;
reg        pcie_int_en;

//throughput counters
reg [31:0] clk_count2;
reg [31:0] clk_count1;
reg        clear_count1;
reg        clear_count2;

//axi r/w response
assign bresp_o = 2'b00;
assign rresp_o = 2'b00;

//start dma operation 
assign pcie_dma0_start    = (dma_start_reg == 8'hA1)? 1'b1 : 1'b0;
assign pcie_dma1_start    = (dma_start_reg == 8'hA2)? 1'b1 : 1'b0;

//start coredma operation
always@(posedge clk_i, negedge resetn_i)
begin	
   if(resetn_i == 1'b0 )
   begin
      coredma0_start_o   <= 0;
      coredma1_start_o   <= 0;
   end
   else
   begin
      if(dma_start_reg[7:4] == 4'hB)
      begin
         if(dma_start_reg[3:0] == 4'h1 || dma_start_reg[3:0] == 4'h3 
                                       || dma_start_reg[3:0] == 4'h5 )
         begin
            coredma0_start_o   <= dma_start_reg[2:0];
         end
         else
         begin
            coredma1_start_o   <= dma_start_reg[2:0];
         end
      end
      else
      begin
         coredma0_start_o   <= 0;
         coredma1_start_o   <= 0;
      end
   end
end

//monitoring DMA0
assign pcie_dma0_end      = (dma0_data_cnt == dma0_size)? 1'b1 : 1'b0; 

///////////////////////////////////////////////////////////////////////////////
// axi slave write state encoding
///////////////////////////////////////////////////////////////////////////////
localparam [1:0]  axiw_addr = 2'b00,
                  axiw_data = 2'b01,
                  axiw_resp = 2'b10;

//write address, write data and write response channels
always@(posedge clk_i, negedge resetn_i)
begin	
   if(resetn_i == 1'b0 )
   begin
      wstate                 <=   axiw_addr;
      bid_o                  <=   0;
      bvalid_o               <=   1'b0;	
      awready_o              <=   1'b0;
      wready_o               <=   1'b0;
      dma0_size              <=   24'h1000;//4KB
      dma_start_reg          <=   0;
      coredma_size_o         <=   0;
      pcie_reg               <=   0;
      led_o                  <=   0;
   end
   else
   begin
      case (wstate)

      //axi write address phase
      axiw_addr:
      begin
         bvalid_o            <=   1'b0;
         if(awvalid_i == 1'b1)
         begin
            awready_o        <=   1'b1;
            waddr_int        <=   awaddr_i[10:3];				
            wstate           <=   axiw_data;	
            bid_o            <=   awid_i;			
         end
      end

      //axi write data phase
      axiw_data:
      begin
         awready_o           <=   1'b0;
         wready_o            <=   1'b1;
         if(wlast_i == 1'b1 && wvalid_i  == 1'b1)							
            wstate           <=   axiw_resp;			
         else
            wstate           <=   axiw_data;
         
         //pcie_reg
         if ( waddr_int == PCIE_RW_REG )			
         begin
            pcie_reg         <=   wdata_i[31:0];			
         end

         //LEDs
         if ( waddr_int == LED_ADDRESS)//16'h0008)			
         begin
            led_o            <=   wdata_i[7:0];			
         end

         //getting dma start
         if ( waddr_int == DMA_CNTRL_REG && wvalid_i == 1'b1)			
         begin                
            dma_start_reg    <=   wdata_i[7:0];			
         end

         //getting dma0 size
         if ( waddr_int == PCIE_DMA0_SIZE)			
         begin//PCIe dma size*8bytes(AXI bus)
            dma0_size        <=   wdata_i[26:3];			
         end

        	//getting coredma size
         if ( waddr_int == COREDMA_SIZE_REG)			
         begin
            coredma_size_o   <=   wdata_i[24:0];// size			
         end
         
      end

      //axi write response state
      axiw_resp:
      begin
         dma_start_reg       <=   0;
         wready_o            <=   1'b0;
         if(bready_i == 1'b1)
         begin
            bvalid_o         <=   1'b1;
            wstate           <=   axiw_addr;
         end
         else
         begin
            bvalid_o         <=   1'b0;
            wstate 	         <=   axiw_resp;
         end
      end

      default:
      begin
         wstate              <=   axiw_addr;
      end

      endcase
   end
end

///////////////////////////////////////////////////////////////////////////////
// axi slave read state encoding
///////////////////////////////////////////////////////////////////////////////
localparam  axir_addr = 1'b0,
            axir_data = 1'b1;
//read address and read data channels
always@(posedge clk_i, negedge resetn_i)
begin	
   if(resetn_i == 1'b0 )
   begin
      rstate                 <=   axir_addr;
      raddr_int              <=   0;
      arready_o              <=   1'b0;
      rid_o                  <=   0;
      rvalid_o               <=   1'b0;
      rlast_o                <=   1'b0;		
   end
   else
   begin
      case (rstate)

      //axi read address phase
      axir_addr:
      begin
         rvalid_o            <=   1'b0;
         rlast_o             <=   1'b0;
         arready_o           <=   1'b1;
         if (arvalid_i == 1'b1)
         begin
            rid_o            <=   arid_i;
            raddr_int        <=   araddr_i[10:3];
            rstate 	         <=   axir_data;				
         end
      end

      //axi read data phase
      axir_data:
      begin
         arready_o           <=   1'b0;
         if(rready_i == 1'b1)
         begin
            rvalid_o         <=   1'b1;
            rlast_o          <=   1'b1;
            rstate 	         <=   axir_addr;				
         end
      end

      default:
      begin
         rstate              <=   axir_addr;
      end
endcase
end
end

//returning the data
always@(posedge clk_i, negedge resetn_i)
begin	
   if(resetn_i == 1'b0 )
   begin
      rdata_o                <=   1;
   end
   else
   begin
      case(raddr_int)

      PCIE_RW_REG:
      begin
         rdata_o             <=   {32'h0,pcie_reg};//pcie reg
      end

      DIP_SWITCH_REG:
      begin
         rdata_o             <=   {60'h0,dip_switch_o};//DIP switch status
      end

      CLK_COUNT_REG:
      begin
         rdata_o             <=   clk_count_o;//DMA channel 0 & 1
      end

      COREDMA_STATUS_REG:
      begin
         rdata_o             <=   {48'h0,coredma_status_i};
      end

      CLK_FREQ_REG:
      begin
         rdata_o             <=   200;//clk
      end

      DEMO_TYPE_REG:
      begin
         rdata_o             <=   64'h332211;//device detection
      end

      default:
      begin
         rdata_o             <=   clk_count_o;
      end

      endcase
   end
end

//clear throughput counter1, dma0 status
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin    
      dma0_inprogress        <=   0;
      clear_count1           <=   0;
   end
   else
   begin
      if(pcie_dma0_start || coredma_ch0_start_i)
      begin
         clear_count1        <=   1;
         dma0_inprogress     <=   1'b1;
      end
      else 
      begin
         clear_count1        <=   0;
         if(coredma_int_i[0] || pcie_dma0_end)
            dma0_inprogress  <=   1'b0;
      end
   end
end

//monitoring pcie axi write channel to get pcie dma0 end
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      dma0_data_cnt      <=   0; 
   end
   else
   begin
      if(pcie_dma0_start)
         dma0_data_cnt   <=   0;
      else if(dma_wvalid_i && dma_wready_i)
         dma0_data_cnt   <=   dma0_data_cnt + 1;
   end
end

//throughput counter1
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      clk_count1             <=   0; 
   end
   else
   begin
      if(clear_count1)
         clk_count1          <=   0;
      else if(dma0_inprogress)
         clk_count1          <=   clk_count1  +   1'b1;
   end
end

//clear throughput counter2, dma1 status
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin    
      dma1_inprogress    <=   0;
      clear_count2       <=   0;
      pcie_int_en        <=   0;
   end
   else
   begin
      if(pcie_dma1_start || coredma_ch1_start_i)
      begin
         clear_count2    <=   1;
         dma1_inprogress <=   1'b1;
         pcie_int_en     <=   ~coredma_ch1_start_i;
      end
      else 
      begin
         clear_count2    <=   0;
         if(coredma_int_i[1] || (pcie_int_i && pcie_int_en))
            dma1_inprogress <=   1'b0;
      end
   end
end

//throughput counter2
always@(posedge clk_i, negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      clk_count2         <=   0; 
   end
   else
   begin
      if(clear_count2)
         clk_count2      <=   0;
      else if(dma1_inprogress)
         clk_count2      <=   clk_count2  +   1'b1;
   end
end

assign clk_count_o    =   {clk_count2,clk_count1};

endmodule

