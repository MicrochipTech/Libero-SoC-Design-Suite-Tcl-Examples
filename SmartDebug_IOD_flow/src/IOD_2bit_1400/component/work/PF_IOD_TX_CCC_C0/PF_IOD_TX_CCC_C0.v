//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Sep  4 12:22:13 2020
// Version: v12.6 12.900.20.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PF_IOD_TX_CCC_C0
module PF_IOD_TX_CCC_C0(
    // Inputs
    CLK_ALIGN_IOD_RX,
    POWERDOWN_N,
    REF_CLK,
    // Outputs
    CLK_TRAIN_DONE,
    GL3,
    HS_IO_CLK_0,
    HS_IO_CLK_90,
    HS_IO_CLK_PAUSE,
    PLL_LOCK,
    TX_CLK_G,
    TX_CLK_G_TO_IOD
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [3:0] CLK_ALIGN_IOD_RX;
input        POWERDOWN_N;
input        REF_CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       CLK_TRAIN_DONE;
output       GL3;
output       HS_IO_CLK_0;
output       HS_IO_CLK_90;
output       HS_IO_CLK_PAUSE;
output       PLL_LOCK;
output       TX_CLK_G;
output       TX_CLK_G_TO_IOD;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0] CLK_ALIGN_IOD_RX;
wire         CLK_TRAIN_DONE_net_0;
wire         COREBCLKSCLKALIGN_0_PLL_LOADPHS;
wire         COREBCLKSCLKALIGN_0_PLL_PHS_DIRECTION;
wire         COREBCLKSCLKALIGN_0_PLL_PHS_ROTATE;
wire         COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK90_SEL;
wire         COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK_SEL;
wire         GL3_net_0;
wire         HS_IO_CLK_0_net_0;
wire         HS_IO_CLK_90_net_0;
wire         HS_IO_CLK_PAUSE_net_0;
wire         PLL_LOCK_net_0;
wire         POWERDOWN_N;
wire         REF_CLK;
wire         TX_CLK_G_net_0;
wire         HS_IO_CLK_0_net_1;
wire         PLL_LOCK_net_1;
wire         CLK_TRAIN_DONE_net_1;
wire         HS_IO_CLK_PAUSE_net_1;
wire         TX_CLK_G_net_1;
wire         TX_CLK_G_net_2;
wire         HS_IO_CLK_90_net_1;
wire         GL3_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [2:0] PLL_BCLKPHS_OFFSET_const_net_0;
wire   [7:0] ICB_BCLKPHS_OFFSET_const_net_0;
wire         GND_net;
wire   [10:0]DRI_CTRL_0_const_net_0;
wire   [32:0]DRI_WDATA_0_const_net_0;
wire   [10:0]DRI_CTRL_1_const_net_0;
wire   [32:0]DRI_WDATA_1_const_net_0;
wire   [10:0]DLL_DRI_CTRL_const_net_0;
wire   [32:0]DLL_DRI_WDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign PLL_BCLKPHS_OFFSET_const_net_0 = 3'h4;
assign ICB_BCLKPHS_OFFSET_const_net_0 = 8'h00;
assign GND_net                        = 1'b0;
assign DRI_CTRL_0_const_net_0         = 11'h000;
assign DRI_WDATA_0_const_net_0        = 33'h000000000;
assign DRI_CTRL_1_const_net_0         = 11'h000;
assign DRI_WDATA_1_const_net_0        = 33'h000000000;
assign DLL_DRI_CTRL_const_net_0       = 11'h000;
assign DLL_DRI_WDATA_const_net_0      = 33'h000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign HS_IO_CLK_0_net_1     = HS_IO_CLK_0_net_0;
assign HS_IO_CLK_0           = HS_IO_CLK_0_net_1;
assign PLL_LOCK_net_1        = PLL_LOCK_net_0;
assign PLL_LOCK              = PLL_LOCK_net_1;
assign CLK_TRAIN_DONE_net_1  = CLK_TRAIN_DONE_net_0;
assign CLK_TRAIN_DONE        = CLK_TRAIN_DONE_net_1;
assign HS_IO_CLK_PAUSE_net_1 = HS_IO_CLK_PAUSE_net_0;
assign HS_IO_CLK_PAUSE       = HS_IO_CLK_PAUSE_net_1;
assign TX_CLK_G_net_1        = TX_CLK_G_net_0;
assign TX_CLK_G              = TX_CLK_G_net_1;
assign TX_CLK_G_net_2        = TX_CLK_G_net_0;
assign TX_CLK_G_TO_IOD       = TX_CLK_G_net_2;
assign HS_IO_CLK_90_net_1    = HS_IO_CLK_90_net_0;
assign HS_IO_CLK_90          = HS_IO_CLK_90_net_1;
assign GL3_net_1             = GL3_net_0;
assign GL3                   = GL3_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_IOD_TX_CCC_C0_TR
PF_IOD_TX_CCC_C0_TR COREBCLKSCLKALIGN_0(
        // Inputs
        .SCLK                    ( TX_CLK_G_net_0 ),
        .RESETN                  ( POWERDOWN_N ),
        .PLL_BCLKPHS_OFFSET      ( PLL_BCLKPHS_OFFSET_const_net_0 ),
        .ICB_BCLKPHS_OFFSET      ( ICB_BCLKPHS_OFFSET_const_net_0 ),
        .CLK_ALGN_RSTRT          ( GND_net ),
        .CLK_ALGN_HOLD           ( GND_net ),
        .CLK_ALGN_SKIP           ( GND_net ),
        .BCLKSCLK_TRAIN_START    ( PLL_LOCK_net_0 ),
        .IOD_EARLY               ( GND_net ),
        .IOD_LATE                ( GND_net ),
        .IOD_OOR                 ( GND_net ),
        .BCLK_IGEAR_RX           ( CLK_ALIGN_IOD_RX ),
        // Outputs
        .PLL_VCOPHSEL_SCLK_SEL   (  ),
        .PLL_VCOPHSEL_BCLK_SEL   ( COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK_SEL ),
        .PLL_VCOPHSEL_BCLK90_SEL ( COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK90_SEL ),
        .PLL_VCOPHSEL_MCLK_SEL   (  ),
        .PLL_LOADPHS             ( COREBCLKSCLKALIGN_0_PLL_LOADPHS ),
        .PLL_PHS_ROTATE          ( COREBCLKSCLKALIGN_0_PLL_PHS_ROTATE ),
        .PLL_PHS_DIRECTION       ( COREBCLKSCLKALIGN_0_PLL_PHS_DIRECTION ),
        .ICB_CLK_ALGN_ERR        (  ),
        .BCLKSCLK_TRAIN_DONE     ( CLK_TRAIN_DONE_net_0 ),
        .BCLKSCLK_BCLK_VCOPHSEL  (  ),
        .ICB_CLK_ALGN_TAPDLY     (  ),
        .ICB_CLK_ALGN_LOAD       (  ),
        .ICB_CLK_ALGN_MOV        (  ),
        .ICB_CLK_ALGN_DIR        (  ),
        .ICB_CLK_ALGN_CLR_FLGS   (  ),
        .BCLKSCLK_ALGN_PAUSE     ( HS_IO_CLK_PAUSE_net_0 ) 
        );

