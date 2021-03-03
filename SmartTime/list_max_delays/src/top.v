//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Feb  4 14:52:21 2021
// Version: v12.6 12.900.20.24
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    A,
    B,
    CLK,
    // Outputs
    Q
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  A;
input  B;
input  CLK;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Q;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   A;
wire   AND2_0_Y;
wire   B;
wire   CLK;
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
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( A ),
        .B ( B ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------DFN1
DFN1 DFN1_0(
        // Inputs
        .D   ( AND2_0_Y ),
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
