//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec 22 17:46:13 2019
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// BclkSclk_PLL_TX2_1200mbps_SD_wrap
module BclkSclk_PLL_TX2_1200mbps_SD_wrap(
    // Inputs
    CLK_TRAIN_HOLD,
    CLK_TRAIN_RESTART,
    CLK_TRAIN_SKIP,
    EYE_MONITOR_WIDTH_ICB_RXIOD,
    HS_IO_CLK_PAUSE,
    PADDR,
    PCLK,
    PENABLE,
    PLL_POWERDOWN_N_0,
    PRESETN,
    PSEL,
    PSTRB,
    PWDATA,
    PWRITE,
    REF_CLK_0,
    RESETN,
    RXD,
    RXD_N,
    RX_CLK_N,
    RX_CLK_P,
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
    TXD,
    TXD_N,
    TX_CLK,
    TX_CLK_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK_TRAIN_HOLD;
input         CLK_TRAIN_RESTART;
input         CLK_TRAIN_SKIP;
input  [2:0]  EYE_MONITOR_WIDTH_ICB_RXIOD;
input         HS_IO_CLK_PAUSE;
input  [28:0] PADDR;
input         PCLK;
input         PENABLE;
input         PLL_POWERDOWN_N_0;
input         PRESETN;
input         PSEL;
input  [3:0]  PSTRB;
input  [31:0] PWDATA;
input         PWRITE;
input         REF_CLK_0;
input         RESETN;
input  [0:0]  RXD;
input  [0:0]  RXD_N;
input         RX_CLK_N;
input         RX_CLK_P;
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
output [0:0]  TXD;
output [0:0]  TXD_N;
output        TX_CLK;
output        TX_CLK_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0]  PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2_0_prbs_out_msb_o;
wire   [3:0]  PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2_0_out_data;
wire   [28:0] PADDR;
wire          PENABLE;
wire   [31:0] APBS_PRDATA;
wire          APBS_PREADY;
wire          PSEL;
wire          APBS_PSLVERR;
wire   [31:0] PWDATA;
wire          PWRITE;
wire          BCLKSCLK_TRAIN_DONE_net_0;
wire          BUSERROR_net_0;
wire          CLK_TRAIN_HOLD;
wire          CLK_TRAIN_RESTART;
wire          CLK_TRAIN_SKIP;
wire   [2:0]  EYE_MONITOR_WIDTH_ICB_RXIOD;
wire          HS_IO_CLK_PAUSE;
wire          ICB_CLK_ALGN_ERR;
wire          PCLK;
wire          PF_CCC_C0_0_OUT0_HS_IO_CLK_0;
wire          PF_CCC_C0_0_OUT1_HS_IO_CLK_0;
wire          PF_CCC_C0_0_OUT2_FABCLK_0;
wire          PF_DRI_C0_0_PLL0_NW_DRI_DRI_ARST_N;
wire          PF_DRI_C0_0_PLL0_NW_DRI_DRI_CLK;
wire   [10:0] PF_DRI_C0_0_PLL0_NW_DRI_DRI_CTRL;
wire          PF_DRI_C0_0_PLL0_NW_DRI_DRI_INTERRUPT;
wire   [32:0] PF_DRI_C0_0_PLL0_NW_DRI_DRI_RDATA;
wire   [32:0] PF_DRI_C0_0_PLL0_NW_DRI_DRI_WDATA;
wire   [3:0]  PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA;
wire          PF_IOD_GENERIC_RX_C1_0_RX_CLK_G;
wire          PINTERRUPT_net_0;
wire          PLL_LOCK_0_net_0;
wire          PLL_POWERDOWN_N_0;
wire          prbs_chk_error_o;
wire          PRESETN;
wire   [3:0]  PSTRB;
wire          PTIMEOUT_net_0;
wire          REF_CLK_0;
wire          RESETN;
wire          RX_CLK_N;
wire          RX_CLK_P;
wire   [0:0]  RXD;
wire   [0:0]  RXD_N;
wire          TX_CLK_0;
wire          TX_CLK_N_0;
wire   [0:0]  TXD_net_0;
wire   [0:0]  TXD_N_net_0;
wire          BCLKSCLK_TRAIN_DONE_net_1;
wire          prbs_chk_error_o_net_0;
wire          TX_CLK_0_net_0;
wire          TX_CLK_N_0_net_0;
wire   [0:0]  TXD_net_1;
wire   [0:0]  TXD_N_net_1;
wire          ICB_CLK_ALGN_ERR_net_0;
wire   [31:0] APBS_PRDATA_net_0;
wire          APBS_PREADY_net_0;
wire          APBS_PSLVERR_net_0;
wire          PINTERRUPT_net_1;
wire          BUSERROR_net_1;
wire          PTIMEOUT_net_1;
wire          PLL_LOCK_0_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign BCLKSCLK_TRAIN_DONE_net_1 = BCLKSCLK_TRAIN_DONE_net_0;
assign BCLKSCLK_TRAIN_DONE       = BCLKSCLK_TRAIN_DONE_net_1;
assign prbs_chk_error_o_net_0    = prbs_chk_error_o;
assign PRBS_ERR                  = prbs_chk_error_o_net_0;
assign TX_CLK_0_net_0            = TX_CLK_0;
assign TX_CLK                    = TX_CLK_0_net_0;
assign TX_CLK_N_0_net_0          = TX_CLK_N_0;
assign TX_CLK_N                  = TX_CLK_N_0_net_0;
assign TXD_net_1[0]              = TXD_net_0[0];
assign TXD[0:0]                  = TXD_net_1[0];
assign TXD_N_net_1[0]            = TXD_N_net_0[0];
assign TXD_N[0:0]                = TXD_N_net_1[0];
assign ICB_CLK_ALGN_ERR_net_0    = ICB_CLK_ALGN_ERR;
assign CLK_TRAIN_ERROR           = ICB_CLK_ALGN_ERR_net_0;
assign APBS_PRDATA_net_0         = APBS_PRDATA;
assign PRDATA[31:0]              = APBS_PRDATA_net_0;
assign APBS_PREADY_net_0         = APBS_PREADY;
assign PREADY                    = APBS_PREADY_net_0;
assign APBS_PSLVERR_net_0        = APBS_PSLVERR;
assign PSLVERR                   = APBS_PSLVERR_net_0;
assign PINTERRUPT_net_1          = PINTERRUPT_net_0;
assign PINTERRUPT                = PINTERRUPT_net_1;
assign BUSERROR_net_1            = BUSERROR_net_0;
assign BUSERROR                  = BUSERROR_net_1;
assign PTIMEOUT_net_1            = PTIMEOUT_net_0;
assign PTIMEOUT                  = PTIMEOUT_net_1;
assign PLL_LOCK_0_net_1          = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                = PLL_LOCK_0_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbscheck_parallel_fab_x2
PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbscheck_parallel_fab_x2 PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbscheck_parallel_fab_x2_0(
        // Inputs
        .clk_i            ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .resetn_i         ( BCLKSCLK_TRAIN_DONE_net_0 ),
        .prbs_en_i        ( VCC_net ),
        .data_in_i        ( PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2_0_out_data ),
        // Outputs
        .prbs_chk_error_o ( prbs_chk_error_o ) 
        );

