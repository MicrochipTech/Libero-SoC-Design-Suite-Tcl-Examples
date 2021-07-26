//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Nov 26 15:23:51 2020
// Version: v12.5 12.900.10.15
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// CoreRxIODBitAlign_SD_wrap
module CoreRxIODBitAlign_SD_wrap(
    // Inputs
    BIT_ALGN_HOLD,
    BIT_ALGN_RSTRT,
    BIT_ALGN_SKIP,
    EYE_MONITOR_WIDTH_ICB_RXIOD,
    HS_IO_CLK_PAUSE,
    PLL_POWERDOWN_N_0,
    REF_CLK_0,
    RESETN,
    RXD,
    RXD_N,
    RX_CLK_N,
    RX_CLK_P,
    RX_CLK_TRAIN_HOLD,
    RX_CLK_TRAIN_RESTART,
    RX_CLK_TRAIN_SKIP,
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
    RX_CLK_G,
    TXD,
    TXD_N,
    TX_CLK,
    TX_CLK_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        BIT_ALGN_HOLD;
input        BIT_ALGN_RSTRT;
input        BIT_ALGN_SKIP;
input  [2:0] EYE_MONITOR_WIDTH_ICB_RXIOD;
input        HS_IO_CLK_PAUSE;
input        PLL_POWERDOWN_N_0;
input        REF_CLK_0;
input        RESETN;
input  [0:0] RXD;
input  [0:0] RXD_N;
input        RX_CLK_N;
input        RX_CLK_P;
input        RX_CLK_TRAIN_HOLD;
input        RX_CLK_TRAIN_RESTART;
input        RX_CLK_TRAIN_SKIP;
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
output [0:0] TXD;
output [0:0] TXD_N;
output       TX_CLK;
output       TX_CLK_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0] CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x2_0_out_data_0;
wire         BIT_ALGN_CLR_FLGS_net_0;
wire         BIT_ALGN_DIR_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_ERR_net_0;
wire         BIT_ALGN_HOLD;
wire         BIT_ALGN_LOAD_net_0;
wire         BIT_ALGN_MOVE_net_0;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_RSTRT;
wire         BIT_ALGN_SKIP;
wire         BIT_ALGN_START_net_0;
wire         CCC_COMP_0_OUT0_HS_IO_CLK_0;
wire         CCC_COMP_0_OUT1_HS_IO_CLK_0;
wire         CCC_COMP_0_OUT2_FABCLK_0;
wire         CLK_TRAIN_DONE_net_0;
wire         CLK_TRAIN_ERROR_net_0;
wire   [0:0] DELAY_LINE_OUT_OF_RANGE_net_0;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_0;
wire   [0:0] EYE_MONITOR_EARLY_net_0;
wire   [0:0] EYE_MONITOR_LATE_net_0;
wire   [2:0] EYE_MONITOR_WIDTH_ICB_RXIOD;
wire         HS_IO_CLK_PAUSE;
wire         PLL_LOCK_0_net_0;
wire         PLL_POWERDOWN_N_0;
wire         prbs_chk_error_o;
wire   [7:0] PRBSGEN_DATA_net_0;
wire         REF_CLK_0;
wire         RESETN;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_0;
wire         RX_CLK_G_net_0;
wire         RX_CLK_N;
wire         RX_CLK_P;
wire         RX_CLK_TRAIN_HOLD;
wire         RX_CLK_TRAIN_RESTART;
wire         RX_CLK_TRAIN_SKIP;
wire   [0:0] RXD;
wire   [0:0] RXD_N;
wire   [7:0] RXIOD_COMP_0_L0_RXD_DATA;
wire         TX_CLK_0;
wire         TX_CLK_N_0;
wire   [0:0] TXD_net_0;
wire   [0:0] TXD_N_net_0;
wire         CLK_TRAIN_DONE_net_1;
wire         prbs_chk_error_o_net_0;
wire         PLL_LOCK_0_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_START_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_ERR_net_1;
wire         RX_CLK_G_net_1;
wire         BIT_ALGN_MOVE_net_1;
wire         BIT_ALGN_CLR_FLGS_net_1;
wire         BIT_ALGN_LOAD_net_1;
wire         BIT_ALGN_DIR_net_1;
wire         CLK_TRAIN_ERROR_net_1;
wire         TX_CLK_0_net_0;
wire         TX_CLK_N_0_net_0;
wire   [0:0] DELAY_LINE_OUT_OF_RANGE_net_1;
wire   [0:0] EYE_MONITOR_LATE_net_1;
wire   [0:0] EYE_MONITOR_EARLY_net_1;
wire   [7:0] PRBSGEN_DATA_net_1;
wire   [0:0] TXD_net_1;
wire   [0:0] TXD_N_net_1;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_1;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_1;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         VCC_net;
wire         GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign CLK_TRAIN_DONE_net_1             = CLK_TRAIN_DONE_net_0;
assign CLK_TRAIN_DONE                   = CLK_TRAIN_DONE_net_1;
assign prbs_chk_error_o_net_0           = prbs_chk_error_o;
assign PRBS_ERR                         = prbs_chk_error_o_net_0;
assign PLL_LOCK_0_net_1                 = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                       = PLL_LOCK_0_net_1;
assign BIT_ALGN_OOR_net_1               = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR                     = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_START_net_1             = BIT_ALGN_START_net_0;
assign BIT_ALGN_START                   = BIT_ALGN_START_net_1;
assign BIT_ALGN_DONE_net_1              = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE                    = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_ERR_net_1               = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR                     = BIT_ALGN_ERR_net_1;
assign RX_CLK_G_net_1                   = RX_CLK_G_net_0;
assign RX_CLK_G                         = RX_CLK_G_net_1;
assign BIT_ALGN_MOVE_net_1              = BIT_ALGN_MOVE_net_0;
assign BIT_ALGN_MOVE                    = BIT_ALGN_MOVE_net_1;
assign BIT_ALGN_CLR_FLGS_net_1          = BIT_ALGN_CLR_FLGS_net_0;
assign BIT_ALGN_CLR_FLGS                = BIT_ALGN_CLR_FLGS_net_1;
assign BIT_ALGN_LOAD_net_1              = BIT_ALGN_LOAD_net_0;
assign BIT_ALGN_LOAD                    = BIT_ALGN_LOAD_net_1;
assign BIT_ALGN_DIR_net_1               = BIT_ALGN_DIR_net_0;
assign BIT_ALGN_DIR                     = BIT_ALGN_DIR_net_1;
assign CLK_TRAIN_ERROR_net_1            = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR                  = CLK_TRAIN_ERROR_net_1;
assign TX_CLK_0_net_0                   = TX_CLK_0;
assign TX_CLK                           = TX_CLK_0_net_0;
assign TX_CLK_N_0_net_0                 = TX_CLK_N_0;
assign TX_CLK_N                         = TX_CLK_N_0_net_0;
assign DELAY_LINE_OUT_OF_RANGE_net_1[0] = DELAY_LINE_OUT_OF_RANGE_net_0[0];
assign DELAY_LINE_OUT_OF_RANGE[0:0]     = DELAY_LINE_OUT_OF_RANGE_net_1[0];
assign EYE_MONITOR_LATE_net_1[0]        = EYE_MONITOR_LATE_net_0[0];
assign EYE_MONITOR_LATE[0:0]            = EYE_MONITOR_LATE_net_1[0];
assign EYE_MONITOR_EARLY_net_1[0]       = EYE_MONITOR_EARLY_net_0[0];
assign EYE_MONITOR_EARLY[0:0]           = EYE_MONITOR_EARLY_net_1[0];
assign PRBSGEN_DATA_net_1               = PRBSGEN_DATA_net_0;
assign PRBSGEN_DATA[7:0]                = PRBSGEN_DATA_net_1;
assign TXD_net_1[0]                     = TXD_net_0[0];
assign TXD[0:0]                         = TXD_net_1[0];
assign TXD_N_net_1[0]                   = TXD_N_net_0[0];
assign TXD_N[0:0]                       = TXD_N_net_1[0];
assign RX_BIT_ALIGN_RGHT_WIN_net_1      = RX_BIT_ALIGN_RGHT_WIN_net_0;
assign RX_BIT_ALIGN_RGHT_WIN[7:0]       = RX_BIT_ALIGN_RGHT_WIN_net_1;
assign RX_BIT_ALIGN_LEFT_WIN_net_1      = RX_BIT_ALIGN_LEFT_WIN_net_0;
assign RX_BIT_ALIGN_LEFT_WIN[7:0]       = RX_BIT_ALIGN_LEFT_WIN_net_1;
assign DEM_BIT_ALGN_TAPDLY_net_1        = DEM_BIT_ALGN_TAPDLY_net_0;
assign DEM_BIT_ALGN_TAPDLY[7:0]         = DEM_BIT_ALGN_TAPDLY_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbscheck_parallel_fab_x4
CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbscheck_parallel_fab_x4 CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbscheck_parallel_fab_x4_0(
        // Inputs
        .clk_i            ( RX_CLK_G_net_0 ),
        .resetn_i         ( CLK_TRAIN_DONE_net_0 ),
        .prbs_en_i        ( VCC_net ),
        .data_in_i        ( CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x2_0_out_data_0 ),
        // Outputs
        .prbs_chk_error_o ( prbs_chk_error_o ) 
        );

