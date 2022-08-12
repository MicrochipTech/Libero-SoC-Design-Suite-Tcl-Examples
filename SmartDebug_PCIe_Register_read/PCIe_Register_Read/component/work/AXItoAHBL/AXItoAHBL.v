//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:00:08 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of AXItoAHBL to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component AXItoAHBL
create_and_configure_core -core_vlnv {Actel:DirectCore:COREAXITOAHBL:3.3.102} -component_name {AXItoAHBL} -params {\
"ASYNC_CLOCKS:false"  \
"AXI_SEL_MM_S:0"  \
"EXPOSE_WID:false"  \
"ID_WIDTH:6"  \
"NO_BURST_TRANS:false"  \
"WRAP_SUPPORT:false"   }
# Exporting Component Description of AXItoAHBL to TCL done
*/

// AXItoAHBL
module AXItoAHBL(
    // Inputs
    ACLK,
    ARADDR,
    ARBURST,
    ARESETN,
    ARID,
    ARLEN,
    ARSIZE,
    ARVALID,
    AWADDR,
    AWBURST,
    AWID,
    AWLEN,
    AWSIZE,
    AWVALID,
    BREADY,
    HCLK,
    HRDATA,
    HREADYIN,
    HRESETN,
    HRESP,
    RREADY,
    WDATA,
    WID_BIF,
    WLAST,
    WSTRB,
    WVALID,
    // Outputs
    ARREADY,
    AWREADY,
    BID,
    BRESP,
    BVALID,
    HADDR,
    HBURST,
    HSIZE,
    HTRANS,
    HWDATA,
    HWRITE,
    RDATA,
    RID,
    RLAST,
    RRESP,
    RVALID,
    WREADY
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ACLK;
input  [31:0] ARADDR;
input  [1:0]  ARBURST;
input         ARESETN;
input  [5:0]  ARID;
input  [3:0]  ARLEN;
input  [2:0]  ARSIZE;
input         ARVALID;
input  [31:0] AWADDR;
input  [1:0]  AWBURST;
input  [5:0]  AWID;
input  [3:0]  AWLEN;
input  [2:0]  AWSIZE;
input         AWVALID;
input         BREADY;
input         HCLK;
input  [31:0] HRDATA;
input         HREADYIN;
input         HRESETN;
input         HRESP;
input         RREADY;
input  [63:0] WDATA;
input  [5:0]  WID_BIF;
input         WLAST;
input  [7:0]  WSTRB;
input         WVALID;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ARREADY;
output        AWREADY;
output [5:0]  BID;
output [1:0]  BRESP;
output        BVALID;
output [31:0] HADDR;
output [2:0]  HBURST;
output [2:0]  HSIZE;
output [1:0]  HTRANS;
output [31:0] HWDATA;
output        HWRITE;
output [63:0] RDATA;
output [5:0]  RID;
output        RLAST;
output [1:0]  RRESP;
output        RVALID;
output        WREADY;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          ACLK;
wire   [31:0] AHBMasterIF_HADDR;
wire   [2:0]  AHBMasterIF_HBURST;
wire   [31:0] HRDATA;
wire          HREADYIN;
wire          HRESP;
wire   [2:0]  AHBMasterIF_HSIZE;
wire   [1:0]  AHBMasterIF_HTRANS;
wire   [31:0] AHBMasterIF_HWDATA;
wire          AHBMasterIF_HWRITE;
wire          ARESETN;
wire   [31:0] ARADDR;
wire   [1:0]  ARBURST;
wire   [5:0]  ARID;
wire   [3:0]  ARLEN;
wire          AXISlaveIF_ARREADY;
wire   [2:0]  ARSIZE;
wire          ARVALID;
wire   [31:0] AWADDR;
wire   [1:0]  AWBURST;
wire   [5:0]  AWID;
wire   [3:0]  AWLEN;
wire          AXISlaveIF_AWREADY;
wire   [2:0]  AWSIZE;
wire          AWVALID;
wire   [5:0]  AXISlaveIF_BID;
wire          BREADY;
wire   [1:0]  AXISlaveIF_BRESP;
wire          AXISlaveIF_BVALID;
wire   [63:0] AXISlaveIF_RDATA;
wire   [5:0]  AXISlaveIF_RID;
wire          AXISlaveIF_RLAST;
wire          RREADY;
wire   [1:0]  AXISlaveIF_RRESP;
wire          AXISlaveIF_RVALID;
wire   [63:0] WDATA;
wire   [5:0]  WID_BIF;
wire          WLAST;
wire          AXISlaveIF_WREADY;
wire   [7:0]  WSTRB;
wire          WVALID;
wire          HCLK;
wire          HRESETN;
wire          AXISlaveIF_AWREADY_net_0;
wire          AXISlaveIF_WREADY_net_0;
wire   [5:0]  AXISlaveIF_BID_net_0;
wire   [1:0]  AXISlaveIF_BRESP_net_0;
wire          AXISlaveIF_BVALID_net_0;
wire          AXISlaveIF_ARREADY_net_0;
wire   [5:0]  AXISlaveIF_RID_net_0;
wire   [63:0] AXISlaveIF_RDATA_net_0;
wire   [1:0]  AXISlaveIF_RRESP_net_0;
wire          AXISlaveIF_RLAST_net_0;
wire          AXISlaveIF_RVALID_net_0;
wire   [31:0] AHBMasterIF_HADDR_net_0;
wire   [1:0]  AHBMasterIF_HTRANS_net_0;
wire          AHBMasterIF_HWRITE_net_0;
wire   [2:0]  AHBMasterIF_HSIZE_net_0;
wire   [2:0]  AHBMasterIF_HBURST_net_0;
wire   [31:0] AHBMasterIF_HWDATA_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [5:0]  WID_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign WID_const_net_0 = 6'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXISlaveIF_AWREADY_net_0 = AXISlaveIF_AWREADY;
assign AWREADY                  = AXISlaveIF_AWREADY_net_0;
assign AXISlaveIF_WREADY_net_0  = AXISlaveIF_WREADY;
assign WREADY                   = AXISlaveIF_WREADY_net_0;
assign AXISlaveIF_BID_net_0     = AXISlaveIF_BID;
assign BID[5:0]                 = AXISlaveIF_BID_net_0;
assign AXISlaveIF_BRESP_net_0   = AXISlaveIF_BRESP;
assign BRESP[1:0]               = AXISlaveIF_BRESP_net_0;
assign AXISlaveIF_BVALID_net_0  = AXISlaveIF_BVALID;
assign BVALID                   = AXISlaveIF_BVALID_net_0;
assign AXISlaveIF_ARREADY_net_0 = AXISlaveIF_ARREADY;
assign ARREADY                  = AXISlaveIF_ARREADY_net_0;
assign AXISlaveIF_RID_net_0     = AXISlaveIF_RID;
assign RID[5:0]                 = AXISlaveIF_RID_net_0;
assign AXISlaveIF_RDATA_net_0   = AXISlaveIF_RDATA;
assign RDATA[63:0]              = AXISlaveIF_RDATA_net_0;
assign AXISlaveIF_RRESP_net_0   = AXISlaveIF_RRESP;
assign RRESP[1:0]               = AXISlaveIF_RRESP_net_0;
assign AXISlaveIF_RLAST_net_0   = AXISlaveIF_RLAST;
assign RLAST                    = AXISlaveIF_RLAST_net_0;
assign AXISlaveIF_RVALID_net_0  = AXISlaveIF_RVALID;
assign RVALID                   = AXISlaveIF_RVALID_net_0;
assign AHBMasterIF_HADDR_net_0  = AHBMasterIF_HADDR;
assign HADDR[31:0]              = AHBMasterIF_HADDR_net_0;
assign AHBMasterIF_HTRANS_net_0 = AHBMasterIF_HTRANS;
assign HTRANS[1:0]              = AHBMasterIF_HTRANS_net_0;
assign AHBMasterIF_HWRITE_net_0 = AHBMasterIF_HWRITE;
assign HWRITE                   = AHBMasterIF_HWRITE_net_0;
assign AHBMasterIF_HSIZE_net_0  = AHBMasterIF_HSIZE;
assign HSIZE[2:0]               = AHBMasterIF_HSIZE_net_0;
assign AHBMasterIF_HBURST_net_0 = AHBMasterIF_HBURST;
assign HBURST[2:0]              = AHBMasterIF_HBURST_net_0;
assign AHBMasterIF_HWDATA_net_0 = AHBMasterIF_HWDATA;
assign HWDATA[31:0]             = AHBMasterIF_HWDATA_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AXItoAHBL_AXItoAHBL_0_COREAXITOAHBL   -   Actel:DirectCore:COREAXITOAHBL:3.3.102
AXItoAHBL_AXItoAHBL_0_COREAXITOAHBL #( 
        .ASYNC_CLOCKS   ( 0 ),
        .AXI_SEL_MM_S   ( 0 ),
        .EXPOSE_WID     ( 0 ),
        .ID_WIDTH       ( 6 ),
        .NO_BURST_TRANS ( 0 ),
        .WRAP_SUPPORT   ( 0 ) )
