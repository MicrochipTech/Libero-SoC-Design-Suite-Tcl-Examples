//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:02:20 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// CoreDMA_IO_CTRL
module CoreDMA_IO_CTRL(
    // Inputs
    CLOCK,
    DMA_ARREADY,
    DMA_AWREADY,
    DMA_BID,
    DMA_BRESP,
    DMA_BVALID,
    DMA_RDATA,
    DMA_RID,
    DMA_RLAST,
    DMA_RRESP,
    DMA_RVALID,
    DMA_WREADY,
    RESETN,
    RX,
    araddr_i,
    arid_i,
    arready_i,
    arvalid_i,
    awaddr_i,
    awid_i,
    awready_i,
    awvalid_i,
    bid_i,
    bready_i,
    bresp_i,
    bvalid_i,
    dip_switch_o,
    dma_wready_i,
    dma_wvalid_i,
    pcie_int_i,
    rdata_i,
    rid_i,
    rlast_i,
    rready_i,
    rresp_i,
    rvalid_i,
    wdata_i,
    wlast_i,
    wready_i,
    wvalid_i,
    // Outputs
    DMA_ARADDR,
    DMA_ARBURST,
    DMA_ARID,
    DMA_ARLEN,
    DMA_ARSIZE,
    DMA_ARVALID,
    DMA_AWADDR,
    DMA_AWBURST,
    DMA_AWID,
    DMA_AWLEN,
    DMA_AWSIZE,
    DMA_AWVALID,
    DMA_BREADY,
    DMA_RREADY,
    DMA_WDATA,
    DMA_WLAST,
    DMA_WSTRB,
    DMA_WVALID,
    TX,
    araddr_o,
    arburst_o,
    arid_o,
    arlen_o,
    arready_o,
    arsize_o,
    arvalid_o,
    awaddr_o,
    awburst_o,
    awid_o,
    awlen_o,
    awready_o,
    awsize_o,
    awvalid_o,
    bid_o,
    bready_o,
    bresp_o,
    bvalid_o,
    led_o,
    rdata_o,
    rid_o,
    rlast_o,
    rready_o,
    rresp_o,
    rvalid_o,
    wdata_o,
    wlast_o,
    wready_o,
    wstrb_o,
    wvalid_o
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLOCK;
input         DMA_ARREADY;
input         DMA_AWREADY;
input  [3:0]  DMA_BID;
input  [1:0]  DMA_BRESP;
input         DMA_BVALID;
input  [63:0] DMA_RDATA;
input  [3:0]  DMA_RID;
input         DMA_RLAST;
input  [1:0]  DMA_RRESP;
input         DMA_RVALID;
input         DMA_WREADY;
input         RESETN;
input         RX;
input  [10:3] araddr_i;
input  [5:0]  arid_i;
input         arready_i;
input         arvalid_i;
input  [10:3] awaddr_i;
input  [5:0]  awid_i;
input         awready_i;
input         awvalid_i;
input  [3:0]  bid_i;
input         bready_i;
input  [1:0]  bresp_i;
input         bvalid_i;
input  [3:0]  dip_switch_o;
input         dma_wready_i;
input         dma_wvalid_i;
input         pcie_int_i;
input  [63:0] rdata_i;
input  [3:0]  rid_i;
input         rlast_i;
input         rready_i;
input  [1:0]  rresp_i;
input         rvalid_i;
input  [31:0] wdata_i;
input         wlast_i;
input         wready_i;
input         wvalid_i;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] DMA_ARADDR;
output [1:0]  DMA_ARBURST;
output [3:0]  DMA_ARID;
output [7:0]  DMA_ARLEN;
output [2:0]  DMA_ARSIZE;
output        DMA_ARVALID;
output [31:0] DMA_AWADDR;
output [1:0]  DMA_AWBURST;
output [3:0]  DMA_AWID;
output [7:0]  DMA_AWLEN;
output [2:0]  DMA_AWSIZE;
output        DMA_AWVALID;
output        DMA_BREADY;
output        DMA_RREADY;
output [63:0] DMA_WDATA;
output        DMA_WLAST;
output [7:0]  DMA_WSTRB;
output        DMA_WVALID;
output        TX;
output [31:0] araddr_o;
output [1:0]  arburst_o;
output [3:0]  arid_o;
output [7:0]  arlen_o;
output        arready_o;
output [1:0]  arsize_o;
output        arvalid_o;
output [31:0] awaddr_o;
output [1:0]  awburst_o;
output [3:0]  awid_o;
output [7:0]  awlen_o;
output        awready_o;
output [1:0]  awsize_o;
output        awvalid_o;
output [5:0]  bid_o;
output        bready_o;
output [1:0]  bresp_o;
output        bvalid_o;
output [7:0]  led_o;
output [63:0] rdata_o;
output [5:0]  rid_o;
output        rlast_o;
output        rready_o;
output [1:0]  rresp_o;
output        rvalid_o;
output [63:0] wdata_o;
output        wlast_o;
output        wready_o;
output [7:0]  wstrb_o;
output        wvalid_o;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [31:0] AXI4_M_ARADDR;
wire   [1:0]  AXI4_M_ARBURST;
wire   [3:0]  AXI4_M_ARID;
wire   [7:0]  AXI4_M_ARLEN;
wire          arready_i;
wire   [1:0]  AXI4_M_ARSIZE;
wire          AXI4_M_ARVALID;
wire   [31:0] AXI4_M_AWADDR;
wire   [1:0]  AXI4_M_AWBURST;
wire   [3:0]  AXI4_M_AWID;
wire   [7:0]  AXI4_M_AWLEN;
wire          awready_i;
wire   [1:0]  AXI4_M_AWSIZE;
wire          AXI4_M_AWVALID;
wire   [3:0]  bid_i;
wire          AXI4_M_BREADY;
wire   [1:0]  bresp_i;
wire          bvalid_i;
wire   [63:0] rdata_i;
wire   [3:0]  rid_i;
wire          rlast_i;
wire          AXI4_M_RREADY;
wire   [1:0]  rresp_i;
wire          rvalid_i;
wire   [63:0] AXI4_M_WDATA;
wire          AXI4_M_WLAST;
wire          wready_i;
wire   [7:0]  AXI4_M_WSTRB;
wire          AXI4_M_WVALID;
wire   [10:3] araddr_i;
wire   [5:0]  arid_i;
wire          AXI4_S_ARREADY;
wire          arvalid_i;
wire   [10:3] awaddr_i;
wire   [5:0]  awid_i;
wire          AXI4_S_AWREADY;
wire          awvalid_i;
wire   [5:0]  AXI4_S_BID;
wire          bready_i;
wire   [1:0]  AXI4_S_BRESP;
wire          AXI4_S_BVALID;
wire   [63:0] AXI4_S_RDATA;
wire   [5:0]  AXI4_S_RID;
wire          AXI4_S_RLAST;
wire          rready_i;
wire   [1:0]  AXI4_S_RRESP;
wire          AXI4_S_RVALID;
wire   [31:0] wdata_i;
wire          wlast_i;
wire          AXI4_S_WREADY;
wire          wvalid_i;
wire   [15:0] axi4dma_init_0_AXI4_M_ARADDR;
wire          axi4dma_init_0_AXI4_M_ARREADY;
wire          axi4dma_init_0_AXI4_M_ARVALID;
wire   [15:0] axi4dma_init_0_AXI4_M_AWADDR;
wire          axi4dma_init_0_AXI4_M_AWREADY;
wire          axi4dma_init_0_AXI4_M_AWVALID;
wire   [2:0]  axi4dma_init_0_AXI4_M_BID;
wire          axi4dma_init_0_AXI4_M_BREADY;
wire   [1:0]  axi4dma_init_0_AXI4_M_BRESP;
wire   [0:0]  axi4dma_init_0_AXI4_M_BUSER;
wire          axi4dma_init_0_AXI4_M_BVALID;
wire   [2:0]  axi4dma_init_0_AXI4_M_RID;
wire          axi4dma_init_0_AXI4_M_RLAST;
wire          axi4dma_init_0_AXI4_M_RREADY;
wire   [1:0]  axi4dma_init_0_AXI4_M_RRESP;
wire   [0:0]  axi4dma_init_0_AXI4_M_RUSER;
wire          axi4dma_init_0_AXI4_M_RVALID;
wire   [31:0] axi4dma_init_0_AXI4_M_WDATA;
wire          axi4dma_init_0_AXI4_M_WREADY;
wire   [3:0]  axi4dma_init_0_AXI4_M_WSTRB;
wire          axi4dma_init_0_AXI4_M_WVALID;
wire          axi4dma_init_0_coredma_ch0_start_o;
wire          axi4dma_init_0_coredma_ch1_start_o;
wire   [15:0] axi4dma_init_0_coredma_status_o;
wire   [31:0] AXI4MasterDMA_IF_ARADDR;
wire   [1:0]  AXI4MasterDMA_IF_ARBURST;
wire   [3:0]  AXI4MasterDMA_IF_ARID;
wire   [7:0]  AXI4MasterDMA_IF_ARLEN;
wire          DMA_ARREADY;
wire   [2:0]  AXI4MasterDMA_IF_ARSIZE;
wire          AXI4MasterDMA_IF_ARVALID;
wire   [31:0] AXI4MasterDMA_IF_AWADDR;
wire   [1:0]  AXI4MasterDMA_IF_AWBURST;
wire   [3:0]  AXI4MasterDMA_IF_AWID;
wire   [7:0]  AXI4MasterDMA_IF_AWLEN;
wire          DMA_AWREADY;
wire   [2:0]  AXI4MasterDMA_IF_AWSIZE;
wire          AXI4MasterDMA_IF_AWVALID;
wire   [3:0]  DMA_BID;
wire          AXI4MasterDMA_IF_BREADY;
wire   [1:0]  DMA_BRESP;
wire          DMA_BVALID;
wire   [63:0] DMA_RDATA;
wire   [3:0]  DMA_RID;
wire          DMA_RLAST;
wire          AXI4MasterDMA_IF_RREADY;
wire   [1:0]  DMA_RRESP;
wire          DMA_RVALID;
wire   [63:0] AXI4MasterDMA_IF_WDATA;
wire          AXI4MasterDMA_IF_WLAST;
wire          DMA_WREADY;
wire   [7:0]  AXI4MasterDMA_IF_WSTRB;
wire          AXI4MasterDMA_IF_WVALID;
wire   [63:0] axi_io_ctrl_0_clk_count_o;
wire   [2:0]  axi_io_ctrl_0_coredma0_start_o;
wire   [2:0]  axi_io_ctrl_0_coredma1_start_o;
wire   [24:0] axi_io_ctrl_0_coredma_size_o;
wire          CLOCK;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_ARBURST;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_ARCACHE;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_ARID;
wire   [7:0]  CoreAXI4_Lite_0_AXI4mslave0_ARLEN;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_ARLOCK;
wire   [2:0]  CoreAXI4_Lite_0_AXI4mslave0_ARPROT;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_ARQOS;
wire          CoreAXI4_Lite_0_AXI4mslave0_ARREADY;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_ARREGION;
wire   [2:0]  CoreAXI4_Lite_0_AXI4mslave0_ARSIZE;
wire   [0:0]  CoreAXI4_Lite_0_AXI4mslave0_ARUSER;
wire          CoreAXI4_Lite_0_AXI4mslave0_ARVALID;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_AWBURST;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_AWCACHE;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_AWID;
wire   [7:0]  CoreAXI4_Lite_0_AXI4mslave0_AWLEN;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_AWLOCK;
wire   [2:0]  CoreAXI4_Lite_0_AXI4mslave0_AWPROT;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_AWQOS;
wire          CoreAXI4_Lite_0_AXI4mslave0_AWREADY;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_AWREGION;
wire   [2:0]  CoreAXI4_Lite_0_AXI4mslave0_AWSIZE;
wire   [0:0]  CoreAXI4_Lite_0_AXI4mslave0_AWUSER;
wire          CoreAXI4_Lite_0_AXI4mslave0_AWVALID;
wire          CoreAXI4_Lite_0_AXI4mslave0_BREADY;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_BRESP;
wire          CoreAXI4_Lite_0_AXI4mslave0_BVALID;
wire   [31:0] CoreAXI4_Lite_0_AXI4mslave0_RDATA;
wire          CoreAXI4_Lite_0_AXI4mslave0_RREADY;
wire   [1:0]  CoreAXI4_Lite_0_AXI4mslave0_RRESP;
wire          CoreAXI4_Lite_0_AXI4mslave0_RVALID;
wire   [31:0] CoreAXI4_Lite_0_AXI4mslave0_WDATA;
wire          CoreAXI4_Lite_0_AXI4mslave0_WLAST;
wire          CoreAXI4_Lite_0_AXI4mslave0_WREADY;
wire   [3:0]  CoreAXI4_Lite_0_AXI4mslave0_WSTRB;
wire   [0:0]  CoreAXI4_Lite_0_AXI4mslave0_WUSER;
wire          CoreAXI4_Lite_0_AXI4mslave0_WVALID;
wire   [1:0]  CoreDMA_Controller_0_INTERRUPT;
wire   [3:0]  dip_switch_o;
wire          dma_wready_i;
wire          dma_wvalid_i;
wire   [7:0]  led_o_net_0;
wire          pcie_int_i;
wire          RESETN;
wire          RX;
wire          TX_net_0;
wire   [2:0]  UART_SD_0_coredma_ch0_type_o;
wire   [2:0]  UART_SD_0_coredma_ch1_type_o;
wire   [24:0] UART_SD_0_coredma_size_o;
wire          AXI4_M_AWVALID_net_0;
wire          AXI4_M_WLAST_net_0;
wire          AXI4_M_WVALID_net_0;
wire          AXI4_M_BREADY_net_0;
wire          AXI4_M_ARVALID_net_0;
wire          AXI4_M_RREADY_net_0;
wire          TX_net_1;
wire          AXI4MasterDMA_IF_AWVALID_net_0;
wire          AXI4MasterDMA_IF_WLAST_net_0;
wire          AXI4MasterDMA_IF_WVALID_net_0;
wire          AXI4MasterDMA_IF_BREADY_net_0;
wire          AXI4MasterDMA_IF_ARVALID_net_0;
wire          AXI4MasterDMA_IF_RREADY_net_0;
wire          AXI4_S_RVALID_net_0;
wire          AXI4_S_RLAST_net_0;
wire          AXI4_S_ARREADY_net_0;
wire          AXI4_S_BVALID_net_0;
wire          AXI4_S_WREADY_net_0;
wire          AXI4_S_AWREADY_net_0;
wire   [3:0]  AXI4_M_AWID_net_0;
wire   [31:0] AXI4_M_AWADDR_net_0;
wire   [7:0]  AXI4_M_AWLEN_net_0;
wire   [1:0]  AXI4_M_AWSIZE_net_0;
wire   [1:0]  AXI4_M_AWBURST_net_0;
wire   [63:0] AXI4_M_WDATA_net_0;
wire   [7:0]  AXI4_M_WSTRB_net_0;
wire   [3:0]  AXI4_M_ARID_net_0;
wire   [31:0] AXI4_M_ARADDR_net_0;
wire   [7:0]  AXI4_M_ARLEN_net_0;
wire   [1:0]  AXI4_M_ARSIZE_net_0;
wire   [1:0]  AXI4_M_ARBURST_net_0;
wire   [3:0]  AXI4MasterDMA_IF_AWID_net_0;
wire   [31:0] AXI4MasterDMA_IF_AWADDR_net_0;
wire   [7:0]  AXI4MasterDMA_IF_AWLEN_net_0;
wire   [2:0]  AXI4MasterDMA_IF_AWSIZE_net_0;
wire   [1:0]  AXI4MasterDMA_IF_AWBURST_net_0;
wire   [63:0] AXI4MasterDMA_IF_WDATA_net_0;
wire   [7:0]  AXI4MasterDMA_IF_WSTRB_net_0;
wire   [3:0]  AXI4MasterDMA_IF_ARID_net_0;
wire   [31:0] AXI4MasterDMA_IF_ARADDR_net_0;
wire   [7:0]  AXI4MasterDMA_IF_ARLEN_net_0;
wire   [2:0]  AXI4MasterDMA_IF_ARSIZE_net_0;
wire   [1:0]  AXI4MasterDMA_IF_ARBURST_net_0;
wire   [7:0]  led_o_net_1;
wire   [1:0]  AXI4_S_RRESP_net_0;
wire   [63:0] AXI4_S_RDATA_net_0;
wire   [5:0]  AXI4_S_RID_net_0;
wire   [1:0]  AXI4_S_BRESP_net_0;
wire   [5:0]  AXI4_S_BID_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [3:0]  STRTDMAOP_const_net_0;
wire   [3:0]  SLAVE0_BID_const_net_0;
wire   [3:0]  SLAVE0_RID_const_net_0;
wire          GND_net;
wire   [2:0]  MASTER0_AWID_const_net_0;
wire   [7:0]  MASTER0_AWLEN_const_net_0;
wire   [2:0]  MASTER0_AWSIZE_const_net_0;
wire   [1:0]  MASTER0_AWBURST_const_net_0;
wire   [1:0]  MASTER0_AWLOCK_const_net_0;
wire   [3:0]  MASTER0_AWCACHE_const_net_0;
wire   [2:0]  MASTER0_AWPROT_const_net_0;
wire   [3:0]  MASTER0_AWQOS_const_net_0;
wire   [3:0]  MASTER0_AWREGION_const_net_0;
wire   [2:0]  MASTER0_ARID_const_net_0;
wire   [7:0]  MASTER0_ARLEN_const_net_0;
wire   [2:0]  MASTER0_ARSIZE_const_net_0;
wire   [1:0]  MASTER0_ARBURST_const_net_0;
wire   [1:0]  MASTER0_ARLOCK_const_net_0;
wire   [3:0]  MASTER0_ARCACHE_const_net_0;
wire   [2:0]  MASTER0_ARPROT_const_net_0;
wire   [3:0]  MASTER0_ARQOS_const_net_0;
wire   [3:0]  MASTER0_ARREGION_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:0] axi4dma_init_0_AXI4_M_RDATA;
wire   [7:0]  axi4dma_init_0_AXI4_M_RDATA_0;
wire   [7:0]  axi4dma_init_0_AXI4_M_RDATA_0_7to0;
wire   [15:0] CoreAXI4_Lite_0_AXI4mslave0_ARADDR;
wire   [10:0] CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0;
wire   [10:0] CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0_10to0;
wire   [15:0] CoreAXI4_Lite_0_AXI4mslave0_AWADDR;
wire   [10:0] CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0;
wire   [10:0] CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0_10to0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign STRTDMAOP_const_net_0        = 4'h0;
assign SLAVE0_BID_const_net_0       = 4'h0;
assign SLAVE0_RID_const_net_0       = 4'h0;
assign GND_net                      = 1'b0;
assign MASTER0_AWID_const_net_0     = 3'h0;
assign MASTER0_AWLEN_const_net_0    = 8'h00;
assign MASTER0_AWSIZE_const_net_0   = 3'h0;
assign MASTER0_AWBURST_const_net_0  = 2'h3;
assign MASTER0_AWLOCK_const_net_0   = 2'h0;
assign MASTER0_AWCACHE_const_net_0  = 4'h0;
assign MASTER0_AWPROT_const_net_0   = 3'h0;
assign MASTER0_AWQOS_const_net_0    = 4'h0;
assign MASTER0_AWREGION_const_net_0 = 4'h0;
assign MASTER0_ARID_const_net_0     = 3'h0;
assign MASTER0_ARLEN_const_net_0    = 8'h00;
assign MASTER0_ARSIZE_const_net_0   = 3'h0;
assign MASTER0_ARBURST_const_net_0  = 2'h3;
assign MASTER0_ARLOCK_const_net_0   = 2'h0;
assign MASTER0_ARCACHE_const_net_0  = 4'h0;
assign MASTER0_ARPROT_const_net_0   = 3'h0;
assign MASTER0_ARQOS_const_net_0    = 4'h0;
assign MASTER0_ARREGION_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXI4_M_AWVALID_net_0           = AXI4_M_AWVALID;
assign awvalid_o                      = AXI4_M_AWVALID_net_0;
assign AXI4_M_WLAST_net_0             = AXI4_M_WLAST;
assign wlast_o                        = AXI4_M_WLAST_net_0;
assign AXI4_M_WVALID_net_0            = AXI4_M_WVALID;
assign wvalid_o                       = AXI4_M_WVALID_net_0;
assign AXI4_M_BREADY_net_0            = AXI4_M_BREADY;
assign bready_o                       = AXI4_M_BREADY_net_0;
assign AXI4_M_ARVALID_net_0           = AXI4_M_ARVALID;
assign arvalid_o                      = AXI4_M_ARVALID_net_0;
assign AXI4_M_RREADY_net_0            = AXI4_M_RREADY;
assign rready_o                       = AXI4_M_RREADY_net_0;
assign TX_net_1                       = TX_net_0;
assign TX                             = TX_net_1;
assign AXI4MasterDMA_IF_AWVALID_net_0 = AXI4MasterDMA_IF_AWVALID;
assign DMA_AWVALID                    = AXI4MasterDMA_IF_AWVALID_net_0;
assign AXI4MasterDMA_IF_WLAST_net_0   = AXI4MasterDMA_IF_WLAST;
assign DMA_WLAST                      = AXI4MasterDMA_IF_WLAST_net_0;
assign AXI4MasterDMA_IF_WVALID_net_0  = AXI4MasterDMA_IF_WVALID;
assign DMA_WVALID                     = AXI4MasterDMA_IF_WVALID_net_0;
assign AXI4MasterDMA_IF_BREADY_net_0  = AXI4MasterDMA_IF_BREADY;
assign DMA_BREADY                     = AXI4MasterDMA_IF_BREADY_net_0;
assign AXI4MasterDMA_IF_ARVALID_net_0 = AXI4MasterDMA_IF_ARVALID;
assign DMA_ARVALID                    = AXI4MasterDMA_IF_ARVALID_net_0;
assign AXI4MasterDMA_IF_RREADY_net_0  = AXI4MasterDMA_IF_RREADY;
assign DMA_RREADY                     = AXI4MasterDMA_IF_RREADY_net_0;
assign AXI4_S_RVALID_net_0            = AXI4_S_RVALID;
assign rvalid_o                       = AXI4_S_RVALID_net_0;
assign AXI4_S_RLAST_net_0             = AXI4_S_RLAST;
assign rlast_o                        = AXI4_S_RLAST_net_0;
assign AXI4_S_ARREADY_net_0           = AXI4_S_ARREADY;
assign arready_o                      = AXI4_S_ARREADY_net_0;
assign AXI4_S_BVALID_net_0            = AXI4_S_BVALID;
assign bvalid_o                       = AXI4_S_BVALID_net_0;
assign AXI4_S_WREADY_net_0            = AXI4_S_WREADY;
assign wready_o                       = AXI4_S_WREADY_net_0;
assign AXI4_S_AWREADY_net_0           = AXI4_S_AWREADY;
assign awready_o                      = AXI4_S_AWREADY_net_0;
assign AXI4_M_AWID_net_0              = AXI4_M_AWID;
assign awid_o[3:0]                    = AXI4_M_AWID_net_0;
assign AXI4_M_AWADDR_net_0            = AXI4_M_AWADDR;
assign awaddr_o[31:0]                 = AXI4_M_AWADDR_net_0;
assign AXI4_M_AWLEN_net_0             = AXI4_M_AWLEN;
assign awlen_o[7:0]                   = AXI4_M_AWLEN_net_0;
assign AXI4_M_AWSIZE_net_0            = AXI4_M_AWSIZE;
assign awsize_o[1:0]                  = AXI4_M_AWSIZE_net_0;
assign AXI4_M_AWBURST_net_0           = AXI4_M_AWBURST;
assign awburst_o[1:0]                 = AXI4_M_AWBURST_net_0;
assign AXI4_M_WDATA_net_0             = AXI4_M_WDATA;
assign wdata_o[63:0]                  = AXI4_M_WDATA_net_0;
assign AXI4_M_WSTRB_net_0             = AXI4_M_WSTRB;
assign wstrb_o[7:0]                   = AXI4_M_WSTRB_net_0;
assign AXI4_M_ARID_net_0              = AXI4_M_ARID;
assign arid_o[3:0]                    = AXI4_M_ARID_net_0;
assign AXI4_M_ARADDR_net_0            = AXI4_M_ARADDR;
assign araddr_o[31:0]                 = AXI4_M_ARADDR_net_0;
assign AXI4_M_ARLEN_net_0             = AXI4_M_ARLEN;
assign arlen_o[7:0]                   = AXI4_M_ARLEN_net_0;
assign AXI4_M_ARSIZE_net_0            = AXI4_M_ARSIZE;
assign arsize_o[1:0]                  = AXI4_M_ARSIZE_net_0;
assign AXI4_M_ARBURST_net_0           = AXI4_M_ARBURST;
assign arburst_o[1:0]                 = AXI4_M_ARBURST_net_0;
assign AXI4MasterDMA_IF_AWID_net_0    = AXI4MasterDMA_IF_AWID;
assign DMA_AWID[3:0]                  = AXI4MasterDMA_IF_AWID_net_0;
assign AXI4MasterDMA_IF_AWADDR_net_0  = AXI4MasterDMA_IF_AWADDR;
assign DMA_AWADDR[31:0]               = AXI4MasterDMA_IF_AWADDR_net_0;
assign AXI4MasterDMA_IF_AWLEN_net_0   = AXI4MasterDMA_IF_AWLEN;
assign DMA_AWLEN[7:0]                 = AXI4MasterDMA_IF_AWLEN_net_0;
assign AXI4MasterDMA_IF_AWSIZE_net_0  = AXI4MasterDMA_IF_AWSIZE;
assign DMA_AWSIZE[2:0]                = AXI4MasterDMA_IF_AWSIZE_net_0;
assign AXI4MasterDMA_IF_AWBURST_net_0 = AXI4MasterDMA_IF_AWBURST;
assign DMA_AWBURST[1:0]               = AXI4MasterDMA_IF_AWBURST_net_0;
assign AXI4MasterDMA_IF_WDATA_net_0   = AXI4MasterDMA_IF_WDATA;
assign DMA_WDATA[63:0]                = AXI4MasterDMA_IF_WDATA_net_0;
assign AXI4MasterDMA_IF_WSTRB_net_0   = AXI4MasterDMA_IF_WSTRB;
assign DMA_WSTRB[7:0]                 = AXI4MasterDMA_IF_WSTRB_net_0;
assign AXI4MasterDMA_IF_ARID_net_0    = AXI4MasterDMA_IF_ARID;
assign DMA_ARID[3:0]                  = AXI4MasterDMA_IF_ARID_net_0;
assign AXI4MasterDMA_IF_ARADDR_net_0  = AXI4MasterDMA_IF_ARADDR;
assign DMA_ARADDR[31:0]               = AXI4MasterDMA_IF_ARADDR_net_0;
assign AXI4MasterDMA_IF_ARLEN_net_0   = AXI4MasterDMA_IF_ARLEN;
assign DMA_ARLEN[7:0]                 = AXI4MasterDMA_IF_ARLEN_net_0;
assign AXI4MasterDMA_IF_ARSIZE_net_0  = AXI4MasterDMA_IF_ARSIZE;
assign DMA_ARSIZE[2:0]                = AXI4MasterDMA_IF_ARSIZE_net_0;
assign AXI4MasterDMA_IF_ARBURST_net_0 = AXI4MasterDMA_IF_ARBURST;
assign DMA_ARBURST[1:0]               = AXI4MasterDMA_IF_ARBURST_net_0;
assign led_o_net_1                    = led_o_net_0;
assign led_o[7:0]                     = led_o_net_1;
assign AXI4_S_RRESP_net_0             = AXI4_S_RRESP;
assign rresp_o[1:0]                   = AXI4_S_RRESP_net_0;
assign AXI4_S_RDATA_net_0             = AXI4_S_RDATA;
assign rdata_o[63:0]                  = AXI4_S_RDATA_net_0;
assign AXI4_S_RID_net_0               = AXI4_S_RID;
assign rid_o[5:0]                     = AXI4_S_RID_net_0;
assign AXI4_S_BRESP_net_0             = AXI4_S_BRESP;
assign bresp_o[1:0]                   = AXI4_S_BRESP_net_0;
assign AXI4_S_BID_net_0               = AXI4_S_BID;
assign bid_o[5:0]                     = AXI4_S_BID_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign axi4dma_init_0_AXI4_M_RDATA_0 = { axi4dma_init_0_AXI4_M_RDATA_0_7to0 };
assign axi4dma_init_0_AXI4_M_RDATA_0_7to0 = axi4dma_init_0_AXI4_M_RDATA[7:0];