//--------CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbsgen_parallel_fab_x4
CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbsgen_parallel_fab_x4 CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_prbsgen_parallel_fab_x4_0(
        // Inputs
        .clk_i          ( RX_CLK_G_net_0 ),
        .resetn_i       ( CLK_TRAIN_DONE_net_0 ),
        .clear_i        ( GND_net ),
        .prbs_en_i      ( VCC_net ),
        // Outputs
        .prbs_out_o     (  ),
        .prbs_out_msb_o ( PRBSGEN_DATA_net_0 ) 
        );

//--------CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x4
CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x4 CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x4_0(
        // Inputs
        .in_data  ( RXIOD_COMP_0_L0_RXD_DATA ),
        // Outputs
        .out_data ( CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x2_0_out_data_0 ) 
        );

//--------CCC_COMP
CCC_COMP CCC_COMP_0(
        // Inputs
        .REF_CLK_0         ( REF_CLK_0 ),
        .PLL_POWERDOWN_N_0 ( PLL_POWERDOWN_N_0 ),
        // Outputs
        .PLL_LOCK_0        ( PLL_LOCK_0_net_0 ),
        .OUT2_FABCLK_0     ( CCC_COMP_0_OUT2_FABCLK_0 ),
        .OUT0_HS_IO_CLK_0  ( CCC_COMP_0_OUT0_HS_IO_CLK_0 ),
        .OUT1_HS_IO_CLK_0  ( CCC_COMP_0_OUT1_HS_IO_CLK_0 ) 
        );

