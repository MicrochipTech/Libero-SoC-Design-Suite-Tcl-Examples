//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:03:00 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PCIe_EP_Demo
module PCIe_EP_Demo(
    // Inputs
    PCIESS_LANE_RXD0_N,
    PCIESS_LANE_RXD0_P,
    PCIESS_LANE_RXD1_N,
    PCIESS_LANE_RXD1_P,
    PCIESS_LANE_RXD2_N,
    PCIESS_LANE_RXD2_P,
    PCIESS_LANE_RXD3_N,
    PCIESS_LANE_RXD3_P,
    PCIE_1_PERST_N,
    REF_CLK_0,
    REF_CLK_PAD_N,
    REF_CLK_PAD_P,
    RX,
    USER_RESETN,
    dip_switch_o,
    switch_i,
    // Outputs
    A,
    ACT_N,
    A_0,
    BA,
    BANK0_1_7_CALIB_DONE,
    BA_0,
    BG,
    CAS_N,
    CAS_N_0,
    CK0,
    CK0_0,
    CK0_N,
    CK0_N_0,
    CKE,
    CKE_0,
    CS_N,
    CS_N_0,
    CTRLR_READY_DDR3,
    CTRLR_READY_DDR4,
    DM,
    DM_N,
    ODT,
    ODT_0,
    PCIESS_LANE_TXD0_N,
    PCIESS_LANE_TXD0_P,
    PCIESS_LANE_TXD1_N,
    PCIESS_LANE_TXD1_P,
    PCIESS_LANE_TXD2_N,
    PCIESS_LANE_TXD2_P,
    PCIESS_LANE_TXD3_N,
    PCIESS_LANE_TXD3_P,
    PLL_LOCK_DDR3,
    PLL_LOCK_DDR4,
    RAS_N,
    RAS_N_0,
    RESET_N,
    RESET_N_0,
    SHIELD0,
    SHIELD0_0,
    SHIELD1,
    SHIELD1_0,
    TX,
    WE_N,
    WE_N_0,
    led_o,
    // Inouts
    DQ,
    DQS,
    DQS_0,
    DQS_N,
    DQS_N_0,
    DQ_0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         PCIESS_LANE_RXD0_N;
input         PCIESS_LANE_RXD0_P;
input         PCIESS_LANE_RXD1_N;
input         PCIESS_LANE_RXD1_P;
input         PCIESS_LANE_RXD2_N;
input         PCIESS_LANE_RXD2_P;
input         PCIESS_LANE_RXD3_N;
input         PCIESS_LANE_RXD3_P;
input         PCIE_1_PERST_N;
input         REF_CLK_0;
input         REF_CLK_PAD_N;
input         REF_CLK_PAD_P;
input         RX;
input         USER_RESETN;
input  [3:0]  dip_switch_o;
input  [3:0]  switch_i;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [13:0] A;
output        ACT_N;
output [15:0] A_0;
output [1:0]  BA;
output        BANK0_1_7_CALIB_DONE;
output [2:0]  BA_0;
output [1:0]  BG;
output        CAS_N;
output        CAS_N_0;
output        CK0;
output        CK0_0;
output        CK0_N;
output        CK0_N_0;
output        CKE;
output        CKE_0;
output        CS_N;
output        CS_N_0;
output        CTRLR_READY_DDR3;
output        CTRLR_READY_DDR4;
output [1:0]  DM;
output [1:0]  DM_N;
output        ODT;
output        ODT_0;
output        PCIESS_LANE_TXD0_N;
output        PCIESS_LANE_TXD0_P;
output        PCIESS_LANE_TXD1_N;
output        PCIESS_LANE_TXD1_P;
output        PCIESS_LANE_TXD2_N;
output        PCIESS_LANE_TXD2_P;
output        PCIESS_LANE_TXD3_N;
output        PCIESS_LANE_TXD3_P;
output        PLL_LOCK_DDR3;
output        PLL_LOCK_DDR4;
output        RAS_N;
output        RAS_N_0;
output        RESET_N;
output        RESET_N_0;
output        SHIELD0;
output        SHIELD0_0;
output        SHIELD1;
output        SHIELD1_0;
output        TX;
output        WE_N;
output        WE_N_0;
output [7:0]  led_o;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [15:0] DQ;
inout  [1:0]  DQS;
inout  [1:0]  DQS_0;
inout  [1:0]  DQS_N;
inout  [1:0]  DQS_N_0;
inout  [15:0] DQ_0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [13:0] A_net_0;
wire   [15:0] A_0_net_0;
wire          ACT_N_net_0;
wire          AND3_0_Y;
wire   [31:0] AXI4_Interconnect_0_AXI3mslave0_ARADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_ARBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_ARCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI3mslave0_ARID;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_ARLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI3mslave0_ARPROT;
wire          AXI4_Interconnect_0_AXI3mslave0_ARREADY;
wire   [2:0]  AXI4_Interconnect_0_AXI3mslave0_ARSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI3mslave0_ARUSER;
wire          AXI4_Interconnect_0_AXI3mslave0_ARVALID;
wire   [31:0] AXI4_Interconnect_0_AXI3mslave0_AWADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_AWBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_AWCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI3mslave0_AWID;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_AWLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI3mslave0_AWPROT;
wire          AXI4_Interconnect_0_AXI3mslave0_AWREADY;
wire   [2:0]  AXI4_Interconnect_0_AXI3mslave0_AWSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI3mslave0_AWUSER;
wire          AXI4_Interconnect_0_AXI3mslave0_AWVALID;
wire   [5:0]  AXI4_Interconnect_0_AXI3mslave0_BID;
wire          AXI4_Interconnect_0_AXI3mslave0_BREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_BRESP;
wire          AXI4_Interconnect_0_AXI3mslave0_BVALID;
wire   [63:0] AXI4_Interconnect_0_AXI3mslave0_RDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI3mslave0_RID;
wire          AXI4_Interconnect_0_AXI3mslave0_RLAST;
wire          AXI4_Interconnect_0_AXI3mslave0_RREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI3mslave0_RRESP;
wire          AXI4_Interconnect_0_AXI3mslave0_RVALID;
wire   [63:0] AXI4_Interconnect_0_AXI3mslave0_WDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI3mslave0_WID;
wire          AXI4_Interconnect_0_AXI3mslave0_WLAST;
wire          AXI4_Interconnect_0_AXI3mslave0_WREADY;
wire   [7:0]  AXI4_Interconnect_0_AXI3mslave0_WSTRB;
wire   [0:0]  AXI4_Interconnect_0_AXI3mslave0_WUSER;
wire          AXI4_Interconnect_0_AXI3mslave0_WVALID;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_ARBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_ARCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave1_ARID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave1_ARLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_ARLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave1_ARPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_ARQOS;
wire          AXI4_Interconnect_0_AXI4mslave1_ARREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_ARREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave1_ARSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave1_ARUSER;
wire          AXI4_Interconnect_0_AXI4mslave1_ARVALID;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_AWBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_AWCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave1_AWID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave1_AWLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_AWLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave1_AWPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_AWQOS;
wire          AXI4_Interconnect_0_AXI4mslave1_AWREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave1_AWREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave1_AWSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave1_AWUSER;
wire          AXI4_Interconnect_0_AXI4mslave1_AWVALID;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave1_BID;
wire          AXI4_Interconnect_0_AXI4mslave1_BREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_BRESP;
wire          AXI4_Interconnect_0_AXI4mslave1_BVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave1_RDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave1_RID;
wire          AXI4_Interconnect_0_AXI4mslave1_RLAST;
wire          AXI4_Interconnect_0_AXI4mslave1_RREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave1_RRESP;
wire          AXI4_Interconnect_0_AXI4mslave1_RVALID;
wire          AXI4_Interconnect_0_AXI4mslave1_WLAST;
wire          AXI4_Interconnect_0_AXI4mslave1_WREADY;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave1_WSTRB;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave1_WUSER;
wire          AXI4_Interconnect_0_AXI4mslave1_WVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave2_ARADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_ARBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_ARCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave2_ARID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave2_ARLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_ARLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave2_ARPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_ARQOS;
wire          AXI4_Interconnect_0_AXI4mslave2_ARREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_ARREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave2_ARSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave2_ARUSER;
wire          AXI4_Interconnect_0_AXI4mslave2_ARVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave2_AWADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_AWBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_AWCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave2_AWID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave2_AWLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_AWLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave2_AWPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_AWQOS;
wire          AXI4_Interconnect_0_AXI4mslave2_AWREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave2_AWREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave2_AWSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave2_AWUSER;
wire          AXI4_Interconnect_0_AXI4mslave2_AWVALID;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave2_BID;
wire          AXI4_Interconnect_0_AXI4mslave2_BREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_BRESP;
wire          AXI4_Interconnect_0_AXI4mslave2_BVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave2_RDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave2_RID;
wire          AXI4_Interconnect_0_AXI4mslave2_RLAST;
wire          AXI4_Interconnect_0_AXI4mslave2_RREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave2_RRESP;
wire          AXI4_Interconnect_0_AXI4mslave2_RVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave2_WDATA;
wire          AXI4_Interconnect_0_AXI4mslave2_WLAST;
wire          AXI4_Interconnect_0_AXI4mslave2_WREADY;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave2_WSTRB;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave2_WUSER;
wire          AXI4_Interconnect_0_AXI4mslave2_WVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave3_ARADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_ARBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_ARCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave3_ARID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave3_ARLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_ARLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave3_ARPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_ARQOS;
wire          AXI4_Interconnect_0_AXI4mslave3_ARREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_ARREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave3_ARSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave3_ARUSER;
wire          AXI4_Interconnect_0_AXI4mslave3_ARVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave3_AWADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_AWBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_AWCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave3_AWID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave3_AWLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_AWLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave3_AWPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_AWQOS;
wire          AXI4_Interconnect_0_AXI4mslave3_AWREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave3_AWREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave3_AWSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave3_AWUSER;
wire          AXI4_Interconnect_0_AXI4mslave3_AWVALID;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave3_BID;
wire          AXI4_Interconnect_0_AXI4mslave3_BREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_BRESP;
wire          AXI4_Interconnect_0_AXI4mslave3_BVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave3_RDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave3_RID;
wire          AXI4_Interconnect_0_AXI4mslave3_RLAST;
wire          AXI4_Interconnect_0_AXI4mslave3_RREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave3_RRESP;
wire          AXI4_Interconnect_0_AXI4mslave3_RVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave3_WDATA;
wire          AXI4_Interconnect_0_AXI4mslave3_WLAST;
wire          AXI4_Interconnect_0_AXI4mslave3_WREADY;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave3_WSTRB;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave3_WUSER;
wire          AXI4_Interconnect_0_AXI4mslave3_WVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave4_ARADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_ARBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_ARCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave4_ARID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave4_ARLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_ARLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave4_ARPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_ARQOS;
wire          AXI4_Interconnect_0_AXI4mslave4_ARREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_ARREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave4_ARSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave4_ARUSER;
wire          AXI4_Interconnect_0_AXI4mslave4_ARVALID;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave4_AWADDR;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_AWBURST;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_AWCACHE;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave4_AWID;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave4_AWLEN;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_AWLOCK;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave4_AWPROT;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_AWQOS;
wire          AXI4_Interconnect_0_AXI4mslave4_AWREADY;
wire   [3:0]  AXI4_Interconnect_0_AXI4mslave4_AWREGION;
wire   [2:0]  AXI4_Interconnect_0_AXI4mslave4_AWSIZE;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave4_AWUSER;
wire          AXI4_Interconnect_0_AXI4mslave4_AWVALID;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave4_BID;
wire          AXI4_Interconnect_0_AXI4mslave4_BREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_BRESP;
wire          AXI4_Interconnect_0_AXI4mslave4_BVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave4_RDATA;
wire   [5:0]  AXI4_Interconnect_0_AXI4mslave4_RID;
wire          AXI4_Interconnect_0_AXI4mslave4_RLAST;
wire          AXI4_Interconnect_0_AXI4mslave4_RREADY;
wire   [1:0]  AXI4_Interconnect_0_AXI4mslave4_RRESP;
wire          AXI4_Interconnect_0_AXI4mslave4_RVALID;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave4_WDATA;
wire          AXI4_Interconnect_0_AXI4mslave4_WLAST;
wire          AXI4_Interconnect_0_AXI4mslave4_WREADY;
wire   [7:0]  AXI4_Interconnect_0_AXI4mslave4_WSTRB;
wire   [0:0]  AXI4_Interconnect_0_AXI4mslave4_WUSER;
wire          AXI4_Interconnect_0_AXI4mslave4_WVALID;
wire          AXI4_Interconnect_0_MASTER0_WREADY;
wire          AXItoAPB_0_APBmslave0_PENABLE;
wire   [31:0] AXItoAPB_0_APBmslave0_PRDATA;
wire          AXItoAPB_0_APBmslave0_PREADY;
wire          AXItoAPB_0_APBmslave0_PSELx;
wire          AXItoAPB_0_APBmslave0_PSLVERR;
wire   [31:0] AXItoAPB_0_APBmslave0_PWDATA;
wire          AXItoAPB_0_APBmslave0_PWRITE;
wire   [1:0]  BA_net_0;
wire   [2:0]  BA_0_net_0;
wire          BANK0_1_7_CALIB_DONE_net_0;
wire   [1:0]  BG_net_0;
wire          CAS_N_net_0;
wire          CAS_N_0_net_0;
wire          CCC_111MHz_0_OUT0_FABCLK_0;
wire          CCC_111MHz_0_PLL_LOCK_0;
wire          CK0_net_0;
wire          CK0_0_net_0;
wire          CK0_N_net_0;
wire          CK0_N_0_net_0;
wire          CKE_net_0;
wire          CKE_0_net_0;
wire          CLKINT_0_Y;
wire   [31:0] CoreDMA_IO_CTRL_0_AXI4_M_ARADDR;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARBURST;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARID;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARLEN;
wire          CoreDMA_IO_CTRL_0_AXI4_M_ARREADY;
wire          CoreDMA_IO_CTRL_0_AXI4_M_ARVALID;
wire   [31:0] CoreDMA_IO_CTRL_0_AXI4_M_AWADDR;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWBURST;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWID;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWLEN;
wire          CoreDMA_IO_CTRL_0_AXI4_M_AWREADY;
wire          CoreDMA_IO_CTRL_0_AXI4_M_AWVALID;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4_M_BID;
wire          CoreDMA_IO_CTRL_0_AXI4_M_BREADY;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_BRESP;
wire   [0:0]  CoreDMA_IO_CTRL_0_AXI4_M_BUSER;
wire          CoreDMA_IO_CTRL_0_AXI4_M_BVALID;
wire   [63:0] CoreDMA_IO_CTRL_0_AXI4_M_RDATA;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4_M_RID;
wire          CoreDMA_IO_CTRL_0_AXI4_M_RLAST;
wire          CoreDMA_IO_CTRL_0_AXI4_M_RREADY;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_RRESP;
wire   [0:0]  CoreDMA_IO_CTRL_0_AXI4_M_RUSER;
wire          CoreDMA_IO_CTRL_0_AXI4_M_RVALID;
wire   [63:0] CoreDMA_IO_CTRL_0_AXI4_M_WDATA;
wire          CoreDMA_IO_CTRL_0_AXI4_M_WLAST;
wire          CoreDMA_IO_CTRL_0_AXI4_M_WREADY;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4_M_WSTRB;
wire          CoreDMA_IO_CTRL_0_AXI4_M_WVALID;
wire   [31:0] CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARADDR;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARBURST;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARID;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARLEN;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARREADY;
wire   [2:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARSIZE;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARVALID;
wire   [31:0] CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWADDR;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWBURST;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWID;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWLEN;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWREADY;
wire   [2:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWSIZE;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWVALID;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BID;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BREADY;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BRESP;
wire   [0:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BUSER;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BVALID;
wire   [63:0] CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RDATA;
wire   [3:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RID;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RLAST;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RREADY;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RRESP;
wire   [0:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RUSER;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RVALID;
wire   [63:0] CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WDATA;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WLAST;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WREADY;
wire   [7:0]  CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WSTRB;
wire          CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WVALID;
wire          CS_N_net_0;
wire          CS_N_0_net_0;
wire          CTRLR_READY_DDR3_net_0;
wire          CTRLR_READY_DDR4_net_0;
wire   [3:0]  dip_switch_o;
wire   [1:0]  DM_net_0;
wire   [1:0]  DM_N_net_0;
wire   [15:0] DQ;
wire   [15:0] DQ_0;
wire   [1:0]  DQS;
wire   [1:0]  DQS_0;
wire   [1:0]  DQS_N;
wire   [1:0]  DQS_N_0;
wire   [7:0]  led_o_net_0;
wire          ODT_net_0;
wire          ODT_0_net_0;
wire          PCIE_1_PERST_N;
wire   [31:0] PCIe_EP_0_AXI_1_MASTER_ARADDR;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_ARBURST;
wire   [3:0]  PCIe_EP_0_AXI_1_MASTER_ARID;
wire   [7:0]  PCIe_EP_0_AXI_1_MASTER_ARLEN;
wire          PCIe_EP_0_AXI_1_MASTER_ARREADY;
wire          PCIe_EP_0_AXI_1_MASTER_ARVALID;
wire   [31:0] PCIe_EP_0_AXI_1_MASTER_AWADDR;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_AWBURST;
wire   [3:0]  PCIe_EP_0_AXI_1_MASTER_AWID;
wire   [7:0]  PCIe_EP_0_AXI_1_MASTER_AWLEN;
wire          PCIe_EP_0_AXI_1_MASTER_AWREADY;
wire          PCIe_EP_0_AXI_1_MASTER_AWVALID;
wire   [3:0]  PCIe_EP_0_AXI_1_MASTER_BID;
wire          PCIe_EP_0_AXI_1_MASTER_BREADY;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_BRESP;
wire   [0:0]  PCIe_EP_0_AXI_1_MASTER_BUSER;
wire          PCIe_EP_0_AXI_1_MASTER_BVALID;
wire   [63:0] PCIe_EP_0_AXI_1_MASTER_RDATA;
wire   [3:0]  PCIe_EP_0_AXI_1_MASTER_RID;
wire          PCIe_EP_0_AXI_1_MASTER_RLAST;
wire          PCIe_EP_0_AXI_1_MASTER_RREADY;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_RRESP;
wire   [0:0]  PCIe_EP_0_AXI_1_MASTER_RUSER;
wire          PCIe_EP_0_AXI_1_MASTER_RVALID;
wire   [63:0] PCIe_EP_0_AXI_1_MASTER_WDATA;
wire          PCIe_EP_0_AXI_1_MASTER_WLAST;
wire   [7:0]  PCIe_EP_0_AXI_1_MASTER_WSTRB;
wire          PCIe_EP_0_AXI_1_MASTER_WVALID;
wire          PCIe_EP_0_DEVICE_INIT_DONE;
wire          PCIe_EP_0_PCIE_1_INTERRUPT_OUT;
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
wire          PF_DDR3_SS_0_SYS_CLK;
wire          PF_DDR4_SS_0_SYS_CLK;
wire          PF_RESET_0_FABRIC_RESET_N;
wire          PLL_LOCK_DDR3_net_0;
wire          PLL_LOCK_DDR4_net_0;
wire          RAS_N_net_0;
wire          RAS_N_0_net_0;
wire          REF_CLK_0;
wire          REF_CLK_PAD_N;
wire          REF_CLK_PAD_P;
wire          RESET_N_net_0;
wire          RESET_N_0_net_0;
wire          RX;
wire          SHIELD0_net_0;
wire          SHIELD0_0_net_0;
wire          SHIELD1_net_0;
wire          SHIELD1_0_net_0;
wire   [3:0]  switch_i;
wire          TX_net_0;
wire          USER_RESETN;
wire          WE_N_net_0;
wire          WE_N_0_net_0;
wire          PCIESS_LANE_TXD0_P_net_1;
wire          PCIESS_LANE_TXD0_N_net_1;
wire          PCIESS_LANE_TXD1_P_net_1;
wire          PCIESS_LANE_TXD1_N_net_1;
wire          PCIESS_LANE_TXD2_P_net_1;
wire          PCIESS_LANE_TXD2_N_net_1;
wire          PCIESS_LANE_TXD3_P_net_1;
wire          PCIESS_LANE_TXD3_N_net_1;
wire          CKE_net_1;
wire          CS_N_net_1;
wire          ODT_net_1;
wire          RAS_N_net_1;
wire          CAS_N_net_1;
wire          WE_N_net_1;
wire          ACT_N_net_1;
wire          RESET_N_net_1;
wire          CK0_net_1;
wire          CK0_N_net_1;
wire          SHIELD0_net_1;
wire          SHIELD1_net_1;
wire          CKE_0_net_1;
wire          CS_N_0_net_1;
wire          ODT_0_net_1;
wire          RAS_N_0_net_1;
wire          CAS_N_0_net_1;
wire          WE_N_0_net_1;
wire          RESET_N_0_net_1;
wire          CK0_0_net_1;
wire          CK0_N_0_net_1;
wire          SHIELD0_0_net_1;
wire          SHIELD1_0_net_1;
wire          TX_net_1;
wire          BANK0_1_7_CALIB_DONE_net_1;
wire          PLL_LOCK_DDR4_net_1;
wire          CTRLR_READY_DDR3_net_1;
wire          PLL_LOCK_DDR3_net_1;
wire          CTRLR_READY_DDR4_net_1;
wire   [1:0]  DM_N_net_1;
wire   [1:0]  BG_net_1;
wire   [1:0]  BA_net_1;
wire   [13:0] A_net_1;
wire   [1:0]  DM_net_1;
wire   [2:0]  BA_0_net_1;
wire   [15:0] A_0_net_1;
wire   [7:0]  led_o_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [1:0]  MASTER0_AWLOCK_const_net_0;
wire   [3:0]  MASTER0_AWCACHE_const_net_0;
wire   [2:0]  MASTER0_AWPROT_const_net_0;
wire   [3:0]  MASTER0_AWQOS_const_net_0;
wire   [3:0]  MASTER0_AWREGION_const_net_0;
wire   [1:0]  MASTER0_ARLOCK_const_net_0;
wire   [3:0]  MASTER0_ARCACHE_const_net_0;
wire   [2:0]  MASTER0_ARPROT_const_net_0;
wire   [3:0]  MASTER0_ARQOS_const_net_0;
wire   [3:0]  MASTER0_ARREGION_const_net_0;
wire   [1:0]  MASTER1_AWLOCK_const_net_0;
wire   [3:0]  MASTER1_AWCACHE_const_net_0;
wire   [2:0]  MASTER1_AWPROT_const_net_0;
wire   [3:0]  MASTER1_AWQOS_const_net_0;
wire   [3:0]  MASTER1_AWREGION_const_net_0;
wire   [1:0]  MASTER1_ARLOCK_const_net_0;
wire   [3:0]  MASTER1_ARCACHE_const_net_0;
wire   [2:0]  MASTER1_ARPROT_const_net_0;
wire   [3:0]  MASTER1_ARQOS_const_net_0;
wire   [3:0]  MASTER1_ARREGION_const_net_0;
wire   [1:0]  MASTER2_AWLOCK_const_net_0;
wire   [3:0]  MASTER2_AWCACHE_const_net_0;
wire   [2:0]  MASTER2_AWPROT_const_net_0;
wire   [3:0]  MASTER2_AWQOS_const_net_0;
wire   [3:0]  MASTER2_AWREGION_const_net_0;
wire   [1:0]  MASTER2_ARLOCK_const_net_0;
wire   [3:0]  MASTER2_ARCACHE_const_net_0;
wire   [2:0]  MASTER2_ARPROT_const_net_0;
wire   [3:0]  MASTER2_ARQOS_const_net_0;
wire   [3:0]  MASTER2_ARREGION_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [7:0]  AXI4_Interconnect_0_AXI3mslave0_ARLEN;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_ARLEN_0;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_ARLEN_0_3to0;
wire   [7:0]  AXI4_Interconnect_0_AXI3mslave0_AWLEN;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_AWLEN_0;
wire   [3:0]  AXI4_Interconnect_0_AXI3mslave0_AWLEN_0_3to0;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave1_ARADDR;
wire   [10:3] AXI4_Interconnect_0_AXI4mslave1_ARADDR_0;
wire   [10:3] AXI4_Interconnect_0_AXI4mslave1_ARADDR_0_10to3;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave1_AWADDR;
wire   [10:3] AXI4_Interconnect_0_AXI4mslave1_AWADDR_0;
wire   [10:3] AXI4_Interconnect_0_AXI4mslave1_AWADDR_0_10to3;
wire   [63:0] AXI4_Interconnect_0_AXI4mslave1_WDATA;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave1_WDATA_0;
wire   [31:0] AXI4_Interconnect_0_AXI4mslave1_WDATA_0_31to0;
wire   [31:0] AXItoAPB_0_APBmslave0_PADDR;
wire   [25:0] AXItoAPB_0_APBmslave0_PADDR_0;
wire   [25:0] AXItoAPB_0_APBmslave0_PADDR_0_25to0;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE;
wire   [2:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_1to0;
wire   [2:2]  CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_2to2;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE;
wire   [2:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0;
wire   [1:0]  CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_1to0;
wire   [2:2]  CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_2to2;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_ARSIZE;
wire   [2:0]  PCIe_EP_0_AXI_1_MASTER_ARSIZE_0;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_1to0;
wire   [2:2]  PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_2to2;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_AWSIZE;
wire   [2:0]  PCIe_EP_0_AXI_1_MASTER_AWSIZE_0;
wire   [1:0]  PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_1to0;
wire   [2:2]  PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_2to2;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                      = 1'b0;
assign MASTER0_AWLOCK_const_net_0   = 2'h0;
assign MASTER0_AWCACHE_const_net_0  = 4'h0;
assign MASTER0_AWPROT_const_net_0   = 3'h0;
assign MASTER0_AWQOS_const_net_0    = 4'h0;
assign MASTER0_AWREGION_const_net_0 = 4'h0;
assign MASTER0_ARLOCK_const_net_0   = 2'h0;
assign MASTER0_ARCACHE_const_net_0  = 4'h0;
assign MASTER0_ARPROT_const_net_0   = 3'h0;
assign MASTER0_ARQOS_const_net_0    = 4'h0;
assign MASTER0_ARREGION_const_net_0 = 4'h0;
assign MASTER1_AWLOCK_const_net_0   = 2'h0;
assign MASTER1_AWCACHE_const_net_0  = 4'h0;
assign MASTER1_AWPROT_const_net_0   = 3'h0;
assign MASTER1_AWQOS_const_net_0    = 4'h0;
assign MASTER1_AWREGION_const_net_0 = 4'h0;
assign MASTER1_ARLOCK_const_net_0   = 2'h0;
assign MASTER1_ARCACHE_const_net_0  = 4'h0;
assign MASTER1_ARPROT_const_net_0   = 3'h0;
assign MASTER1_ARQOS_const_net_0    = 4'h0;
assign MASTER1_ARREGION_const_net_0 = 4'h0;
assign MASTER2_AWLOCK_const_net_0   = 2'h0;
assign MASTER2_AWCACHE_const_net_0  = 4'h0;
assign MASTER2_AWPROT_const_net_0   = 3'h0;
assign MASTER2_AWQOS_const_net_0    = 4'h0;
assign MASTER2_AWREGION_const_net_0 = 4'h0;
assign MASTER2_ARLOCK_const_net_0   = 2'h0;
assign MASTER2_ARCACHE_const_net_0  = 4'h0;
assign MASTER2_ARPROT_const_net_0   = 3'h0;
assign MASTER2_ARQOS_const_net_0    = 4'h0;
assign MASTER2_ARREGION_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PCIESS_LANE_TXD0_P_net_1   = PCIESS_LANE_TXD0_P_net_0;
assign PCIESS_LANE_TXD0_P         = PCIESS_LANE_TXD0_P_net_1;
assign PCIESS_LANE_TXD0_N_net_1   = PCIESS_LANE_TXD0_N_net_0;
assign PCIESS_LANE_TXD0_N         = PCIESS_LANE_TXD0_N_net_1;
assign PCIESS_LANE_TXD1_P_net_1   = PCIESS_LANE_TXD1_P_net_0;
assign PCIESS_LANE_TXD1_P         = PCIESS_LANE_TXD1_P_net_1;
assign PCIESS_LANE_TXD1_N_net_1   = PCIESS_LANE_TXD1_N_net_0;
assign PCIESS_LANE_TXD1_N         = PCIESS_LANE_TXD1_N_net_1;
assign PCIESS_LANE_TXD2_P_net_1   = PCIESS_LANE_TXD2_P_net_0;
assign PCIESS_LANE_TXD2_P         = PCIESS_LANE_TXD2_P_net_1;
assign PCIESS_LANE_TXD2_N_net_1   = PCIESS_LANE_TXD2_N_net_0;
assign PCIESS_LANE_TXD2_N         = PCIESS_LANE_TXD2_N_net_1;
assign PCIESS_LANE_TXD3_P_net_1   = PCIESS_LANE_TXD3_P_net_0;
assign PCIESS_LANE_TXD3_P         = PCIESS_LANE_TXD3_P_net_1;
assign PCIESS_LANE_TXD3_N_net_1   = PCIESS_LANE_TXD3_N_net_0;
assign PCIESS_LANE_TXD3_N         = PCIESS_LANE_TXD3_N_net_1;
assign CKE_net_1                  = CKE_net_0;
assign CKE                        = CKE_net_1;
assign CS_N_net_1                 = CS_N_net_0;
assign CS_N                       = CS_N_net_1;
assign ODT_net_1                  = ODT_net_0;
assign ODT                        = ODT_net_1;
assign RAS_N_net_1                = RAS_N_net_0;
assign RAS_N                      = RAS_N_net_1;
assign CAS_N_net_1                = CAS_N_net_0;
assign CAS_N                      = CAS_N_net_1;
assign WE_N_net_1                 = WE_N_net_0;
assign WE_N                       = WE_N_net_1;
assign ACT_N_net_1                = ACT_N_net_0;
assign ACT_N                      = ACT_N_net_1;
assign RESET_N_net_1              = RESET_N_net_0;
assign RESET_N                    = RESET_N_net_1;
assign CK0_net_1                  = CK0_net_0;
assign CK0                        = CK0_net_1;
assign CK0_N_net_1                = CK0_N_net_0;
assign CK0_N                      = CK0_N_net_1;
assign SHIELD0_net_1              = SHIELD0_net_0;
assign SHIELD0                    = SHIELD0_net_1;
assign SHIELD1_net_1              = SHIELD1_net_0;
assign SHIELD1                    = SHIELD1_net_1;
assign CKE_0_net_1                = CKE_0_net_0;
assign CKE_0                      = CKE_0_net_1;
assign CS_N_0_net_1               = CS_N_0_net_0;
assign CS_N_0                     = CS_N_0_net_1;
assign ODT_0_net_1                = ODT_0_net_0;
assign ODT_0                      = ODT_0_net_1;
assign RAS_N_0_net_1              = RAS_N_0_net_0;
assign RAS_N_0                    = RAS_N_0_net_1;
assign CAS_N_0_net_1              = CAS_N_0_net_0;
assign CAS_N_0                    = CAS_N_0_net_1;
assign WE_N_0_net_1               = WE_N_0_net_0;
assign WE_N_0                     = WE_N_0_net_1;
assign RESET_N_0_net_1            = RESET_N_0_net_0;
assign RESET_N_0                  = RESET_N_0_net_1;
assign CK0_0_net_1                = CK0_0_net_0;
assign CK0_0                      = CK0_0_net_1;
assign CK0_N_0_net_1              = CK0_N_0_net_0;
assign CK0_N_0                    = CK0_N_0_net_1;
assign SHIELD0_0_net_1            = SHIELD0_0_net_0;
assign SHIELD0_0                  = SHIELD0_0_net_1;
assign SHIELD1_0_net_1            = SHIELD1_0_net_0;
assign SHIELD1_0                  = SHIELD1_0_net_1;
assign TX_net_1                   = TX_net_0;
assign TX                         = TX_net_1;
assign BANK0_1_7_CALIB_DONE_net_1 = BANK0_1_7_CALIB_DONE_net_0;
assign BANK0_1_7_CALIB_DONE       = BANK0_1_7_CALIB_DONE_net_1;
assign PLL_LOCK_DDR4_net_1        = PLL_LOCK_DDR4_net_0;
assign PLL_LOCK_DDR4              = PLL_LOCK_DDR4_net_1;
assign CTRLR_READY_DDR3_net_1     = CTRLR_READY_DDR3_net_0;
assign CTRLR_READY_DDR3           = CTRLR_READY_DDR3_net_1;
assign PLL_LOCK_DDR3_net_1        = PLL_LOCK_DDR3_net_0;
assign PLL_LOCK_DDR3              = PLL_LOCK_DDR3_net_1;
assign CTRLR_READY_DDR4_net_1     = CTRLR_READY_DDR4_net_0;
assign CTRLR_READY_DDR4           = CTRLR_READY_DDR4_net_1;
assign DM_N_net_1                 = DM_N_net_0;
assign DM_N[1:0]                  = DM_N_net_1;
assign BG_net_1                   = BG_net_0;
assign BG[1:0]                    = BG_net_1;
assign BA_net_1                   = BA_net_0;
assign BA[1:0]                    = BA_net_1;
assign A_net_1                    = A_net_0;
assign A[13:0]                    = A_net_1;
assign DM_net_1                   = DM_net_0;
assign DM[1:0]                    = DM_net_1;
assign BA_0_net_1                 = BA_0_net_0;
assign BA_0[2:0]                  = BA_0_net_1;
assign A_0_net_1                  = A_0_net_0;
assign A_0[15:0]                  = A_0_net_1;
assign led_o_net_1                = led_o_net_0;
assign led_o[7:0]                 = led_o_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign AXI4_Interconnect_0_AXI3mslave0_ARLEN_0 = { AXI4_Interconnect_0_AXI3mslave0_ARLEN_0_3to0 };
assign AXI4_Interconnect_0_AXI3mslave0_ARLEN_0_3to0 = AXI4_Interconnect_0_AXI3mslave0_ARLEN[3:0];

assign AXI4_Interconnect_0_AXI3mslave0_AWLEN_0 = { AXI4_Interconnect_0_AXI3mslave0_AWLEN_0_3to0 };
assign AXI4_Interconnect_0_AXI3mslave0_AWLEN_0_3to0 = AXI4_Interconnect_0_AXI3mslave0_AWLEN[3:0];

assign AXI4_Interconnect_0_AXI4mslave1_ARADDR_0 = { AXI4_Interconnect_0_AXI4mslave1_ARADDR_0_10to3 };
assign AXI4_Interconnect_0_AXI4mslave1_ARADDR_0_10to3 = AXI4_Interconnect_0_AXI4mslave1_ARADDR[10:3];

assign AXI4_Interconnect_0_AXI4mslave1_AWADDR_0 = { AXI4_Interconnect_0_AXI4mslave1_AWADDR_0_10to3 };
assign AXI4_Interconnect_0_AXI4mslave1_AWADDR_0_10to3 = AXI4_Interconnect_0_AXI4mslave1_AWADDR[10:3];

assign AXI4_Interconnect_0_AXI4mslave1_WDATA_0 = { AXI4_Interconnect_0_AXI4mslave1_WDATA_0_31to0 };
assign AXI4_Interconnect_0_AXI4mslave1_WDATA_0_31to0 = AXI4_Interconnect_0_AXI4mslave1_WDATA[31:0];

assign AXItoAPB_0_APBmslave0_PADDR_0 = { AXItoAPB_0_APBmslave0_PADDR_0_25to0 };
assign AXItoAPB_0_APBmslave0_PADDR_0_25to0 = AXItoAPB_0_APBmslave0_PADDR[25:0];

assign CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0 = { CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_2to2, CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_1to0 };
assign CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_1to0 = CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE[1:0];
assign CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0_2to2 = 1'b0;

assign CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0 = { CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_2to2, CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_1to0 };
assign CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_1to0 = CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE[1:0];
assign CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0_2to2 = 1'b0;

assign PCIe_EP_0_AXI_1_MASTER_ARSIZE_0 = { PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_2to2, PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_1to0 };
assign PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_1to0 = PCIe_EP_0_AXI_1_MASTER_ARSIZE[1:0];
assign PCIe_EP_0_AXI_1_MASTER_ARSIZE_0_2to2 = 1'b0;

assign PCIe_EP_0_AXI_1_MASTER_AWSIZE_0 = { PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_2to2, PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_1to0 };
assign PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_1to0 = PCIe_EP_0_AXI_1_MASTER_AWSIZE[1:0];
assign PCIe_EP_0_AXI_1_MASTER_AWSIZE_0_2to2 = 1'b0;

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND3
AND3 AND3_0(
        // Inputs
        .A ( CCC_111MHz_0_PLL_LOCK_0 ),
        .B ( BANK0_1_7_CALIB_DONE_net_0 ),
        .C ( USER_RESETN ),
        // Outputs
        .Y ( AND3_0_Y ) 
        );

//--------AXI4_Interconnect
AXI4_Interconnect AXI4_Interconnect_0(
        // Inputs
        .ACLK             ( PF_DDR4_SS_0_SYS_CLK ),
        .ARESETN          ( PF_RESET_0_FABRIC_RESET_N ),
        .S_CLK0           ( CLKINT_0_Y ),
        .S_CLK2           ( PF_DDR3_SS_0_SYS_CLK ),
        .SLAVE1_AWREADY   ( AXI4_Interconnect_0_AXI4mslave1_AWREADY ),
        .SLAVE1_WREADY    ( AXI4_Interconnect_0_AXI4mslave1_WREADY ),
        .SLAVE1_BID       ( AXI4_Interconnect_0_AXI4mslave1_BID ),
        .SLAVE1_BRESP     ( AXI4_Interconnect_0_AXI4mslave1_BRESP ),
        .SLAVE1_BVALID    ( AXI4_Interconnect_0_AXI4mslave1_BVALID ),
        .SLAVE1_ARREADY   ( AXI4_Interconnect_0_AXI4mslave1_ARREADY ),
        .SLAVE1_RID       ( AXI4_Interconnect_0_AXI4mslave1_RID ),
        .SLAVE1_RDATA     ( AXI4_Interconnect_0_AXI4mslave1_RDATA ),
        .SLAVE1_RRESP     ( AXI4_Interconnect_0_AXI4mslave1_RRESP ),
        .SLAVE1_RLAST     ( AXI4_Interconnect_0_AXI4mslave1_RLAST ),
        .SLAVE1_RVALID    ( AXI4_Interconnect_0_AXI4mslave1_RVALID ),
        .SLAVE1_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE1_RUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE2_AWREADY   ( AXI4_Interconnect_0_AXI4mslave2_AWREADY ),
        .SLAVE2_WREADY    ( AXI4_Interconnect_0_AXI4mslave2_WREADY ),
        .SLAVE2_BID       ( AXI4_Interconnect_0_AXI4mslave2_BID ),
        .SLAVE2_BRESP     ( AXI4_Interconnect_0_AXI4mslave2_BRESP ),
        .SLAVE2_BVALID    ( AXI4_Interconnect_0_AXI4mslave2_BVALID ),
        .SLAVE2_ARREADY   ( AXI4_Interconnect_0_AXI4mslave2_ARREADY ),
        .SLAVE2_RID       ( AXI4_Interconnect_0_AXI4mslave2_RID ),
        .SLAVE2_RDATA     ( AXI4_Interconnect_0_AXI4mslave2_RDATA ),
        .SLAVE2_RRESP     ( AXI4_Interconnect_0_AXI4mslave2_RRESP ),
        .SLAVE2_RLAST     ( AXI4_Interconnect_0_AXI4mslave2_RLAST ),
        .SLAVE2_RVALID    ( AXI4_Interconnect_0_AXI4mslave2_RVALID ),
        .SLAVE2_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE2_RUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE3_AWREADY   ( AXI4_Interconnect_0_AXI4mslave3_AWREADY ),
        .SLAVE3_WREADY    ( AXI4_Interconnect_0_AXI4mslave3_WREADY ),
        .SLAVE3_BID       ( AXI4_Interconnect_0_AXI4mslave3_BID ),
        .SLAVE3_BRESP     ( AXI4_Interconnect_0_AXI4mslave3_BRESP ),
        .SLAVE3_BVALID    ( AXI4_Interconnect_0_AXI4mslave3_BVALID ),
        .SLAVE3_ARREADY   ( AXI4_Interconnect_0_AXI4mslave3_ARREADY ),
        .SLAVE3_RID       ( AXI4_Interconnect_0_AXI4mslave3_RID ),
        .SLAVE3_RDATA     ( AXI4_Interconnect_0_AXI4mslave3_RDATA ),
        .SLAVE3_RRESP     ( AXI4_Interconnect_0_AXI4mslave3_RRESP ),
        .SLAVE3_RLAST     ( AXI4_Interconnect_0_AXI4mslave3_RLAST ),
        .SLAVE3_RVALID    ( AXI4_Interconnect_0_AXI4mslave3_RVALID ),
        .SLAVE3_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE3_RUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE4_AWREADY   ( AXI4_Interconnect_0_AXI4mslave4_AWREADY ),
        .SLAVE4_WREADY    ( AXI4_Interconnect_0_AXI4mslave4_WREADY ),
        .SLAVE4_BID       ( AXI4_Interconnect_0_AXI4mslave4_BID ),
        .SLAVE4_BRESP     ( AXI4_Interconnect_0_AXI4mslave4_BRESP ),
        .SLAVE4_BVALID    ( AXI4_Interconnect_0_AXI4mslave4_BVALID ),
        .SLAVE4_ARREADY   ( AXI4_Interconnect_0_AXI4mslave4_ARREADY ),
        .SLAVE4_RID       ( AXI4_Interconnect_0_AXI4mslave4_RID ),
        .SLAVE4_RDATA     ( AXI4_Interconnect_0_AXI4mslave4_RDATA ),
        .SLAVE4_RRESP     ( AXI4_Interconnect_0_AXI4mslave4_RRESP ),
        .SLAVE4_RLAST     ( AXI4_Interconnect_0_AXI4mslave4_RLAST ),
        .SLAVE4_RVALID    ( AXI4_Interconnect_0_AXI4mslave4_RVALID ),
        .SLAVE4_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE4_RUSER     ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_AWID     ( PCIe_EP_0_AXI_1_MASTER_AWID ),
        .MASTER0_AWADDR   ( PCIe_EP_0_AXI_1_MASTER_AWADDR ),
        .MASTER0_AWLEN    ( PCIe_EP_0_AXI_1_MASTER_AWLEN ),
        .MASTER0_AWSIZE   ( PCIe_EP_0_AXI_1_MASTER_AWSIZE_0 ),
        .MASTER0_AWBURST  ( PCIe_EP_0_AXI_1_MASTER_AWBURST ),
        .MASTER0_AWLOCK   ( MASTER0_AWLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER0_AWCACHE  ( MASTER0_AWCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWPROT   ( MASTER0_AWPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_AWQOS    ( MASTER0_AWQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWREGION ( MASTER0_AWREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_AWVALID  ( PCIe_EP_0_AXI_1_MASTER_AWVALID ),
        .MASTER0_WDATA    ( PCIe_EP_0_AXI_1_MASTER_WDATA ),
        .MASTER0_WSTRB    ( PCIe_EP_0_AXI_1_MASTER_WSTRB ),
        .MASTER0_WLAST    ( PCIe_EP_0_AXI_1_MASTER_WLAST ),
        .MASTER0_WVALID   ( PCIe_EP_0_AXI_1_MASTER_WVALID ),
        .MASTER0_BREADY   ( PCIe_EP_0_AXI_1_MASTER_BREADY ),
        .MASTER0_ARID     ( PCIe_EP_0_AXI_1_MASTER_ARID ),
        .MASTER0_ARADDR   ( PCIe_EP_0_AXI_1_MASTER_ARADDR ),
        .MASTER0_ARLEN    ( PCIe_EP_0_AXI_1_MASTER_ARLEN ),
        .MASTER0_ARSIZE   ( PCIe_EP_0_AXI_1_MASTER_ARSIZE_0 ),
        .MASTER0_ARBURST  ( PCIe_EP_0_AXI_1_MASTER_ARBURST ),
        .MASTER0_ARLOCK   ( MASTER0_ARLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER0_ARCACHE  ( MASTER0_ARCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARPROT   ( MASTER0_ARPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER0_ARQOS    ( MASTER0_ARQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARREGION ( MASTER0_ARREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER0_ARVALID  ( PCIe_EP_0_AXI_1_MASTER_ARVALID ),
        .MASTER0_RREADY   ( PCIe_EP_0_AXI_1_MASTER_RREADY ),
        .MASTER0_AWUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_WUSER    ( GND_net ), // tied to 1'b0 from definition
        .MASTER0_ARUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER1_AWID     ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWID ),
        .MASTER1_AWADDR   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWADDR ),
        .MASTER1_AWLEN    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWLEN ),
        .MASTER1_AWSIZE   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWSIZE ),
        .MASTER1_AWBURST  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWBURST ),
        .MASTER1_AWLOCK   ( MASTER1_AWLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER1_AWCACHE  ( MASTER1_AWCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_AWPROT   ( MASTER1_AWPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER1_AWQOS    ( MASTER1_AWQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_AWREGION ( MASTER1_AWREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_AWVALID  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWVALID ),
        .MASTER1_WDATA    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WDATA ),
        .MASTER1_WSTRB    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WSTRB ),
        .MASTER1_WLAST    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WLAST ),
        .MASTER1_WVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WVALID ),
        .MASTER1_BREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BREADY ),
        .MASTER1_ARID     ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARID ),
        .MASTER1_ARADDR   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARADDR ),
        .MASTER1_ARLEN    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARLEN ),
        .MASTER1_ARSIZE   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARSIZE ),
        .MASTER1_ARBURST  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARBURST ),
        .MASTER1_ARLOCK   ( MASTER1_ARLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER1_ARCACHE  ( MASTER1_ARCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_ARPROT   ( MASTER1_ARPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER1_ARQOS    ( MASTER1_ARQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_ARREGION ( MASTER1_ARREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER1_ARVALID  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARVALID ),
        .MASTER1_RREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RREADY ),
        .MASTER1_AWUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER1_WUSER    ( GND_net ), // tied to 1'b0 from definition
        .MASTER1_ARUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER2_AWID     ( CoreDMA_IO_CTRL_0_AXI4_M_AWID ),
        .MASTER2_AWADDR   ( CoreDMA_IO_CTRL_0_AXI4_M_AWADDR ),
        .MASTER2_AWLEN    ( CoreDMA_IO_CTRL_0_AXI4_M_AWLEN ),
        .MASTER2_AWSIZE   ( CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE_0 ),
        .MASTER2_AWBURST  ( CoreDMA_IO_CTRL_0_AXI4_M_AWBURST ),
        .MASTER2_AWLOCK   ( MASTER2_AWLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER2_AWCACHE  ( MASTER2_AWCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_AWPROT   ( MASTER2_AWPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER2_AWQOS    ( MASTER2_AWQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_AWREGION ( MASTER2_AWREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_AWVALID  ( CoreDMA_IO_CTRL_0_AXI4_M_AWVALID ),
        .MASTER2_WDATA    ( CoreDMA_IO_CTRL_0_AXI4_M_WDATA ),
        .MASTER2_WSTRB    ( CoreDMA_IO_CTRL_0_AXI4_M_WSTRB ),
        .MASTER2_WLAST    ( CoreDMA_IO_CTRL_0_AXI4_M_WLAST ),
        .MASTER2_WVALID   ( CoreDMA_IO_CTRL_0_AXI4_M_WVALID ),
        .MASTER2_BREADY   ( CoreDMA_IO_CTRL_0_AXI4_M_BREADY ),
        .MASTER2_ARID     ( CoreDMA_IO_CTRL_0_AXI4_M_ARID ),
        .MASTER2_ARADDR   ( CoreDMA_IO_CTRL_0_AXI4_M_ARADDR ),
        .MASTER2_ARLEN    ( CoreDMA_IO_CTRL_0_AXI4_M_ARLEN ),
        .MASTER2_ARSIZE   ( CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE_0 ),
        .MASTER2_ARBURST  ( CoreDMA_IO_CTRL_0_AXI4_M_ARBURST ),
        .MASTER2_ARLOCK   ( MASTER2_ARLOCK_const_net_0 ), // tied to 2'h0 from definition
        .MASTER2_ARCACHE  ( MASTER2_ARCACHE_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_ARPROT   ( MASTER2_ARPROT_const_net_0 ), // tied to 3'h0 from definition
        .MASTER2_ARQOS    ( MASTER2_ARQOS_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_ARREGION ( MASTER2_ARREGION_const_net_0 ), // tied to 4'h0 from definition
        .MASTER2_ARVALID  ( CoreDMA_IO_CTRL_0_AXI4_M_ARVALID ),
        .MASTER2_RREADY   ( CoreDMA_IO_CTRL_0_AXI4_M_RREADY ),
        .MASTER2_AWUSER   ( GND_net ), // tied to 1'b0 from definition
        .MASTER2_WUSER    ( GND_net ), // tied to 1'b0 from definition
        .MASTER2_ARUSER   ( GND_net ), // tied to 1'b0 from definition
        .SLAVE0_AWREADY   ( AXI4_Interconnect_0_AXI3mslave0_AWREADY ),
        .SLAVE0_WREADY    ( AXI4_Interconnect_0_AXI3mslave0_WREADY ),
        .SLAVE0_BID       ( AXI4_Interconnect_0_AXI3mslave0_BID ),
        .SLAVE0_BRESP     ( AXI4_Interconnect_0_AXI3mslave0_BRESP ),
        .SLAVE0_BVALID    ( AXI4_Interconnect_0_AXI3mslave0_BVALID ),
        .SLAVE0_ARREADY   ( AXI4_Interconnect_0_AXI3mslave0_ARREADY ),
        .SLAVE0_RID       ( AXI4_Interconnect_0_AXI3mslave0_RID ),
        .SLAVE0_RDATA     ( AXI4_Interconnect_0_AXI3mslave0_RDATA ),
        .SLAVE0_RRESP     ( AXI4_Interconnect_0_AXI3mslave0_RRESP ),
        .SLAVE0_RLAST     ( AXI4_Interconnect_0_AXI3mslave0_RLAST ),
        .SLAVE0_RVALID    ( AXI4_Interconnect_0_AXI3mslave0_RVALID ),
        .SLAVE0_BUSER     ( GND_net ), // tied to 1'b0 from definition
        .SLAVE0_RUSER     ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .SLAVE1_AWID      ( AXI4_Interconnect_0_AXI4mslave1_AWID ),
        .SLAVE1_AWADDR    ( AXI4_Interconnect_0_AXI4mslave1_AWADDR ),
        .SLAVE1_AWLEN     ( AXI4_Interconnect_0_AXI4mslave1_AWLEN ),
        .SLAVE1_AWSIZE    ( AXI4_Interconnect_0_AXI4mslave1_AWSIZE ),
        .SLAVE1_AWBURST   ( AXI4_Interconnect_0_AXI4mslave1_AWBURST ),
        .SLAVE1_AWLOCK    ( AXI4_Interconnect_0_AXI4mslave1_AWLOCK ),
        .SLAVE1_AWCACHE   ( AXI4_Interconnect_0_AXI4mslave1_AWCACHE ),
        .SLAVE1_AWPROT    ( AXI4_Interconnect_0_AXI4mslave1_AWPROT ),
        .SLAVE1_AWQOS     ( AXI4_Interconnect_0_AXI4mslave1_AWQOS ),
        .SLAVE1_AWREGION  ( AXI4_Interconnect_0_AXI4mslave1_AWREGION ),
        .SLAVE1_AWVALID   ( AXI4_Interconnect_0_AXI4mslave1_AWVALID ),
        .SLAVE1_WDATA     ( AXI4_Interconnect_0_AXI4mslave1_WDATA ),
        .SLAVE1_WSTRB     ( AXI4_Interconnect_0_AXI4mslave1_WSTRB ),
        .SLAVE1_WLAST     ( AXI4_Interconnect_0_AXI4mslave1_WLAST ),
        .SLAVE1_WVALID    ( AXI4_Interconnect_0_AXI4mslave1_WVALID ),
        .SLAVE1_BREADY    ( AXI4_Interconnect_0_AXI4mslave1_BREADY ),
        .SLAVE1_ARID      ( AXI4_Interconnect_0_AXI4mslave1_ARID ),
        .SLAVE1_ARADDR    ( AXI4_Interconnect_0_AXI4mslave1_ARADDR ),
        .SLAVE1_ARLEN     ( AXI4_Interconnect_0_AXI4mslave1_ARLEN ),
        .SLAVE1_ARSIZE    ( AXI4_Interconnect_0_AXI4mslave1_ARSIZE ),
        .SLAVE1_ARBURST   ( AXI4_Interconnect_0_AXI4mslave1_ARBURST ),
        .SLAVE1_ARLOCK    ( AXI4_Interconnect_0_AXI4mslave1_ARLOCK ),
        .SLAVE1_ARCACHE   ( AXI4_Interconnect_0_AXI4mslave1_ARCACHE ),
        .SLAVE1_ARPROT    ( AXI4_Interconnect_0_AXI4mslave1_ARPROT ),
        .SLAVE1_ARQOS     ( AXI4_Interconnect_0_AXI4mslave1_ARQOS ),
        .SLAVE1_ARREGION  ( AXI4_Interconnect_0_AXI4mslave1_ARREGION ),
        .SLAVE1_ARVALID   ( AXI4_Interconnect_0_AXI4mslave1_ARVALID ),
        .SLAVE1_RREADY    ( AXI4_Interconnect_0_AXI4mslave1_RREADY ),
        .SLAVE1_AWUSER    ( AXI4_Interconnect_0_AXI4mslave1_AWUSER ),
        .SLAVE1_WUSER     ( AXI4_Interconnect_0_AXI4mslave1_WUSER ),
        .SLAVE1_ARUSER    ( AXI4_Interconnect_0_AXI4mslave1_ARUSER ),
        .SLAVE2_AWID      ( AXI4_Interconnect_0_AXI4mslave2_AWID ),
        .SLAVE2_AWADDR    ( AXI4_Interconnect_0_AXI4mslave2_AWADDR ),
        .SLAVE2_AWLEN     ( AXI4_Interconnect_0_AXI4mslave2_AWLEN ),
        .SLAVE2_AWSIZE    ( AXI4_Interconnect_0_AXI4mslave2_AWSIZE ),
        .SLAVE2_AWBURST   ( AXI4_Interconnect_0_AXI4mslave2_AWBURST ),
        .SLAVE2_AWLOCK    ( AXI4_Interconnect_0_AXI4mslave2_AWLOCK ),
        .SLAVE2_AWCACHE   ( AXI4_Interconnect_0_AXI4mslave2_AWCACHE ),
        .SLAVE2_AWPROT    ( AXI4_Interconnect_0_AXI4mslave2_AWPROT ),
        .SLAVE2_AWQOS     ( AXI4_Interconnect_0_AXI4mslave2_AWQOS ),
        .SLAVE2_AWREGION  ( AXI4_Interconnect_0_AXI4mslave2_AWREGION ),
        .SLAVE2_AWVALID   ( AXI4_Interconnect_0_AXI4mslave2_AWVALID ),
        .SLAVE2_WDATA     ( AXI4_Interconnect_0_AXI4mslave2_WDATA ),
        .SLAVE2_WSTRB     ( AXI4_Interconnect_0_AXI4mslave2_WSTRB ),
        .SLAVE2_WLAST     ( AXI4_Interconnect_0_AXI4mslave2_WLAST ),
        .SLAVE2_WVALID    ( AXI4_Interconnect_0_AXI4mslave2_WVALID ),
        .SLAVE2_BREADY    ( AXI4_Interconnect_0_AXI4mslave2_BREADY ),
        .SLAVE2_ARID      ( AXI4_Interconnect_0_AXI4mslave2_ARID ),
        .SLAVE2_ARADDR    ( AXI4_Interconnect_0_AXI4mslave2_ARADDR ),
        .SLAVE2_ARLEN     ( AXI4_Interconnect_0_AXI4mslave2_ARLEN ),
        .SLAVE2_ARSIZE    ( AXI4_Interconnect_0_AXI4mslave2_ARSIZE ),
        .SLAVE2_ARBURST   ( AXI4_Interconnect_0_AXI4mslave2_ARBURST ),
        .SLAVE2_ARLOCK    ( AXI4_Interconnect_0_AXI4mslave2_ARLOCK ),
        .SLAVE2_ARCACHE   ( AXI4_Interconnect_0_AXI4mslave2_ARCACHE ),
        .SLAVE2_ARPROT    ( AXI4_Interconnect_0_AXI4mslave2_ARPROT ),
        .SLAVE2_ARQOS     ( AXI4_Interconnect_0_AXI4mslave2_ARQOS ),
        .SLAVE2_ARREGION  ( AXI4_Interconnect_0_AXI4mslave2_ARREGION ),
        .SLAVE2_ARVALID   ( AXI4_Interconnect_0_AXI4mslave2_ARVALID ),
        .SLAVE2_RREADY    ( AXI4_Interconnect_0_AXI4mslave2_RREADY ),
        .SLAVE2_AWUSER    ( AXI4_Interconnect_0_AXI4mslave2_AWUSER ),
        .SLAVE2_WUSER     ( AXI4_Interconnect_0_AXI4mslave2_WUSER ),
        .SLAVE2_ARUSER    ( AXI4_Interconnect_0_AXI4mslave2_ARUSER ),
        .SLAVE3_AWID      ( AXI4_Interconnect_0_AXI4mslave3_AWID ),
        .SLAVE3_AWADDR    ( AXI4_Interconnect_0_AXI4mslave3_AWADDR ),
        .SLAVE3_AWLEN     ( AXI4_Interconnect_0_AXI4mslave3_AWLEN ),
        .SLAVE3_AWSIZE    ( AXI4_Interconnect_0_AXI4mslave3_AWSIZE ),
        .SLAVE3_AWBURST   ( AXI4_Interconnect_0_AXI4mslave3_AWBURST ),
        .SLAVE3_AWLOCK    ( AXI4_Interconnect_0_AXI4mslave3_AWLOCK ),
        .SLAVE3_AWCACHE   ( AXI4_Interconnect_0_AXI4mslave3_AWCACHE ),
        .SLAVE3_AWPROT    ( AXI4_Interconnect_0_AXI4mslave3_AWPROT ),
        .SLAVE3_AWQOS     ( AXI4_Interconnect_0_AXI4mslave3_AWQOS ),
        .SLAVE3_AWREGION  ( AXI4_Interconnect_0_AXI4mslave3_AWREGION ),
        .SLAVE3_AWVALID   ( AXI4_Interconnect_0_AXI4mslave3_AWVALID ),
        .SLAVE3_WDATA     ( AXI4_Interconnect_0_AXI4mslave3_WDATA ),
        .SLAVE3_WSTRB     ( AXI4_Interconnect_0_AXI4mslave3_WSTRB ),
        .SLAVE3_WLAST     ( AXI4_Interconnect_0_AXI4mslave3_WLAST ),
        .SLAVE3_WVALID    ( AXI4_Interconnect_0_AXI4mslave3_WVALID ),
        .SLAVE3_BREADY    ( AXI4_Interconnect_0_AXI4mslave3_BREADY ),
        .SLAVE3_ARID      ( AXI4_Interconnect_0_AXI4mslave3_ARID ),
        .SLAVE3_ARADDR    ( AXI4_Interconnect_0_AXI4mslave3_ARADDR ),
        .SLAVE3_ARLEN     ( AXI4_Interconnect_0_AXI4mslave3_ARLEN ),
        .SLAVE3_ARSIZE    ( AXI4_Interconnect_0_AXI4mslave3_ARSIZE ),
        .SLAVE3_ARBURST   ( AXI4_Interconnect_0_AXI4mslave3_ARBURST ),
        .SLAVE3_ARLOCK    ( AXI4_Interconnect_0_AXI4mslave3_ARLOCK ),
        .SLAVE3_ARCACHE   ( AXI4_Interconnect_0_AXI4mslave3_ARCACHE ),
        .SLAVE3_ARPROT    ( AXI4_Interconnect_0_AXI4mslave3_ARPROT ),
        .SLAVE3_ARQOS     ( AXI4_Interconnect_0_AXI4mslave3_ARQOS ),
        .SLAVE3_ARREGION  ( AXI4_Interconnect_0_AXI4mslave3_ARREGION ),
        .SLAVE3_ARVALID   ( AXI4_Interconnect_0_AXI4mslave3_ARVALID ),
        .SLAVE3_RREADY    ( AXI4_Interconnect_0_AXI4mslave3_RREADY ),
        .SLAVE3_AWUSER    ( AXI4_Interconnect_0_AXI4mslave3_AWUSER ),
        .SLAVE3_WUSER     ( AXI4_Interconnect_0_AXI4mslave3_WUSER ),
        .SLAVE3_ARUSER    ( AXI4_Interconnect_0_AXI4mslave3_ARUSER ),
        .SLAVE4_AWID      ( AXI4_Interconnect_0_AXI4mslave4_AWID ),
        .SLAVE4_AWADDR    ( AXI4_Interconnect_0_AXI4mslave4_AWADDR ),
        .SLAVE4_AWLEN     ( AXI4_Interconnect_0_AXI4mslave4_AWLEN ),
        .SLAVE4_AWSIZE    ( AXI4_Interconnect_0_AXI4mslave4_AWSIZE ),
        .SLAVE4_AWBURST   ( AXI4_Interconnect_0_AXI4mslave4_AWBURST ),
        .SLAVE4_AWLOCK    ( AXI4_Interconnect_0_AXI4mslave4_AWLOCK ),
        .SLAVE4_AWCACHE   ( AXI4_Interconnect_0_AXI4mslave4_AWCACHE ),
        .SLAVE4_AWPROT    ( AXI4_Interconnect_0_AXI4mslave4_AWPROT ),
        .SLAVE4_AWQOS     ( AXI4_Interconnect_0_AXI4mslave4_AWQOS ),
        .SLAVE4_AWREGION  ( AXI4_Interconnect_0_AXI4mslave4_AWREGION ),
        .SLAVE4_AWVALID   ( AXI4_Interconnect_0_AXI4mslave4_AWVALID ),
        .SLAVE4_WDATA     ( AXI4_Interconnect_0_AXI4mslave4_WDATA ),
        .SLAVE4_WSTRB     ( AXI4_Interconnect_0_AXI4mslave4_WSTRB ),
        .SLAVE4_WLAST     ( AXI4_Interconnect_0_AXI4mslave4_WLAST ),
        .SLAVE4_WVALID    ( AXI4_Interconnect_0_AXI4mslave4_WVALID ),
        .SLAVE4_BREADY    ( AXI4_Interconnect_0_AXI4mslave4_BREADY ),
        .SLAVE4_ARID      ( AXI4_Interconnect_0_AXI4mslave4_ARID ),
        .SLAVE4_ARADDR    ( AXI4_Interconnect_0_AXI4mslave4_ARADDR ),
        .SLAVE4_ARLEN     ( AXI4_Interconnect_0_AXI4mslave4_ARLEN ),
        .SLAVE4_ARSIZE    ( AXI4_Interconnect_0_AXI4mslave4_ARSIZE ),
        .SLAVE4_ARBURST   ( AXI4_Interconnect_0_AXI4mslave4_ARBURST ),
        .SLAVE4_ARLOCK    ( AXI4_Interconnect_0_AXI4mslave4_ARLOCK ),
        .SLAVE4_ARCACHE   ( AXI4_Interconnect_0_AXI4mslave4_ARCACHE ),
        .SLAVE4_ARPROT    ( AXI4_Interconnect_0_AXI4mslave4_ARPROT ),
        .SLAVE4_ARQOS     ( AXI4_Interconnect_0_AXI4mslave4_ARQOS ),
        .SLAVE4_ARREGION  ( AXI4_Interconnect_0_AXI4mslave4_ARREGION ),
        .SLAVE4_ARVALID   ( AXI4_Interconnect_0_AXI4mslave4_ARVALID ),
        .SLAVE4_RREADY    ( AXI4_Interconnect_0_AXI4mslave4_RREADY ),
        .SLAVE4_AWUSER    ( AXI4_Interconnect_0_AXI4mslave4_AWUSER ),
        .SLAVE4_WUSER     ( AXI4_Interconnect_0_AXI4mslave4_WUSER ),
        .SLAVE4_ARUSER    ( AXI4_Interconnect_0_AXI4mslave4_ARUSER ),
        .MASTER0_AWREADY  ( PCIe_EP_0_AXI_1_MASTER_AWREADY ),
        .MASTER0_WREADY   ( AXI4_Interconnect_0_MASTER0_WREADY ),
        .MASTER0_BID      ( PCIe_EP_0_AXI_1_MASTER_BID ),
        .MASTER0_BRESP    ( PCIe_EP_0_AXI_1_MASTER_BRESP ),
        .MASTER0_BVALID   ( PCIe_EP_0_AXI_1_MASTER_BVALID ),
        .MASTER0_ARREADY  ( PCIe_EP_0_AXI_1_MASTER_ARREADY ),
        .MASTER0_RID      ( PCIe_EP_0_AXI_1_MASTER_RID ),
        .MASTER0_RDATA    ( PCIe_EP_0_AXI_1_MASTER_RDATA ),
        .MASTER0_RRESP    ( PCIe_EP_0_AXI_1_MASTER_RRESP ),
        .MASTER0_RLAST    ( PCIe_EP_0_AXI_1_MASTER_RLAST ),
        .MASTER0_RVALID   ( PCIe_EP_0_AXI_1_MASTER_RVALID ),
        .MASTER0_BUSER    ( PCIe_EP_0_AXI_1_MASTER_BUSER ),
        .MASTER0_RUSER    ( PCIe_EP_0_AXI_1_MASTER_RUSER ),
        .MASTER1_AWREADY  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWREADY ),
        .MASTER1_WREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WREADY ),
        .MASTER1_BID      ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BID ),
        .MASTER1_BRESP    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BRESP ),
        .MASTER1_BVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BVALID ),
        .MASTER1_ARREADY  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARREADY ),
        .MASTER1_RID      ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RID ),
        .MASTER1_RDATA    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RDATA ),
        .MASTER1_RRESP    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RRESP ),
        .MASTER1_RLAST    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RLAST ),
        .MASTER1_RVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RVALID ),
        .MASTER1_BUSER    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BUSER ),
        .MASTER1_RUSER    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RUSER ),
        .MASTER2_AWREADY  ( CoreDMA_IO_CTRL_0_AXI4_M_AWREADY ),
        .MASTER2_WREADY   ( CoreDMA_IO_CTRL_0_AXI4_M_WREADY ),
        .MASTER2_BID      ( CoreDMA_IO_CTRL_0_AXI4_M_BID ),
        .MASTER2_BRESP    ( CoreDMA_IO_CTRL_0_AXI4_M_BRESP ),
        .MASTER2_BVALID   ( CoreDMA_IO_CTRL_0_AXI4_M_BVALID ),
        .MASTER2_ARREADY  ( CoreDMA_IO_CTRL_0_AXI4_M_ARREADY ),
        .MASTER2_RID      ( CoreDMA_IO_CTRL_0_AXI4_M_RID ),
        .MASTER2_RDATA    ( CoreDMA_IO_CTRL_0_AXI4_M_RDATA ),
        .MASTER2_RRESP    ( CoreDMA_IO_CTRL_0_AXI4_M_RRESP ),
        .MASTER2_RLAST    ( CoreDMA_IO_CTRL_0_AXI4_M_RLAST ),
        .MASTER2_RVALID   ( CoreDMA_IO_CTRL_0_AXI4_M_RVALID ),
        .MASTER2_BUSER    ( CoreDMA_IO_CTRL_0_AXI4_M_BUSER ),
        .MASTER2_RUSER    ( CoreDMA_IO_CTRL_0_AXI4_M_RUSER ),
        .SLAVE0_AWID      ( AXI4_Interconnect_0_AXI3mslave0_AWID ),
        .SLAVE0_AWADDR    ( AXI4_Interconnect_0_AXI3mslave0_AWADDR ),
        .SLAVE0_AWLEN     ( AXI4_Interconnect_0_AXI3mslave0_AWLEN ),
        .SLAVE0_AWSIZE    ( AXI4_Interconnect_0_AXI3mslave0_AWSIZE ),
        .SLAVE0_AWBURST   ( AXI4_Interconnect_0_AXI3mslave0_AWBURST ),
        .SLAVE0_AWLOCK    ( AXI4_Interconnect_0_AXI3mslave0_AWLOCK ),
        .SLAVE0_AWCACHE   ( AXI4_Interconnect_0_AXI3mslave0_AWCACHE ),
        .SLAVE0_AWPROT    ( AXI4_Interconnect_0_AXI3mslave0_AWPROT ),
        .SLAVE0_AWVALID   ( AXI4_Interconnect_0_AXI3mslave0_AWVALID ),
        .SLAVE0_WID       ( AXI4_Interconnect_0_AXI3mslave0_WID ),
        .SLAVE0_WDATA     ( AXI4_Interconnect_0_AXI3mslave0_WDATA ),
        .SLAVE0_WSTRB     ( AXI4_Interconnect_0_AXI3mslave0_WSTRB ),
        .SLAVE0_WLAST     ( AXI4_Interconnect_0_AXI3mslave0_WLAST ),
        .SLAVE0_WVALID    ( AXI4_Interconnect_0_AXI3mslave0_WVALID ),
        .SLAVE0_BREADY    ( AXI4_Interconnect_0_AXI3mslave0_BREADY ),
        .SLAVE0_ARID      ( AXI4_Interconnect_0_AXI3mslave0_ARID ),
        .SLAVE0_ARADDR    ( AXI4_Interconnect_0_AXI3mslave0_ARADDR ),
        .SLAVE0_ARLEN     ( AXI4_Interconnect_0_AXI3mslave0_ARLEN ),
        .SLAVE0_ARSIZE    ( AXI4_Interconnect_0_AXI3mslave0_ARSIZE ),
        .SLAVE0_ARBURST   ( AXI4_Interconnect_0_AXI3mslave0_ARBURST ),
        .SLAVE0_ARLOCK    ( AXI4_Interconnect_0_AXI3mslave0_ARLOCK ),
        .SLAVE0_ARCACHE   ( AXI4_Interconnect_0_AXI3mslave0_ARCACHE ),
        .SLAVE0_ARPROT    ( AXI4_Interconnect_0_AXI3mslave0_ARPROT ),
        .SLAVE0_ARVALID   ( AXI4_Interconnect_0_AXI3mslave0_ARVALID ),
        .SLAVE0_RREADY    ( AXI4_Interconnect_0_AXI3mslave0_RREADY ),
        .SLAVE0_AWUSER    ( AXI4_Interconnect_0_AXI3mslave0_AWUSER ),
        .SLAVE0_WUSER     ( AXI4_Interconnect_0_AXI3mslave0_WUSER ),
        .SLAVE0_ARUSER    ( AXI4_Interconnect_0_AXI3mslave0_ARUSER ) 
        );

//--------AXItoAPB
AXItoAPB AXItoAPB_0(
        // Inputs
        .ARESETN   ( PF_RESET_0_FABRIC_RESET_N ),
        .ACLK      ( CLKINT_0_Y ),
        .PREADYS0  ( AXItoAPB_0_APBmslave0_PREADY ),
        .PSLVERRS0 ( AXItoAPB_0_APBmslave0_PSLVERR ),
        .AWVALID   ( AXI4_Interconnect_0_AXI3mslave0_AWVALID ),
        .WLAST     ( AXI4_Interconnect_0_AXI3mslave0_WLAST ),
        .WVALID    ( AXI4_Interconnect_0_AXI3mslave0_WVALID ),
        .BREADY    ( AXI4_Interconnect_0_AXI3mslave0_BREADY ),
        .ARVALID   ( AXI4_Interconnect_0_AXI3mslave0_ARVALID ),
        .RREADY    ( AXI4_Interconnect_0_AXI3mslave0_RREADY ),
        .PRDATAS0  ( AXItoAPB_0_APBmslave0_PRDATA ),
        .AWID      ( AXI4_Interconnect_0_AXI3mslave0_AWID ),
        .AWADDR    ( AXI4_Interconnect_0_AXI3mslave0_AWADDR ),
        .AWLEN     ( AXI4_Interconnect_0_AXI3mslave0_AWLEN_0 ),
        .AWSIZE    ( AXI4_Interconnect_0_AXI3mslave0_AWSIZE ),
        .AWBURST   ( AXI4_Interconnect_0_AXI3mslave0_AWBURST ),
        .WID_BIF   ( AXI4_Interconnect_0_AXI3mslave0_WID ),
        .WDATA     ( AXI4_Interconnect_0_AXI3mslave0_WDATA ),
        .WSTRB     ( AXI4_Interconnect_0_AXI3mslave0_WSTRB ),
        .ARID      ( AXI4_Interconnect_0_AXI3mslave0_ARID ),
        .ARADDR    ( AXI4_Interconnect_0_AXI3mslave0_ARADDR ),
        .ARLEN     ( AXI4_Interconnect_0_AXI3mslave0_ARLEN_0 ),
        .ARSIZE    ( AXI4_Interconnect_0_AXI3mslave0_ARSIZE ),
        .ARBURST   ( AXI4_Interconnect_0_AXI3mslave0_ARBURST ),
        // Outputs
        .PSELS0    ( AXItoAPB_0_APBmslave0_PSELx ),
        .PENABLES  ( AXItoAPB_0_APBmslave0_PENABLE ),
        .PWRITES   ( AXItoAPB_0_APBmslave0_PWRITE ),
        .AWREADY   ( AXI4_Interconnect_0_AXI3mslave0_AWREADY ),
        .WREADY    ( AXI4_Interconnect_0_AXI3mslave0_WREADY ),
        .BVALID    ( AXI4_Interconnect_0_AXI3mslave0_BVALID ),
        .ARREADY   ( AXI4_Interconnect_0_AXI3mslave0_ARREADY ),
        .RLAST     ( AXI4_Interconnect_0_AXI3mslave0_RLAST ),
        .RVALID    ( AXI4_Interconnect_0_AXI3mslave0_RVALID ),
        .PADDRS    ( AXItoAPB_0_APBmslave0_PADDR ),
        .PWDATAS   ( AXItoAPB_0_APBmslave0_PWDATA ),
        .BID       ( AXI4_Interconnect_0_AXI3mslave0_BID ),
        .BRESP     ( AXI4_Interconnect_0_AXI3mslave0_BRESP ),
        .RID       ( AXI4_Interconnect_0_AXI3mslave0_RID ),
        .RDATA     ( AXI4_Interconnect_0_AXI3mslave0_RDATA ),
        .RRESP     ( AXI4_Interconnect_0_AXI3mslave0_RRESP ) 
        );

//--------CCC_111MHz
CCC_111MHz CCC_111MHz_0(
        // Inputs
        .REF_CLK_0     ( REF_CLK_0 ),
        // Outputs
        .OUT0_FABCLK_0 ( CCC_111MHz_0_OUT0_FABCLK_0 ),
        .PLL_LOCK_0    ( CCC_111MHz_0_PLL_LOCK_0 ) 
        );

//--------CLKINT
CLKINT CLKINT_0(
        // Inputs
        .A ( REF_CLK_0 ),
        // Outputs
        .Y ( CLKINT_0_Y ) 
        );

//--------CoreDMA_IO_CTRL
CoreDMA_IO_CTRL CoreDMA_IO_CTRL_0(
        // Inputs
        .RESETN       ( PF_RESET_0_FABRIC_RESET_N ),
        .CLOCK        ( PF_DDR4_SS_0_SYS_CLK ),
        .awready_i    ( CoreDMA_IO_CTRL_0_AXI4_M_AWREADY ),
        .wready_i     ( CoreDMA_IO_CTRL_0_AXI4_M_WREADY ),
        .bvalid_i     ( CoreDMA_IO_CTRL_0_AXI4_M_BVALID ),
        .arready_i    ( CoreDMA_IO_CTRL_0_AXI4_M_ARREADY ),
        .rlast_i      ( CoreDMA_IO_CTRL_0_AXI4_M_RLAST ),
        .rvalid_i     ( CoreDMA_IO_CTRL_0_AXI4_M_RVALID ),
        .RX           ( RX ),
        .DMA_AWREADY  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWREADY ),
        .DMA_WREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WREADY ),
        .DMA_BVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BVALID ),
        .DMA_ARREADY  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARREADY ),
        .DMA_RLAST    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RLAST ),
        .DMA_RVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RVALID ),
        .dma_wready_i ( AXI4_Interconnect_0_MASTER0_WREADY ),
        .pcie_int_i   ( PCIe_EP_0_PCIE_1_INTERRUPT_OUT ),
        .dma_wvalid_i ( PCIe_EP_0_AXI_1_MASTER_WVALID ),
        .rready_i     ( AXI4_Interconnect_0_AXI4mslave1_RREADY ),
        .arvalid_i    ( AXI4_Interconnect_0_AXI4mslave1_ARVALID ),
        .bready_i     ( AXI4_Interconnect_0_AXI4mslave1_BREADY ),
        .wvalid_i     ( AXI4_Interconnect_0_AXI4mslave1_WVALID ),
        .wlast_i      ( AXI4_Interconnect_0_AXI4mslave1_WLAST ),
        .awvalid_i    ( AXI4_Interconnect_0_AXI4mslave1_AWVALID ),
        .bid_i        ( CoreDMA_IO_CTRL_0_AXI4_M_BID ),
        .bresp_i      ( CoreDMA_IO_CTRL_0_AXI4_M_BRESP ),
        .rid_i        ( CoreDMA_IO_CTRL_0_AXI4_M_RID ),
        .rdata_i      ( CoreDMA_IO_CTRL_0_AXI4_M_RDATA ),
        .rresp_i      ( CoreDMA_IO_CTRL_0_AXI4_M_RRESP ),
        .DMA_BID      ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BID ),
        .DMA_BRESP    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BRESP ),
        .DMA_RID      ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RID ),
        .DMA_RDATA    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RDATA ),
        .DMA_RRESP    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RRESP ),
        .dip_switch_o ( dip_switch_o ),
        .araddr_i     ( AXI4_Interconnect_0_AXI4mslave1_ARADDR_0 ),
        .arid_i       ( AXI4_Interconnect_0_AXI4mslave1_ARID ),
        .wdata_i      ( AXI4_Interconnect_0_AXI4mslave1_WDATA_0 ),
        .awaddr_i     ( AXI4_Interconnect_0_AXI4mslave1_AWADDR_0 ),
        .awid_i       ( AXI4_Interconnect_0_AXI4mslave1_AWID ),
        // Outputs
        .awvalid_o    ( CoreDMA_IO_CTRL_0_AXI4_M_AWVALID ),
        .wlast_o      ( CoreDMA_IO_CTRL_0_AXI4_M_WLAST ),
        .wvalid_o     ( CoreDMA_IO_CTRL_0_AXI4_M_WVALID ),
        .bready_o     ( CoreDMA_IO_CTRL_0_AXI4_M_BREADY ),
        .arvalid_o    ( CoreDMA_IO_CTRL_0_AXI4_M_ARVALID ),
        .rready_o     ( CoreDMA_IO_CTRL_0_AXI4_M_RREADY ),
        .TX           ( TX_net_0 ),
        .DMA_AWVALID  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWVALID ),
        .DMA_WLAST    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WLAST ),
        .DMA_WVALID   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WVALID ),
        .DMA_BREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_BREADY ),
        .DMA_ARVALID  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARVALID ),
        .DMA_RREADY   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_RREADY ),
        .rvalid_o     ( AXI4_Interconnect_0_AXI4mslave1_RVALID ),
        .rlast_o      ( AXI4_Interconnect_0_AXI4mslave1_RLAST ),
        .arready_o    ( AXI4_Interconnect_0_AXI4mslave1_ARREADY ),
        .bvalid_o     ( AXI4_Interconnect_0_AXI4mslave1_BVALID ),
        .wready_o     ( AXI4_Interconnect_0_AXI4mslave1_WREADY ),
        .awready_o    ( AXI4_Interconnect_0_AXI4mslave1_AWREADY ),
        .awid_o       ( CoreDMA_IO_CTRL_0_AXI4_M_AWID ),
        .awaddr_o     ( CoreDMA_IO_CTRL_0_AXI4_M_AWADDR ),
        .awlen_o      ( CoreDMA_IO_CTRL_0_AXI4_M_AWLEN ),
        .awsize_o     ( CoreDMA_IO_CTRL_0_AXI4_M_AWSIZE ),
        .awburst_o    ( CoreDMA_IO_CTRL_0_AXI4_M_AWBURST ),
        .wdata_o      ( CoreDMA_IO_CTRL_0_AXI4_M_WDATA ),
        .wstrb_o      ( CoreDMA_IO_CTRL_0_AXI4_M_WSTRB ),
        .arid_o       ( CoreDMA_IO_CTRL_0_AXI4_M_ARID ),
        .araddr_o     ( CoreDMA_IO_CTRL_0_AXI4_M_ARADDR ),
        .arlen_o      ( CoreDMA_IO_CTRL_0_AXI4_M_ARLEN ),
        .arsize_o     ( CoreDMA_IO_CTRL_0_AXI4_M_ARSIZE ),
        .arburst_o    ( CoreDMA_IO_CTRL_0_AXI4_M_ARBURST ),
        .DMA_AWID     ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWID ),
        .DMA_AWADDR   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWADDR ),
        .DMA_AWLEN    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWLEN ),
        .DMA_AWSIZE   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWSIZE ),
        .DMA_AWBURST  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_AWBURST ),
        .DMA_WDATA    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WDATA ),
        .DMA_WSTRB    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_WSTRB ),
        .DMA_ARID     ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARID ),
        .DMA_ARADDR   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARADDR ),
        .DMA_ARLEN    ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARLEN ),
        .DMA_ARSIZE   ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARSIZE ),
        .DMA_ARBURST  ( CoreDMA_IO_CTRL_0_AXI4MasterDMA_IF_ARBURST ),
        .led_o        ( led_o_net_0 ),
        .rresp_o      ( AXI4_Interconnect_0_AXI4mslave1_RRESP ),
        .rdata_o      ( AXI4_Interconnect_0_AXI4mslave1_RDATA ),
        .rid_o        ( AXI4_Interconnect_0_AXI4mslave1_RID ),
        .bresp_o      ( AXI4_Interconnect_0_AXI4mslave1_BRESP ),
        .bid_o        ( AXI4_Interconnect_0_AXI4mslave1_BID ) 
        );