//--------PF_IOD_TX_CCC_C0_PF_CCC_0_PF_CCC   -   Actel:SgCore:PF_CCC:2.1.104
PF_IOD_TX_CCC_C0_PF_CCC_0_PF_CCC PF_CCC_0(
        // Inputs
        .REF_CLK_0         ( REF_CLK ),
        .PHASE_OUT0_SEL_0  ( COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK_SEL ),
        .PHASE_OUT1_SEL_0  ( COREBCLKSCLKALIGN_0_PLL_VCOPHSEL_BCLK90_SEL ),
        .PHASE_ROTATE_0    ( COREBCLKSCLKALIGN_0_PLL_PHS_ROTATE ),
        .PHASE_DIRECTION_0 ( COREBCLKSCLKALIGN_0_PLL_PHS_DIRECTION ),
        .LOAD_PHASE_N_0    ( COREBCLKSCLKALIGN_0_PLL_LOADPHS ),
        .PLL_POWERDOWN_N_0 ( POWERDOWN_N ),
        // Outputs
        .OUT2_FABCLK_0     ( TX_CLK_G_net_0 ),
        .OUT3_FABCLK_0     ( GL3_net_0 ),
        .OUT0_HS_IO_CLK_0  ( HS_IO_CLK_0_net_0 ),
        .OUT1_HS_IO_CLK_0  ( HS_IO_CLK_90_net_0 ),
        .PLL_LOCK_0        ( PLL_LOCK_net_0 ) 
        );


endmodule
