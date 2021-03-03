//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Jan  7 13:33:20 2020
// Version: v12.3 SPA 12.800.1.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// TOP
module TOP(
    // Inputs
    CLK,
    D,
    // Outputs
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK;
input  D;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   CLK;
wire   D;
wire   DFN1_0_Q;
wire   Q_net_0;
wire   Q_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Q_net_1 = Q_net_0;
assign Q       = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------DFN1
DFN1 DFN1_0(
        // Inputs
        .D   ( D ),
        .CLK ( CLK ),
        // Outputs
        .Q   ( DFN1_0_Q ) 
        );

//--------DFN1
DFN1 DFN1_1(
        // Inputs
        .D   ( DFN1_0_Q ),
        .CLK ( CLK ),
        // Outputs
        .Q   ( Q_net_0 ) 
        );


endmodule