//--------PCIe_EP
PCIe_EP PCIe_EP_0(
        // Inputs
        .PCIESS_LANE_RXD0_P     ( PCIESS_LANE_RXD0_P ),
        .PCIESS_LANE_RXD0_N     ( PCIESS_LANE_RXD0_N ),
        .PCIESS_LANE_RXD1_P     ( PCIESS_LANE_RXD1_P ),
        .PCIESS_LANE_RXD1_N     ( PCIESS_LANE_RXD1_N ),
        .PCIESS_LANE_RXD2_P     ( PCIESS_LANE_RXD2_P ),
        .PCIESS_LANE_RXD2_N     ( PCIESS_LANE_RXD2_N ),
        .PCIESS_LANE_RXD3_P     ( PCIESS_LANE_RXD3_P ),
        .PCIESS_LANE_RXD3_N     ( PCIESS_LANE_RXD3_N ),
        .REF_CLK_PAD_P          ( REF_CLK_PAD_P ),
        .REF_CLK_PAD_N          ( REF_CLK_PAD_N ),
        .AXI_CLK_STABLE         ( PLL_LOCK_DDR4_net_0 ),
        .AXI_CLK                ( PF_DDR4_SS_0_SYS_CLK ),
        .APB_S_PCLK             ( CLKINT_0_Y ),
        .RESET_N                ( PF_RESET_0_FABRIC_RESET_N ),
        .PCIE_1_PERST_N         ( PCIE_1_PERST_N ),
        .PCIESS_AXI_1_M_ARREADY ( PCIe_EP_0_AXI_1_MASTER_ARREADY ),
        .PCIESS_AXI_1_M_AWREADY ( PCIe_EP_0_AXI_1_MASTER_AWREADY ),
        .PCIESS_AXI_1_M_BVALID  ( PCIe_EP_0_AXI_1_MASTER_BVALID ),
        .PCIESS_AXI_1_M_RLAST   ( PCIe_EP_0_AXI_1_MASTER_RLAST ),
        .PCIESS_AXI_1_M_RVALID  ( PCIe_EP_0_AXI_1_MASTER_RVALID ),
        .PCIESS_AXI_1_M_WREADY  ( AXI4_Interconnect_0_MASTER0_WREADY ),
        .APB_S_PSEL             ( AXItoAPB_0_APBmslave0_PSELx ),
        .APB_S_PENABLE          ( AXItoAPB_0_APBmslave0_PENABLE ),
        .APB_S_PWRITE           ( AXItoAPB_0_APBmslave0_PWRITE ),
        .switch_i               ( switch_i ),
        .PCIESS_AXI_1_M_BID     ( PCIe_EP_0_AXI_1_MASTER_BID ),
        .PCIESS_AXI_1_M_BRESP   ( PCIe_EP_0_AXI_1_MASTER_BRESP ),
        .PCIESS_AXI_1_M_RID     ( PCIe_EP_0_AXI_1_MASTER_RID ),
        .PCIESS_AXI_1_M_RRESP   ( PCIe_EP_0_AXI_1_MASTER_RRESP ),
        .PCIESS_AXI_1_M_RDATA   ( PCIe_EP_0_AXI_1_MASTER_RDATA ),
        .APB_S_PADDR            ( AXItoAPB_0_APBmslave0_PADDR_0 ),
        .APB_S_PWDATA           ( AXItoAPB_0_APBmslave0_PWDATA ),
        // Outputs
        .PCIESS_LANE_TXD0_P     ( PCIESS_LANE_TXD0_P_net_0 ),
        .PCIESS_LANE_TXD0_N     ( PCIESS_LANE_TXD0_N_net_0 ),
        .PCIESS_LANE_TXD1_P     ( PCIESS_LANE_TXD1_P_net_0 ),
        .PCIESS_LANE_TXD1_N     ( PCIESS_LANE_TXD1_N_net_0 ),
        .PCIESS_LANE_TXD2_P     ( PCIESS_LANE_TXD2_P_net_0 ),
        .PCIESS_LANE_TXD2_N     ( PCIESS_LANE_TXD2_N_net_0 ),
        .PCIESS_LANE_TXD3_P     ( PCIESS_LANE_TXD3_P_net_0 ),
        .PCIESS_LANE_TXD3_N     ( PCIESS_LANE_TXD3_N_net_0 ),
        .DEVICE_INIT_DONE       ( PCIe_EP_0_DEVICE_INIT_DONE ),
        .PCIE_1_INTERRUPT_OUT   ( PCIe_EP_0_PCIE_1_INTERRUPT_OUT ),
        .BANK0_1_7_CALIB_DONE   ( BANK0_1_7_CALIB_DONE_net_0 ),
        .PCIESS_AXI_1_M_ARVALID ( PCIe_EP_0_AXI_1_MASTER_ARVALID ),
        .PCIESS_AXI_1_M_AWVALID ( PCIe_EP_0_AXI_1_MASTER_AWVALID ),
        .PCIESS_AXI_1_M_BREADY  ( PCIe_EP_0_AXI_1_MASTER_BREADY ),
        .PCIESS_AXI_1_M_RREADY  ( PCIe_EP_0_AXI_1_MASTER_RREADY ),
        .PCIESS_AXI_1_M_WLAST   ( PCIe_EP_0_AXI_1_MASTER_WLAST ),
        .PCIESS_AXI_1_M_WVALID  ( PCIe_EP_0_AXI_1_MASTER_WVALID ),
        .APB_S_PREADY           ( AXItoAPB_0_APBmslave0_PREADY ),
        .APB_S_PSLVERR          ( AXItoAPB_0_APBmslave0_PSLVERR ),
        .PCIESS_AXI_1_M_ARBURST ( PCIe_EP_0_AXI_1_MASTER_ARBURST ),
        .PCIESS_AXI_1_M_ARLEN   ( PCIe_EP_0_AXI_1_MASTER_ARLEN ),
        .PCIESS_AXI_1_M_ARSIZE  ( PCIe_EP_0_AXI_1_MASTER_ARSIZE ),
        .PCIESS_AXI_1_M_AWBURST ( PCIe_EP_0_AXI_1_MASTER_AWBURST ),
        .PCIESS_AXI_1_M_AWLEN   ( PCIe_EP_0_AXI_1_MASTER_AWLEN ),
        .PCIESS_AXI_1_M_AWSIZE  ( PCIe_EP_0_AXI_1_MASTER_AWSIZE ),
        .PCIESS_AXI_1_M_WSTRB   ( PCIe_EP_0_AXI_1_MASTER_WSTRB ),
        .PCIESS_AXI_1_M_ARID    ( PCIe_EP_0_AXI_1_MASTER_ARID ),
        .PCIESS_AXI_1_M_AWADDR  ( PCIe_EP_0_AXI_1_MASTER_AWADDR ),
        .PCIESS_AXI_1_M_WDATA   ( PCIe_EP_0_AXI_1_MASTER_WDATA ),
        .PCIESS_AXI_1_M_AWID    ( PCIe_EP_0_AXI_1_MASTER_AWID ),
        .PCIESS_AXI_1_M_ARADDR  ( PCIe_EP_0_AXI_1_MASTER_ARADDR ),
        .APB_S_PRDATA           ( AXItoAPB_0_APBmslave0_PRDATA ) 
        );

