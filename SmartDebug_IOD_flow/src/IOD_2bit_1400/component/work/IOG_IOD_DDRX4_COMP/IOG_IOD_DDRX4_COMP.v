//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Dec  8 22:50:00 2020
// Version: v12.6 2021.10.1.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// IOG_IOD_DDRX4_COMP
module IOG_IOD_DDRX4_COMP(
    // Inputs
    BIT_ALGN_EYE_IN,
    RESTARTN,
    RXD,
    RXD_N,
    RX_CLK_N,
    RX_CLK_P,
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
    DEM_BIT_ALGN_TAPDLY,
    DEM_BIT_ALGN_TAPDLY_0,
    PLL_LOCK,
    PLL_LOCK_0,
    PRBS_ERR,
    PRBS_ERR_0,
    RX_BIT_ALIGN_LEFT_WIN,
    RX_BIT_ALIGN_LEFT_WIN_0,
    RX_BIT_ALIGN_RGHT_WIN,
    RX_BIT_ALIGN_RGHT_WIN_0,
    TXD,
    TXD_N,
    TX_CLK,
    TX_CLK_N,
    Y,
    prbs_chk_error_o_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [2:0] BIT_ALGN_EYE_IN;
input        RESTARTN;
input  [1:0] RXD;
input  [1:0] RXD_N;
input        RX_CLK_N;
input        RX_CLK_P;
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
output [7:0] DEM_BIT_ALGN_TAPDLY;
output [7:0] DEM_BIT_ALGN_TAPDLY_0;
output       PLL_LOCK;
output       PLL_LOCK_0;
output       PRBS_ERR;
output       PRBS_ERR_0;
output [7:0] RX_BIT_ALIGN_LEFT_WIN;
output [7:0] RX_BIT_ALIGN_LEFT_WIN_0;
output [7:0] RX_BIT_ALIGN_RGHT_WIN;
output [7:0] RX_BIT_ALIGN_RGHT_WIN_0;
output [1:0] TXD;
output [1:0] TXD_N;
output       TX_CLK;
output       TX_CLK_N;
output       Y;
output       prbs_chk_error_o_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         ACT_UNIQUE_debouncer_0_DB_OUT;
wire   [7:0] ACT_UNIQUE_rev_bits_0_out_data;
wire         Algn_Done_net_0;
wire         BIT_ALGN_DONE_net_0;
wire         BIT_ALGN_ERR_net_0;
wire         BIT_ALGN_ERR_0_net_0;
wire   [2:0] BIT_ALGN_EYE_IN;
wire         BIT_ALGN_OOR_net_0;
wire         BIT_ALGN_OOR_0_0;
wire         BIT_ALGN_START_0_net_0;
wire         BIT_ALGN_START_1_net_0;
wire         CLK_TRAIN_ERROR_net_0;
wire         CORERXIODBITALIGN_C0_0_BIT_ALGN_CLR_FLGS;
wire         CORERXIODBITALIGN_C0_0_BIT_ALGN_DIR;
wire         CORERXIODBITALIGN_C0_0_BIT_ALGN_LOAD;
wire         CORERXIODBITALIGN_C0_0_BIT_ALGN_MOVE;
wire         CORERXIODBITALIGN_C0_1_BIT_ALGN_CLR_FLGS;
wire         CORERXIODBITALIGN_C0_1_BIT_ALGN_DIR;
wire         CORERXIODBITALIGN_C0_1_BIT_ALGN_LOAD;
wire         CORERXIODBITALIGN_C0_1_BIT_ALGN_MOVE;
wire         debouncer_0_DB_OUT;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_0;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_0_net_0;
wire         PF_CCC_C0_0_OUT0_FABCLK_0;
wire         PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE;
wire   [0:0] PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE0to0;
wire   [1:1] PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE1to1;
wire   [0:0] PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY0to0;
wire   [1:1] PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY1to1;
wire   [0:0] PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE0to0;
wire   [1:1] PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE1to1;
wire   [7:0] PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA_2;
wire   [7:0] PF_IOD_GENERIC_RX_C1_0_L1_RXD_DATA;
wire         PF_IOD_GENERIC_RX_C1_0_RX_CLK_G;
wire         PF_IOD_TX_CCC_C0_0_CLK_TRAIN_DONE;
wire   [3:0] PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_CLK_ALIGN_IOD_RX;
wire         PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_0;
wire         PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_90;
wire         PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_PAUSE;
wire         PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_TX_CLK_G;
wire         PF_IOD_TX_CCC_C0_0_TX_CLK_G;
wire         PF_OSC_C1_0_RCOSC_160MHZ_GL;
wire         PLL_LOCK_net_0;
wire         PLL_LOCK_0_net_0;
wire         prbs_chk_error_o_1_net_0;
wire         PRBS_ERR_0_net_0;
wire   [7:0] prbsgen_parallel_fab_0_prbs_out_msb_o_0;
wire         RESTARTN;
wire   [7:0] rev_bits_0_out_data_4;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_0;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_0_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_0_net_0;
wire         RX_CLK_N;
wire         RX_CLK_P;
wire   [1:0] RXD;
wire   [1:0] RXD_N;
wire         SWITCH;
wire         TX_CLK_net_0;
wire         TX_CLK_N_net_0;
wire   [1:0] TXD_2;
wire   [1:0] TXD_N_1;
wire         Y_net_0;
wire         BIT_ALGN_START_0_net_1;
wire         Algn_Done_net_1;
wire         BIT_ALGN_OOR_0_0_net_0;
wire         BIT_ALGN_ERR_net_1;
wire         PRBS_ERR_0_net_1;
wire         Y_net_1;
wire         Algn_Done_net_2;
wire         BIT_ALGN_ERR_net_2;
wire         BIT_ALGN_START_0_net_2;
wire         PRBS_ERR_0_net_2;
wire         PLL_LOCK_0_net_1;
wire         PLL_LOCK_net_1;
wire         CLK_TRAIN_ERROR_net_1;
wire         TX_CLK_net_1;
wire         TX_CLK_N_net_1;
wire         BIT_ALGN_START_1_net_1;
wire         BIT_ALGN_DONE_net_1;
wire         BIT_ALGN_OOR_net_1;
wire         BIT_ALGN_ERR_0_net_1;
wire         prbs_chk_error_o_1_net_1;
wire   [1:0] TXD_2_net_0;
wire   [1:0] TXD_N_1_net_0;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_net_1;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_net_1;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_net_1;
wire   [7:0] RX_BIT_ALIGN_RGHT_WIN_0_net_1;
wire   [7:0] RX_BIT_ALIGN_LEFT_WIN_0_net_1;
wire   [7:0] DEM_BIT_ALGN_TAPDLY_0_net_1;
wire   [1:0] EYE_MONITOR_CLEAR_FLAGS_net_0;
wire   [1:0] EYE_MONITOR_EARLY_net_0;
wire   [1:0] EYE_MONITOR_LATE_net_0;
wire   [1:0] DELAY_LINE_MOVE_net_0;
wire   [1:0] DELAY_LINE_DIRECTION_net_0;
wire   [1:0] DELAY_LINE_LOAD_net_0;
wire   [1:0] DELAY_LINE_OUT_OF_RANGE_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         VCC_net;
wire         GND_net;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire         SWITCH_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign SWITCH_IN_POST_INV0_0 = ~ RESTARTN;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BIT_ALGN_START_0_net_1        = BIT_ALGN_START_0_net_0;
assign BIT_ALGN_START_0              = BIT_ALGN_START_0_net_1;
assign Algn_Done_net_1               = Algn_Done_net_0;
assign BIT_ALGN_DONE_0               = Algn_Done_net_1;
assign BIT_ALGN_OOR_0_0_net_0        = BIT_ALGN_OOR_0_0;
assign BIT_ALGN_OOR_0                = BIT_ALGN_OOR_0_0_net_0;
assign BIT_ALGN_ERR_net_1            = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR                  = BIT_ALGN_ERR_net_1;
assign PRBS_ERR_0_net_1              = PRBS_ERR_0_net_0;
assign PRBS_ERR                      = PRBS_ERR_0_net_1;
assign Y_net_1                       = Y_net_0;
assign Y                             = Y_net_1;
assign Algn_Done_net_2               = Algn_Done_net_0;
assign Algn_Done                     = Algn_Done_net_2;
assign BIT_ALGN_ERR_net_2            = BIT_ALGN_ERR_net_0;
assign Algn_Err                      = BIT_ALGN_ERR_net_2;
assign BIT_ALGN_START_0_net_2        = BIT_ALGN_START_0_net_0;
assign BIT_ALGN_START                = BIT_ALGN_START_0_net_2;
assign PRBS_ERR_0_net_2              = PRBS_ERR_0_net_0;
assign PRBS_ERR_0                    = PRBS_ERR_0_net_2;
assign PLL_LOCK_0_net_1              = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                    = PLL_LOCK_0_net_1;
assign PLL_LOCK_net_1                = PLL_LOCK_net_0;
assign PLL_LOCK                      = PLL_LOCK_net_1;
assign CLK_TRAIN_ERROR_net_1         = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR               = CLK_TRAIN_ERROR_net_1;
assign TX_CLK_net_1                  = TX_CLK_net_0;
assign TX_CLK                        = TX_CLK_net_1;
assign TX_CLK_N_net_1                = TX_CLK_N_net_0;
assign TX_CLK_N                      = TX_CLK_N_net_1;
assign BIT_ALGN_START_1_net_1        = BIT_ALGN_START_1_net_0;
assign BIT_ALGN_START_1              = BIT_ALGN_START_1_net_1;
assign BIT_ALGN_DONE_net_1           = BIT_ALGN_DONE_net_0;
assign BIT_ALGN_DONE                 = BIT_ALGN_DONE_net_1;
assign BIT_ALGN_OOR_net_1            = BIT_ALGN_OOR_net_0;
assign BIT_ALGN_OOR                  = BIT_ALGN_OOR_net_1;
assign BIT_ALGN_ERR_0_net_1          = BIT_ALGN_ERR_0_net_0;
assign BIT_ALGN_ERR_0                = BIT_ALGN_ERR_0_net_1;
assign prbs_chk_error_o_1_net_1      = prbs_chk_error_o_1_net_0;
assign prbs_chk_error_o_1            = prbs_chk_error_o_1_net_1;
assign TXD_2_net_0                   = TXD_2;
assign TXD[1:0]                      = TXD_2_net_0;
assign TXD_N_1_net_0                 = TXD_N_1;
assign TXD_N[1:0]                    = TXD_N_1_net_0;
assign RX_BIT_ALIGN_RGHT_WIN_net_1   = RX_BIT_ALIGN_RGHT_WIN_net_0;
assign RX_BIT_ALIGN_RGHT_WIN[7:0]    = RX_BIT_ALIGN_RGHT_WIN_net_1;
assign DEM_BIT_ALGN_TAPDLY_net_1     = DEM_BIT_ALGN_TAPDLY_net_0;
assign DEM_BIT_ALGN_TAPDLY[7:0]      = DEM_BIT_ALGN_TAPDLY_net_1;
assign RX_BIT_ALIGN_LEFT_WIN_net_1   = RX_BIT_ALIGN_LEFT_WIN_net_0;
assign RX_BIT_ALIGN_LEFT_WIN[7:0]    = RX_BIT_ALIGN_LEFT_WIN_net_1;
assign RX_BIT_ALIGN_RGHT_WIN_0_net_1 = RX_BIT_ALIGN_RGHT_WIN_0_net_0;
assign RX_BIT_ALIGN_RGHT_WIN_0[7:0]  = RX_BIT_ALIGN_RGHT_WIN_0_net_1;
assign RX_BIT_ALIGN_LEFT_WIN_0_net_1 = RX_BIT_ALIGN_LEFT_WIN_0_net_0;
assign RX_BIT_ALIGN_LEFT_WIN_0[7:0]  = RX_BIT_ALIGN_LEFT_WIN_0_net_1;
assign DEM_BIT_ALGN_TAPDLY_0_net_1   = DEM_BIT_ALGN_TAPDLY_0_net_0;
assign DEM_BIT_ALGN_TAPDLY_0[7:0]    = DEM_BIT_ALGN_TAPDLY_0_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE0to0[0] = DELAY_LINE_OUT_OF_RANGE_net_0[0:0];
assign PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE1to1[1] = DELAY_LINE_OUT_OF_RANGE_net_0[1:1];
assign PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY0to0[0]       = EYE_MONITOR_EARLY_net_0[0:0];
assign PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY1to1[1]       = EYE_MONITOR_EARLY_net_0[1:1];
assign PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE0to0[0]        = EYE_MONITOR_LATE_net_0[0:0];
assign PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE1to1[1]        = EYE_MONITOR_LATE_net_0[1:1];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign EYE_MONITOR_CLEAR_FLAGS_net_0 = { CORERXIODBITALIGN_C0_1_BIT_ALGN_CLR_FLGS , CORERXIODBITALIGN_C0_0_BIT_ALGN_CLR_FLGS };
assign DELAY_LINE_MOVE_net_0         = { CORERXIODBITALIGN_C0_1_BIT_ALGN_MOVE , CORERXIODBITALIGN_C0_0_BIT_ALGN_MOVE };
assign DELAY_LINE_DIRECTION_net_0    = { CORERXIODBITALIGN_C0_1_BIT_ALGN_DIR , CORERXIODBITALIGN_C0_0_BIT_ALGN_DIR };
assign DELAY_LINE_LOAD_net_0         = { CORERXIODBITALIGN_C0_1_BIT_ALGN_LOAD , CORERXIODBITALIGN_C0_0_BIT_ALGN_LOAD };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------ACT_UNIQUE_debouncer
ACT_UNIQUE_debouncer ACT_UNIQUE_debouncer_0(
        // Inputs
        .CLK     ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .RESET_N ( PLL_LOCK_0_net_0 ),
        .SWITCH  ( SWITCH ),
        // Outputs
        .DB_OUT  ( ACT_UNIQUE_debouncer_0_DB_OUT ) 
        );

//--------ACT_UNIQUE_prbscheck_parallel_fab
ACT_UNIQUE_prbscheck_parallel_fab ACT_UNIQUE_prbscheck_parallel_fab_0(
        // Inputs
        .clk_i            ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .resetn_i         ( PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE ),
        .prbs_en_i        ( VCC_net ),
        .data_in_i        ( rev_bits_0_out_data_4 ),
        // Outputs
        .prbs_chk_error_o ( PRBS_ERR_0_net_0 ) 
        );

//--------ACT_UNIQUE_prbscheck_parallel_fab
ACT_UNIQUE_prbscheck_parallel_fab ACT_UNIQUE_prbscheck_parallel_fab_1(
        // Inputs
        .clk_i            ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .resetn_i         ( PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE ),
        .prbs_en_i        ( VCC_net ),
        .data_in_i        ( ACT_UNIQUE_rev_bits_0_out_data ),
        // Outputs
        .prbs_chk_error_o ( prbs_chk_error_o_1_net_0 ) 
        );

//--------ACT_UNIQUE_rev_bits
ACT_UNIQUE_rev_bits ACT_UNIQUE_rev_bits_0(
        // Inputs
        .in_data  ( PF_IOD_GENERIC_RX_C1_0_L1_RXD_DATA ),
        // Outputs
        .out_data ( ACT_UNIQUE_rev_bits_0_out_data ) 
        );

//--------BUFF
BUFF BUFF_0(
        // Inputs
        .A ( RESTARTN ),
        // Outputs
        .Y ( Y_net_0 ) 
        );

//--------CORERXIODBITALIGN_C0
CORERXIODBITALIGN_C0 CORERXIODBITALIGN_C0_0(
        // Inputs
        .SCLK                  ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .RESETN                ( PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE ),
        .PLL_LOCK              ( PLL_LOCK_net_0 ),
        .IOD_EARLY             ( PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY0to0 ),
        .IOD_LATE              ( PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE0to0 ),
        .IOD_OOR               ( PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE0to0 ),
        .BIT_ALGN_RSTRT        ( debouncer_0_DB_OUT ),
        .BIT_ALGN_HOLD         ( GND_net ),
        .BIT_ALGN_SKIP         ( GND_net ),
        .BIT_ALGN_EYE_IN       ( BIT_ALGN_EYE_IN ),
        // Outputs
        .BIT_ALGN_START        ( BIT_ALGN_START_0_net_0 ),
        .BIT_ALGN_DONE         ( Algn_Done_net_0 ),
        .BIT_ALGN_OOR          ( BIT_ALGN_OOR_0_0 ),
        .BIT_ALGN_CLR_FLGS     ( CORERXIODBITALIGN_C0_0_BIT_ALGN_CLR_FLGS ),
        .BIT_ALGN_LOAD         ( CORERXIODBITALIGN_C0_0_BIT_ALGN_LOAD ),
        .BIT_ALGN_DIR          ( CORERXIODBITALIGN_C0_0_BIT_ALGN_DIR ),
        .BIT_ALGN_MOVE         ( CORERXIODBITALIGN_C0_0_BIT_ALGN_MOVE ),
        .BIT_ALGN_ERR          ( BIT_ALGN_ERR_net_0 ),
        .DEM_BIT_ALGN_TAPDLY   ( DEM_BIT_ALGN_TAPDLY_0_net_0 ),
        .RX_BIT_ALIGN_LEFT_WIN ( RX_BIT_ALIGN_LEFT_WIN_0_net_0 ),
        .RX_BIT_ALIGN_RGHT_WIN ( RX_BIT_ALIGN_RGHT_WIN_net_0 ) 
        );

//--------CORERXIODBITALIGN_C0
CORERXIODBITALIGN_C0 CORERXIODBITALIGN_C0_1(
        // Inputs
        .SCLK                  ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .RESETN                ( PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE ),
        .PLL_LOCK              ( PLL_LOCK_net_0 ),
        .IOD_EARLY             ( PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_EARLY1to1 ),
        .IOD_LATE              ( PF_IOD_GENERIC_RX_C1_0_EYE_MONITOR_LATE1to1 ),
        .IOD_OOR               ( PF_IOD_GENERIC_RX_C1_0_DELAY_LINE_OUT_OF_RANGE1to1 ),
        .BIT_ALGN_RSTRT        ( debouncer_0_DB_OUT ),
        .BIT_ALGN_HOLD         ( GND_net ),
        .BIT_ALGN_SKIP         ( GND_net ),
        .BIT_ALGN_EYE_IN       ( BIT_ALGN_EYE_IN ),
        // Outputs
        .BIT_ALGN_START        ( BIT_ALGN_START_1_net_0 ),
        .BIT_ALGN_DONE         ( BIT_ALGN_DONE_net_0 ),
        .BIT_ALGN_OOR          ( BIT_ALGN_OOR_net_0 ),
        .BIT_ALGN_CLR_FLGS     ( CORERXIODBITALIGN_C0_1_BIT_ALGN_CLR_FLGS ),
        .BIT_ALGN_LOAD         ( CORERXIODBITALIGN_C0_1_BIT_ALGN_LOAD ),
        .BIT_ALGN_DIR          ( CORERXIODBITALIGN_C0_1_BIT_ALGN_DIR ),
        .BIT_ALGN_MOVE         ( CORERXIODBITALIGN_C0_1_BIT_ALGN_MOVE ),
        .BIT_ALGN_ERR          ( BIT_ALGN_ERR_0_net_0 ),
        .DEM_BIT_ALGN_TAPDLY   ( DEM_BIT_ALGN_TAPDLY_net_0 ),
        .RX_BIT_ALIGN_LEFT_WIN ( RX_BIT_ALIGN_LEFT_WIN_net_0 ),
        .RX_BIT_ALIGN_RGHT_WIN ( RX_BIT_ALIGN_RGHT_WIN_0_net_0 ) 
        );

//--------ACT_UNIQUE_debouncer
ACT_UNIQUE_debouncer debouncer_0(
        // Inputs
        .CLK     ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .RESET_N ( PLL_LOCK_net_0 ),
        .SWITCH  ( SWITCH_IN_POST_INV0_0 ),
        // Outputs
        .DB_OUT  ( debouncer_0_DB_OUT ) 
        );

//--------PF_CCC_C0
PF_CCC_C0 PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0     ( PF_OSC_C1_0_RCOSC_160MHZ_GL ),
        // Outputs
        .OUT0_FABCLK_0 ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0    ( PLL_LOCK_0_net_0 ) 
        );