assign CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0 = { CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0_10to0 };
assign CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0_10to0 = CoreAXI4_Lite_0_AXI4mslave0_ARADDR[10:0];

assign CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0 = { CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0_10to0 };
assign CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0_10to0 = CoreAXI4_Lite_0_AXI4mslave0_AWADDR[10:0];

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------axi4dma_init
axi4dma_init axi4dma_init_0(
        // Inputs
        .clk_i                 ( CLOCK ),
        .resetn_i              ( RESETN ),
        .coredma0_start_pcie_i ( axi_io_ctrl_0_coredma0_start_o ),
        .coredma1_start_pcie_i ( axi_io_ctrl_0_coredma1_start_o ),
        .dma_size_pcie_i       ( axi_io_ctrl_0_coredma_size_o ),
        .coredma0_start_uart_i ( UART_SD_0_coredma_ch0_type_o ),
        .coredma1_start_uart_i ( UART_SD_0_coredma_ch1_type_o ),
        .dma_size_uart_i       ( UART_SD_0_coredma_size_o ),
        .coredma_int_i         ( CoreDMA_Controller_0_INTERRUPT ),
        .awready_i             ( axi4dma_init_0_AXI4_M_AWREADY ),
        .wready_i              ( axi4dma_init_0_AXI4_M_WREADY ),
        .bvalid_i              ( axi4dma_init_0_AXI4_M_BVALID ),
        .arready_i             ( axi4dma_init_0_AXI4_M_ARREADY ),
        .rdata_i               ( axi4dma_init_0_AXI4_M_RDATA_0 ),
        .rvalid_i              ( axi4dma_init_0_AXI4_M_RVALID ),
        // Outputs
        .coredma_ch0_start_o   ( axi4dma_init_0_coredma_ch0_start_o ),
        .coredma_ch1_start_o   ( axi4dma_init_0_coredma_ch1_start_o ),
        .coredma_status_o      ( axi4dma_init_0_coredma_status_o ),
        .awaddr_o              ( axi4dma_init_0_AXI4_M_AWADDR ),
        .awvalid_o             ( axi4dma_init_0_AXI4_M_AWVALID ),
        .wstrb_o               ( axi4dma_init_0_AXI4_M_WSTRB ),
        .wvalid_o              ( axi4dma_init_0_AXI4_M_WVALID ),
        .wdata_o               ( axi4dma_init_0_AXI4_M_WDATA ),
        .bready_o              ( axi4dma_init_0_AXI4_M_BREADY ),
        .araddr_o              ( axi4dma_init_0_AXI4_M_ARADDR ),
        .arvalid_o             ( axi4dma_init_0_AXI4_M_ARVALID ),
        .rready_o              ( axi4dma_init_0_AXI4_M_RREADY ) 
        );