AXItoAHBL_0(
        // Inputs
        .ACLK     ( ACLK ),
        .ARESETN  ( ARESETN ),
        .AWVALID  ( AWVALID ),
        .AWLEN    ( AWLEN ),
        .AWSIZE   ( AWSIZE ),
        .AWBURST  ( AWBURST ),
        .AWID     ( AWID ),
        .AWADDR   ( AWADDR ),
        .WVALID   ( WVALID ),
        .WDATA    ( WDATA ),
        .WSTRB    ( WSTRB ),
        .WLAST    ( WLAST ),
        .BREADY   ( BREADY ),
        .ARVALID  ( ARVALID ),
        .RREADY   ( RREADY ),
        .ARADDR   ( ARADDR ),
        .ARSIZE   ( ARSIZE ),
        .ARID     ( ARID ),
        .ARLEN    ( ARLEN ),
        .ARBURST  ( ARBURST ),
        .HCLK     ( HCLK ),
        .HRESETN  ( HRESETN ),
        .HREADYIN ( HREADYIN ),
        .HRESP    ( HRESP ),
        .HRDATA   ( HRDATA ),
        .WID      ( WID_const_net_0 ), // tied to 6'h00 from definition
        .WID_BIF  ( WID_BIF ),
        // Outputs
        .BRESP    ( AXISlaveIF_BRESP ),
        .BID      ( AXISlaveIF_BID ),
        .BVALID   ( AXISlaveIF_BVALID ),
        .AWREADY  ( AXISlaveIF_AWREADY ),
        .WREADY   ( AXISlaveIF_WREADY ),
        .ARREADY  ( AXISlaveIF_ARREADY ),
        .RVALID   ( AXISlaveIF_RVALID ),
        .RLAST    ( AXISlaveIF_RLAST ),
        .RID      ( AXISlaveIF_RID ),
        .RDATA    ( AXISlaveIF_RDATA ),
        .RRESP    ( AXISlaveIF_RRESP ),
        .HWRITE   ( AHBMasterIF_HWRITE ),
        .HSIZE    ( AHBMasterIF_HSIZE ),
        .HWDATA   ( AHBMasterIF_HWDATA ),
        .HADDR    ( AHBMasterIF_HADDR ),
        .HTRANS   ( AHBMasterIF_HTRANS ),
        .HBURST   ( AHBMasterIF_HBURST ) 
        );


endmodule
