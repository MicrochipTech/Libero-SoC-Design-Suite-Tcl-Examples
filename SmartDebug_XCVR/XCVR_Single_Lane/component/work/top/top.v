//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon May 16 17:00:50 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// top
module top(
    // Inputs
    LANE0_RXD_N,
    LANE0_RXD_P,
    REF_CLK_PAD_N,
    REF_CLK_PAD_P,
    SYS_RESET_N,
    // Outputs
    LANE0_TXD_N,
    LANE0_TXD_P
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  LANE0_RXD_N;
input  LANE0_RXD_P;
input  REF_CLK_PAD_N;
input  REF_CLK_PAD_P;
input  SYS_RESET_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output LANE0_TXD_N;
output LANE0_TXD_P;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   LANE0_RXD_N;
wire   LANE0_RXD_P;
wire   LANE0_TXD_N_net_0;
wire   LANE0_TXD_P_net_0;
wire   PF_TX_PLL_0_0_CLKS_TO_XCVR_BIT_CLK;
wire   PF_TX_PLL_0_0_CLKS_TO_XCVR_LOCK;
wire   PF_TX_PLL_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire   PF_XCVR_REF_CLK_0_0_REF_CLK;
wire   REF_CLK_PAD_N;
wire   REF_CLK_PAD_P;
wire   SYS_RESET_N;
wire   LANE0_TXD_P_net_1;
wire   LANE0_TXD_N_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1 = LANE0_TXD_P_net_0;
assign LANE0_TXD_P       = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1 = LANE0_TXD_N_net_0;
assign LANE0_TXD_N       = LANE0_TXD_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_TX_PLL_0
PF_TX_PLL_0 PF_TX_PLL_0_0(
        // Inputs
        .REF_CLK         ( PF_XCVR_REF_CLK_0_0_REF_CLK ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PF_TX_PLL_0_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PF_TX_PLL_0_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PF_TX_PLL_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CLK_125         (  ) 
        );

//--------PF_XCVR_REF_CLK_0
PF_XCVR_REF_CLK_0 PF_XCVR_REF_CLK_0_0(
        // Inputs
        .REF_CLK_PAD_P ( REF_CLK_PAD_P ),
        .REF_CLK_PAD_N ( REF_CLK_PAD_N ),
        // Outputs
        .REF_CLK       ( PF_XCVR_REF_CLK_0_0_REF_CLK ) 
        );

//--------SmartBert_Core_0
SmartBert_Core_0 SmartBert_Core_0_0(
        // Inputs
        .LANE0_RXD_P         ( LANE0_RXD_P ),
        .LANE0_RXD_N         ( LANE0_RXD_N ),
        .SYS_RESET_N         ( SYS_RESET_N ),
        .LANE0_CDR_REF_CLK_0 ( PF_XCVR_REF_CLK_0_0_REF_CLK ),
        .TX_PLL_LOCK_0       ( PF_TX_PLL_0_0_CLKS_TO_XCVR_LOCK ),
        .TX_BIT_CLK_0        ( PF_TX_PLL_0_0_CLKS_TO_XCVR_BIT_CLK ),
        .TX_PLL_REF_CLK_0    ( PF_TX_PLL_0_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        // Outputs
        .LANE0_TXD_P         ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N         ( LANE0_TXD_N_net_0 ) 
        );


endmodule
