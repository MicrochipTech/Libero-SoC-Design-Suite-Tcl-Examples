//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun May  3 18:21:27 2020
// Version: v12.4 12.900.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// RXIOD_COMP_TR
module RXIOD_COMP_TR(
    // Inputs
    BCLKSCLK_TRAIN_START,
    BCLK_IGEAR_RX,
    CLK_ALGN_HOLD,
    CLK_ALGN_RSTRT,
    CLK_ALGN_SKIP,
    ICB_BCLKPHS_OFFSET,
    IOD_EARLY,
    IOD_LATE,
    IOD_OOR,
    PLL_BCLKPHS_OFFSET,
    RESETN,
    SCLK,
    // Outputs
    BCLKSCLK_ALGN_PAUSE,
    BCLKSCLK_BCLK_VCOPHSEL,
    BCLKSCLK_TRAIN_DONE,
    ICB_CLK_ALGN_CLR_FLGS,
    ICB_CLK_ALGN_DIR,
    ICB_CLK_ALGN_ERR,
    ICB_CLK_ALGN_LOAD,
    ICB_CLK_ALGN_MOV,
    ICB_CLK_ALGN_TAPDLY,
    PLL_LOADPHS,
    PLL_PHS_DIRECTION,
    PLL_PHS_ROTATE,
    PLL_VCOPHSEL_BCLK90_SEL,
    PLL_VCOPHSEL_BCLK_SEL,
    PLL_VCOPHSEL_MCLK_SEL,
    PLL_VCOPHSEL_SCLK_SEL
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        BCLKSCLK_TRAIN_START;
input  [3:0] BCLK_IGEAR_RX;
input        CLK_ALGN_HOLD;
input        CLK_ALGN_RSTRT;
input        CLK_ALGN_SKIP;
input  [7:0] ICB_BCLKPHS_OFFSET;
input        IOD_EARLY;
input        IOD_LATE;
input        IOD_OOR;
input  [2:0] PLL_BCLKPHS_OFFSET;
input        RESETN;
input        SCLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       BCLKSCLK_ALGN_PAUSE;
output [6:0] BCLKSCLK_BCLK_VCOPHSEL;
output       BCLKSCLK_TRAIN_DONE;
output       ICB_CLK_ALGN_CLR_FLGS;
output       ICB_CLK_ALGN_DIR;
output       ICB_CLK_ALGN_ERR;
output       ICB_CLK_ALGN_LOAD;
output       ICB_CLK_ALGN_MOV;
output [7:0] ICB_CLK_ALGN_TAPDLY;
output       PLL_LOADPHS;
output       PLL_PHS_DIRECTION;
output       PLL_PHS_ROTATE;
output       PLL_VCOPHSEL_BCLK90_SEL;
output       PLL_VCOPHSEL_BCLK_SEL;
output       PLL_VCOPHSEL_MCLK_SEL;
output       PLL_VCOPHSEL_SCLK_SEL;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0] BCLK_IGEAR_RX;
wire         BCLKSCLK_ALGN_PAUSE_net_0;
wire   [6:0] BCLKSCLK_BCLK_VCOPHSEL_net_0;
wire         BCLKSCLK_TRAIN_DONE_net_0;
wire         BCLKSCLK_TRAIN_START;
wire         CLK_ALGN_HOLD;
wire         CLK_ALGN_RSTRT;
wire         CLK_ALGN_SKIP;
wire   [7:0] ICB_BCLKPHS_OFFSET;
wire         ICB_CLK_ALGN_CLR_FLGS_net_0;
wire         ICB_CLK_ALGN_DIR_net_0;
wire         ICB_CLK_ALGN_ERR_net_0;
wire         ICB_CLK_ALGN_LOAD_net_0;
wire         ICB_CLK_ALGN_MOV_net_0;
wire   [7:0] ICB_CLK_ALGN_TAPDLY_net_0;
wire         IOD_EARLY;
wire         IOD_LATE;
wire         IOD_OOR;
wire   [2:0] PLL_BCLKPHS_OFFSET;
wire         PLL_LOADPHS_net_0;
wire         PLL_PHS_DIRECTION_net_0;
wire         PLL_PHS_ROTATE_net_0;
wire         PLL_VCOPHSEL_BCLK90_SEL_net_0;
wire         PLL_VCOPHSEL_BCLK_SEL_net_0;
wire         PLL_VCOPHSEL_MCLK_SEL_net_0;
wire         PLL_VCOPHSEL_SCLK_SEL_net_0;
wire         RESETN;
wire         SCLK;
wire         PLL_VCOPHSEL_SCLK_SEL_net_1;
wire         PLL_VCOPHSEL_BCLK_SEL_net_1;
wire         PLL_VCOPHSEL_BCLK90_SEL_net_1;
wire         PLL_VCOPHSEL_MCLK_SEL_net_1;
wire         PLL_LOADPHS_net_1;
wire         PLL_PHS_ROTATE_net_1;
wire         PLL_PHS_DIRECTION_net_1;
wire         ICB_CLK_ALGN_ERR_net_1;
wire         BCLKSCLK_TRAIN_DONE_net_1;
wire   [6:0] BCLKSCLK_BCLK_VCOPHSEL_net_1;
wire   [7:0] ICB_CLK_ALGN_TAPDLY_net_1;
wire         ICB_CLK_ALGN_LOAD_net_1;
wire         ICB_CLK_ALGN_MOV_net_1;
wire         ICB_CLK_ALGN_DIR_net_1;
wire         ICB_CLK_ALGN_CLR_FLGS_net_1;
wire         BCLKSCLK_ALGN_PAUSE_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PLL_VCOPHSEL_SCLK_SEL_net_1   = PLL_VCOPHSEL_SCLK_SEL_net_0;
assign PLL_VCOPHSEL_SCLK_SEL         = PLL_VCOPHSEL_SCLK_SEL_net_1;
assign PLL_VCOPHSEL_BCLK_SEL_net_1   = PLL_VCOPHSEL_BCLK_SEL_net_0;
assign PLL_VCOPHSEL_BCLK_SEL         = PLL_VCOPHSEL_BCLK_SEL_net_1;
assign PLL_VCOPHSEL_BCLK90_SEL_net_1 = PLL_VCOPHSEL_BCLK90_SEL_net_0;
assign PLL_VCOPHSEL_BCLK90_SEL       = PLL_VCOPHSEL_BCLK90_SEL_net_1;
assign PLL_VCOPHSEL_MCLK_SEL_net_1   = PLL_VCOPHSEL_MCLK_SEL_net_0;
assign PLL_VCOPHSEL_MCLK_SEL         = PLL_VCOPHSEL_MCLK_SEL_net_1;
assign PLL_LOADPHS_net_1             = PLL_LOADPHS_net_0;
assign PLL_LOADPHS                   = PLL_LOADPHS_net_1;
assign PLL_PHS_ROTATE_net_1          = PLL_PHS_ROTATE_net_0;
assign PLL_PHS_ROTATE                = PLL_PHS_ROTATE_net_1;
assign PLL_PHS_DIRECTION_net_1       = PLL_PHS_DIRECTION_net_0;
assign PLL_PHS_DIRECTION             = PLL_PHS_DIRECTION_net_1;
assign ICB_CLK_ALGN_ERR_net_1        = ICB_CLK_ALGN_ERR_net_0;
assign ICB_CLK_ALGN_ERR              = ICB_CLK_ALGN_ERR_net_1;
assign BCLKSCLK_TRAIN_DONE_net_1     = BCLKSCLK_TRAIN_DONE_net_0;
assign BCLKSCLK_TRAIN_DONE           = BCLKSCLK_TRAIN_DONE_net_1;
assign BCLKSCLK_BCLK_VCOPHSEL_net_1  = BCLKSCLK_BCLK_VCOPHSEL_net_0;
assign BCLKSCLK_BCLK_VCOPHSEL[6:0]   = BCLKSCLK_BCLK_VCOPHSEL_net_1;
assign ICB_CLK_ALGN_TAPDLY_net_1     = ICB_CLK_ALGN_TAPDLY_net_0;
assign ICB_CLK_ALGN_TAPDLY[7:0]      = ICB_CLK_ALGN_TAPDLY_net_1;
assign ICB_CLK_ALGN_LOAD_net_1       = ICB_CLK_ALGN_LOAD_net_0;
assign ICB_CLK_ALGN_LOAD             = ICB_CLK_ALGN_LOAD_net_1;
assign ICB_CLK_ALGN_MOV_net_1        = ICB_CLK_ALGN_MOV_net_0;
assign ICB_CLK_ALGN_MOV              = ICB_CLK_ALGN_MOV_net_1;
assign ICB_CLK_ALGN_DIR_net_1        = ICB_CLK_ALGN_DIR_net_0;
assign ICB_CLK_ALGN_DIR              = ICB_CLK_ALGN_DIR_net_1;
assign ICB_CLK_ALGN_CLR_FLGS_net_1   = ICB_CLK_ALGN_CLR_FLGS_net_0;
assign ICB_CLK_ALGN_CLR_FLGS         = ICB_CLK_ALGN_CLR_FLGS_net_1;
assign BCLKSCLK_ALGN_PAUSE_net_1     = BCLKSCLK_ALGN_PAUSE_net_0;
assign BCLKSCLK_ALGN_PAUSE           = BCLKSCLK_ALGN_PAUSE_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------RXIOD_COMP_TR_RXIOD_COMP_TR_0_COREBCLKSCLKALIGN   -   Actel:DirectCore:COREBCLKSCLKALIGN:2.0.111
RXIOD_COMP_TR_RXIOD_COMP_TR_0_COREBCLKSCLKALIGN #( 
        .BCLKSCLK_ICB_MODE               ( 1 ),
        .BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH ( 3 ),
        .BCLKSCLK_TRN_MODE               ( 1 ),
        .CLK_ALGN_HOLD_TRNG              ( 1 ),
        .CLK_ALGN_SKIP_TRNG              ( 1 ),
        .FAMILY                          ( 26 ),
        .IOG_FABRIC_RATIO                ( 4 ) )
