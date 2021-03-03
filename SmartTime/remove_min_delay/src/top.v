//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Oct  5 13:19:04 2020
// Version: v12.4 12.900.0.16
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    A,
    CLK_0,
    CLK_2,
    D_0,
    // Outputs
    Q,
    Q_0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  A;
input  CLK_0;
input  CLK_2;
input  D_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Q;
output Q_0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   A;
wire   AND2_0_Y;
wire   CLK_0;
wire   CLK_2;
wire   D_0;
wire   DFN1_0_Q;
wire   Q_net_0;
wire   Q_0_net_0;
wire   Q_net_1;
wire   Q_0_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Q_net_1   = Q_net_0;
assign Q         = Q_net_1;
assign Q_0_net_1 = Q_0_net_0;
assign Q_0       = Q_0_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( A ),
        .B ( DFN1_0_Q ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------DFN1
DFN1 DFN1_0(
        // Inputs
        .D   ( D_0 ),
        .CLK ( CLK_0 ),
        // Outputs
        .Q   ( DFN1_0_Q ) 
        );

//--------DFN1
DFN1 DFN1_1(
        // Inputs
        .D   ( AND2_0_Y ),
        .CLK ( CLK_0 ),
        // Outputs
        .Q   ( Q_net_0 ) 
        );

//--------DFN1
DFN1 DFN1_2(
        // Inputs
        .D   ( DFN1_0_Q ),
        .CLK ( CLK_2 ),
        // Outputs
        .Q   ( Q_0_net_0 ) 
        );


endmodule