//--------PF_DDR3_SS
PF_DDR3_SS PF_DDR3_SS_0(
        // Inputs
        .PLL_REF_CLK  ( CCC_111MHz_0_OUT0_FABCLK_0 ),
        .SYS_RESET_N  ( AND3_0_Y ),
        .axi0_awid    ( AXI4_Interconnect_0_AXI4mslave2_AWID ),
        .axi0_awaddr  ( AXI4_Interconnect_0_AXI4mslave2_AWADDR ),
        .axi0_awlen   ( AXI4_Interconnect_0_AXI4mslave2_AWLEN ),
        .axi0_awsize  ( AXI4_Interconnect_0_AXI4mslave2_AWSIZE ),
        .axi0_awburst ( AXI4_Interconnect_0_AXI4mslave2_AWBURST ),
        .axi0_awlock  ( AXI4_Interconnect_0_AXI4mslave2_AWLOCK ),
        .axi0_awcache ( AXI4_Interconnect_0_AXI4mslave2_AWCACHE ),
        .axi0_awprot  ( AXI4_Interconnect_0_AXI4mslave2_AWPROT ),
        .axi0_awvalid ( AXI4_Interconnect_0_AXI4mslave2_AWVALID ),
        .axi0_wdata   ( AXI4_Interconnect_0_AXI4mslave2_WDATA ),
        .axi0_wstrb   ( AXI4_Interconnect_0_AXI4mslave2_WSTRB ),
        .axi0_wlast   ( AXI4_Interconnect_0_AXI4mslave2_WLAST ),
        .axi0_wvalid  ( AXI4_Interconnect_0_AXI4mslave2_WVALID ),
        .axi0_bready  ( AXI4_Interconnect_0_AXI4mslave2_BREADY ),
        .axi0_arid    ( AXI4_Interconnect_0_AXI4mslave2_ARID ),
        .axi0_araddr  ( AXI4_Interconnect_0_AXI4mslave2_ARADDR ),
        .axi0_arlen   ( AXI4_Interconnect_0_AXI4mslave2_ARLEN ),
        .axi0_arsize  ( AXI4_Interconnect_0_AXI4mslave2_ARSIZE ),
        .axi0_arburst ( AXI4_Interconnect_0_AXI4mslave2_ARBURST ),
        .axi0_arlock  ( AXI4_Interconnect_0_AXI4mslave2_ARLOCK ),
        .axi0_arcache ( AXI4_Interconnect_0_AXI4mslave2_ARCACHE ),
        .axi0_arprot  ( AXI4_Interconnect_0_AXI4mslave2_ARPROT ),
        .axi0_arvalid ( AXI4_Interconnect_0_AXI4mslave2_ARVALID ),
        .axi0_rready  ( AXI4_Interconnect_0_AXI4mslave2_RREADY ),
        // Outputs
        .DM           ( DM_net_0 ),
        .CKE          ( CKE_0_net_0 ),
        .CS_N         ( CS_N_0_net_0 ),
        .ODT          ( ODT_0_net_0 ),
        .RAS_N        ( RAS_N_0_net_0 ),
        .CAS_N        ( CAS_N_0_net_0 ),
        .WE_N         ( WE_N_0_net_0 ),
        .BA           ( BA_0_net_0 ),
        .RESET_N      ( RESET_N_0_net_0 ),
        .A            ( A_0_net_0 ),
        .CK0          ( CK0_0_net_0 ),
        .CK0_N        ( CK0_N_0_net_0 ),
        .SHIELD0      ( SHIELD0_0_net_0 ),
        .SHIELD1      ( SHIELD1_0_net_0 ),
        .SYS_CLK      ( PF_DDR3_SS_0_SYS_CLK ),
        .PLL_LOCK     ( PLL_LOCK_DDR3_net_0 ),
        .axi0_awready ( AXI4_Interconnect_0_AXI4mslave2_AWREADY ),
        .axi0_wready  ( AXI4_Interconnect_0_AXI4mslave2_WREADY ),
        .axi0_bid     ( AXI4_Interconnect_0_AXI4mslave2_BID ),
        .axi0_bresp   ( AXI4_Interconnect_0_AXI4mslave2_BRESP ),
        .axi0_bvalid  ( AXI4_Interconnect_0_AXI4mslave2_BVALID ),
        .axi0_arready ( AXI4_Interconnect_0_AXI4mslave2_ARREADY ),
        .axi0_rid     ( AXI4_Interconnect_0_AXI4mslave2_RID ),
        .axi0_rdata   ( AXI4_Interconnect_0_AXI4mslave2_RDATA ),
        .axi0_rresp   ( AXI4_Interconnect_0_AXI4mslave2_RRESP ),
        .axi0_rlast   ( AXI4_Interconnect_0_AXI4mslave2_RLAST ),
        .axi0_rvalid  ( AXI4_Interconnect_0_AXI4mslave2_RVALID ),
        .CTRLR_READY  ( CTRLR_READY_DDR3_net_0 ),
        // Inouts
        .DQ           ( DQ_0 ),
        .DQS          ( DQS_0 ),
        .DQS_N        ( DQS_N_0 ) 
        );

