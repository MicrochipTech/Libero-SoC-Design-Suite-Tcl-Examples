//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Aug 28 12:11:42 2020
// Version: v12.6 12.900.20.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// sd_tb
module sd_tb(
    // Inputs
    RESTARTN,
    SWITCH,
    // Outputs
    Algn_Done,
    Algn_Err,
    BIT_ALGN_DONE,
    BIT_ALGN_DONE_0,
    BIT_ALGN_ERR,
    BIT_ALGN_ERR_0,
    BIT_ALGN_OOR,
    BIT_ALGN_OOR_0,
    BIT_ALGN_START,
    BIT_ALGN_START_0,
    BIT_ALGN_START_1,
    CLK_TRAIN_ERROR,
    PLL_LOCK,
    PLL_LOCK_0,
    PRBS_ERR,
    PRBS_ERR_0,
    TXD,
    TXD_N,
    Y,
    prbs_chk_error_o_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        RESTARTN;
input        SWITCH;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       Algn_Done;
output       Algn_Err;
output       BIT_ALGN_DONE;
output       BIT_ALGN_DONE_0;
output       BIT_ALGN_ERR;
output       BIT_ALGN_ERR_0;
output       BIT_ALGN_OOR;
output       BIT_ALGN_OOR_0;
output       BIT_ALGN_START;
output       BIT_ALGN_START_0;
output       BIT_ALGN_START_1;
output       CLK_TRAIN_ERROR;
output       PLL_LOCK;
output       PLL_LOCK_0;
output       PRBS_ERR;
output       PRBS_ERR_0;
output [1:0] TXD;
output [1:0] TXD_N;
output       Y;
output       prbs_chk_error_o_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         Algn_Done_net_0;
wire         Algn_Err_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_DONE_0_net_0;
wire         BIT_ALGN_ERR_net_0;
wire         BIT_ALGN_ERR_0_net_0;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_OOR_0_net_0;
wire         BIT_ALGN_START_net_0;
wire         BIT_ALGN_START_0_net_0;
wire         BIT_ALGN_START_1_net_0;
wire         CLK_TRAIN_ERROR_net_0;
wire         IOG_IOD_DDRX4_COMP_0_TX_CLK;
wire         IOG_IOD_DDRX4_COMP_0_TX_CLK_N;
wire         PLL_LOCK_net_0;
wire         PLL_LOCK_0_net_0;
wire         prbs_chk_error_o_1_net_0;
wire         PRBS_ERR_net_0;
wire         PRBS_ERR_0_net_0;
wire         RESTARTN;
wire         SWITCH;
wire   [1:0] TXD_net_0;
wire   [1:0] TXD_N_net_0;
wire         Y_net_0;
wire         prbs_chk_error_o_1_net_1;
wire         BIT_ALGN_START_0_net_1;
wire         BIT_ALGN_DONE_0_net_1;
wire         BIT_ALGN_OOR_0_net_1;
wire         BIT_ALGN_ERR_net_1;
wire         PRBS_ERR_net_1;
wire         Y_net_1;
wire         Algn_Done_net_1;
wire         Algn_Err_net_1;
wire         BIT_ALGN_START_net_1;
wire         PRBS_ERR_0_net_1;
wire         PLL_LOCK_0_net_1;
wire         PLL_LOCK_net_1;
wire         CLK_TRAIN_ERROR_net_1;
wire         BIT_ALGN_START_1_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_ERR_0_net_1;
wire   [1:0] TXD_N_net_1;
wire   [1:0] TXD_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [2:0] BIT_ALGN_EYE_IN_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign BIT_ALGN_EYE_IN_const_net_0 = 3'h2;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign prbs_chk_error_o_1_net_1 = prbs_chk_error_o_1_net_0;
assign prbs_chk_error_o_1       = prbs_chk_error_o_1_net_1;
assign BIT_ALGN_START_0_net_1   = BIT_ALGN_START_0_net_0;
assign BIT_ALGN_START_0         = BIT_ALGN_START_0_net_1;
assign BIT_ALGN_DONE_0_net_1    = BIT_ALGN_DONE_0_net_0;
assign BIT_ALGN_DONE_0          = BIT_ALGN_DONE_0_net_1;
assign BIT_ALGN_OOR_0_net_1     = BIT_ALGN_OOR_0_net_0;
assign BIT_ALGN_OOR_0           = BIT_ALGN_OOR_0_net_1;
assign BIT_ALGN_ERR_net_1       = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR             = BIT_ALGN_ERR_net_1;
assign PRBS_ERR_net_1           = PRBS_ERR_net_0;
assign PRBS_ERR                 = PRBS_ERR_net_1;
assign Y_net_1                  = Y_net_0;
assign Y                        = Y_net_1;
assign Algn_Done_net_1          = Algn_Done_net_0;
assign Algn_Done                = Algn_Done_net_1;
assign Algn_Err_net_1           = Algn_Err_net_0;
assign Algn_Err                 = Algn_Err_net_1;
assign BIT_ALGN_START_net_1     = BIT_ALGN_START_net_0;
assign BIT_ALGN_START           = BIT_ALGN_START_net_1;
assign PRBS_ERR_0_net_1         = PRBS_ERR_0_net_0;
assign PRBS_ERR_0               = PRBS_ERR_0_net_1;
assign PLL_LOCK_0_net_1         = PLL_LOCK_0_net_0;
assign PLL_LOCK_0               = PLL_LOCK_0_net_1;
assign PLL_LOCK_net_1           = PLL_LOCK_net_0;
assign PLL_LOCK                 = PLL_LOCK_net_1;
assign CLK_TRAIN_ERROR_net_1    = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR          = CLK_TRAIN_ERROR_net_1;
assign BIT_ALGN_START_1_net_1   = BIT_ALGN_START_1_net_0;
assign BIT_ALGN_START_1         = BIT_ALGN_START_1_net_1;
assign BIT_ALGN_DONE_net_1      = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE            = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_OOR_net_1       = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR             = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_ERR_0_net_1     = BIT_ALGN_ERR_0_net_0;
assign BIT_ALGN_ERR_0           = BIT_ALGN_ERR_0_net_1;
assign TXD_N_net_1              = TXD_N_net_0;
assign TXD_N[1:0]               = TXD_N_net_1;
assign TXD_net_1                = TXD_net_0;
assign TXD[1:0]                 = TXD_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------IOG_IOD_DDRX4_COMP
IOG_IOD_DDRX4_COMP IOG_IOD_DDRX4_COMP_0(
        // Inputs
        .RESTARTN           ( RESTARTN ),
        .RX_CLK_P           ( IOG_IOD_DDRX4_COMP_0_TX_CLK ),
        .RX_CLK_N           ( IOG_IOD_DDRX4_COMP_0_TX_CLK_N ),
        .SWITCH             ( SWITCH ),
        .BIT_ALGN_EYE_IN    ( BIT_ALGN_EYE_IN_const_net_0 ),
        .RXD                ( TXD_net_0 ),
        .RXD_N              ( TXD_N_net_0 ),
        // Outputs
        .BIT_ALGN_START_0   ( BIT_ALGN_START_0_net_0 ),
        .BIT_ALGN_DONE_0    ( BIT_ALGN_DONE_0_net_0 ),
        .BIT_ALGN_OOR_0     ( BIT_ALGN_OOR_0_net_0 ),
        .BIT_ALGN_ERR       ( BIT_ALGN_ERR_net_0 ),
        .PRBS_ERR           ( PRBS_ERR_net_0 ),
        .Y                  ( Y_net_0 ),
        .Algn_Done          ( Algn_Done_net_0 ),
        .Algn_Err           ( Algn_Err_net_0 ),
        .BIT_ALGN_START     ( BIT_ALGN_START_net_0 ),
        .PRBS_ERR_0         ( PRBS_ERR_0_net_0 ),
        .PLL_LOCK_0         ( PLL_LOCK_0_net_0 ),
        .PLL_LOCK           ( PLL_LOCK_net_0 ),
        .CLK_TRAIN_ERROR    ( CLK_TRAIN_ERROR_net_0 ),
        .TX_CLK             ( IOG_IOD_DDRX4_COMP_0_TX_CLK ),
        .TX_CLK_N           ( IOG_IOD_DDRX4_COMP_0_TX_CLK_N ),
        .BIT_ALGN_START_1   ( BIT_ALGN_START_1_net_0 ),
        .BIT_ALGN_DONE      ( BIT_ALGN_DONE_net_0 ),
        .BIT_ALGN_OOR       ( BIT_ALGN_OOR_net_0 ),
        .BIT_ALGN_ERR_0     ( BIT_ALGN_ERR_0_net_0 ),
        .prbs_chk_error_o_1 ( prbs_chk_error_o_1_net_0 ),
        .TXD                ( TXD_net_0 ),
        .TXD_N              ( TXD_N_net_0 ) 
        );


endmodule