//--------PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2
PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2 PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2_0(
        // Inputs
        .clk_i          ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .resetn_i       ( BCLKSCLK_TRAIN_DONE_net_0 ),
        .clear_i        ( GND_net ),
        .prbs_en_i      ( VCC_net ),
        // Outputs
        .prbs_out_o     (  ),
        .prbs_out_msb_o ( PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2_0_prbs_out_msb_o ) 
        );

//--------PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2
PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2 PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2_0(
        // Inputs
        .in_data  ( PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA ),
        // Outputs
        .out_data ( PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2_0_out_data ) 
        );

//--------PF_CCC_C0
PF_CCC_C0 PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0         ( REF_CLK_0 ),
        .PLL_POWERDOWN_N_0 ( PLL_POWERDOWN_N_0 ),
        .DRI_CLK_0         ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_CLK ),
        .DRI_ARST_N_0      ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_ARST_N ),
        .DRI_WDATA_0       ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_WDATA ),
        .DRI_CTRL_0        ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_CTRL ),
        // Outputs
        .PLL_LOCK_0        ( PLL_LOCK_0_net_0 ),
        .OUT2_FABCLK_0     ( PF_CCC_C0_0_OUT2_FABCLK_0 ),
        .OUT0_HS_IO_CLK_0  ( PF_CCC_C0_0_OUT0_HS_IO_CLK_0 ),
        .OUT1_HS_IO_CLK_0  ( PF_CCC_C0_0_OUT1_HS_IO_CLK_0 ),
        .OUT3_HS_IO_CLK_0  (  ),
        .DRI_INTERRUPT_0   ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_INTERRUPT ),
        .DRI_RDATA_0       ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_RDATA ) 
        );

