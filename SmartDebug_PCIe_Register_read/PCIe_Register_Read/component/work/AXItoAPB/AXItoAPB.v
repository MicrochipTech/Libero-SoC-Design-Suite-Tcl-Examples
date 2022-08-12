//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:02:25 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// AXItoAPB
module AXItoAPB(
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
    PRDATAS0,
    PREADYS0,
    PSLVERRS0,
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
    PADDRS,
    PENABLES,
    PSELS0,
    PWDATAS,
    PWRITES,
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
input  [31:0] PRDATAS0;
input         PREADYS0;
input         PSLVERRS0;
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
output [31:0] PADDRS;
output        PENABLES;
output        PSELS0;
output [31:0] PWDATAS;
output        PWRITES;
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
wire   [31:0] AHBtoAPB_0_APBmaster_PADDR;
wire          AHBtoAPB_0_APBmaster_PENABLE;
wire   [31:0] AHBtoAPB_0_APBmaster_PRDATA;
wire          AHBtoAPB_0_APBmaster_PREADY;
wire          AHBtoAPB_0_APBmaster_PSELx;
wire          AHBtoAPB_0_APBmaster_PSLVERR;
wire   [31:0] AHBtoAPB_0_APBmaster_PWDATA;
wire          AHBtoAPB_0_APBmaster_PWRITE;
wire   [31:0] APBmslave0_PADDR;
wire          APBmslave0_PENABLE;
wire   [31:0] PRDATAS0;
wire          PREADYS0;
wire          APBmslave0_PSELx;
wire          PSLVERRS0;
wire   [31:0] APBmslave0_PWDATA;
wire          APBmslave0_PWRITE;
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
wire   [31:0] AXItoAHBL_0_AHBMasterIF_HADDR;
wire   [2:0]  AXItoAHBL_0_AHBMasterIF_HBURST;
wire   [31:0] AXItoAHBL_0_AHBMasterIF_HRDATA;
wire          AXItoAHBL_0_AHBMasterIF_HREADY;
wire   [2:0]  AXItoAHBL_0_AHBMasterIF_HSIZE;
wire   [1:0]  AXItoAHBL_0_AHBMasterIF_HTRANS;
wire   [31:0] AXItoAHBL_0_AHBMasterIF_HWDATA;
wire          AXItoAHBL_0_AHBMasterIF_HWRITE;
wire   [31:0] Core_AHBL_0_AHBmslave0_HADDR;
wire   [2:0]  Core_AHBL_0_AHBmslave0_HBURST;
wire          Core_AHBL_0_AHBmslave0_HMASTLOCK;
wire   [3:0]  Core_AHBL_0_AHBmslave0_HPROT;
wire   [31:0] Core_AHBL_0_AHBmslave0_HRDATA;
wire          Core_AHBL_0_AHBmslave0_HREADY;
wire          Core_AHBL_0_AHBmslave0_HREADYOUT;
wire   [1:0]  Core_AHBL_0_AHBmslave0_HRESP;
wire          Core_AHBL_0_AHBmslave0_HSELx;
wire   [2:0]  Core_AHBL_0_AHBmslave0_HSIZE;
wire   [1:0]  Core_AHBL_0_AHBmslave0_HTRANS;
wire   [31:0] Core_AHBL_0_AHBmslave0_HWDATA;
wire          Core_AHBL_0_AHBmslave0_HWRITE;
wire          APBmslave0_PSELx_net_0;
wire          APBmslave0_PENABLE_net_0;
wire          APBmslave0_PWRITE_net_0;
wire          AXISlaveIF_AWREADY_net_0;
wire          AXISlaveIF_WREADY_net_0;
wire          AXISlaveIF_BVALID_net_0;
wire          AXISlaveIF_ARREADY_net_0;
wire          AXISlaveIF_RLAST_net_0;
wire          AXISlaveIF_RVALID_net_0;
wire   [31:0] APBmslave0_PADDR_net_0;
wire   [31:0] APBmslave0_PWDATA_net_0;
wire   [5:0]  AXISlaveIF_BID_net_0;
wire   [1:0]  AXISlaveIF_BRESP_net_0;
wire   [5:0]  AXISlaveIF_RID_net_0;
wire   [63:0] AXISlaveIF_RDATA_net_0;
wire   [1:0]  AXISlaveIF_RRESP_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [3:0]  HPROT_M0_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [1:0]  AXItoAHBL_0_AHBMasterIF_HRESP;
wire          AXItoAHBL_0_AHBMasterIF_HRESP_0;
wire   [0:0]  AXItoAHBL_0_AHBMasterIF_HRESP_0_0to0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net              = 1'b0;
assign HPROT_M0_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign APBmslave0_PSELx_net_0   = APBmslave0_PSELx;
assign PSELS0                   = APBmslave0_PSELx_net_0;
assign APBmslave0_PENABLE_net_0 = APBmslave0_PENABLE;
assign PENABLES                 = APBmslave0_PENABLE_net_0;
assign APBmslave0_PWRITE_net_0  = APBmslave0_PWRITE;
assign PWRITES                  = APBmslave0_PWRITE_net_0;
assign AXISlaveIF_AWREADY_net_0 = AXISlaveIF_AWREADY;
assign AWREADY                  = AXISlaveIF_AWREADY_net_0;
assign AXISlaveIF_WREADY_net_0  = AXISlaveIF_WREADY;
assign WREADY                   = AXISlaveIF_WREADY_net_0;
assign AXISlaveIF_BVALID_net_0  = AXISlaveIF_BVALID;
assign BVALID                   = AXISlaveIF_BVALID_net_0;
assign AXISlaveIF_ARREADY_net_0 = AXISlaveIF_ARREADY;
assign ARREADY                  = AXISlaveIF_ARREADY_net_0;
assign AXISlaveIF_RLAST_net_0   = AXISlaveIF_RLAST;
assign RLAST                    = AXISlaveIF_RLAST_net_0;
assign AXISlaveIF_RVALID_net_0  = AXISlaveIF_RVALID;
assign RVALID                   = AXISlaveIF_RVALID_net_0;
assign APBmslave0_PADDR_net_0   = APBmslave0_PADDR;
assign PADDRS[31:0]             = APBmslave0_PADDR_net_0;
assign APBmslave0_PWDATA_net_0  = APBmslave0_PWDATA;
assign PWDATAS[31:0]            = APBmslave0_PWDATA_net_0;
assign AXISlaveIF_BID_net_0     = AXISlaveIF_BID;
assign BID[5:0]                 = AXISlaveIF_BID_net_0;
assign AXISlaveIF_BRESP_net_0   = AXISlaveIF_BRESP;
assign BRESP[1:0]               = AXISlaveIF_BRESP_net_0;
assign AXISlaveIF_RID_net_0     = AXISlaveIF_RID;
assign RID[5:0]                 = AXISlaveIF_RID_net_0;
assign AXISlaveIF_RDATA_net_0   = AXISlaveIF_RDATA;
assign RDATA[63:0]              = AXISlaveIF_RDATA_net_0;
assign AXISlaveIF_RRESP_net_0   = AXISlaveIF_RRESP;
assign RRESP[1:0]               = AXISlaveIF_RRESP_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign AXItoAHBL_0_AHBMasterIF_HRESP_0 = { AXItoAHBL_0_AHBMasterIF_HRESP_0_0to0 };
assign AXItoAHBL_0_AHBMasterIF_HRESP_0_0to0 = AXItoAHBL_0_AHBMasterIF_HRESP[0:0];

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AHBtoAPB
AHBtoAPB AHBtoAPB_0(
        // Inputs
        .HCLK      ( ACLK ),
        .HRESETN   ( ARESETN ),
        .HADDR     ( Core_AHBL_0_AHBmslave0_HADDR ),
        .HTRANS    ( Core_AHBL_0_AHBmslave0_HTRANS ),
        .HWRITE    ( Core_AHBL_0_AHBmslave0_HWRITE ),
        .HWDATA    ( Core_AHBL_0_AHBmslave0_HWDATA ),
        .HSEL      ( Core_AHBL_0_AHBmslave0_HSELx ),
        .HREADY    ( Core_AHBL_0_AHBmslave0_HREADY ),
        .PRDATA    ( AHBtoAPB_0_APBmaster_PRDATA ),
        .PREADY    ( AHBtoAPB_0_APBmaster_PREADY ),
        .PSLVERR   ( AHBtoAPB_0_APBmaster_PSLVERR ),
        // Outputs
        .HRDATA    ( Core_AHBL_0_AHBmslave0_HRDATA ),
        .HREADYOUT ( Core_AHBL_0_AHBmslave0_HREADYOUT ),
        .HRESP     ( Core_AHBL_0_AHBmslave0_HRESP ),
        .PADDR     ( AHBtoAPB_0_APBmaster_PADDR ),
        .PSEL      ( AHBtoAPB_0_APBmaster_PSELx ),
        .PENABLE   ( AHBtoAPB_0_APBmaster_PENABLE ),
        .PWRITE    ( AHBtoAPB_0_APBmaster_PWRITE ),
        .PWDATA    ( AHBtoAPB_0_APBmaster_PWDATA ) 
        );

//--------AXItoAHBL
AXItoAHBL AXItoAHBL_0(
        // Inputs
        .ACLK     ( ACLK ),
        .ARESETN  ( ARESETN ),
        .HCLK     ( ACLK ),
        .HRESETN  ( ARESETN ),
        .AWID     ( AWID ),
        .AWADDR   ( AWADDR ),
        .AWLEN    ( AWLEN ),
        .AWSIZE   ( AWSIZE ),
        .AWBURST  ( AWBURST ),
        .AWVALID  ( AWVALID ),
        .WDATA    ( WDATA ),
        .WSTRB    ( WSTRB ),
        .WLAST    ( WLAST ),
        .WVALID   ( WVALID ),
        .BREADY   ( BREADY ),
        .ARID     ( ARID ),
        .ARADDR   ( ARADDR ),
        .ARLEN    ( ARLEN ),
        .ARSIZE   ( ARSIZE ),
        .ARBURST  ( ARBURST ),
        .ARVALID  ( ARVALID ),
        .RREADY   ( RREADY ),
        .WID_BIF  ( WID_BIF ),
        .HRDATA   ( AXItoAHBL_0_AHBMasterIF_HRDATA ),
        .HRESP    ( AXItoAHBL_0_AHBMasterIF_HRESP_0 ),
        .HREADYIN ( AXItoAHBL_0_AHBMasterIF_HREADY ),
        // Outputs
        .AWREADY  ( AXISlaveIF_AWREADY ),
        .WREADY   ( AXISlaveIF_WREADY ),
        .BID      ( AXISlaveIF_BID ),
        .BRESP    ( AXISlaveIF_BRESP ),
        .BVALID   ( AXISlaveIF_BVALID ),
        .ARREADY  ( AXISlaveIF_ARREADY ),
        .RID      ( AXISlaveIF_RID ),
        .RDATA    ( AXISlaveIF_RDATA ),
        .RRESP    ( AXISlaveIF_RRESP ),
        .RLAST    ( AXISlaveIF_RLAST ),
        .RVALID   ( AXISlaveIF_RVALID ),
        .HADDR    ( AXItoAHBL_0_AHBMasterIF_HADDR ),
        .HTRANS   ( AXItoAHBL_0_AHBMasterIF_HTRANS ),
        .HWRITE   ( AXItoAHBL_0_AHBMasterIF_HWRITE ),
        .HSIZE    ( AXItoAHBL_0_AHBMasterIF_HSIZE ),
        .HBURST   ( AXItoAHBL_0_AHBMasterIF_HBURST ),
        .HWDATA   ( AXItoAHBL_0_AHBMasterIF_HWDATA ) 
        );

//--------Core_AHBL
Core_AHBL Core_AHBL_0(
        // Inputs
        .HCLK         ( ACLK ),
        .HRESETN      ( ARESETN ),
        .REMAP_M0     ( GND_net ),
        .HADDR_M0     ( AXItoAHBL_0_AHBMasterIF_HADDR ),
        .HTRANS_M0    ( AXItoAHBL_0_AHBMasterIF_HTRANS ),
        .HWRITE_M0    ( AXItoAHBL_0_AHBMasterIF_HWRITE ),
        .HSIZE_M0     ( AXItoAHBL_0_AHBMasterIF_HSIZE ),
        .HBURST_M0    ( AXItoAHBL_0_AHBMasterIF_HBURST ),
        .HPROT_M0     ( HPROT_M0_const_net_0 ), // tied to 4'h0 from definition
        .HWDATA_M0    ( AXItoAHBL_0_AHBMasterIF_HWDATA ),
        .HMASTLOCK_M0 ( GND_net ), // tied to 1'b0 from definition
        .HRDATA_S0    ( Core_AHBL_0_AHBmslave0_HRDATA ),
        .HREADYOUT_S0 ( Core_AHBL_0_AHBmslave0_HREADYOUT ),
        .HRESP_S0     ( Core_AHBL_0_AHBmslave0_HRESP ),
        // Outputs
        .HRDATA_M0    ( AXItoAHBL_0_AHBMasterIF_HRDATA ),
        .HREADY_M0    ( AXItoAHBL_0_AHBMasterIF_HREADY ),
        .HRESP_M0     ( AXItoAHBL_0_AHBMasterIF_HRESP ),
        .HADDR_S0     ( Core_AHBL_0_AHBmslave0_HADDR ),
        .HTRANS_S0    ( Core_AHBL_0_AHBmslave0_HTRANS ),
        .HWRITE_S0    ( Core_AHBL_0_AHBmslave0_HWRITE ),
        .HSIZE_S0     ( Core_AHBL_0_AHBmslave0_HSIZE ),
        .HWDATA_S0    ( Core_AHBL_0_AHBmslave0_HWDATA ),
        .HSEL_S0      ( Core_AHBL_0_AHBmslave0_HSELx ),
        .HREADY_S0    ( Core_AHBL_0_AHBmslave0_HREADY ),
        .HMASTLOCK_S0 ( Core_AHBL_0_AHBmslave0_HMASTLOCK ),
        .HBURST_S0    ( Core_AHBL_0_AHBmslave0_HBURST ),
        .HPROT_S0     ( Core_AHBL_0_AHBmslave0_HPROT ) 
        );

//--------Core_APB
Core_APB Core_APB_0(
        // Inputs
        .PADDR     ( AHBtoAPB_0_APBmaster_PADDR ),
        .PSEL      ( AHBtoAPB_0_APBmaster_PSELx ),
        .PENABLE   ( AHBtoAPB_0_APBmaster_PENABLE ),
        .PWRITE    ( AHBtoAPB_0_APBmaster_PWRITE ),
        .PWDATA    ( AHBtoAPB_0_APBmaster_PWDATA ),
        .PRDATAS0  ( PRDATAS0 ),
        .PREADYS0  ( PREADYS0 ),
        .PSLVERRS0 ( PSLVERRS0 ),
        // Outputs
        .PRDATA    ( AHBtoAPB_0_APBmaster_PRDATA ),
        .PREADY    ( AHBtoAPB_0_APBmaster_PREADY ),
        .PSLVERR   ( AHBtoAPB_0_APBmaster_PSLVERR ),
        .PADDRS    ( APBmslave0_PADDR ),
        .PSELS0    ( APBmslave0_PSELx ),
        .PENABLES  ( APBmslave0_PENABLE ),
        .PWRITES   ( APBmslave0_PWRITE ),
        .PWDATAS   ( APBmslave0_PWDATA ) 
        );


endmodule