//--------PF_IOD_GENERIC_RX_C1
PF_IOD_GENERIC_RX_C1 PF_IOD_GENERIC_RX_C1_0(
        // Inputs
        .RX_CLK_P                ( RX_CLK_P ),
        .RX_CLK_N                ( RX_CLK_N ),
        .ARST_N                  ( PF_IOD_TX_CCC_C0_0_CLK_TRAIN_DONE ),
        .HS_IO_CLK_PAUSE         ( GND_net ),
        .RXD                     ( RXD ),
        .RXD_N                   ( RXD_N ),
        .EYE_MONITOR_CLEAR_FLAGS ( EYE_MONITOR_CLEAR_FLAGS_net_0 ),
        .DELAY_LINE_MOVE         ( DELAY_LINE_MOVE_net_0 ),
        .DELAY_LINE_DIRECTION    ( DELAY_LINE_DIRECTION_net_0 ),
        .DELAY_LINE_LOAD         ( DELAY_LINE_LOAD_net_0 ),
        .EYE_MONITOR_WIDTH       ( BIT_ALGN_EYE_IN ),
        // Outputs
        .RX_CLK_G                ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .CLK_TRAIN_DONE          ( PF_IOD_GENERIC_RX_C1_0_CLK_TRAIN_DONE ),
        .CLK_TRAIN_ERROR         ( CLK_TRAIN_ERROR_net_0 ),
        .L0_RXD_DATA             ( PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA_2 ),
        .L1_RXD_DATA             ( PF_IOD_GENERIC_RX_C1_0_L1_RXD_DATA ),
        .EYE_MONITOR_EARLY       ( EYE_MONITOR_EARLY_net_0 ),
        .EYE_MONITOR_LATE        ( EYE_MONITOR_LATE_net_0 ),
        .DELAY_LINE_OUT_OF_RANGE ( DELAY_LINE_OUT_OF_RANGE_net_0 ) 
        );

