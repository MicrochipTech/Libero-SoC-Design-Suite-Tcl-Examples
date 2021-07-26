//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Nov 26 15:23:00 2020
// Version: v12.5 12.900.10.15
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// CORERXIODBITALIGN_C0
module CORERXIODBITALIGN_C0(
    // Inputs
    BIT_ALGN_EYE_IN,
    BIT_ALGN_HOLD,
    BIT_ALGN_RSTRT,
    BIT_ALGN_SKIP,
    IOD_EARLY,
    IOD_LATE,
    IOD_OOR,
    PLL_LOCK,
    RESETN,
    SCLK,
    // Outputs
    BIT_ALGN_CLR_FLGS,
    BIT_ALGN_DIR,
    BIT_ALGN_DONE,
    BIT_ALGN_ERR,
    BIT_ALGN_LOAD,
    BIT_ALGN_MOVE,
    BIT_ALGN_OOR,
    BIT_ALGN_START,
    DEM_BIT_ALGN_TAPDLY,
    RX_BIT_ALIGN_LEFT_WIN,
    RX_BIT_ALIGN_RGHT_WIN
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [2:0] BIT_ALGN_EYE_IN;
input        BIT_ALGN_HOLD;
input        BIT_ALGN_RSTRT;
input        BIT_ALGN_SKIP;
input        IOD_EARLY;
input        IOD_LATE;
input        IOD_OOR;
input        PLL_LOCK;
input        RESETN;
input        SCLK;
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
output [7:0] DEM_BIT_ALGN_TAPDLY;
output [7:0] RX_BIT_ALIGN_LEFT_WIN;
output [7:0] RX_BIT_ALIGN_RGHT_WIN;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         BIT_ALGN_CLR_FLGS_net_0;
wire         BIT_ALGN_DIR_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_ERR_net_0;
wire   [2:0] BIT_ALGN_EYE_IN;
wire         BIT_ALGN_HOLD;
wire         BIT_ALGN_LOAD_net_0;
wire         BIT_ALGN_MOVE_net_0;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_RSTRT;
wire         BIT_ALGN_SKIP;
wire         BIT_ALGN_START_net_0;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_0;
wire         IOD_EARLY;
wire         IOD_LATE;
wire         IOD_OOR;
wire         PLL_LOCK;
wire         RESETN;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_0;
wire         SCLK;
wire         BIT_ALGN_START_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_CLR_FLGS_net_1;
wire         BIT_ALGN_LOAD_net_1;
wire         BIT_ALGN_DIR_net_1;
wire         BIT_ALGN_MOVE_net_1;
wire         BIT_ALGN_ERR_net_1;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_1;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_1;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BIT_ALGN_START_net_1        = BIT_ALGN_START_net_0;
assign BIT_ALGN_START              = BIT_ALGN_START_net_1;
assign BIT_ALGN_DONE_net_1         = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE               = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_OOR_net_1          = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR                = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_CLR_FLGS_net_1     = BIT_ALGN_CLR_FLGS_net_0;
assign BIT_ALGN_CLR_FLGS           = BIT_ALGN_CLR_FLGS_net_1;
assign BIT_ALGN_LOAD_net_1         = BIT_ALGN_LOAD_net_0;
assign BIT_ALGN_LOAD               = BIT_ALGN_LOAD_net_1;
assign BIT_ALGN_DIR_net_1          = BIT_ALGN_DIR_net_0;
assign BIT_ALGN_DIR                = BIT_ALGN_DIR_net_1;
assign BIT_ALGN_MOVE_net_1         = BIT_ALGN_MOVE_net_0;
assign BIT_ALGN_MOVE               = BIT_ALGN_MOVE_net_1;
assign BIT_ALGN_ERR_net_1          = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR                = BIT_ALGN_ERR_net_1;
assign DEM_BIT_ALGN_TAPDLY_net_1   = DEM_BIT_ALGN_TAPDLY_net_0;
assign DEM_BIT_ALGN_TAPDLY[7:0]    = DEM_BIT_ALGN_TAPDLY_net_1;
assign RX_BIT_ALIGN_LEFT_WIN_net_1 = RX_BIT_ALIGN_LEFT_WIN_net_0;
assign RX_BIT_ALIGN_LEFT_WIN[7:0]  = RX_BIT_ALIGN_LEFT_WIN_net_1;
assign RX_BIT_ALIGN_RGHT_WIN_net_1 = RX_BIT_ALIGN_RGHT_WIN_net_0;
assign RX_BIT_ALIGN_RGHT_WIN[7:0]  = RX_BIT_ALIGN_RGHT_WIN_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN   -   Actel:DirectCore:CORERXIODBITALIGN:2.2.100
CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN #( 
        .DEM_TAP_WAIT_CNT_WIDTH ( 3 ),
        .HOLD_TRNG              ( 0 ),
        .MIPI_TRNG              ( 0 ),
        .SKIP_TRNG              ( 0 ) )
CORERXIODBITALIGN_C0_0(
        // Inputs
        .SCLK                  ( SCLK ),
        .RESETN                ( RESETN ),
        .PLL_LOCK              ( PLL_LOCK ),
        .IOD_EARLY             ( IOD_EARLY ),
        .IOD_LATE              ( IOD_LATE ),
        .IOD_OOR               ( IOD_OOR ),
        .BIT_ALGN_RSTRT        ( BIT_ALGN_RSTRT ),
        .BIT_ALGN_HOLD         ( BIT_ALGN_HOLD ),
        .BIT_ALGN_EYE_IN       ( BIT_ALGN_EYE_IN ),
        .LP_IN                 ( GND_net ), // tied to 1'b0 from definition
        .BIT_ALGN_SKIP         ( BIT_ALGN_SKIP ),
        // Outputs
        .BIT_ALGN_START        ( BIT_ALGN_START_net_0 ),
        .BIT_ALGN_DONE         ( BIT_ALGN_DONE_net_0 ),
        .BIT_ALGN_OOR          ( BIT_ALGN_OOR_net_0 ),
        .BIT_ALGN_CLR_FLGS     ( BIT_ALGN_CLR_FLGS_net_0 ),
        .BIT_ALGN_LOAD         ( BIT_ALGN_LOAD_net_0 ),
        .BIT_ALGN_DIR          ( BIT_ALGN_DIR_net_0 ),
        .BIT_ALGN_MOVE         ( BIT_ALGN_MOVE_net_0 ),
        .BIT_ALGN_ERR          ( BIT_ALGN_ERR_net_0 ),
        .DEM_BIT_ALGN_TAPDLY   ( DEM_BIT_ALGN_TAPDLY_net_0 ),
        .RX_BIT_ALIGN_LEFT_WIN ( RX_BIT_ALIGN_LEFT_WIN_net_0 ),
        .RX_BIT_ALIGN_RGHT_WIN ( RX_BIT_ALIGN_RGHT_WIN_net_0 ) 
        );


endmodule
