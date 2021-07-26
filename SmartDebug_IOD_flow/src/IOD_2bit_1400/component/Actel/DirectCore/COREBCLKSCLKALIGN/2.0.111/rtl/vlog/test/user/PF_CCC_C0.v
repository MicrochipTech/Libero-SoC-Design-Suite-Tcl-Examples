//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec 22 16:01:51 2019
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PF_CCC_C0
module PF_CCC_C0(
    // Inputs
    DRI_ARST_N_0,
    DRI_CLK_0,
    DRI_CTRL_0,
    DRI_WDATA_0,
    PLL_POWERDOWN_N_0,
    REF_CLK_0,
    // Outputs
    DRI_INTERRUPT_0,
    DRI_RDATA_0,
    OUT0_HS_IO_CLK_0,
    OUT1_HS_IO_CLK_0,
    OUT2_FABCLK_0,
    OUT3_HS_IO_CLK_0,
    PLL_LOCK_0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         DRI_ARST_N_0;
input         DRI_CLK_0;
input  [10:0] DRI_CTRL_0;
input  [32:0] DRI_WDATA_0;
input         PLL_POWERDOWN_N_0;
input         REF_CLK_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        DRI_INTERRUPT_0;
output [32:0] DRI_RDATA_0;
output        OUT0_HS_IO_CLK_0;
output        OUT1_HS_IO_CLK_0;
output        OUT2_FABCLK_0;
output        OUT3_HS_IO_CLK_0;
output        PLL_LOCK_0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          OUT0_HS_IO_CLK_0_net_0;
wire          OUT1_HS_IO_CLK_0_net_0;
wire          OUT2_FABCLK_0_net_0;
wire          OUT3_HS_IO_CLK_0_net_0;
wire          DRI_ARST_N_0;
wire          DRI_CLK_0;
wire   [10:0] DRI_CTRL_0;
wire          PLL0_DRI_DRI_INTERRUPT;
wire   [32:0] PLL0_DRI_DRI_RDATA;
wire   [32:0] DRI_WDATA_0;
wire          PLL_LOCK_0_net_0;
wire          PLL_POWERDOWN_N_0;
wire          REF_CLK_0;
wire          PLL_LOCK_0_net_1;
wire          OUT2_FABCLK_0_net_1;
wire          OUT0_HS_IO_CLK_0_net_1;
wire          OUT1_HS_IO_CLK_0_net_1;
wire          OUT3_HS_IO_CLK_0_net_1;
wire          PLL0_DRI_DRI_INTERRUPT_net_0;
wire   [32:0] PLL0_DRI_DRI_RDATA_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [10:0] DRI_CTRL_1_const_net_0;
wire   [32:0] DRI_WDATA_1_const_net_0;
wire   [10:0] DLL_DRI_CTRL_const_net_0;
wire   [32:0] DLL_DRI_WDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                   = 1'b0;
assign DRI_CTRL_1_const_net_0    = 11'h000;
assign DRI_WDATA_1_const_net_0   = 33'h000000000;
assign DLL_DRI_CTRL_const_net_0  = 11'h000;
assign DLL_DRI_WDATA_const_net_0 = 33'h000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PLL_LOCK_0_net_1             = PLL_LOCK_0_net_0;
assign PLL_LOCK_0                   = PLL_LOCK_0_net_1;
assign OUT2_FABCLK_0_net_1          = OUT2_FABCLK_0_net_0;
assign OUT2_FABCLK_0                = OUT2_FABCLK_0_net_1;
assign OUT0_HS_IO_CLK_0_net_1       = OUT0_HS_IO_CLK_0_net_0;
assign OUT0_HS_IO_CLK_0             = OUT0_HS_IO_CLK_0_net_1;
assign OUT1_HS_IO_CLK_0_net_1       = OUT1_HS_IO_CLK_0_net_0;
assign OUT1_HS_IO_CLK_0             = OUT1_HS_IO_CLK_0_net_1;
assign OUT3_HS_IO_CLK_0_net_1       = OUT3_HS_IO_CLK_0_net_0;
assign OUT3_HS_IO_CLK_0             = OUT3_HS_IO_CLK_0_net_1;
assign PLL0_DRI_DRI_INTERRUPT_net_0 = PLL0_DRI_DRI_INTERRUPT;
assign DRI_INTERRUPT_0              = PLL0_DRI_DRI_INTERRUPT_net_0;
assign PLL0_DRI_DRI_RDATA_net_0     = PLL0_DRI_DRI_RDATA;
assign DRI_RDATA_0[32:0]            = PLL0_DRI_DRI_RDATA_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_CCC_C0_PF_CCC_C0_0_PF_CCC   -   Actel:SgCore:PF_CCC:2.1.104
PF_CCC_C0_PF_CCC_C0_0_PF_CCC PF_CCC_C0_0(
        // Inputs
        .REF_CLK_0         ( REF_CLK_0 ),
        .DRI_CLK_0         ( DRI_CLK_0 ),
        .DRI_ARST_N_0      ( DRI_ARST_N_0 ),
        .PLL_POWERDOWN_N_0 ( PLL_POWERDOWN_N_0 ),
        .DRI_CTRL_0        ( DRI_CTRL_0 ),
        .DRI_WDATA_0       ( DRI_WDATA_0 ),
        // Outputs
        .OUT2_FABCLK_0     ( OUT2_FABCLK_0_net_0 ),
        .OUT0_HS_IO_CLK_0  ( OUT0_HS_IO_CLK_0_net_0 ),
        .OUT1_HS_IO_CLK_0  ( OUT1_HS_IO_CLK_0_net_0 ),
        .OUT3_HS_IO_CLK_0  ( OUT3_HS_IO_CLK_0_net_0 ),
        .PLL_LOCK_0        ( PLL_LOCK_0_net_0 ),
        .DRI_INTERRUPT_0   ( PLL0_DRI_DRI_INTERRUPT ),
        .DRI_RDATA_0       ( PLL0_DRI_DRI_RDATA ) 
        );


endmodule
