//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:00:29 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of NGMUX to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component NGMUX
create_and_configure_core -core_vlnv {Actel:SgCore:PF_NGMUX:1.0.101} -component_name {NGMUX} -params {\
"ENABLE_NON_TOGGLING_CLK_SWITCH_SUPPORT:false"   }
# Exporting Component Description of NGMUX to TCL done
*/

// NGMUX
module NGMUX(
    // Inputs
    CLK0,
    CLK1,
    SEL,
    // Outputs
    CLK_OUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK0;
input  CLK1;
input  SEL;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output CLK_OUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   CLK0;
wire   CLK1;
wire   CLK_OUT_net_0;
wire   SEL;
wire   CLK_OUT_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign CLK_OUT_net_1 = CLK_OUT_net_0;
assign CLK_OUT       = CLK_OUT_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------NGMUX_NGMUX_0_PF_NGMUX   -   Actel:SgCore:PF_NGMUX:1.0.101
NGMUX_NGMUX_0_PF_NGMUX NGMUX_0(
        // Inputs
        .CLK0    ( CLK0 ),
        .CLK1    ( CLK1 ),
        .SEL     ( SEL ),
        // Outputs
        .CLK_OUT ( CLK_OUT_net_0 ) 
        );


endmodule