//--------PF_DDR4_SS
PF_DDR4_SS PF_DDR4_SS_0(
        // Inputs
        .PLL_REF_CLK  ( CLKINT_0_Y ),
        .SYS_RESET_N  ( AND3_0_Y ),
        .axi0_awid    ( AXI4_Interconnect_0_AXI4mslave4_AWID ),
        .axi0_awaddr  ( AXI4_Interconnect_0_AXI4mslave4_AWADDR ),
        .axi0_awlen   ( AXI4_Interconnect_0_AXI4mslave4_AWLEN ),
        .axi0_awsize  ( AXI4_Interconnect_0_AXI4mslave4_AWSIZE ),
        .axi0_awburst ( AXI4_Interconnect_0_AXI4mslave4_AWBURST ),
        .axi0_awlock  ( AXI4_Interconnect_0_AXI4mslave4_AWLOCK ),
        .axi0_awcache ( AXI4_Interconnect_0_AXI4mslave4_AWCACHE ),
        .axi0_awprot  ( AXI4_Interconnect_0_AXI4mslave4_AWPROT ),
        .axi0_awvalid ( AXI4_Interconnect_0_AXI4mslave4_AWVALID ),
        .axi0_wdata   ( AXI4_Interconnect_0_AXI4mslave4_WDATA ),
        .axi0_wstrb   ( AXI4_Interconnect_0_AXI4mslave4_WSTRB ),
        .axi0_wlast   ( AXI4_Interconnect_0_AXI4mslave4_WLAST ),
        .axi0_wvalid  ( AXI4_Interconnect_0_AXI4mslave4_WVALID ),
        .axi0_bready  ( AXI4_Interconnect_0_AXI4mslave4_BREADY ),
        .axi0_arid    ( AXI4_Interconnect_0_AXI4mslave4_ARID ),
        .axi0_araddr  ( AXI4_Interconnect_0_AXI4mslave4_ARADDR ),
        .axi0_arlen   ( AXI4_Interconnect_0_AXI4mslave4_ARLEN ),
        .axi0_arsize  ( AXI4_Interconnect_0_AXI4mslave4_ARSIZE ),
        .axi0_arburst ( AXI4_Interconnect_0_AXI4mslave4_ARBURST ),
        .axi0_arlock  ( AXI4_Interconnect_0_AXI4mslave4_ARLOCK ),
        .axi0_arcache ( AXI4_Interconnect_0_AXI4mslave4_ARCACHE ),
        .axi0_arprot  ( AXI4_Interconnect_0_AXI4mslave4_ARPROT ),
        .axi0_arvalid ( AXI4_Interconnect_0_AXI4mslave4_ARVALID ),
        .axi0_rready  ( AXI4_Interconnect_0_AXI4mslave4_RREADY ),
        // Outputs
        .DM_N         ( DM_N_net_0 ),
        .CKE          ( CKE_net_0 ),
        .CS_N         ( CS_N_net_0 ),
        .ODT          ( ODT_net_0 ),
        .RAS_N        ( RAS_N_net_0 ),
        .CAS_N        ( CAS_N_net_0 ),
        .WE_N         ( WE_N_net_0 ),
        .ACT_N        ( ACT_N_net_0 ),
        .BG           ( BG_net_0 ),
        .BA           ( BA_net_0 ),
        .RESET_N      ( RESET_N_net_0 ),
        .A            ( A_net_0 ),
        .CK0          ( CK0_net_0 ),
        .CK0_N        ( CK0_N_net_0 ),
        .SHIELD0      ( SHIELD0_net_0 ),
        .SHIELD1      ( SHIELD1_net_0 ),
        .SYS_CLK      ( PF_DDR4_SS_0_SYS_CLK ),
        .PLL_LOCK     ( PLL_LOCK_DDR4_net_0 ),
        .axi0_awready ( AXI4_Interconnect_0_AXI4mslave4_AWREADY ),
        .axi0_wready  ( AXI4_Interconnect_0_AXI4mslave4_WREADY ),
        .axi0_bid     ( AXI4_Interconnect_0_AXI4mslave4_BID ),
        .axi0_bresp   ( AXI4_Interconnect_0_AXI4mslave4_BRESP ),
        .axi0_bvalid  ( AXI4_Interconnect_0_AXI4mslave4_BVALID ),
        .axi0_arready ( AXI4_Interconnect_0_AXI4mslave4_ARREADY ),
        .axi0_rid     ( AXI4_Interconnect_0_AXI4mslave4_RID ),
        .axi0_rdata   ( AXI4_Interconnect_0_AXI4mslave4_RDATA ),
        .axi0_rresp   ( AXI4_Interconnect_0_AXI4mslave4_RRESP ),
        .axi0_rlast   ( AXI4_Interconnect_0_AXI4mslave4_RLAST ),
        .axi0_rvalid  ( AXI4_Interconnect_0_AXI4mslave4_RVALID ),
        .CTRLR_READY  ( CTRLR_READY_DDR4_net_0 ),
        // Inouts
        .DQ           ( DQ ),
        .DQS          ( DQS ),
        .DQS_N        ( DQS_N ) 
        );

