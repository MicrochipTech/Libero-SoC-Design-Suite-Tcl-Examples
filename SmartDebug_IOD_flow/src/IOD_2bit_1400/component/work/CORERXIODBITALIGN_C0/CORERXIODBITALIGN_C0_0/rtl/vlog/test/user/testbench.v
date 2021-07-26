//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Nov 26 15:31:36 2020
// Version: v12.5 12.900.10.15
//////////////////////////////////////////////////////////////////////

//`timescale 1ns / 100ps
`timescale 1ps/1ps

// testbench
module testbench(
    // Inputs
    HS_IO_CLK_PAUSE,
    PLL_POWERDOWN_N_0,
    REF_CLK_0,
    RESETN,
    // Outputs
    BIT_ALGN_CLR_FLGS,
    BIT_ALGN_DIR,
    BIT_ALGN_DONE,
    BIT_ALGN_ERR,
    BIT_ALGN_LOAD,
    BIT_ALGN_MOVE,
    BIT_ALGN_OOR,
    BIT_ALGN_START,
    CLK_TRAIN_DONE,
    CLK_TRAIN_ERROR,
    DELAY_LINE_OUT_OF_RANGE,
    DEM_BIT_ALGN_TAPDLY,
    EYE_MONITOR_EARLY,
    EYE_MONITOR_LATE,
    PLL_LOCK_0,
    PRBSGEN_DATA,
    PRBS_ERR,
    RX_BIT_ALIGN_LEFT_WIN,
    RX_BIT_ALIGN_RGHT_WIN,
    RX_CLK_G
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        HS_IO_CLK_PAUSE;
input        PLL_POWERDOWN_N_0;
input        REF_CLK_0;
input        RESETN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       BIT_ALGN_CLR_FLGS;
output       BIT_ALGN_DIR;
output       BIT_ALGN_DONE;
output       BIT_ALGN_ERR;
output       BIT_ALGN_LOAD;
output       BIT_ALGN_MOVE;
output       BIT_ALGN_OOR;
output       BIT_ALGN_START;
output       CLK_TRAIN_DONE;
output       CLK_TRAIN_ERROR;
output [0:0] DELAY_LINE_OUT_OF_RANGE;
output [7:0] DEM_BIT_ALGN_TAPDLY;
output [0:0] EYE_MONITOR_EARLY;
output [0:0] EYE_MONITOR_LATE;
output       PLL_LOCK_0;
output [7:0] PRBSGEN_DATA;
output       PRBS_ERR;
output [7:0] RX_BIT_ALIGN_LEFT_WIN;
output [7:0] RX_BIT_ALIGN_RGHT_WIN;
output       RX_CLK_G;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         BIT_ALGN_CLR_FLGS_net_0;
wire         BIT_ALGN_DIR_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_ERR_net_0;
wire         BIT_ALGN_LOAD_net_0;
wire         BIT_ALGN_MOVE_net_0;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_START_net_0;
wire         CLK_TRAIN_DONE_net_0;
wire         CLK_TRAIN_ERROR_net_0;
wire         CoreRxIODBitAlign_SD_wrap_0_TX_CLK;
wire         CoreRxIODBitAlign_SD_wrap_0_TX_CLK_N;
wire   [0:0] CoreRxIODBitAlign_SD_wrap_0_TXD;
wire   [0:0] CoreRxIODBitAlign_SD_wrap_0_TXD_N;
wire   [0:0] DELAY_LINE_OUT_OF_RANGE_net_0;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_0;
wire   [0:0] EYE_MONITOR_EARLY_net_0;
wire   [0:0] EYE_MONITOR_LATE_net_0;
wire         HS_IO_CLK_PAUSE;
wire         PLL_LOCK_0_net_0;
wire         PLL_POWERDOWN_N_0;
wire         PRBS_ERR_net_0;
wire   [7:0] PRBSGEN_DATA_net_0;
wire         REF_CLK_0;
wire         RESETN;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_0;
wire         RX_CLK_G_net_0;
wire         CLK_TRAIN_DONE_net_1;
wire         PLL_LOCK_0_net_1;
wire         BIT_ALGN_LOAD_net_1;
wire         BIT_ALGN_DIR_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_ERR_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_START_net_1;
wire         CLK_TRAIN_ERROR_net_1;
wire         RX_CLK_G_net_1;
wire         BIT_ALGN_MOVE_net_1;
wire         BIT_ALGN_CLR_FLGS_net_1;
wire         PRBS_ERR_net_1;
wire   [0:0] DELAY_LINE_OUT_OF_RANGE_net_1;
wire   [0:0] EYE_MONITOR_LATE_net_1;
wire   [0:0] EYE_MONITOR_EARLY_net_1;
wire   [7:0] PRBSGEN_DATA_net_1;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_1;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_1;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire   [2:0] EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                                 = 1'b0;
assign EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0 = 3'h5;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign CLK_TRAIN_DONE_net_1             = CLK_TRAIN_DONE_net_0;
assign CLK_TRAIN_DONE                   = CLK_TRAIN_DONE_net_1;
assign PLL_LOCK_0_net_1                 = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                       = PLL_LOCK_0_net_1;
assign BIT_ALGN_LOAD_net_1              = BIT_ALGN_LOAD_net_0;
assign BIT_ALGN_LOAD                    = BIT_ALGN_LOAD_net_1;
assign BIT_ALGN_DIR_net_1               = BIT_ALGN_DIR_net_0;
assign BIT_ALGN_DIR                     = BIT_ALGN_DIR_net_1;
assign BIT_ALGN_DONE_net_1              = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE                    = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_ERR_net_1               = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR                     = BIT_ALGN_ERR_net_1;
assign BIT_ALGN_OOR_net_1               = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR                     = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_START_net_1             = BIT_ALGN_START_net_0;
assign BIT_ALGN_START                   = BIT_ALGN_START_net_1;
assign CLK_TRAIN_ERROR_net_1            = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR                  = CLK_TRAIN_ERROR_net_1;
assign RX_CLK_G_net_1                   = RX_CLK_G_net_0;
assign RX_CLK_G                         = RX_CLK_G_net_1;
assign BIT_ALGN_MOVE_net_1              = BIT_ALGN_MOVE_net_0;
assign BIT_ALGN_MOVE                    = BIT_ALGN_MOVE_net_1;
assign BIT_ALGN_CLR_FLGS_net_1          = BIT_ALGN_CLR_FLGS_net_0;
assign BIT_ALGN_CLR_FLGS                = BIT_ALGN_CLR_FLGS_net_1;
assign PRBS_ERR_net_1                   = PRBS_ERR_net_0;
assign PRBS_ERR                         = PRBS_ERR_net_1;
assign DELAY_LINE_OUT_OF_RANGE_net_1[0] = DELAY_LINE_OUT_OF_RANGE_net_0[0];
assign DELAY_LINE_OUT_OF_RANGE[0:0]     = DELAY_LINE_OUT_OF_RANGE_net_1[0];
assign EYE_MONITOR_LATE_net_1[0]        = EYE_MONITOR_LATE_net_0[0];
assign EYE_MONITOR_LATE[0:0]            = EYE_MONITOR_LATE_net_1[0];
assign EYE_MONITOR_EARLY_net_1[0]       = EYE_MONITOR_EARLY_net_0[0];
assign EYE_MONITOR_EARLY[0:0]           = EYE_MONITOR_EARLY_net_1[0];
assign PRBSGEN_DATA_net_1               = PRBSGEN_DATA_net_0;
assign PRBSGEN_DATA[7:0]                = PRBSGEN_DATA_net_1;
assign DEM_BIT_ALGN_TAPDLY_net_1        = DEM_BIT_ALGN_TAPDLY_net_0;
assign DEM_BIT_ALGN_TAPDLY[7:0]         = DEM_BIT_ALGN_TAPDLY_net_1;
assign RX_BIT_ALIGN_RGHT_WIN_net_1      = RX_BIT_ALIGN_RGHT_WIN_net_0;
assign RX_BIT_ALIGN_RGHT_WIN[7:0]       = RX_BIT_ALIGN_RGHT_WIN_net_1;
assign RX_BIT_ALIGN_LEFT_WIN_net_1      = RX_BIT_ALIGN_LEFT_WIN_net_0;
assign RX_BIT_ALIGN_LEFT_WIN[7:0]       = RX_BIT_ALIGN_LEFT_WIN_net_1;
parameter REF_CLK_0_PERIOD     = 6250;    // 160 MHZ

reg REF_CLK;
reg BCLK_0;
reg RSTN;
reg POWERDOWN_N;
reg d_RSTN;
reg dd_RSTN;

initial
begin
    REF_CLK = 1'b0;
    RSTN = 1'b0;
    POWERDOWN_N = 1'b0;
    #40000
    POWERDOWN_N = 1'b1;
end

always @(REF_CLK)
    #(REF_CLK_0_PERIOD / 2.0) REF_CLK <= !REF_CLK;
    
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
  dd_RSTN <= 1'b0;
 end else begin
  dd_RSTN <= d_RSTN;
 end
end
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreRxIODBitAlign_SD_wrap
CoreRxIODBitAlign_SD_wrap CoreRxIODBitAlign_SD_wrap_0(
        // Inputs
        .RX_CLK_TRAIN_RESTART        ( GND_net ),
        .RX_CLK_TRAIN_SKIP           ( GND_net ),
        .RX_CLK_TRAIN_HOLD           ( GND_net ),
        .BIT_ALGN_RSTRT              ( GND_net ),
        .BIT_ALGN_SKIP               ( GND_net ),
        .BIT_ALGN_HOLD               ( GND_net ),
        .HS_IO_CLK_PAUSE             ( (d_RSTN && (!dd_RSTN))),
        .PLL_POWERDOWN_N_0           ( POWERDOWN_N ),
        .REF_CLK_0                   ( REF_CLK ),
        .RESETN                      ( RSTN ),
        .RX_CLK_P                    ( CoreRxIODBitAlign_SD_wrap_0_TX_CLK ),
        .RX_CLK_N                    ( CoreRxIODBitAlign_SD_wrap_0_TX_CLK_N ),
        .EYE_MONITOR_WIDTH_ICB_RXIOD ( EYE_MONITOR_WIDTH_ICB_RXIOD_const_net_0 ),
        .RXD                         ( CoreRxIODBitAlign_SD_wrap_0_TXD ),
        .RXD_N                       ( CoreRxIODBitAlign_SD_wrap_0_TXD_N ),
        // Outputs
        .CLK_TRAIN_DONE              ( CLK_TRAIN_DONE_net_0 ),
        .PRBS_ERR                    ( PRBS_ERR_net_0 ),
        .PLL_LOCK_0                  ( PLL_LOCK_0_net_0 ),
        .BIT_ALGN_OOR                ( BIT_ALGN_OOR_net_0 ),
        .BIT_ALGN_START              ( BIT_ALGN_START_net_0 ),
        .BIT_ALGN_DONE               ( BIT_ALGN_DONE_net_0 ),
        .BIT_ALGN_ERR                ( BIT_ALGN_ERR_net_0 ),
        .RX_CLK_G                    ( RX_CLK_G_net_0 ),
        .BIT_ALGN_MOVE               ( BIT_ALGN_MOVE_net_0 ),
        .BIT_ALGN_CLR_FLGS           ( BIT_ALGN_CLR_FLGS_net_0 ),
        .BIT_ALGN_LOAD               ( BIT_ALGN_LOAD_net_0 ),
        .BIT_ALGN_DIR                ( BIT_ALGN_DIR_net_0 ),
        .CLK_TRAIN_ERROR             ( CLK_TRAIN_ERROR_net_0 ),
        .TX_CLK                      ( CoreRxIODBitAlign_SD_wrap_0_TX_CLK ),
        .TX_CLK_N                    ( CoreRxIODBitAlign_SD_wrap_0_TX_CLK_N ),
        .DELAY_LINE_OUT_OF_RANGE     ( DELAY_LINE_OUT_OF_RANGE_net_0 ),
        .EYE_MONITOR_LATE            ( EYE_MONITOR_LATE_net_0 ),
        .EYE_MONITOR_EARLY           ( EYE_MONITOR_EARLY_net_0 ),
        .PRBSGEN_DATA                ( PRBSGEN_DATA_net_0 ),
        .TXD                         ( CoreRxIODBitAlign_SD_wrap_0_TXD ),
        .TXD_N                       ( CoreRxIODBitAlign_SD_wrap_0_TXD_N ),
        .RX_BIT_ALIGN_RGHT_WIN       ( RX_BIT_ALIGN_RGHT_WIN_net_0 ),
        .RX_BIT_ALIGN_LEFT_WIN       ( RX_BIT_ALIGN_LEFT_WIN_net_0 ),
        .DEM_BIT_ALGN_TAPDLY         ( DEM_BIT_ALGN_TAPDLY_net_0 ) 
        );


endmodule
