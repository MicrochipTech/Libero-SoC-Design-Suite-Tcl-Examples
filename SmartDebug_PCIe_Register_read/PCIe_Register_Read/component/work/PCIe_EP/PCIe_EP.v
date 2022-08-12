//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:02:43 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PCIe_EP
module PCIe_EP(
    // Inputs
    APB_S_PADDR,
    APB_S_PCLK,
    APB_S_PENABLE,
    APB_S_PSEL,
    APB_S_PWDATA,
    APB_S_PWRITE,
    AXI_CLK,
    AXI_CLK_STABLE,
    PCIESS_AXI_1_M_ARREADY,
    PCIESS_AXI_1_M_AWREADY,
    PCIESS_AXI_1_M_BID,
    PCIESS_AXI_1_M_BRESP,
    PCIESS_AXI_1_M_BVALID,
    PCIESS_AXI_1_M_RDATA,
    PCIESS_AXI_1_M_RID,
    PCIESS_AXI_1_M_RLAST,
    PCIESS_AXI_1_M_RRESP,
    PCIESS_AXI_1_M_RVALID,
    PCIESS_AXI_1_M_WREADY,
    PCIESS_LANE_RXD0_N,
    PCIESS_LANE_RXD0_P,
    PCIESS_LANE_RXD1_N,
    PCIESS_LANE_RXD1_P,
    PCIESS_LANE_RXD2_N,
    PCIESS_LANE_RXD2_P,
    PCIESS_LANE_RXD3_N,
    PCIESS_LANE_RXD3_P,
    PCIE_1_PERST_N,
    REF_CLK_PAD_N,
    REF_CLK_PAD_P,
    RESET_N,
    switch_i,
    // Outputs
    APB_S_PRDATA,
    APB_S_PREADY,
    APB_S_PSLVERR,
    BANK0_1_7_CALIB_DONE,
    DEVICE_INIT_DONE,
    PCIESS_AXI_1_M_ARADDR,
    PCIESS_AXI_1_M_ARBURST,
    PCIESS_AXI_1_M_ARID,
    PCIESS_AXI_1_M_ARLEN,
    PCIESS_AXI_1_M_ARSIZE,
    PCIESS_AXI_1_M_ARVALID,
    PCIESS_AXI_1_M_AWADDR,
    PCIESS_AXI_1_M_AWBURST,
    PCIESS_AXI_1_M_AWID,
    PCIESS_AXI_1_M_AWLEN,
    PCIESS_AXI_1_M_AWSIZE,
    PCIESS_AXI_1_M_AWVALID,
    PCIESS_AXI_1_M_BREADY,
    PCIESS_AXI_1_M_RREADY,
    PCIESS_AXI_1_M_WDATA,
    PCIESS_AXI_1_M_WLAST,
    PCIESS_AXI_1_M_WSTRB,
    PCIESS_AXI_1_M_WVALID,
    PCIESS_LANE_TXD0_N,
    PCIESS_LANE_TXD0_P,
    PCIESS_LANE_TXD1_N,
    PCIESS_LANE_TXD1_P,
    PCIESS_LANE_TXD2_N,
    PCIESS_LANE_TXD2_P,
    PCIESS_LANE_TXD3_N,
    PCIESS_LANE_TXD3_P,
    PCIE_1_INTERRUPT_OUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [25:0] APB_S_PADDR;
input         APB_S_PCLK;
input         APB_S_PENABLE;
input         APB_S_PSEL;
input  [31:0] APB_S_PWDATA;
input         APB_S_PWRITE;
input         AXI_CLK;
input         AXI_CLK_STABLE;
input         PCIESS_AXI_1_M_ARREADY;
input         PCIESS_AXI_1_M_AWREADY;
input  [3:0]  PCIESS_AXI_1_M_BID;
input  [1:0]  PCIESS_AXI_1_M_BRESP;
input         PCIESS_AXI_1_M_BVALID;
input  [63:0] PCIESS_AXI_1_M_RDATA;
input  [3:0]  PCIESS_AXI_1_M_RID;
input         PCIESS_AXI_1_M_RLAST;
input  [1:0]  PCIESS_AXI_1_M_RRESP;
input         PCIESS_AXI_1_M_RVALID;
input         PCIESS_AXI_1_M_WREADY;
input         PCIESS_LANE_RXD0_N;
input         PCIESS_LANE_RXD0_P;
input         PCIESS_LANE_RXD1_N;
input         PCIESS_LANE_RXD1_P;
input         PCIESS_LANE_RXD2_N;
input         PCIESS_LANE_RXD2_P;
input         PCIESS_LANE_RXD3_N;
input         PCIESS_LANE_RXD3_P;
input         PCIE_1_PERST_N;
input         REF_CLK_PAD_N;
input         REF_CLK_PAD_P;
input         RESET_N;
input  [3:0]  switch_i;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] APB_S_PRDATA;
output        APB_S_PREADY;
output        APB_S_PSLVERR;
output        BANK0_1_7_CALIB_DONE;
output        DEVICE_INIT_DONE;
output [31:0] PCIESS_AXI_1_M_ARADDR;
output [1:0]  PCIESS_AXI_1_M_ARBURST;
output [3:0]  PCIESS_AXI_1_M_ARID;
output [7:0]  PCIESS_AXI_1_M_ARLEN;
output [1:0]  PCIESS_AXI_1_M_ARSIZE;
output        PCIESS_AXI_1_M_ARVALID;
output [31:0] PCIESS_AXI_1_M_AWADDR;
output [1:0]  PCIESS_AXI_1_M_AWBURST;
output [3:0]  PCIESS_AXI_1_M_AWID;
output [7:0]  PCIESS_AXI_1_M_AWLEN;
output [1:0]  PCIESS_AXI_1_M_AWSIZE;
output        PCIESS_AXI_1_M_AWVALID;
output        PCIESS_AXI_1_M_BREADY;
output        PCIESS_AXI_1_M_RREADY;
output [63:0] PCIESS_AXI_1_M_WDATA;
output        PCIESS_AXI_1_M_WLAST;
output [7:0]  PCIESS_AXI_1_M_WSTRB;
output        PCIESS_AXI_1_M_WVALID;
output        PCIESS_LANE_TXD0_N;
output        PCIESS_LANE_TXD0_P;
output        PCIESS_LANE_TXD1_N;
output        PCIESS_LANE_TXD1_P;
output        PCIESS_LANE_TXD2_N;
output        PCIESS_LANE_TXD2_P;
output        PCIESS_LANE_TXD3_N;
output        PCIESS_LANE_TXD3_P;
output        PCIE_1_INTERRUPT_OUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          APB_S_PCLK;
wire   [31:0] AXI_1_MASTER_ARADDR;
wire   [1:0]  AXI_1_MASTER_ARBURST;
wire   [3:0]  AXI_1_MASTER_ARID;
wire   [7:0]  AXI_1_MASTER_ARLEN;
wire          PCIESS_AXI_1_M_ARREADY;
wire   [1:0]  AXI_1_MASTER_ARSIZE;
wire          AXI_1_MASTER_ARVALID;
wire   [31:0] AXI_1_MASTER_AWADDR;
wire   [1:0]  AXI_1_MASTER_AWBURST;
wire   [3:0]  AXI_1_MASTER_AWID;
wire   [7:0]  AXI_1_MASTER_AWLEN;
wire          PCIESS_AXI_1_M_AWREADY;
wire   [1:0]  AXI_1_MASTER_AWSIZE;
wire          AXI_1_MASTER_AWVALID;
wire   [3:0]  PCIESS_AXI_1_M_BID;
wire          AXI_1_MASTER_BREADY;
wire   [1:0]  PCIESS_AXI_1_M_BRESP;
wire          PCIESS_AXI_1_M_BVALID;
wire   [63:0] PCIESS_AXI_1_M_RDATA;
wire   [3:0]  PCIESS_AXI_1_M_RID;
wire          PCIESS_AXI_1_M_RLAST;
wire          AXI_1_MASTER_RREADY;
wire   [1:0]  PCIESS_AXI_1_M_RRESP;
wire          PCIESS_AXI_1_M_RVALID;
wire   [63:0] AXI_1_MASTER_WDATA;
wire          AXI_1_MASTER_WLAST;
wire          PCIESS_AXI_1_M_WREADY;
wire   [7:0]  AXI_1_MASTER_WSTRB;
wire          AXI_1_MASTER_WVALID;
wire          AXI_CLK;
wire          AXI_CLK_STABLE;
wire          BANK0_1_7_CALIB_DONE_net_0;
wire          DEVICE_INIT_DONE_net_0;
wire          PCIE_1_INTERRUPT_OUT_net_0;
wire          PCIE_1_PERST_N;
wire   [25:0] APB_S_PADDR;
wire          APB_S_PENABLE;
wire   [31:0] PCIE_APB_SLAVE_PRDATA;
wire          PCIE_APB_SLAVE_PREADY;
wire          APB_S_PSEL;
wire          PCIE_APB_SLAVE_PSLVERR;
wire   [31:0] APB_S_PWDATA;
wire          APB_S_PWRITE;
wire          PCIe_REF_CLK_0_REF_CLK;
wire          PCIe_TL_CLK_0_TL_CLK;
wire          PCIe_TX_PLL_0_CLK_125;
wire          PCIe_TX_PLL_0_CLKS_TO_XCVR_BIT_CLK;
wire          PCIe_TX_PLL_0_CLKS_TO_XCVR_LOCK;
wire          PCIe_TX_PLL_0_CLKS_TO_XCVR_REF_CLK_TO_LANE;
wire          PCIESS_LANE_RXD0_N;
wire          PCIESS_LANE_RXD0_P;
wire          PCIESS_LANE_RXD1_N;
wire          PCIESS_LANE_RXD1_P;
wire          PCIESS_LANE_RXD2_N;
wire          PCIESS_LANE_RXD2_P;
wire          PCIESS_LANE_RXD3_N;
wire          PCIESS_LANE_RXD3_P;
wire          PCIESS_LANE_TXD0_N_net_0;
wire          PCIESS_LANE_TXD0_P_net_0;
wire          PCIESS_LANE_TXD1_N_net_0;
wire          PCIESS_LANE_TXD1_P_net_0;
wire          PCIESS_LANE_TXD2_N_net_0;
wire          PCIESS_LANE_TXD2_P_net_0;
wire          PCIESS_LANE_TXD3_N_net_0;
wire          PCIESS_LANE_TXD3_P_net_0;
wire          REF_CLK_PAD_N;
wire          REF_CLK_PAD_P;
wire          RESET_N;
wire   [3:0]  sw_debounce_0_interrupt_o;
wire   [3:0]  switch_i;
wire          PCIESS_LANE_TXD0_P_net_1;
wire          PCIESS_LANE_TXD0_N_net_1;
wire          PCIESS_LANE_TXD1_P_net_1;
wire          PCIESS_LANE_TXD1_N_net_1;
wire          PCIESS_LANE_TXD2_P_net_1;
wire          PCIESS_LANE_TXD2_N_net_1;
wire          PCIESS_LANE_TXD3_P_net_1;
wire          PCIESS_LANE_TXD3_N_net_1;
wire          DEVICE_INIT_DONE_net_1;
wire          PCIE_1_INTERRUPT_OUT_net_1;
wire          BANK0_1_7_CALIB_DONE_net_1;
wire          AXI_1_MASTER_ARVALID_net_0;
wire          AXI_1_MASTER_AWVALID_net_0;
wire          AXI_1_MASTER_BREADY_net_0;
wire          AXI_1_MASTER_RREADY_net_0;
wire          AXI_1_MASTER_WLAST_net_0;
wire          AXI_1_MASTER_WVALID_net_0;
wire          PCIE_APB_SLAVE_PREADY_net_0;
wire          PCIE_APB_SLAVE_PSLVERR_net_0;
wire   [1:0]  AXI_1_MASTER_ARBURST_net_0;
wire   [7:0]  AXI_1_MASTER_ARLEN_net_0;
wire   [1:0]  AXI_1_MASTER_ARSIZE_net_0;
wire   [1:0]  AXI_1_MASTER_AWBURST_net_0;
wire   [7:0]  AXI_1_MASTER_AWLEN_net_0;
wire   [1:0]  AXI_1_MASTER_AWSIZE_net_0;
wire   [7:0]  AXI_1_MASTER_WSTRB_net_0;
wire   [3:0]  AXI_1_MASTER_ARID_net_0;
wire   [31:0] AXI_1_MASTER_AWADDR_net_0;
wire   [63:0] AXI_1_MASTER_WDATA_net_0;
wire   [3:0]  AXI_1_MASTER_AWID_net_0;
wire   [31:0] AXI_1_MASTER_ARADDR_net_0;
wire   [31:0] PCIE_APB_SLAVE_PRDATA_net_0;
wire   [7:0]  PCIE_1_INTERRUPT_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [7:4]  PCIE_1_INTERRUPT_const_net_0;
wire          GND_net;
wire   [7:0]  PCIE_0_INTERRUPT_const_net_0;
wire   [3:0]  PCIESS_AXI_0_M_BID_const_net_0;
wire   [1:0]  PCIESS_AXI_0_M_BRESP_const_net_0;
wire   [3:0]  PCIESS_AXI_0_M_RID_const_net_0;
wire   [1:0]  PCIESS_AXI_0_M_RRESP_const_net_0;
wire   [1:0]  PCIESS_AXI_0_S_ARBURST_const_net_0;
wire   [3:0]  PCIESS_AXI_0_S_ARID_const_net_0;
wire   [7:0]  PCIESS_AXI_0_S_ARLEN_const_net_0;
wire   [1:0]  PCIESS_AXI_0_S_ARSIZE_const_net_0;
wire   [1:0]  PCIESS_AXI_0_S_AWBURST_const_net_0;
wire   [3:0]  PCIESS_AXI_0_S_AWID_const_net_0;
wire   [7:0]  PCIESS_AXI_0_S_AWLEN_const_net_0;
wire   [1:0]  PCIESS_AXI_0_S_AWSIZE_const_net_0;
wire   [7:0]  PCIESS_AXI_0_S_WSTRB_const_net_0;
wire   [63:0] PCIESS_AXI_0_M_RDATA_const_net_0;
wire   [31:0] PCIESS_AXI_0_S_AWADDR_const_net_0;
wire   [63:0] PCIESS_AXI_0_S_WDATA_const_net_0;
wire   [31:0] PCIESS_AXI_0_S_ARADDR_const_net_0;
wire   [10:0] PCIESS_LANE0_DRI_CTRL_const_net_0;
wire   [32:0] PCIESS_LANE0_DRI_WDATA_const_net_0;
wire   [10:0] PCIESS_LANE1_DRI_CTRL_const_net_0;
wire   [32:0] PCIESS_LANE1_DRI_WDATA_const_net_0;
wire   [10:0] PCIESS_LANE2_DRI_CTRL_const_net_0;
wire   [32:0] PCIESS_LANE2_DRI_WDATA_const_net_0;
wire   [10:0] PCIESS_LANE3_DRI_CTRL_const_net_0;
wire   [32:0] PCIESS_LANE3_DRI_WDATA_const_net_0;
wire   [1:0]  PCIESS_AXI_1_S_ARBURST_const_net_0;
wire   [3:0]  PCIESS_AXI_1_S_ARID_const_net_0;
wire   [7:0]  PCIESS_AXI_1_S_ARLEN_const_net_0;
wire   [1:0]  PCIESS_AXI_1_S_ARSIZE_const_net_0;
wire   [1:0]  PCIESS_AXI_1_S_AWBURST_const_net_0;
wire   [3:0]  PCIESS_AXI_1_S_AWID_const_net_0;
wire   [7:0]  PCIESS_AXI_1_S_AWLEN_const_net_0;
wire   [1:0]  PCIESS_AXI_1_S_AWSIZE_const_net_0;
wire   [7:0]  PCIESS_AXI_1_S_WSTRB_const_net_0;
wire   [31:0] PCIESS_AXI_1_S_AWADDR_const_net_0;
wire   [63:0] PCIESS_AXI_1_S_WDATA_const_net_0;
wire   [31:0] PCIESS_AXI_1_S_ARADDR_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign PCIE_1_INTERRUPT_const_net_0       = 4'h0;
assign GND_net                            = 1'b0;
assign PCIE_0_INTERRUPT_const_net_0       = 8'h00;
assign PCIESS_AXI_0_M_BID_const_net_0     = 4'h0;
assign PCIESS_AXI_0_M_BRESP_const_net_0   = 2'h0;
assign PCIESS_AXI_0_M_RID_const_net_0     = 4'h0;
assign PCIESS_AXI_0_M_RRESP_const_net_0   = 2'h0;
assign PCIESS_AXI_0_S_ARBURST_const_net_0 = 2'h0;
assign PCIESS_AXI_0_S_ARID_const_net_0    = 4'h0;
assign PCIESS_AXI_0_S_ARLEN_const_net_0   = 8'h00;
assign PCIESS_AXI_0_S_ARSIZE_const_net_0  = 2'h0;
assign PCIESS_AXI_0_S_AWBURST_const_net_0 = 2'h0;
assign PCIESS_AXI_0_S_AWID_const_net_0    = 4'h0;
assign PCIESS_AXI_0_S_AWLEN_const_net_0   = 8'h00;
assign PCIESS_AXI_0_S_AWSIZE_const_net_0  = 2'h0;
assign PCIESS_AXI_0_S_WSTRB_const_net_0   = 8'h00;
assign PCIESS_AXI_0_M_RDATA_const_net_0   = 64'h0000000000000000;
assign PCIESS_AXI_0_S_AWADDR_const_net_0  = 32'h00000000;
assign PCIESS_AXI_0_S_WDATA_const_net_0   = 64'h0000000000000000;
assign PCIESS_AXI_0_S_ARADDR_const_net_0  = 32'h00000000;
assign PCIESS_LANE0_DRI_CTRL_const_net_0  = 11'h000;
assign PCIESS_LANE0_DRI_WDATA_const_net_0 = 33'h000000000;
assign PCIESS_LANE1_DRI_CTRL_const_net_0  = 11'h000;
assign PCIESS_LANE1_DRI_WDATA_const_net_0 = 33'h000000000;
assign PCIESS_LANE2_DRI_CTRL_const_net_0  = 11'h000;
assign PCIESS_LANE2_DRI_WDATA_const_net_0 = 33'h000000000;
assign PCIESS_LANE3_DRI_CTRL_const_net_0  = 11'h000;
assign PCIESS_LANE3_DRI_WDATA_const_net_0 = 33'h000000000;
assign PCIESS_AXI_1_S_ARBURST_const_net_0 = 2'h3;
assign PCIESS_AXI_1_S_ARID_const_net_0    = 4'h0;
assign PCIESS_AXI_1_S_ARLEN_const_net_0   = 8'h00;
assign PCIESS_AXI_1_S_ARSIZE_const_net_0  = 2'h0;
assign PCIESS_AXI_1_S_AWBURST_const_net_0 = 2'h3;
assign PCIESS_AXI_1_S_AWID_const_net_0    = 4'h0;
assign PCIESS_AXI_1_S_AWLEN_const_net_0   = 8'h00;
assign PCIESS_AXI_1_S_AWSIZE_const_net_0  = 2'h0;
assign PCIESS_AXI_1_S_WSTRB_const_net_0   = 8'hFF;
assign PCIESS_AXI_1_S_AWADDR_const_net_0  = 32'h00000000;
assign PCIESS_AXI_1_S_WDATA_const_net_0   = 64'h0000000000000000;
assign PCIESS_AXI_1_S_ARADDR_const_net_0  = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PCIESS_LANE_TXD0_P_net_1     = PCIESS_LANE_TXD0_P_net_0;
assign PCIESS_LANE_TXD0_P           = PCIESS_LANE_TXD0_P_net_1;
assign PCIESS_LANE_TXD0_N_net_1     = PCIESS_LANE_TXD0_N_net_0;
assign PCIESS_LANE_TXD0_N           = PCIESS_LANE_TXD0_N_net_1;
assign PCIESS_LANE_TXD1_P_net_1     = PCIESS_LANE_TXD1_P_net_0;
assign PCIESS_LANE_TXD1_P           = PCIESS_LANE_TXD1_P_net_1;
assign PCIESS_LANE_TXD1_N_net_1     = PCIESS_LANE_TXD1_N_net_0;
assign PCIESS_LANE_TXD1_N           = PCIESS_LANE_TXD1_N_net_1;
assign PCIESS_LANE_TXD2_P_net_1     = PCIESS_LANE_TXD2_P_net_0;
assign PCIESS_LANE_TXD2_P           = PCIESS_LANE_TXD2_P_net_1;
assign PCIESS_LANE_TXD2_N_net_1     = PCIESS_LANE_TXD2_N_net_0;
assign PCIESS_LANE_TXD2_N           = PCIESS_LANE_TXD2_N_net_1;
assign PCIESS_LANE_TXD3_P_net_1     = PCIESS_LANE_TXD3_P_net_0;
assign PCIESS_LANE_TXD3_P           = PCIESS_LANE_TXD3_P_net_1;
assign PCIESS_LANE_TXD3_N_net_1     = PCIESS_LANE_TXD3_N_net_0;
assign PCIESS_LANE_TXD3_N           = PCIESS_LANE_TXD3_N_net_1;
assign DEVICE_INIT_DONE_net_1       = DEVICE_INIT_DONE_net_0;
assign DEVICE_INIT_DONE             = DEVICE_INIT_DONE_net_1;
assign PCIE_1_INTERRUPT_OUT_net_1   = PCIE_1_INTERRUPT_OUT_net_0;
assign PCIE_1_INTERRUPT_OUT         = PCIE_1_INTERRUPT_OUT_net_1;
assign BANK0_1_7_CALIB_DONE_net_1   = BANK0_1_7_CALIB_DONE_net_0;
assign BANK0_1_7_CALIB_DONE         = BANK0_1_7_CALIB_DONE_net_1;
assign AXI_1_MASTER_ARVALID_net_0   = AXI_1_MASTER_ARVALID;
assign PCIESS_AXI_1_M_ARVALID       = AXI_1_MASTER_ARVALID_net_0;
assign AXI_1_MASTER_AWVALID_net_0   = AXI_1_MASTER_AWVALID;
assign PCIESS_AXI_1_M_AWVALID       = AXI_1_MASTER_AWVALID_net_0;
assign AXI_1_MASTER_BREADY_net_0    = AXI_1_MASTER_BREADY;
assign PCIESS_AXI_1_M_BREADY        = AXI_1_MASTER_BREADY_net_0;
assign AXI_1_MASTER_RREADY_net_0    = AXI_1_MASTER_RREADY;
assign PCIESS_AXI_1_M_RREADY        = AXI_1_MASTER_RREADY_net_0;
assign AXI_1_MASTER_WLAST_net_0     = AXI_1_MASTER_WLAST;
assign PCIESS_AXI_1_M_WLAST         = AXI_1_MASTER_WLAST_net_0;
assign AXI_1_MASTER_WVALID_net_0    = AXI_1_MASTER_WVALID;
assign PCIESS_AXI_1_M_WVALID        = AXI_1_MASTER_WVALID_net_0;
assign PCIE_APB_SLAVE_PREADY_net_0  = PCIE_APB_SLAVE_PREADY;
assign APB_S_PREADY                 = PCIE_APB_SLAVE_PREADY_net_0;
assign PCIE_APB_SLAVE_PSLVERR_net_0 = PCIE_APB_SLAVE_PSLVERR;
assign APB_S_PSLVERR                = PCIE_APB_SLAVE_PSLVERR_net_0;
assign AXI_1_MASTER_ARBURST_net_0   = AXI_1_MASTER_ARBURST;
assign PCIESS_AXI_1_M_ARBURST[1:0]  = AXI_1_MASTER_ARBURST_net_0;
assign AXI_1_MASTER_ARLEN_net_0     = AXI_1_MASTER_ARLEN;
assign PCIESS_AXI_1_M_ARLEN[7:0]    = AXI_1_MASTER_ARLEN_net_0;
assign AXI_1_MASTER_ARSIZE_net_0    = AXI_1_MASTER_ARSIZE;
assign PCIESS_AXI_1_M_ARSIZE[1:0]   = AXI_1_MASTER_ARSIZE_net_0;
assign AXI_1_MASTER_AWBURST_net_0   = AXI_1_MASTER_AWBURST;
assign PCIESS_AXI_1_M_AWBURST[1:0]  = AXI_1_MASTER_AWBURST_net_0;
assign AXI_1_MASTER_AWLEN_net_0     = AXI_1_MASTER_AWLEN;
assign PCIESS_AXI_1_M_AWLEN[7:0]    = AXI_1_MASTER_AWLEN_net_0;
assign AXI_1_MASTER_AWSIZE_net_0    = AXI_1_MASTER_AWSIZE;
assign PCIESS_AXI_1_M_AWSIZE[1:0]   = AXI_1_MASTER_AWSIZE_net_0;
assign AXI_1_MASTER_WSTRB_net_0     = AXI_1_MASTER_WSTRB;
assign PCIESS_AXI_1_M_WSTRB[7:0]    = AXI_1_MASTER_WSTRB_net_0;
assign AXI_1_MASTER_ARID_net_0      = AXI_1_MASTER_ARID;
assign PCIESS_AXI_1_M_ARID[3:0]     = AXI_1_MASTER_ARID_net_0;
assign AXI_1_MASTER_AWADDR_net_0    = AXI_1_MASTER_AWADDR;
assign PCIESS_AXI_1_M_AWADDR[31:0]  = AXI_1_MASTER_AWADDR_net_0;
assign AXI_1_MASTER_WDATA_net_0     = AXI_1_MASTER_WDATA;
assign PCIESS_AXI_1_M_WDATA[63:0]   = AXI_1_MASTER_WDATA_net_0;
assign AXI_1_MASTER_AWID_net_0      = AXI_1_MASTER_AWID;
assign PCIESS_AXI_1_M_AWID[3:0]     = AXI_1_MASTER_AWID_net_0;
assign AXI_1_MASTER_ARADDR_net_0    = AXI_1_MASTER_ARADDR;
assign PCIESS_AXI_1_M_ARADDR[31:0]  = AXI_1_MASTER_ARADDR_net_0;
assign PCIE_APB_SLAVE_PRDATA_net_0  = PCIE_APB_SLAVE_PRDATA;
assign APB_S_PRDATA[31:0]           = PCIE_APB_SLAVE_PRDATA_net_0;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign PCIE_1_INTERRUPT_net_0 = { 4'h0 , sw_debounce_0_interrupt_o };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PCIe_EP_PCIe_REF_CLK_0_PF_XCVR_REF_CLK   -   Actel:SgCore:PF_XCVR_REF_CLK:1.0.103
PCIe_EP_PCIe_REF_CLK_0_PF_XCVR_REF_CLK PCIe_REF_CLK_0(
        // Inputs
        .REF_CLK_PAD_P ( REF_CLK_PAD_P ),
        .REF_CLK_PAD_N ( REF_CLK_PAD_N ),
        // Outputs
        .REF_CLK       ( PCIe_REF_CLK_0_REF_CLK ) 
        );

//--------PCIe_TL_CLK
PCIe_TL_CLK PCIe_TL_CLK_0(
        // Inputs
        .CLK_125MHz           ( PCIe_TX_PLL_0_CLK_125 ),
        // Outputs
        .DEVICE_INIT_DONE     ( DEVICE_INIT_DONE_net_0 ),
        .BANK0_1_7_CALIB_DONE ( BANK0_1_7_CALIB_DONE_net_0 ),
        .TL_CLK               ( PCIe_TL_CLK_0_TL_CLK ) 
        );

//--------PCIe_TX_PLL
PCIe_TX_PLL PCIe_TX_PLL_0(
        // Inputs
        .REF_CLK         ( PCIe_REF_CLK_0_REF_CLK ),
        // Outputs
        .PLL_LOCK        (  ),
        .LOCK            ( PCIe_TX_PLL_0_CLKS_TO_XCVR_LOCK ),
        .BIT_CLK         ( PCIe_TX_PLL_0_CLKS_TO_XCVR_BIT_CLK ),
        .REF_CLK_TO_LANE ( PCIe_TX_PLL_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .CLK_125         ( PCIe_TX_PLL_0_CLK_125 ) 
        );

//--------PCIe_EP_PCIex4_0_PF_PCIE   -   Actel:SgCore:PF_PCIE:2.0.116
PCIe_EP_PCIex4_0_PF_PCIE PCIex4_0(
        // Inputs
        .PCIESS_LANE0_CDR_REF_CLK_0 ( PCIe_REF_CLK_0_REF_CLK ),
        .PCIESS_LANE1_CDR_REF_CLK_0 ( PCIe_REF_CLK_0_REF_CLK ),
        .PCIESS_LANE2_CDR_REF_CLK_0 ( PCIe_REF_CLK_0_REF_CLK ),
        .PCIESS_LANE3_CDR_REF_CLK_0 ( PCIe_REF_CLK_0_REF_CLK ),
        .AXI_CLK                    ( AXI_CLK ),
        .AXI_CLK_STABLE             ( AXI_CLK_STABLE ),
        .PCIE_1_TL_CLK_125MHz       ( PCIe_TL_CLK_0_TL_CLK ),
        .PCIE_1_PERST_N             ( PCIE_1_PERST_N ),
        .PCIE_1_INTERRUPT           ( PCIE_1_INTERRUPT_net_0 ),
        .PCIE_1_M_RDERR             ( GND_net ),
        .PCIE_1_S_WDERR             ( GND_net ),
        .APB_S_PRESET_N             ( RESET_N ),
        .APB_S_PCLK                 ( APB_S_PCLK ),
        .PCIESS_AXI_1_M_ARREADY     ( PCIESS_AXI_1_M_ARREADY ),
        .PCIESS_AXI_1_M_AWREADY     ( PCIESS_AXI_1_M_AWREADY ),
        .PCIESS_AXI_1_M_BID         ( PCIESS_AXI_1_M_BID ),
        .PCIESS_AXI_1_M_BRESP       ( PCIESS_AXI_1_M_BRESP ),
        .PCIESS_AXI_1_M_BVALID      ( PCIESS_AXI_1_M_BVALID ),
        .PCIESS_AXI_1_M_RID         ( PCIESS_AXI_1_M_RID ),
        .PCIESS_AXI_1_M_RLAST       ( PCIESS_AXI_1_M_RLAST ),
        .PCIESS_AXI_1_M_RRESP       ( PCIESS_AXI_1_M_RRESP ),
        .PCIESS_AXI_1_M_RVALID      ( PCIESS_AXI_1_M_RVALID ),
        .PCIESS_AXI_1_M_WREADY      ( PCIESS_AXI_1_M_WREADY ),
        .PCIESS_AXI_1_S_ARBURST     ( PCIESS_AXI_1_S_ARBURST_const_net_0 ), // tied to 2'h3 from definition
        .PCIESS_AXI_1_S_ARID        ( PCIESS_AXI_1_S_ARID_const_net_0 ), // tied to 4'h0 from definition
        .PCIESS_AXI_1_S_ARLEN       ( PCIESS_AXI_1_S_ARLEN_const_net_0 ), // tied to 8'h00 from definition
        .PCIESS_AXI_1_S_ARSIZE      ( PCIESS_AXI_1_S_ARSIZE_const_net_0 ), // tied to 2'h0 from definition
        .PCIESS_AXI_1_S_ARVALID     ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_S_AWBURST     ( PCIESS_AXI_1_S_AWBURST_const_net_0 ), // tied to 2'h3 from definition
        .PCIESS_AXI_1_S_AWID        ( PCIESS_AXI_1_S_AWID_const_net_0 ), // tied to 4'h0 from definition
        .PCIESS_AXI_1_S_AWLEN       ( PCIESS_AXI_1_S_AWLEN_const_net_0 ), // tied to 8'h00 from definition
        .PCIESS_AXI_1_S_AWSIZE      ( PCIESS_AXI_1_S_AWSIZE_const_net_0 ), // tied to 2'h0 from definition
        .PCIESS_AXI_1_S_AWVALID     ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_S_BREADY      ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_S_RREADY      ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_S_WLAST       ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_S_WSTRB       ( PCIESS_AXI_1_S_WSTRB_const_net_0 ), // tied to 8'hFF from definition
        .PCIESS_AXI_1_S_WVALID      ( GND_net ), // tied to 1'b0 from definition
        .PCIESS_AXI_1_M_RDATA       ( PCIESS_AXI_1_M_RDATA ),
        .PCIESS_AXI_1_S_AWADDR      ( PCIESS_AXI_1_S_AWADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .PCIESS_AXI_1_S_WDATA       ( PCIESS_AXI_1_S_WDATA_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .PCIESS_AXI_1_S_ARADDR      ( PCIESS_AXI_1_S_ARADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .APB_S_PADDR                ( APB_S_PADDR ),
        .APB_S_PENABLE              ( APB_S_PENABLE ),
        .APB_S_PSEL                 ( APB_S_PSEL ),
        .APB_S_PWDATA               ( APB_S_PWDATA ),
        .APB_S_PWRITE               ( APB_S_PWRITE ),
        .PCIE_1_TX_PLL_LOCK         ( PCIe_TX_PLL_0_CLKS_TO_XCVR_LOCK ),
        .PCIE_1_TX_BIT_CLK          ( PCIe_TX_PLL_0_CLKS_TO_XCVR_BIT_CLK ),
        .PCIE_1_TX_PLL_REF_CLK      ( PCIe_TX_PLL_0_CLKS_TO_XCVR_REF_CLK_TO_LANE ),
        .PCIESS_LANE_RXD0_P         ( PCIESS_LANE_RXD0_P ),
        .PCIESS_LANE_RXD0_N         ( PCIESS_LANE_RXD0_N ),
        .PCIESS_LANE_RXD1_P         ( PCIESS_LANE_RXD1_P ),
        .PCIESS_LANE_RXD1_N         ( PCIESS_LANE_RXD1_N ),
        .PCIESS_LANE_RXD2_P         ( PCIESS_LANE_RXD2_P ),
        .PCIESS_LANE_RXD2_N         ( PCIESS_LANE_RXD2_N ),
        .PCIESS_LANE_RXD3_P         ( PCIESS_LANE_RXD3_P ),
        .PCIESS_LANE_RXD3_N         ( PCIESS_LANE_RXD3_N ),
        // Outputs
        .PCIE_1_LTSSM               (  ),
        .PCIE_1_INTERRUPT_OUT       ( PCIE_1_INTERRUPT_OUT_net_0 ),
        .PCIE_1_M_WDERR             (  ),
        .PCIE_1_S_RDERR             (  ),
        .PCIE_1_HOT_RST_EXIT        (  ),
        .PCIE_1_DLUP_EXIT           (  ),
        .PCIESS_AXI_1_M_ARBURST     ( AXI_1_MASTER_ARBURST ),
        .PCIESS_AXI_1_M_ARLEN       ( AXI_1_MASTER_ARLEN ),
        .PCIESS_AXI_1_M_ARSIZE      ( AXI_1_MASTER_ARSIZE ),
        .PCIESS_AXI_1_M_ARVALID     ( AXI_1_MASTER_ARVALID ),
        .PCIESS_AXI_1_M_AWBURST     ( AXI_1_MASTER_AWBURST ),
        .PCIESS_AXI_1_M_AWLEN       ( AXI_1_MASTER_AWLEN ),
        .PCIESS_AXI_1_M_AWSIZE      ( AXI_1_MASTER_AWSIZE ),
        .PCIESS_AXI_1_M_AWVALID     ( AXI_1_MASTER_AWVALID ),
        .PCIESS_AXI_1_M_BREADY      ( AXI_1_MASTER_BREADY ),
        .PCIESS_AXI_1_M_RREADY      ( AXI_1_MASTER_RREADY ),
        .PCIESS_AXI_1_M_WLAST       ( AXI_1_MASTER_WLAST ),
        .PCIESS_AXI_1_M_WSTRB       ( AXI_1_MASTER_WSTRB ),
        .PCIESS_AXI_1_M_WVALID      ( AXI_1_MASTER_WVALID ),
        .PCIESS_AXI_1_S_ARREADY     (  ),
        .PCIESS_AXI_1_S_AWREADY     (  ),
        .PCIESS_AXI_1_S_BID         (  ),
        .PCIESS_AXI_1_S_BRESP       (  ),
        .PCIESS_AXI_1_S_BVALID      (  ),
        .PCIESS_AXI_1_S_RID         (  ),
        .PCIESS_AXI_1_S_RLAST       (  ),
        .PCIESS_AXI_1_S_RRESP       (  ),
        .PCIESS_AXI_1_S_RVALID      (  ),
        .PCIESS_AXI_1_S_WREADY      (  ),
        .PCIESS_AXI_1_M_ARID        ( AXI_1_MASTER_ARID ),
        .PCIESS_AXI_1_M_AWADDR      ( AXI_1_MASTER_AWADDR ),
        .PCIESS_AXI_1_M_WDATA       ( AXI_1_MASTER_WDATA ),
        .PCIESS_AXI_1_M_AWID        ( AXI_1_MASTER_AWID ),
        .PCIESS_AXI_1_M_ARADDR      ( AXI_1_MASTER_ARADDR ),
        .PCIESS_AXI_1_S_RDATA       (  ),
        .APB_S_PRDATA               ( PCIE_APB_SLAVE_PRDATA ),
        .APB_S_PREADY               ( PCIE_APB_SLAVE_PREADY ),
        .APB_S_PSLVERR              ( PCIE_APB_SLAVE_PSLVERR ),
        .PCIESS_LANE_TXD0_P         ( PCIESS_LANE_TXD0_P_net_0 ),
        .PCIESS_LANE_TXD0_N         ( PCIESS_LANE_TXD0_N_net_0 ),
        .PCIESS_LANE_TXD1_P         ( PCIESS_LANE_TXD1_P_net_0 ),
        .PCIESS_LANE_TXD1_N         ( PCIESS_LANE_TXD1_N_net_0 ),
        .PCIESS_LANE_TXD2_P         ( PCIESS_LANE_TXD2_P_net_0 ),
        .PCIESS_LANE_TXD2_N         ( PCIESS_LANE_TXD2_N_net_0 ),
        .PCIESS_LANE_TXD3_P         ( PCIESS_LANE_TXD3_P_net_0 ),
        .PCIESS_LANE_TXD3_N         ( PCIESS_LANE_TXD3_N_net_0 ) 
        );

//--------sw_debounce
sw_debounce sw_debounce_0(
        // Inputs
        .clk_i       ( AXI_CLK ),
        .resetn_i    ( RESET_N ),
        .switch_i    ( switch_i ),
        // Outputs
        .interrupt_o ( sw_debounce_0_interrupt_o ) 
        );


endmodule