//--------PF_RESET
PF_RESET PF_RESET_0(
        // Inputs
        .CLK            ( PF_DDR4_SS_0_SYS_CLK ),
        .EXT_RST_N      ( USER_RESETN ),
        .PLL_LOCK       ( PLL_LOCK_DDR4_net_0 ),
        .SS_BUSY        ( GND_net ),
        .INIT_DONE      ( PCIe_EP_0_DEVICE_INIT_DONE ),
        .FF_US_RESTORE  ( GND_net ),
        // Outputs
        .FABRIC_RESET_N ( PF_RESET_0_FABRIC_RESET_N ) 
        );

//--------SRAM_AXI
SRAM_AXI SRAM_AXI_0(
        // Inputs
        .ACLK    ( PF_DDR4_SS_0_SYS_CLK ),
        .ARESETN ( PF_RESET_0_FABRIC_RESET_N ),
        .AWADDR  ( AXI4_Interconnect_0_AXI4mslave3_AWADDR ),
        .AWLEN   ( AXI4_Interconnect_0_AXI4mslave3_AWLEN ),
        .AWSIZE  ( AXI4_Interconnect_0_AXI4mslave3_AWSIZE ),
        .AWBURST ( AXI4_Interconnect_0_AXI4mslave3_AWBURST ),
        .AWLOCK  ( AXI4_Interconnect_0_AXI4mslave3_AWLOCK ),
        .AWCACHE ( AXI4_Interconnect_0_AXI4mslave3_AWCACHE ),
        .AWPROT  ( AXI4_Interconnect_0_AXI4mslave3_AWPROT ),
        .AWVALID ( AXI4_Interconnect_0_AXI4mslave3_AWVALID ),
        .WDATA   ( AXI4_Interconnect_0_AXI4mslave3_WDATA ),
        .WSTRB   ( AXI4_Interconnect_0_AXI4mslave3_WSTRB ),
        .WLAST   ( AXI4_Interconnect_0_AXI4mslave3_WLAST ),
        .WVALID  ( AXI4_Interconnect_0_AXI4mslave3_WVALID ),
        .BREADY  ( AXI4_Interconnect_0_AXI4mslave3_BREADY ),
        .ARADDR  ( AXI4_Interconnect_0_AXI4mslave3_ARADDR ),
        .ARLEN   ( AXI4_Interconnect_0_AXI4mslave3_ARLEN ),
        .ARSIZE  ( AXI4_Interconnect_0_AXI4mslave3_ARSIZE ),
        .ARBURST ( AXI4_Interconnect_0_AXI4mslave3_ARBURST ),
        .ARLOCK  ( AXI4_Interconnect_0_AXI4mslave3_ARLOCK ),
        .ARCACHE ( AXI4_Interconnect_0_AXI4mslave3_ARCACHE ),
        .ARPROT  ( AXI4_Interconnect_0_AXI4mslave3_ARPROT ),
        .ARVALID ( AXI4_Interconnect_0_AXI4mslave3_ARVALID ),
        .RREADY  ( AXI4_Interconnect_0_AXI4mslave3_RREADY ),
        .AWID    ( AXI4_Interconnect_0_AXI4mslave3_AWID ),
        .ARID    ( AXI4_Interconnect_0_AXI4mslave3_ARID ),
        // Outputs
        .AWREADY ( AXI4_Interconnect_0_AXI4mslave3_AWREADY ),
        .WREADY  ( AXI4_Interconnect_0_AXI4mslave3_WREADY ),
        .BVALID  ( AXI4_Interconnect_0_AXI4mslave3_BVALID ),
        .ARREADY ( AXI4_Interconnect_0_AXI4mslave3_ARREADY ),
        .RDATA   ( AXI4_Interconnect_0_AXI4mslave3_RDATA ),
        .RRESP   ( AXI4_Interconnect_0_AXI4mslave3_RRESP ),
        .RLAST   ( AXI4_Interconnect_0_AXI4mslave3_RLAST ),
        .RVALID  ( AXI4_Interconnect_0_AXI4mslave3_RVALID ),
        .BRESP   ( AXI4_Interconnect_0_AXI4mslave3_BRESP ),
        .BID     ( AXI4_Interconnect_0_AXI4mslave3_BID ),
        .RID     ( AXI4_Interconnect_0_AXI4mslave3_RID ) 
        );


endmodule