//--------CORERXIODBITALIGN_C0
CORERXIODBITALIGN_C0 CORERXIODBITALIGN_C0_0(
        // Inputs
        .SCLK                  ( RX_CLK_G_net_0 ),
        .RESETN                ( CLK_TRAIN_DONE_net_0 ),
        .PLL_LOCK              ( PLL_LOCK_0_net_0 ),
        .IOD_EARLY             ( EYE_MONITOR_EARLY_net_0 ),
        .IOD_LATE              ( EYE_MONITOR_LATE_net_0 ),
        .IOD_OOR               ( DELAY_LINE_OUT_OF_RANGE_net_0 ),
        .BIT_ALGN_RSTRT        ( BIT_ALGN_RSTRT ),
        .BIT_ALGN_HOLD         ( BIT_ALGN_HOLD ),
        .BIT_ALGN_SKIP         ( BIT_ALGN_SKIP ),
        .BIT_ALGN_EYE_IN       ( EYE_MONITOR_WIDTH_ICB_RXIOD ),
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

//--------RXIOD_COMP
RXIOD_COMP RXIOD_COMP_0(
        // Inputs
        .RX_CLK_P                ( RX_CLK_P ),
        .RX_CLK_N                ( RX_CLK_N ),
        .ARST_N                  ( RESETN ),
        .HS_IO_CLK_PAUSE         ( HS_IO_CLK_PAUSE ),
        .CLK_TRAIN_RESTART       ( RX_CLK_TRAIN_RESTART ),
        .CLK_TRAIN_HOLD          ( RX_CLK_TRAIN_HOLD ),
        .CLK_TRAIN_SKIP          ( RX_CLK_TRAIN_SKIP ),
        .RXD                     ( RXD ),
        .RXD_N                   ( RXD_N ),
        .EYE_MONITOR_CLEAR_FLAGS ( BIT_ALGN_CLR_FLGS_net_0 ),
        .DELAY_LINE_MOVE         ( BIT_ALGN_MOVE_net_0 ),
        .DELAY_LINE_DIRECTION    ( BIT_ALGN_DIR_net_0 ),
        .DELAY_LINE_LOAD         ( BIT_ALGN_LOAD_net_0 ),
        .EYE_MONITOR_WIDTH       ( EYE_MONITOR_WIDTH_ICB_RXIOD ),
        // Outputs
        .RX_CLK_G                ( RX_CLK_G_net_0 ),
        .CLK_TRAIN_DONE          ( CLK_TRAIN_DONE_net_0 ),
        .CLK_TRAIN_ERROR         ( CLK_TRAIN_ERROR_net_0 ),
        .L0_RXD_DATA             ( RXIOD_COMP_0_L0_RXD_DATA ),
        .EYE_MONITOR_EARLY       ( EYE_MONITOR_EARLY_net_0 ),
        .EYE_MONITOR_LATE        ( EYE_MONITOR_LATE_net_0 ),
        .DELAY_LINE_OUT_OF_RANGE ( DELAY_LINE_OUT_OF_RANGE_net_0 ) 
        );

//--------TXIOD_COMP
TXIOD_COMP TXIOD_COMP_0(
        // Inputs
        .HS_IO_CLK_PAUSE ( HS_IO_CLK_PAUSE ),
        .TX_CLK_G        ( CCC_COMP_0_OUT2_FABCLK_0 ),
        .HS_IO_CLK_90    ( CCC_COMP_0_OUT1_HS_IO_CLK_0 ),
        .HS_IO_CLK       ( CCC_COMP_0_OUT0_HS_IO_CLK_0 ),
        .ARST_N          ( PLL_LOCK_0_net_0 ),
        .TXD_DATA        ( PRBSGEN_DATA_net_0 ),
        // Outputs
        .TX_CLK          ( TX_CLK_0 ),
        .TX_CLK_N        ( TX_CLK_N_0 ),
        .TXD             ( TXD_net_0 ),
        .TXD_N           ( TXD_N_net_0 ) 
        );


endmodule
