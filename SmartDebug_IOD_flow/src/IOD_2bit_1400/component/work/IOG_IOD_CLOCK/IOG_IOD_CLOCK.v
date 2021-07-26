//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Jan 23 19:38:55 2020
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// IOG_IOD_CLOCK
module IOG_IOD_CLOCK(
    // Inputs
    REF_CLK_0,
    // Outputs
    OUT0_HS_IO_CLK_0,
    OUT1_HS_IO_CLK_0,
    OUT2_FABCLK_0,
    PLL_LOCK_0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  REF_CLK_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output OUT0_HS_IO_CLK_0;
output OUT1_HS_IO_CLK_0;
output OUT2_FABCLK_0;
output PLL_LOCK_0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   OUT0_HS_IO_CLK_0_net_0;
wire   OUT1_HS_IO_CLK_0_net_0;
wire   OUT2_FABCLK_0_net_0;
wire   PLL_LOCK_0_net_0;
wire   REF_CLK_0;
wire   PLL_LOCK_0_net_1;
wire   OUT2_FABCLK_0_net_1;
wire   OUT0_HS_IO_CLK_0_net_1;
wire   OUT1_HS_IO_CLK_0_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
wire   [10:0]DRI_CTRL_0_const_net_0;
wire   [32:0]DRI_WDATA_0_const_net_0;
wire   [10:0]DRI_CTRL_1_const_net_0;
wire   [32:0]DRI_WDATA_1_const_net_0;
wire   [10:0]DLL_DRI_CTRL_const_net_0;
wire   [32:0]DLL_DRI_WDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                   = 1'b0;
assign DRI_CTRL_0_const_net_0    = 11'h000;
assign DRI_WDATA_0_const_net_0   = 33'h000000000;
assign DRI_CTRL_1_const_net_0    = 11'h000;
assign DRI_WDATA_1_const_net_0   = 33'h000000000;
assign DLL_DRI_CTRL_const_net_0  = 11'h000;
assign DLL_DRI_WDATA_const_net_0 = 33'h000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PLL_LOCK_0_net_1       = PLL_LOCK_0_net_0;
assign PLL_LOCK_0             = PLL_LOCK_0_net_1;
assign OUT2_FABCLK_0_net_1    = OUT2_FABCLK_0_net_0;
assign OUT2_FABCLK_0          = OUT2_FABCLK_0_net_1;
assign OUT0_HS_IO_CLK_0_net_1 = OUT0_HS_IO_CLK_0_net_0;
assign OUT0_HS_IO_CLK_0       = OUT0_HS_IO_CLK_0_net_1;
assign OUT1_HS_IO_CLK_0_net_1 = OUT1_HS_IO_CLK_0_net_0;
assign OUT1_HS_IO_CLK_0       = OUT1_HS_IO_CLK_0_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------IOG_IOD_CLOCK_IOG_IOD_CLOCK_0_PF_CCC   -   Actel:SgCore:PF_CCC:2.1.104
IOG_IOD_CLOCK_IOG_IOD_CLOCK_0_PF_CCC IOG_IOD_CLOCK_0(
        // Inputs
        .REF_CLK_0        ( REF_CLK_0 ),
        // Outputs
        .OUT2_FABCLK_0    ( OUT2_FABCLK_0_net_0 ),
        .OUT0_HS_IO_CLK_0 ( OUT0_HS_IO_CLK_0_net_0 ),
        .OUT1_HS_IO_CLK_0 ( OUT1_HS_IO_CLK_0_net_0 ),
        .PLL_LOCK_0       ( PLL_LOCK_0_net_0 ) 
        );


endmodule
