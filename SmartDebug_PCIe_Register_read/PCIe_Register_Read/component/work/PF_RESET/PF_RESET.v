//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:01:54 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_RESET to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component PF_RESET
create_and_configure_core -core_vlnv {Actel:DirectCore:CORERESET_PF:2.1.100} -component_name {PF_RESET} -params { }
# Exporting Component Description of PF_RESET to TCL done
*/

// PF_RESET
module PF_RESET(
    // Inputs
    CLK,
    EXT_RST_N,
    FF_US_RESTORE,
    INIT_DONE,
    PLL_LOCK,
    SS_BUSY,
    // Outputs
    FABRIC_RESET_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK;
input  EXT_RST_N;
input  FF_US_RESTORE;
input  INIT_DONE;
input  PLL_LOCK;
input  SS_BUSY;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output FABRIC_RESET_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   CLK;
wire   EXT_RST_N;
wire   FABRIC_RESET_N_net_0;
wire   FF_US_RESTORE;
wire   INIT_DONE;
wire   PLL_LOCK;
wire   SS_BUSY;
wire   FABRIC_RESET_N_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign FABRIC_RESET_N_net_1 = FABRIC_RESET_N_net_0;
assign FABRIC_RESET_N       = FABRIC_RESET_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_RESET_PF_RESET_0_CORERESET_PF   -   Actel:DirectCore:CORERESET_PF:2.1.100
PF_RESET_PF_RESET_0_CORERESET_PF PF_RESET_0(
        // Inputs
        .CLK            ( CLK ),
        .EXT_RST_N      ( EXT_RST_N ),
        .PLL_LOCK       ( PLL_LOCK ),
        .SS_BUSY        ( SS_BUSY ),
        .INIT_DONE      ( INIT_DONE ),
        .FF_US_RESTORE  ( FF_US_RESTORE ),
        // Outputs
        .FABRIC_RESET_N ( FABRIC_RESET_N_net_0 ) 
        );


endmodule