//--------axi_io_ctrl
axi_io_ctrl axi_io_ctrl_0(
        // Inputs
        .clk_i               ( CLOCK ),
        .resetn_i            ( RESETN ),
        .awid_i              ( awid_i ),
        .awaddr_i            ( awaddr_i ),
        .awvalid_i           ( awvalid_i ),
        .wdata_i             ( wdata_i ),
        .wlast_i             ( wlast_i ),
        .wvalid_i            ( wvalid_i ),
        .bready_i            ( bready_i ),
        .arid_i              ( arid_i ),
        .araddr_i            ( araddr_i ),
        .arvalid_i           ( arvalid_i ),
        .rready_i            ( rready_i ),
        .coredma_int_i       ( CoreDMA_Controller_0_INTERRUPT ),
        .pcie_int_i          ( pcie_int_i ),
        .coredma_ch0_start_i ( axi4dma_init_0_coredma_ch0_start_o ),
        .coredma_ch1_start_i ( axi4dma_init_0_coredma_ch1_start_o ),
        .dma_wvalid_i        ( dma_wvalid_i ),
        .dma_wready_i        ( dma_wready_i ),
        .coredma_status_i    ( axi4dma_init_0_coredma_status_o ),
        .dip_switch_o        ( dip_switch_o ),
        // Outputs
        .awready_o           ( AXI4_S_AWREADY ),
        .wready_o            ( AXI4_S_WREADY ),
        .bid_o               ( AXI4_S_BID ),
        .bresp_o             ( AXI4_S_BRESP ),
        .bvalid_o            ( AXI4_S_BVALID ),
        .arready_o           ( AXI4_S_ARREADY ),
        .rid_o               ( AXI4_S_RID ),
        .rdata_o             ( AXI4_S_RDATA ),
        .rresp_o             ( AXI4_S_RRESP ),
        .rlast_o             ( AXI4_S_RLAST ),
        .rvalid_o            ( AXI4_S_RVALID ),
        .coredma_size_o      ( axi_io_ctrl_0_coredma_size_o ),
        .coredma0_start_o    ( axi_io_ctrl_0_coredma0_start_o ),
        .coredma1_start_o    ( axi_io_ctrl_0_coredma1_start_o ),
        .clk_count_o         ( axi_io_ctrl_0_clk_count_o ),
        .led_o               ( led_o_net_0 ) 
        );