//--------PF_IOD_GENERIC_TX_C0
PF_IOD_GENERIC_TX_C0 PF_IOD_GENERIC_TX_C0_0(
        // Inputs
        .HS_IO_CLK_PAUSE  ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_PAUSE ),
        .TX_CLK_G         ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_TX_CLK_G ),
        .HS_IO_CLK_90     ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_90 ),
        .HS_IO_CLK        ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_0 ),
        .ARST_N           ( PLL_LOCK_net_0 ),
        .L0_TXD_DATA      ( prbsgen_parallel_fab_0_prbs_out_msb_o_0 ),
        .L1_TXD_DATA      ( prbsgen_parallel_fab_0_prbs_out_msb_o_0 ),
        // Outputs
        .TX_CLK           ( TX_CLK_net_0 ),
        .TX_CLK_N         ( TX_CLK_N_net_0 ),
        .TXD              ( TXD_2 ),
        .TXD_N            ( TXD_N_1 ),
        .CLK_ALIGN_IOD_RX ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_CLK_ALIGN_IOD_RX ) 
        );

//--------PF_IOD_TX_CCC_C0
PF_IOD_TX_CCC_C0 PF_IOD_TX_CCC_C0_0(
        // Inputs
        .REF_CLK          ( PF_CCC_C0_0_OUT0_FABCLK_0 ),
        .POWERDOWN_N      ( ACT_UNIQUE_debouncer_0_DB_OUT ),
        .CLK_ALIGN_IOD_RX ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_CLK_ALIGN_IOD_RX ),
        // Outputs
        .HS_IO_CLK_0      ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_0 ),
        .PLL_LOCK         ( PLL_LOCK_net_0 ),
        .CLK_TRAIN_DONE   ( PF_IOD_TX_CCC_C0_0_CLK_TRAIN_DONE ),
        .HS_IO_CLK_PAUSE  ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_PAUSE ),
        .TX_CLK_G         ( PF_IOD_TX_CCC_C0_0_TX_CLK_G ),
        .TX_CLK_G_TO_IOD  ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_TX_CLK_G ),
        .HS_IO_CLK_90     ( PF_IOD_TX_CCC_C0_0_IOD_TX_CLKS_HS_IO_CLK_90 ),
        .GL3              (  ) 
        );

//--------PF_OSC_C1
PF_OSC_C1 PF_OSC_C1_0(
        // Outputs
        .RCOSC_160MHZ_GL ( PF_OSC_C1_0_RCOSC_160MHZ_GL ) 
        );

//--------ACT_UNIQUE_prbsgen_parallel_fab
ACT_UNIQUE_prbsgen_parallel_fab prbsgen_parallel_fab_0(
        // Inputs
        .clk_i          ( PF_IOD_TX_CCC_C0_0_TX_CLK_G ),
        .resetn_i       ( PF_IOD_TX_CCC_C0_0_CLK_TRAIN_DONE ),
        .clear_i        ( GND_net ),
        .prbs_en_i      ( VCC_net ),
        // Outputs
        .prbs_out_o     (  ),
        .prbs_out_msb_o ( prbsgen_parallel_fab_0_prbs_out_msb_o_0 ) 
        );

//--------ACT_UNIQUE_rev_bits
ACT_UNIQUE_rev_bits rev_bits_0(
        // Inputs
        .in_data  ( PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA_2 ),
        // Outputs
        .out_data ( rev_bits_0_out_data_4 ) 
        );


endmodule
