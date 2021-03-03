//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Oct  1 17:24:17 2020
// Version: v12.4 12.900.0.16
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    A,
    CLK_0,
    CLK_1,
    D_0,
    D_E_0,
    E_0,
    // Outputs
    Q_0,
    Q_1,
    Y
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  A;
input  CLK_0;
input  CLK_1;
input  D_0;
input  D_E_0;
input  E_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Q_0;
output Q_1;
output Y;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   A;
wire   CLK_0;
wire   CLK_1;
wire   D_0;
wire   D_E_0;
wire   DFN1_1_Q;
wire   DFN1E1_0_Q;
wire   E_0;
wire   INV_0_Y;
wire   Q_0_net_0;
wire   Q_1_net_0;
wire   Y_net_0;
wire   Y_net_1;
wire   Q_1_net_1;
wire   Q_0_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Y_net_1   = Y_net_0;
assign Y         = Y_net_1;
assign Q_1_net_1 = Q_1_net_0;
assign Q_1       = Q_1_net_1;
assign Q_0_net_1 = Q_0_net_0;
assign Q_0       = Q_0_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( A ),
        .B ( DFN1E1_0_Q ),
        // Outputs
        .Y ( Y_net_0 ) 
        );

//--------DFN1
DFN1 DFN1_0(
        // Inputs
        .D   ( D_0 ),
        .CLK ( CLK_0 ),
        // Outputs
        .Q   ( Q_0_net_0 ) 
        );

//--------DFN1
DFN1 DFN1_1(
        // Inputs
        .D   ( D_0 ),
        .CLK ( CLK_1 ),
        // Outputs
        .Q   ( DFN1_1_Q ) 
        );

//--------DFN1
DFN1 DFN1_2(
        // Inputs
        .D   ( INV_0_Y ),
        .CLK ( CLK_1 ),
        // Outputs
        .Q   ( Q_1_net_0 ) 
        );

//--------DFN1E1
DFN1E1 DFN1E1_0(
        // Inputs
        .D   ( D_E_0 ),
        .CLK ( CLK_0 ),
        .E   ( E_0 ),
        // Outputs
        .Q   ( DFN1E1_0_Q ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( DFN1_1_Q ),
        // Outputs
        .Y ( INV_0_Y ) 
        );


endmodule