//--------CoreAXI4_Lite
CoreAXI4_Lite CoreAXI4_Lite_0(
        // Inputs
        .ACLK             ( CLOCK ),
        .ARESETN          ( RESETN ),
        .SLAVE0_AWREADY   ( CoreAXI4_Lite_0_AXI4mslave0_AWREADY ),
        .SLAVE0_WREADY    ( CoreAXI4_Lite_0_AXI4mslave0_WREADY ),
        .SLAVE0_BID       ( SLAVE0_BID_const_net_0 ), // tied to 4'h0 from definition
        .SLAVE0_BRESP     ( CoreAXI4_Lite_0_AXI4mslave0_BRESP ),
        .SLAVE0_BVALID    ( CoreAXI4_Lite_0_AXI4mslave0_BVALID ),
        .SLAVE0_ARREADY   ( CoreAXI4_Lite_0_AXI4mslave0_ARREADY ),
        .SLAVE0_RID       ( SLAVE0_RID_const_net_0 ), // tied to 4'h0 from definition
        .SLAVE0_RDATA     ( CoreAXI4_Lite_0_AXI4mslave0_RDATA ),
        .SLAVE0_RRESP     ( CoreAXI4_Lite_0_AXI4mslave0_RRESP ),
        .SLAVE0_RLAST     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE0_RVALID    ( CoreAXI4_Lite_0_AXI4mslave0_RVALID ),
        .SLAVE0_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE0_RUSER     ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_AWID     ( MASTER0_AWID_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_AWADDR   ( axi4dma_init_0_AXI4_M_AWADDR ),
        .MASTER0_AWLEN    ( MASTER0_AWLEN_const_net_0 ), // tied to 8'h00 from definition
        .MASTER0_AWSIZE   ( MASTER0_AWSIZE_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_AWBURST  ( MASTER0_AWBURST_const_net_0 ), // tied to 2'h3 from definition
        .MASTER0_AWLOCK   ( MASTER0_AWLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER0_AWCACHE  ( MASTER0_AWCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWPROT   ( MASTER0_AWPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_AWQOS    ( MASTER0_AWQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWREGION ( MASTER0_AWREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWVALID  ( axi4dma_init_0_AXI4_M_AWVALID ),
        .MASTER0_WDATA    ( axi4dma_init_0_AXI4_M_WDATA ),
        .MASTER0_WSTRB    ( axi4dma_init_0_AXI4_M_WSTRB ),
        .MASTER0_WLAST    ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_WVALID   ( axi4dma_init_0_AXI4_M_WVALID ),
        .MASTER0_BREADY   ( axi4dma_init_0_AXI4_M_BREADY ),
        .MASTER0_ARID     ( MASTER0_ARID_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_ARADDR   ( axi4dma_init_0_AXI4_M_ARADDR ),
        .MASTER0_ARLEN    ( MASTER0_ARLEN_const_net_0 ), // tied to 8'h00 from definition
        .MASTER0_ARSIZE   ( MASTER0_ARSIZE_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_ARBURST  ( MASTER0_ARBURST_const_net_0 ), // tied to 2'h3 from definition
        .MASTER0_ARLOCK   ( MASTER0_ARLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER0_ARCACHE  ( MASTER0_ARCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARPROT   ( MASTER0_ARPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_ARQOS    ( MASTER0_ARQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARREGION ( MASTER0_ARREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARVALID  ( axi4dma_init_0_AXI4_M_ARVALID ),
        .MASTER0_RREADY   ( axi4dma_init_0_AXI4_M_RREADY ),
        .MASTER0_AWUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_WUSER    ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_ARUSER   ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .SLAVE0_AWID      ( CoreAXI4_Lite_0_AXI4mslave0_AWID ),
        .SLAVE0_AWADDR    ( CoreAXI4_Lite_0_AXI4mslave0_AWADDR ),
        .SLAVE0_AWLEN     ( CoreAXI4_Lite_0_AXI4mslave0_AWLEN ),
        .SLAVE0_AWSIZE    ( CoreAXI4_Lite_0_AXI4mslave0_AWSIZE ),
        .SLAVE0_AWBURST   ( CoreAXI4_Lite_0_AXI4mslave0_AWBURST ),
        .SLAVE0_AWLOCK    ( CoreAXI4_Lite_0_AXI4mslave0_AWLOCK ),
        .SLAVE0_AWCACHE   ( CoreAXI4_Lite_0_AXI4mslave0_AWCACHE ),
        .SLAVE0_AWPROT    ( CoreAXI4_Lite_0_AXI4mslave0_AWPROT ),
        .SLAVE0_AWQOS     ( CoreAXI4_Lite_0_AXI4mslave0_AWQOS ),
        .SLAVE0_AWREGION  ( CoreAXI4_Lite_0_AXI4mslave0_AWREGION ),
        .SLAVE0_AWVALID   ( CoreAXI4_Lite_0_AXI4mslave0_AWVALID ),
        .SLAVE0_WDATA     ( CoreAXI4_Lite_0_AXI4mslave0_WDATA ),
        .SLAVE0_WSTRB     ( CoreAXI4_Lite_0_AXI4mslave0_WSTRB ),
        .SLAVE0_WLAST     ( CoreAXI4_Lite_0_AXI4mslave0_WLAST ),
        .SLAVE0_WVALID    ( CoreAXI4_Lite_0_AXI4mslave0_WVALID ),
        .SLAVE0_BREADY    ( CoreAXI4_Lite_0_AXI4mslave0_BREADY ),
        .SLAVE0_ARID      ( CoreAXI4_Lite_0_AXI4mslave0_ARID ),
        .SLAVE0_ARADDR    ( CoreAXI4_Lite_0_AXI4mslave0_ARADDR ),
        .SLAVE0_ARLEN     ( CoreAXI4_Lite_0_AXI4mslave0_ARLEN ),
        .SLAVE0_ARSIZE    ( CoreAXI4_Lite_0_AXI4mslave0_ARSIZE ),
        .SLAVE0_ARBURST   ( CoreAXI4_Lite_0_AXI4mslave0_ARBURST ),
        .SLAVE0_ARLOCK    ( CoreAXI4_Lite_0_AXI4mslave0_ARLOCK ),
        .SLAVE0_ARCACHE   ( CoreAXI4_Lite_0_AXI4mslave0_ARCACHE ),
        .SLAVE0_ARPROT    ( CoreAXI4_Lite_0_AXI4mslave0_ARPROT ),
        .SLAVE0_ARQOS     ( CoreAXI4_Lite_0_AXI4mslave0_ARQOS ),
        .SLAVE0_ARREGION  ( CoreAXI4_Lite_0_AXI4mslave0_ARREGION ),
        .SLAVE0_ARVALID   ( CoreAXI4_Lite_0_AXI4mslave0_ARVALID ),
        .SLAVE0_RREADY    ( CoreAXI4_Lite_0_AXI4mslave0_RREADY ),
        .SLAVE0_AWUSER    ( CoreAXI4_Lite_0_AXI4mslave0_AWUSER ),
        .SLAVE0_WUSER     ( CoreAXI4_Lite_0_AXI4mslave0_WUSER ),
        .SLAVE0_ARUSER    ( CoreAXI4_Lite_0_AXI4mslave0_ARUSER ),
        .MASTER0_AWREADY  ( axi4dma_init_0_AXI4_M_AWREADY ),
        .MASTER0_WREADY   ( axi4dma_init_0_AXI4_M_WREADY ),
        .MASTER0_BID      ( axi4dma_init_0_AXI4_M_BID ),
        .MASTER0_BRESP    ( axi4dma_init_0_AXI4_M_BRESP ),
        .MASTER0_BVALID   ( axi4dma_init_0_AXI4_M_BVALID ),
        .MASTER0_ARREADY  ( axi4dma_init_0_AXI4_M_ARREADY ),
        .MASTER0_RID      ( axi4dma_init_0_AXI4_M_RID ),
        .MASTER0_RDATA    ( axi4dma_init_0_AXI4_M_RDATA ),
        .MASTER0_RRESP    ( axi4dma_init_0_AXI4_M_RRESP ),
        .MASTER0_RLAST    ( axi4dma_init_0_AXI4_M_RLAST ),
        .MASTER0_RVALID   ( axi4dma_init_0_AXI4_M_RVALID ),
        .MASTER0_BUSER    ( axi4dma_init_0_AXI4_M_BUSER ),
        .MASTER0_RUSER    ( axi4dma_init_0_AXI4_M_RUSER ) 
        );

//--------CoreDMA_Controller
CoreDMA_Controller CoreDMA_Controller_0(
        // Inputs
        .RESETN       ( RESETN ),
        .CLOCK        ( CLOCK ),
        .STRTDMAOP    ( STRTDMAOP_const_net_0 ),
        .DMA_AWREADY  ( DMA_AWREADY ),
        .DMA_WREADY   ( DMA_WREADY ),
        .DMA_BID      ( DMA_BID ),
        .DMA_BRESP    ( DMA_BRESP ),
        .DMA_BVALID   ( DMA_BVALID ),
        .DMA_ARREADY  ( DMA_ARREADY ),
        .DMA_RID      ( DMA_RID ),
        .DMA_RDATA    ( DMA_RDATA ),
        .DMA_RRESP    ( DMA_RRESP ),
        .DMA_RLAST    ( DMA_RLAST ),
        .DMA_RVALID   ( DMA_RVALID ),
        .CTRL_AWADDR  ( CoreAXI4_Lite_0_AXI4mslave0_AWADDR_0 ),
        .CTRL_AWVALID ( CoreAXI4_Lite_0_AXI4mslave0_AWVALID ),
        .CTRL_WDATA   ( CoreAXI4_Lite_0_AXI4mslave0_WDATA ),
        .CTRL_WSTRB   ( CoreAXI4_Lite_0_AXI4mslave0_WSTRB ),
        .CTRL_WVALID  ( CoreAXI4_Lite_0_AXI4mslave0_WVALID ),
        .CTRL_BREADY  ( CoreAXI4_Lite_0_AXI4mslave0_BREADY ),
        .CTRL_ARADDR  ( CoreAXI4_Lite_0_AXI4mslave0_ARADDR_0 ),
        .CTRL_ARVALID ( CoreAXI4_Lite_0_AXI4mslave0_ARVALID ),
        .CTRL_RREADY  ( CoreAXI4_Lite_0_AXI4mslave0_RREADY ),
        // Outputs
        .INTERRUPT    ( CoreDMA_Controller_0_INTERRUPT ),
        .DMA_AWID     ( AXI4MasterDMA_IF_AWID ),
        .DMA_AWADDR   ( AXI4MasterDMA_IF_AWADDR ),
        .DMA_AWLEN    ( AXI4MasterDMA_IF_AWLEN ),
        .DMA_AWSIZE   ( AXI4MasterDMA_IF_AWSIZE ),
        .DMA_AWBURST  ( AXI4MasterDMA_IF_AWBURST ),
        .DMA_AWVALID  ( AXI4MasterDMA_IF_AWVALID ),
        .DMA_WDATA    ( AXI4MasterDMA_IF_WDATA ),
        .DMA_WSTRB    ( AXI4MasterDMA_IF_WSTRB ),
        .DMA_WLAST    ( AXI4MasterDMA_IF_WLAST ),
        .DMA_WVALID   ( AXI4MasterDMA_IF_WVALID ),
        .DMA_BREADY   ( AXI4MasterDMA_IF_BREADY ),
        .DMA_ARID     ( AXI4MasterDMA_IF_ARID ),
        .DMA_ARADDR   ( AXI4MasterDMA_IF_ARADDR ),
        .DMA_ARLEN    ( AXI4MasterDMA_IF_ARLEN ),
        .DMA_ARSIZE   ( AXI4MasterDMA_IF_ARSIZE ),
        .DMA_ARBURST  ( AXI4MasterDMA_IF_ARBURST ),
        .DMA_ARVALID  ( AXI4MasterDMA_IF_ARVALID ),
        .DMA_RREADY   ( AXI4MasterDMA_IF_RREADY ),
        .CTRL_AWREADY ( CoreAXI4_Lite_0_AXI4mslave0_AWREADY ),
        .CTRL_WREADY  ( CoreAXI4_Lite_0_AXI4mslave0_WREADY ),
        .CTRL_BRESP   ( CoreAXI4_Lite_0_AXI4mslave0_BRESP ),
        .CTRL_BVALID  ( CoreAXI4_Lite_0_AXI4mslave0_BVALID ),
        .CTRL_ARREADY ( CoreAXI4_Lite_0_AXI4mslave0_ARREADY ),
        .CTRL_RDATA   ( CoreAXI4_Lite_0_AXI4mslave0_RDATA ),
        .CTRL_RRESP   ( CoreAXI4_Lite_0_AXI4mslave0_RRESP ),
        .CTRL_RVALID  ( CoreAXI4_Lite_0_AXI4mslave0_RVALID ) 
        );

//--------UART_SD
UART_SD UART_SD_0(
        // Inputs
        .RX                 ( RX ),
        .RESET_N            ( RESETN ),
        .CLK                ( CLOCK ),
        .rvalid_i           ( rvalid_i ),
        .rlast_i            ( rlast_i ),
        .arready_i          ( arready_i ),
        .bvalid_i           ( bvalid_i ),
        .wready_i           ( wready_i ),
        .awready_i          ( awready_i ),
        .coredma_int_i      ( CoreDMA_Controller_0_INTERRUPT ),
        .clk_count_i        ( axi_io_ctrl_0_clk_count_o ),
        .rresp_i            ( rresp_i ),
        .rdata_i            ( rdata_i ),
        .rid_i              ( rid_i ),
        .bresp_i            ( bresp_i ),
        .bid_i              ( bid_i ),
        // Outputs
        .TX                 ( TX_net_0 ),
        .rready_o           ( AXI4_M_RREADY ),
        .arvalid_o          ( AXI4_M_ARVALID ),
        .bready_o           ( AXI4_M_BREADY ),
        .wvalid_o           ( AXI4_M_WVALID ),
        .wlast_o            ( AXI4_M_WLAST ),
        .awvalid_o          ( AXI4_M_AWVALID ),
        .coredma_ch1_type_o ( UART_SD_0_coredma_ch1_type_o ),
        .coredma_size_o     ( UART_SD_0_coredma_size_o ),
        .coredma_ch0_type_o ( UART_SD_0_coredma_ch0_type_o ),
        .arburst_o          ( AXI4_M_ARBURST ),
        .arsize_o           ( AXI4_M_ARSIZE ),
        .arlen_o            ( AXI4_M_ARLEN ),
        .araddr_o           ( AXI4_M_ARADDR ),
        .arid_o             ( AXI4_M_ARID ),
        .wstrb_o            ( AXI4_M_WSTRB ),
        .wdata_o            ( AXI4_M_WDATA ),
        .awburst_o          ( AXI4_M_AWBURST ),
        .awsize_o           ( AXI4_M_AWSIZE ),
        .awlen_o            ( AXI4_M_AWLEN ),
        .awaddr_o           ( AXI4_M_AWADDR ),
        .awid_o             ( AXI4_M_AWID ) 
        );


endmodule