//--------PF_DRI_C0
PF_DRI_C0 PF_DRI_C0_0(
        // Inputs
        .PCLK                  ( PCLK ),
        .PRESETN               ( PRESETN ),
        .PSEL                  ( PSEL ),
        .PENABLE               ( PENABLE ),
        .PWRITE                ( PWRITE ),
        .PLL0_NW_DRI_INTERRUPT ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_INTERRUPT ),
        .PSTRB                 ( PSTRB ),
        .PADDR                 ( PADDR ),
        .PWDATA                ( PWDATA ),
        .PLL0_NW_DRI_RDATA     ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_RDATA ),
        // Outputs
        .PINTERRUPT            ( PINTERRUPT_net_0 ),
        .PTIMEOUT              ( PTIMEOUT_net_0 ),
        .BUSERROR              ( BUSERROR_net_0 ),
        .PREADY                ( APBS_PREADY ),
        .PSLVERR               ( APBS_PSLVERR ),
        .DRI_CLK               ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_CLK ),
        .DRI_ARST_N            ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_ARST_N ),
        .PRDATA                ( APBS_PRDATA ),
        .DRI_WDATA             ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_WDATA ),
        .PLL0_NW_DRI_CTRL      ( PF_DRI_C0_0_PLL0_NW_DRI_DRI_CTRL ) 
        );

//--------PF_IOD_GENERIC_RX_C1
PF_IOD_GENERIC_RX_C1 PF_IOD_GENERIC_RX_C1_0(
        // Inputs
        .RX_CLK_P          ( RX_CLK_P ),
        .RX_CLK_N          ( RX_CLK_N ),
        .ARST_N            ( RESETN ),
        .HS_IO_CLK_PAUSE   ( GND_net ),
        .CLK_TRAIN_RESTART ( CLK_TRAIN_RESTART ),
        .CLK_TRAIN_HOLD    ( CLK_TRAIN_HOLD ),
        .CLK_TRAIN_SKIP    ( CLK_TRAIN_SKIP ),
        .RXD               ( RXD ),
        .RXD_N             ( RXD_N ),
        .EYE_MONITOR_WIDTH ( EYE_MONITOR_WIDTH_ICB_RXIOD ),
        // Outputs
        .RX_CLK_G          ( PF_IOD_GENERIC_RX_C1_0_RX_CLK_G ),
        .CLK_TRAIN_DONE    ( BCLKSCLK_TRAIN_DONE_net_0 ),
        .CLK_TRAIN_ERROR   ( ICB_CLK_ALGN_ERR ),
        .L0_RXD_DATA       ( PF_IOD_GENERIC_RX_C1_0_L0_RXD_DATA ) 
        );

//--------PF_IOD_GENERIC_TX_C0
PF_IOD_GENERIC_TX_C0 PF_IOD_GENERIC_TX_C0_0(
        // Inputs
        .HS_IO_CLK_PAUSE  ( HS_IO_CLK_PAUSE ),
        .TXD_DATA         ( PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2_0_prbs_out_msb_o ),
        .TX_CLK_G         ( PF_CCC_C0_0_OUT2_FABCLK_0 ),
        .HS_IO_CLK_90     ( PF_CCC_C0_0_OUT1_HS_IO_CLK_0 ),
        .HS_IO_CLK        ( PF_CCC_C0_0_OUT0_HS_IO_CLK_0 ),
        // Outputs
        .TX_CLK           ( TX_CLK_0 ),
        .TX_CLK_N         ( TX_CLK_N_0 ),
        .TXD              ( TXD_net_0 ),
        .TXD_N            ( TXD_N_net_0 ),
        .CLK_ALIGN_IOD_RX (  ) 
        );


endmodule
