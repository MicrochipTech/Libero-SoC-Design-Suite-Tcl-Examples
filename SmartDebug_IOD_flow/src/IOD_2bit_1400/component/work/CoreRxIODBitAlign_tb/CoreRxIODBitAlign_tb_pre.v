//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 14 16:53:17 2019
// Version: v12.0 12.500.0.22
//////////////////////////////////////////////////////////////////////

//`timescale 1ns / 100ps
`timescale 1ps/1ps

// CoreRxIODBitAlign_tb
module CoreRxIODBitAlign_tb(
    // Outputs
    BIT_ALGN_CLR_FLGS_0,
    BIT_ALGN_DIR_0,
    BIT_ALGN_DONE_0,
    BIT_ALGN_ERR,
    BIT_ALGN_LOAD_0,
    BIT_ALGN_MOVE_0,
    BIT_ALGN_OOR_0,
    BIT_ALGN_START_0,
    DELAY_LINE_OUT_OF_RANGE_0,
    DELAY_LINE_OUT_OF_RANGE_1,
    EYE_MONITOR_EARLY_0,
    EYE_MONITOR_EARLY_1,
    EYE_MONITOR_LATE_0,
    EYE_MONITOR_LATE_1,
    L0_RXD_DATA,
    L1_RXD_DATA,
    OUT0_HS_IO_CLK_0,
    OUT1_HS_IO_CLK_0,
    OUT2_FABCLK_0,
    PLL_LOCK_0,
    PRBSGEN_DATA,
    PRBS_ERR,
    RX_CLK_G_0,
    TX_PAT_CLK
);

//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       BIT_ALGN_CLR_FLGS_0;
output       BIT_ALGN_DIR_0;
output       BIT_ALGN_DONE_0;
output       BIT_ALGN_ERR;
output       BIT_ALGN_LOAD_0;
output       BIT_ALGN_MOVE_0;
output       BIT_ALGN_OOR_0;
output       BIT_ALGN_START_0;
output       DELAY_LINE_OUT_OF_RANGE_0;
output       DELAY_LINE_OUT_OF_RANGE_1;
output       EYE_MONITOR_EARLY_0;
output       EYE_MONITOR_EARLY_1;
output       EYE_MONITOR_LATE_0;
output       EYE_MONITOR_LATE_1;
output [7:0] L0_RXD_DATA;
output [7:0] L1_RXD_DATA;
output       OUT0_HS_IO_CLK_0;
output       OUT1_HS_IO_CLK_0;
output       OUT2_FABCLK_0;
output       PLL_LOCK_0;
output [7:0] PRBSGEN_DATA;
output       PRBS_ERR;
output       RX_CLK_G_0;
output       TX_PAT_CLK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         BIT_ALGN_CLR_FLGS_0_net_0;
wire         BIT_ALGN_DIR_0_net_0;
wire         BIT_ALGN_DONE_0_net_0;
wire         BIT_ALGN_ERR_net_0;
wire         BIT_ALGN_LOAD_0_net_0;
wire         BIT_ALGN_MOVE_0_net_0;
wire         BIT_ALGN_OOR_0_net_0;
wire         BIT_ALGN_START_0_net_0;
wire         DELAY_LINE_OUT_OF_RANGE_0_net_0;
wire         DELAY_LINE_OUT_OF_RANGE_1_net_0;
wire         EYE_MONITOR_EARLY_0_net_0;
wire         EYE_MONITOR_EARLY_1_net_0;
wire         EYE_MONITOR_LATE_0_net_0;
wire         EYE_MONITOR_LATE_1_net_0;
wire         IOG_IOD_DDRX4_COMP_0_TX_PAT_CLK_N;
wire   [0:0] IOG_IOD_DDRX4_COMP_0_TXD_PAT_1;
wire   [0:0] IOG_IOD_DDRX4_COMP_0_TXD_PAT_N_0;
wire   [7:0] L0_RXD_DATA_1;
wire   [7:0] L1_RXD_DATA_1;
wire         OUT0_HS_IO_CLK_0_net_0;
wire         OUT1_HS_IO_CLK_0_net_0;
wire         OUT2_FABCLK_0_net_0;
wire         PLL_LOCK_0_net_0;
wire         PRBS_ERR_net_0;
wire   [7:0] PRBSGEN_DATA_1;
wire         RX_CLK_G_0_net_0;
wire         TX_PAT_CLK_net_0;
wire         BIT_ALGN_DONE_0_net_1;
wire         BIT_ALGN_OOR_0_net_1;
wire         BIT_ALGN_START_0_net_1;
wire         OUT0_HS_IO_CLK_0_net_1;
wire         DELAY_LINE_OUT_OF_RANGE_1_net_1;
wire         EYE_MONITOR_EARLY_1_net_1;
wire         EYE_MONITOR_EARLY_0_net_1;
wire         EYE_MONITOR_LATE_1_net_1;
wire         EYE_MONITOR_LATE_0_net_1;
wire         DELAY_LINE_OUT_OF_RANGE_0_net_1;
wire         BIT_ALGN_DIR_0_net_1;
wire         BIT_ALGN_CLR_FLGS_0_net_1;
wire         BIT_ALGN_LOAD_0_net_1;
wire         BIT_ALGN_MOVE_0_net_1;
wire         RX_CLK_G_0_net_1;
wire         OUT2_FABCLK_0_net_1;
wire         OUT1_HS_IO_CLK_0_net_1;
wire         PLL_LOCK_0_net_1;
wire         TX_PAT_CLK_net_1;
wire         PRBS_ERR_net_1;
wire         BIT_ALGN_ERR_net_1;
wire   [7:0] L1_RXD_DATA_1_net_0;
wire   [7:0] L0_RXD_DATA_1_net_0;
wire   [7:0] PRBSGEN_DATA_1_net_0;
wire   [1:0] RXD_net_0;
wire   [1:0] RXD_N_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
wire   [2:0] BIT_ALGN_EYE_IN_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                     = 1'b0;
assign VCC_net                     = 1'b1;
assign BIT_ALGN_EYE_IN_const_net_0 = 3'h5;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BIT_ALGN_DONE_0_net_1           = BIT_ALGN_DONE_0_net_0;
assign BIT_ALGN_DONE_0                 = BIT_ALGN_DONE_0_net_1;
assign BIT_ALGN_OOR_0_net_1            = BIT_ALGN_OOR_0_net_0;
assign BIT_ALGN_OOR_0                  = BIT_ALGN_OOR_0_net_1;
assign BIT_ALGN_START_0_net_1          = BIT_ALGN_START_0_net_0;
assign BIT_ALGN_START_0                = BIT_ALGN_START_0_net_1;
assign OUT0_HS_IO_CLK_0_net_1          = OUT0_HS_IO_CLK_0_net_0;
assign OUT0_HS_IO_CLK_0                = OUT0_HS_IO_CLK_0_net_1;
assign DELAY_LINE_OUT_OF_RANGE_1_net_1 = DELAY_LINE_OUT_OF_RANGE_1_net_0;
assign DELAY_LINE_OUT_OF_RANGE_1       = DELAY_LINE_OUT_OF_RANGE_1_net_1;
assign EYE_MONITOR_EARLY_1_net_1       = EYE_MONITOR_EARLY_1_net_0;
assign EYE_MONITOR_EARLY_1             = EYE_MONITOR_EARLY_1_net_1;
assign EYE_MONITOR_EARLY_0_net_1       = EYE_MONITOR_EARLY_0_net_0;
assign EYE_MONITOR_EARLY_0             = EYE_MONITOR_EARLY_0_net_1;
assign EYE_MONITOR_LATE_1_net_1        = EYE_MONITOR_LATE_1_net_0;
assign EYE_MONITOR_LATE_1              = EYE_MONITOR_LATE_1_net_1;
assign EYE_MONITOR_LATE_0_net_1        = EYE_MONITOR_LATE_0_net_0;
assign EYE_MONITOR_LATE_0              = EYE_MONITOR_LATE_0_net_1;
assign DELAY_LINE_OUT_OF_RANGE_0_net_1 = DELAY_LINE_OUT_OF_RANGE_0_net_0;
assign DELAY_LINE_OUT_OF_RANGE_0       = DELAY_LINE_OUT_OF_RANGE_0_net_1;
assign BIT_ALGN_DIR_0_net_1            = BIT_ALGN_DIR_0_net_0;
assign BIT_ALGN_DIR_0                  = BIT_ALGN_DIR_0_net_1;
assign BIT_ALGN_CLR_FLGS_0_net_1       = BIT_ALGN_CLR_FLGS_0_net_0;
assign BIT_ALGN_CLR_FLGS_0             = BIT_ALGN_CLR_FLGS_0_net_1;
assign BIT_ALGN_LOAD_0_net_1           = BIT_ALGN_LOAD_0_net_0;
assign BIT_ALGN_LOAD_0                 = BIT_ALGN_LOAD_0_net_1;
assign BIT_ALGN_MOVE_0_net_1           = BIT_ALGN_MOVE_0_net_0;
assign BIT_ALGN_MOVE_0                 = BIT_ALGN_MOVE_0_net_1;
assign RX_CLK_G_0_net_1                = RX_CLK_G_0_net_0;
assign RX_CLK_G_0                      = RX_CLK_G_0_net_1;
assign OUT2_FABCLK_0_net_1             = OUT2_FABCLK_0_net_0;
assign OUT2_FABCLK_0                   = OUT2_FABCLK_0_net_1;
assign OUT1_HS_IO_CLK_0_net_1          = OUT1_HS_IO_CLK_0_net_0;
assign OUT1_HS_IO_CLK_0                = OUT1_HS_IO_CLK_0_net_1;
assign PLL_LOCK_0_net_1                = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                      = PLL_LOCK_0_net_1;
assign TX_PAT_CLK_net_1                = TX_PAT_CLK_net_0;
assign TX_PAT_CLK                      = TX_PAT_CLK_net_1;
assign PRBS_ERR_net_1                  = PRBS_ERR_net_0;
assign PRBS_ERR                        = PRBS_ERR_net_1;
assign BIT_ALGN_ERR_net_1              = BIT_ALGN_ERR_net_0;
assign BIT_ALGN_ERR                    = BIT_ALGN_ERR_net_1;
assign L1_RXD_DATA_1_net_0             = L1_RXD_DATA_1;
assign L1_RXD_DATA[7:0]                = L1_RXD_DATA_1_net_0;
assign L0_RXD_DATA_1_net_0             = L0_RXD_DATA_1;
assign L0_RXD_DATA[7:0]                = L0_RXD_DATA_1_net_0;
assign PRBSGEN_DATA_1_net_0            = PRBSGEN_DATA_1;
assign PRBSGEN_DATA[7:0]               = PRBSGEN_DATA_1_net_0;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign RXD_net_0   = { IOG_IOD_DDRX4_COMP_0_TXD_PAT_1[0] , IOG_IOD_DDRX4_COMP_0_TXD_PAT_1[0] };
assign RXD_N_net_0 = { IOG_IOD_DDRX4_COMP_0_TXD_PAT_N_0[0] , IOG_IOD_DDRX4_COMP_0_TXD_PAT_N_0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------IOG_IOD_DDRX4_COMP
IOG_IOD_DDRX4_COMP IOG_IOD_DDRX4_COMP_0(
        // Inputs
        .BIT_ALGN_HOLD             ( GND_net ),
        .RESTARTN                  ( VCC_net ),
        .RX_CLK_P                  ( TX_PAT_CLK_net_0 ),
        .RX_CLK_N                  ( IOG_IOD_DDRX4_COMP_0_TX_PAT_CLK_N ),
        .RXD                       ( RXD_net_0 ),
        .BIT_ALGN_EYE_IN           ( BIT_ALGN_EYE_IN_const_net_0 ),
        .RXD_N                     ( RXD_N_net_0 ),
        // Outputs
        .TX_PAT_CLK                ( TX_PAT_CLK_net_0 ),
        .OUT0_HS_IO_CLK_0          ( OUT0_HS_IO_CLK_0_net_0 ),
        .BIT_ALGN_START_0          ( BIT_ALGN_START_0_net_0 ),
        .BIT_ALGN_DONE_0           ( BIT_ALGN_DONE_0_net_0 ),
        .BIT_ALGN_OOR_0            ( BIT_ALGN_OOR_0_net_0 ),
        .DELAY_LINE_OUT_OF_RANGE_0 ( DELAY_LINE_OUT_OF_RANGE_0_net_0 ),
        .DELAY_LINE_OUT_OF_RANGE_1 ( DELAY_LINE_OUT_OF_RANGE_1_net_0 ),
        .EYE_MONITOR_EARLY_1       ( EYE_MONITOR_EARLY_1_net_0 ),
        .EYE_MONITOR_EARLY_0       ( EYE_MONITOR_EARLY_0_net_0 ),
        .EYE_MONITOR_LATE_1        ( EYE_MONITOR_LATE_1_net_0 ),
        .EYE_MONITOR_LATE_0        ( EYE_MONITOR_LATE_0_net_0 ),
        .RX_CLK_G_0                ( RX_CLK_G_0_net_0 ),
        .BIT_ALGN_MOVE_0           ( BIT_ALGN_MOVE_0_net_0 ),
        .BIT_ALGN_CLR_FLGS_0       ( BIT_ALGN_CLR_FLGS_0_net_0 ),
        .BIT_ALGN_LOAD_0           ( BIT_ALGN_LOAD_0_net_0 ),
        .BIT_ALGN_DIR_0            ( BIT_ALGN_DIR_0_net_0 ),
        .OUT2_FABCLK_0             ( OUT2_FABCLK_0_net_0 ),
        .OUT1_HS_IO_CLK_0          ( OUT1_HS_IO_CLK_0_net_0 ),
        .PLL_LOCK_0                ( PLL_LOCK_0_net_0 ),
        .TX_PAT_CLK_N              ( IOG_IOD_DDRX4_COMP_0_TX_PAT_CLK_N ),
        .PRBS_ERR                  ( PRBS_ERR_net_0 ),
        .BIT_ALGN_ERR              ( BIT_ALGN_ERR_net_0 ),
        .L0_RXD_DATA               ( L0_RXD_DATA_1 ),
        .L1_RXD_DATA               ( L1_RXD_DATA_1 ),
        .TXD_PAT                   ( IOG_IOD_DDRX4_COMP_0_TXD_PAT_1 ),
        .TXD_PAT_N                 ( IOG_IOD_DDRX4_COMP_0_TXD_PAT_N_0 ),
        .PRBSGEN_DATA              ( PRBSGEN_DATA_1 ) 
        );


endmodule
