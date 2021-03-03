//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Sep 10 16:53:54 2020
// Version: v12.4 12.900.0.16
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Top
module Top(
    // Inputs
    CLK_1,
    D_1,
    // Outputs
    Q,
    Q_1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK_1;
input  D_1;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output Q;
output Q_1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   AND2_0_Y;
wire   CLK_1;
wire   D_1;
wire   DFN1_1_Q;
wire   Q_net_0;
wire   Q_1_net_0;
wire   Q_net_1;
wire   Q_1_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Q_net_1   = Q_net_0;
assign Q         = Q_net_1;
assign Q_1_net_1 = Q_1_net_0;
assign Q_1       = Q_1_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( D_1 ),
        .B ( DFN1_1_Q ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------DFN1
DFN1 DFN1_0(
        // Inputs
        .D   ( AND2_0_Y ),
        .CLK ( CLK_1 ),
        // Outputs
        .Q   ( Q_net_0 ) 
        );

//--------DFN1
DFN1 DFN1_1(
        // Inputs
        .D   ( D_1 ),
        .CLK ( CLK_1 ),
        // Outputs
        .Q   ( DFN1_1_Q ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( DFN1_1_Q ),
        // Outputs
        .Y ( Q_1_net_0 ) 
        );


endmodule