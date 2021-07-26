//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec 22 17:46:27 2019
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

//`timescale 1ns / 100ps
`timescale 1ps/1ps

// BclkSclk_PLL_TX2_1200mbps_TB
module BclkSclk_PLL_TX2_1200mbps_TB(
    // Inputs
    PADDR,
    PCLK,
    PENABLE,
    PRESETN,
    PSEL,
    PWDATA,
    PWRITE,
    REF_CLK_0,
    RESETN,
    // Outputs
    BCLKSCLK_TRAIN_DONE,
    BUSERROR,
    CLK_TRAIN_ERROR,
    PINTERRUPT,
    PLL_LOCK_0,
    PRBS_ERR,
    PRDATA,
    PREADY,
    PSLVERR,
    PTIMEOUT,
    TX_CLK,
    TX_CLK_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [28:0] PADDR;
input         PCLK;
input         PENABLE;
input         PRESETN;
input         PSEL;
input  [31:0] PWDATA;
input         PWRITE;
input         REF_CLK_0;
input         RESETN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        BCLKSCLK_TRAIN_DONE;
output        BUSERROR;
output        CLK_TRAIN_ERROR;
output        PINTERRUPT;
output        PLL_LOCK_0;
output        PRBS_ERR;
output [31:0] PRDATA;
output        PREADY;
output        PSLVERR;
output        PTIMEOUT;
output        TX_CLK;
output        TX_CLK_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [28:0] PADDR;
wire          PENABLE;
wire   [31:0] APBS_PRDATA;
wire          APBS_PREADY;
wire          PSEL;
wire          APBS_PSLVERR;
wire   [31:0] PWDATA;
wire          PWRITE;
wire   [0:0]  BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_2;
wire   [0:0]  BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_N_2;
wire          BCLKSCLK_TRAIN_DONE_net_0;
wire          BUSERROR_net_0;
wire          CLK_TRAIN_ERROR_net_0;
wire          PCLK;
wire          PINTERRUPT_net_0;
wire          PLL_LOCK_0_net_0;
wire          PRBS_ERR_net_0;
wire          PRESETN;
wire          PTIMEOUT_net_0;
wire          REF_CLK_0;
wire          RESETN;
wire          TX_CLK_net_0;
wire          TX_CLK_N_net_0;
wire          BCLKSCLK_TRAIN_DONE_net_1;
wire          PRBS_ERR_net_1;
wire          TX_CLK_N_net_1;
wire          TX_CLK_net_1;
wire          CLK_TRAIN_ERROR_net_1;
wire          PTIMEOUT_net_1;
wire          PINTERRUPT_net_1;
wire          BUSERROR_net_1;
wire          PLL_LOCK_0_net_1;
wire   [31:0] APBS_PRDATA_net_0;
wire          APBS_PREADY_net_0;
wire          APBS_PSLVERR_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [2:0]  EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                                 = 1'b1;
assign GND_net                                 = 1'b0;
assign EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0 = 3'h5;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BCLKSCLK_TRAIN_DONE_net_1 = BCLKSCLK_TRAIN_DONE_net_0;
assign BCLKSCLK_TRAIN_DONE       = BCLKSCLK_TRAIN_DONE_net_1;
assign PRBS_ERR_net_1            = PRBS_ERR_net_0;
assign PRBS_ERR                  = PRBS_ERR_net_1;
assign TX_CLK_N_net_1            = TX_CLK_N_net_0;
assign TX_CLK_N                  = TX_CLK_N_net_1;
assign TX_CLK_net_1              = TX_CLK_net_0;
assign TX_CLK                    = TX_CLK_net_1;
assign CLK_TRAIN_ERROR_net_1     = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR           = CLK_TRAIN_ERROR_net_1;
assign PTIMEOUT_net_1            = PTIMEOUT_net_0;
assign PTIMEOUT                  = PTIMEOUT_net_1;
assign PINTERRUPT_net_1          = PINTERRUPT_net_0;
assign PINTERRUPT                = PINTERRUPT_net_1;
assign BUSERROR_net_1            = BUSERROR_net_0;
assign BUSERROR                  = BUSERROR_net_1;
assign PLL_LOCK_0_net_1          = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                = PLL_LOCK_0_net_1;
assign APBS_PRDATA_net_0         = APBS_PRDATA;
assign PRDATA[31:0]              = APBS_PRDATA_net_0;
assign APBS_PREADY_net_0         = APBS_PREADY;
assign PREADY                    = APBS_PREADY_net_0;
assign APBS_PSLVERR_net_0        = APBS_PSLVERR;
assign PSLVERR                   = APBS_PSLVERR_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
parameter REF_CLK_0_PERIOD     = 6250;    // 160 MHZ
parameter BCLK_0_PERIOD        = 2500;    // 400 MHZ

reg REF_CLK;
reg BCLK_0;
reg RSTN;
reg d_RSTN;
reg   [28:0] CFG_PADDR;
reg          CFG_PSEL;
reg          CFG_PENABLE;
reg          CFG_PWRITE;
reg   [31:0] CFG_PWDATA;
reg   [7:0]  CFG_APB_CNT;
reg          CFG_APB_DONE;
reg   [3:0]  CFG_PSTRB;

initial
begin
    REF_CLK = 1'b0;
    BCLK_0 = 1'b0;
    RSTN = 1'b0;
end

always @(REF_CLK)
    #(REF_CLK_0_PERIOD / 2.0) REF_CLK <= !REF_CLK;
    
always @(BCLK_0)
    #(BCLK_0_PERIOD / 2.0) BCLK_0 <= !BCLK_0;    

always@(posedge REF_CLK) begin
 if(!PLL_LOCK_0_net_0)begin
  RSTN <= 1'b0;
 end else begin
  RSTN <= 1'b1;
 end
end

always@(posedge REF_CLK) begin
 if(!PLL_LOCK_0_net_0)begin
  d_RSTN <= 1'b0;
 end else begin
  d_RSTN <= RSTN;
 end
end


always@(posedge REF_CLK) begin
 if(!PLL_LOCK_0_net_0)begin
  CFG_PADDR   <= 29'd0;
  CFG_PSEL    <= 1'b0;
  CFG_PENABLE <= 1'b0;
  CFG_PWRITE  <= 1'b0;
  CFG_PWDATA  <= 32'd0;  
  CFG_APB_CNT    <= 8'd0;
  CFG_APB_DONE <= 1'b0;
 end else if (!CFG_APB_DONE)begin
// PLL lock achieved
  case (CFG_APB_CNT)
// -------------------------pll_sleep_seq--start----------------------
   'd0 : begin
	 //PLL control read data : addr = 0x08100004 data = 0x00000000
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd1 : begin
	 //PLL control write data : addr = 0x08100004 data = 0x00000000
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
//# -------------------------pll_sleep_seq--done----------------------

   //PLL Configuration selected:RFDIV=2--FBDIV=25--Mode=1--FB_DIV_FRAC=0(hex)DIV0_VAL=1--DIV1_VAL=1--DIV2_VAL2

//# -----------------------get_bclk_dynamic--start------------------------
   'd2 : begin
         //READ : addr = 0x08100008 data = 0x00000100
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd3 : begin
         //WRITE : addr = 0x08100008 data = 0x00000200
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h00000200;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd4 : begin
         //READ : addr = 0x08100008 data = 0x00000200
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd5 : begin
         //READ : addr = 0x0810002c data = 0x00000010
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd6 : begin
         //WRITE : addr = 0x0810002c data = 0x00008019
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h00008019;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd7 : begin
         //READ : addr = 0x08100024 data = 0x00000001
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd8 : begin
         //WRITE : addr = 0x08100024 data = 0x00000001
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h00000001;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd9 : begin
         //READ : addr = 0x08100010 data = 0x01020100
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd10 : begin
         //WRITE : addr = 0x08100010 data = 0x01020100
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h01020100;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd11 : begin
         //READ : addr = 0x08100014 data = 0x04000200
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd12 : begin
         //WRITE : addr = 0x08100014 data = 0x04000200
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h04000200;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
//# -----------------------get_bclk_dynamic--done------------------------

//# -----------------------pll_wake_seq---start-----------------------
   'd13 : begin
         //PLL control read data : addr = 0x08100004 data = 0x00000000
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b0;
          CFG_PWDATA  <= 'h00000000;  
	  CFG_PSTRB    <= 4'd0;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b0;
         end	   
   'd14 : begin
         //PLL control write data : addr = 0x08100004 data = 0x000010bf
  	  CFG_PADDR   <= 'h08100004;
	  CFG_PSEL    <= 'b1;
          CFG_PENABLE <= 'b1;
          CFG_PWRITE  <= 'b1;
          CFG_PWDATA  <= 'h000010BF;  
	  CFG_PSTRB    <= 4'd15;
          CFG_APB_CNT    <= CFG_APB_CNT + 'd1;
	  CFG_APB_DONE <= 1'b1;
         end	   
//# -----------------------pll_wake_seq---done-----------------------
  endcase	  
 end else if (CFG_APB_DONE) begin
  CFG_PADDR   <= 29'd0;
  CFG_PSEL    <= 1'b0;
  CFG_PENABLE <= 1'b0;
  CFG_PWRITE  <= 1'b0;
  CFG_PWDATA  <= 'h00000000;  
  CFG_PSTRB   <= 4'd0;
  CFG_APB_CNT <= 8'd0;
  //CFG_APB_DONE <= 1'b0;
 end 
end

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BclkSclk_PLL_TX2_1200mbps_SD_wrap
BclkSclk_PLL_TX2_1200mbps_SD_wrap BclkSclk_PLL_TX2_1200mbps_SD_wrap_0(
        // Inputs
        .RX_CLK_P                    ( TX_CLK_net_0 ),
        .RX_CLK_N                    ( TX_CLK_N_net_0 ),
        .RXD                         ( BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_2 ),
        .RXD_N                       ( BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_N_2 ),
        .CLK_TRAIN_SKIP              ( GND_net ),
        .HS_IO_CLK_PAUSE             ( (RSTN & !d_RSTN) ),
        .CLK_TRAIN_RESTART           ( GND_net ),
        .CLK_TRAIN_HOLD              ( GND_net ),
        .EYE_MONITOR_WIDTH_ICB_RXIOD ( EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0 ),
        .RESETN                      ( (RSTN & CFG_APB_DONE) ),    //RESETN ),
        .PADDR                       ( CFG_PADDR ),
        .PSEL                        ( CFG_PSEL ),
        .PENABLE                     ( CFG_PENABLE ),
        .PWRITE                      ( CFG_PWRITE ),
        .PWDATA                      ( CFG_PWDATA ),
        .PCLK                        ( REF_CLK ), //PCLK ),
        .PSTRB                       ( CFG_PSTRB ), 
        .REF_CLK_0                   ( REF_CLK ), //REF_CLK_0 ),
        .PLL_POWERDOWN_N_0           ( VCC_net ),
	.PRESETN                     ( RSTN ), 
        // Outputs
        .BCLKSCLK_TRAIN_DONE         ( BCLKSCLK_TRAIN_DONE_net_0 ),
        .PRBS_ERR                    ( PRBS_ERR_net_0 ),
        .TX_CLK                      ( TX_CLK_net_0 ),
        .TX_CLK_N                    ( TX_CLK_N_net_0 ),
        .TXD                         ( BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_2 ),
        .TXD_N                       ( BclkSclk_PLL_TX2_1200mbps_SD_wrap_0_TXD_N_2 ),
        .CLK_TRAIN_ERROR             ( CLK_TRAIN_ERROR_net_0 ),
        .PRDATA                      ( APBS_PRDATA ),
        .PREADY                      ( APBS_PREADY ),
        .PSLVERR                     ( APBS_PSLVERR ),
        .PINTERRUPT                  ( PINTERRUPT_net_0 ),
        .BUSERROR                    ( BUSERROR_net_0 ),
        .PTIMEOUT                    ( PTIMEOUT_net_0 ),
        .PLL_LOCK_0                  ( PLL_LOCK_0_net_0 ) 
        );


endmodule