RXIOD_COMP_TR_0(
        // Inputs
        .SCLK                    ( SCLK ),
        .RESETN                  ( RESETN ),
        .PLL_BCLKPHS_OFFSET      ( PLL_BCLKPHS_OFFSET ),
        .ICB_BCLKPHS_OFFSET      ( ICB_BCLKPHS_OFFSET ),
        .CLK_ALGN_RSTRT          ( CLK_ALGN_RSTRT ),
        .CLK_ALGN_HOLD           ( CLK_ALGN_HOLD ),
        .CLK_ALGN_SKIP           ( CLK_ALGN_SKIP ),
        .BCLKSCLK_TRAIN_START    ( BCLKSCLK_TRAIN_START ),
        .BCLK_IGEAR_RX           ( BCLK_IGEAR_RX ),
        .IOD_EARLY               ( IOD_EARLY ),
        .IOD_LATE                ( IOD_LATE ),
        .IOD_OOR                 ( IOD_OOR ),
        // Outputs
        .PLL_VCOPHSEL_SCLK_SEL   ( PLL_VCOPHSEL_SCLK_SEL_net_0 ),
        .PLL_VCOPHSEL_BCLK_SEL   ( PLL_VCOPHSEL_BCLK_SEL_net_0 ),
        .PLL_VCOPHSEL_BCLK90_SEL ( PLL_VCOPHSEL_BCLK90_SEL_net_0 ),
        .PLL_VCOPHSEL_MCLK_SEL   ( PLL_VCOPHSEL_MCLK_SEL_net_0 ),
        .PLL_LOADPHS             ( PLL_LOADPHS_net_0 ),
        .PLL_PHS_ROTATE          ( PLL_PHS_ROTATE_net_0 ),
        .PLL_PHS_DIRECTION       ( PLL_PHS_DIRECTION_net_0 ),
        .ICB_CLK_ALGN_ERR        ( ICB_CLK_ALGN_ERR_net_0 ),
        .BCLKSCLK_TRAIN_DONE     ( BCLKSCLK_TRAIN_DONE_net_0 ),
        .BCLKSCLK_BCLK_VCOPHSEL  ( BCLKSCLK_BCLK_VCOPHSEL_net_0 ),
        .ICB_CLK_ALGN_TAPDLY     ( ICB_CLK_ALGN_TAPDLY_net_0 ),
        .ICB_CLK_ALGN_LOAD       ( ICB_CLK_ALGN_LOAD_net_0 ),
        .ICB_CLK_ALGN_MOV        ( ICB_CLK_ALGN_MOV_net_0 ),
        .ICB_CLK_ALGN_DIR        ( ICB_CLK_ALGN_DIR_net_0 ),
        .ICB_CLK_ALGN_CLR_FLGS   ( ICB_CLK_ALGN_CLR_FLGS_net_0 ),
        .BCLKSCLK_ALGN_PAUSE     ( BCLKSCLK_ALGN_PAUSE_net_0 ) 
        );


endmodule
