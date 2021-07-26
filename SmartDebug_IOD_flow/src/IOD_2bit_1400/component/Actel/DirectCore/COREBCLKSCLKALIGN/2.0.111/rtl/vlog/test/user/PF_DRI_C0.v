//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Dec  3 14:33:41 2019
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PF_DRI_C0
module PF_DRI_C0(
    // Inputs
    PADDR,
    PCLK,
    PENABLE,
    PLL0_NW_DRI_INTERRUPT,
    PLL0_NW_DRI_RDATA,
    PRESETN,
    PSEL,
    PSTRB,
    PWDATA,
    PWRITE,
    // Outputs
    BUSERROR,
    DRI_ARST_N,
    DRI_CLK,
    DRI_WDATA,
    PINTERRUPT,
    PLL0_NW_DRI_CTRL,
    PRDATA,
    PREADY,
    PSLVERR,
    PTIMEOUT
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [28:0] PADDR;
input         PCLK;
input         PENABLE;
input         PLL0_NW_DRI_INTERRUPT;
input  [32:0] PLL0_NW_DRI_RDATA;
input         PRESETN;
input         PSEL;
input  [3:0]  PSTRB;
input  [31:0] PWDATA;
input         PWRITE;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        BUSERROR;
output        DRI_ARST_N;
output        DRI_CLK;
output [32:0] DRI_WDATA;
output        PINTERRUPT;
output [10:0] PLL0_NW_DRI_CTRL;
output [31:0] PRDATA;
output        PREADY;
output        PSLVERR;
output        PTIMEOUT;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [28:0] PADDR;
wire          PENABLE;
wire   [31:0] APBS_PRDATA;
wire          APBS_PREADY;
wire          PSEL;
wire          APBS_PSLVERR;
wire   [31:0] PWDATA;
wire          PWRITE;
wire          BUSERROR_net_0;
wire          PCLK;
wire          PINTERRUPT_net_0;
wire          PLL0_NW_DRI_DRI_ARST_N;
wire          PLL0_NW_DRI_DRI_CLK;
wire   [10:0] PLL0_NW_DRI_DRI_CTRL;
wire          PLL0_NW_DRI_INTERRUPT;
wire   [32:0] PLL0_NW_DRI_RDATA;
wire   [32:0] PLL0_NW_DRI_DRI_WDATA;
wire          PRESETN;
wire   [3:0]  PSTRB;
wire          PTIMEOUT_net_0;
wire          PINTERRUPT_net_1;
wire          PTIMEOUT_net_1;
wire          BUSERROR_net_1;
wire   [31:0] APBS_PRDATA_net_0;
wire          APBS_PREADY_net_0;
wire          APBS_PSLVERR_net_0;
wire          PLL0_NW_DRI_DRI_CLK_net_0;
wire   [32:0] PLL0_NW_DRI_DRI_WDATA_net_0;
wire          PLL0_NW_DRI_DRI_ARST_N_net_0;
wire   [10:0] PLL0_NW_DRI_DRI_CTRL_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [32:0] Q0_LANE0_DRI_RDATA_const_net_0;
wire          GND_net;
wire   [32:0] Q0_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q0_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q0_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q1_LANE0_DRI_RDATA_const_net_0;
wire   [32:0] Q1_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q1_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q1_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q2_LANE0_DRI_RDATA_const_net_0;
wire   [32:0] Q2_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q2_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q2_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q3_LANE0_DRI_RDATA_const_net_0;
wire   [32:0] Q3_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q3_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q3_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q4_LANE0_DRI_RDATA_const_net_0;
wire   [32:0] Q4_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q4_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q4_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q5_LANE0_DRI_RDATA_const_net_0;
wire   [32:0] Q5_LANE1_DRI_RDATA_const_net_0;
wire   [32:0] Q5_LANE2_DRI_RDATA_const_net_0;
wire   [32:0] Q5_LANE3_DRI_RDATA_const_net_0;
wire   [32:0] Q4_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q2_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q0_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q1_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q3_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q5_TXPLL_SSC_DRI_RDATA_const_net_0;
wire   [32:0] Q4_TXPLL_DRI_RDATA_const_net_0;
wire   [32:0] Q2_TXPLL0_DRI_RDATA_const_net_0;
wire   [32:0] Q2_TXPLL1_DRI_RDATA_const_net_0;
wire   [32:0] Q0_TXPLL0_DRI_RDATA_const_net_0;
wire   [32:0] Q0_TXPLL1_DRI_RDATA_const_net_0;
wire   [32:0] Q1_TXPLL0_DRI_RDATA_const_net_0;
wire   [32:0] Q1_TXPLL1_DRI_RDATA_const_net_0;
wire   [32:0] Q3_TXPLL_DRI_RDATA_const_net_0;
wire   [32:0] Q5_TXPLL_DRI_RDATA_const_net_0;
wire   [32:0] PCIE0_DRI_RDATA_const_net_0;
wire   [32:0] PCIE1_DRI_RDATA_const_net_0;
wire   [32:0] PLL1_NW_DRI_RDATA_const_net_0;
wire   [32:0] PLL0_NE_DRI_RDATA_const_net_0;
wire   [32:0] PLL1_NE_DRI_RDATA_const_net_0;
wire   [32:0] PLL0_SE_DRI_RDATA_const_net_0;
wire   [32:0] PLL1_SE_DRI_RDATA_const_net_0;
wire   [32:0] PLL0_SW_DRI_RDATA_const_net_0;
wire   [32:0] PLL1_SW_DRI_RDATA_const_net_0;
wire   [32:0] DLL0_NW_DRI_RDATA_const_net_0;
wire   [32:0] DLL1_NW_DRI_RDATA_const_net_0;
wire   [32:0] DLL0_NE_DRI_RDATA_const_net_0;
wire   [32:0] DLL1_NE_DRI_RDATA_const_net_0;
wire   [32:0] DLL0_SE_DRI_RDATA_const_net_0;
wire   [32:0] DLL1_SE_DRI_RDATA_const_net_0;
wire   [32:0] DLL0_SW_DRI_RDATA_const_net_0;
wire   [32:0] DLL1_SW_DRI_RDATA_const_net_0;
wire   [32:0] CRYPTO_DRI_RDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign Q0_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign GND_net                            = 1'b0;
assign Q0_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q0_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q0_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q1_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q1_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q1_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q1_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q2_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q2_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q2_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q2_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q3_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q3_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q3_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q3_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q4_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q4_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q4_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q4_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q5_LANE0_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q5_LANE1_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q5_LANE2_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q5_LANE3_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q4_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q2_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q0_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q1_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q3_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q5_TXPLL_SSC_DRI_RDATA_const_net_0 = 33'h000000000;
assign Q4_TXPLL_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q2_TXPLL0_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q2_TXPLL1_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q0_TXPLL0_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q0_TXPLL1_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q1_TXPLL0_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q1_TXPLL1_DRI_RDATA_const_net_0    = 33'h000000000;
assign Q3_TXPLL_DRI_RDATA_const_net_0     = 33'h000000000;
assign Q5_TXPLL_DRI_RDATA_const_net_0     = 33'h000000000;
assign PCIE0_DRI_RDATA_const_net_0        = 33'h000000000;
assign PCIE1_DRI_RDATA_const_net_0        = 33'h000000000;
assign PLL1_NW_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL0_NE_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL1_NE_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL0_SE_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL1_SE_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL0_SW_DRI_RDATA_const_net_0      = 33'h000000000;
assign PLL1_SW_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL0_NW_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL1_NW_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL0_NE_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL1_NE_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL0_SE_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL1_SE_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL0_SW_DRI_RDATA_const_net_0      = 33'h000000000;
assign DLL1_SW_DRI_RDATA_const_net_0      = 33'h000000000;
assign CRYPTO_DRI_RDATA_const_net_0       = 33'h000000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign PINTERRUPT_net_1             = PINTERRUPT_net_0;
assign PINTERRUPT                   = PINTERRUPT_net_1;
assign PTIMEOUT_net_1               = PTIMEOUT_net_0;
assign PTIMEOUT                     = PTIMEOUT_net_1;
assign BUSERROR_net_1               = BUSERROR_net_0;
assign BUSERROR                     = BUSERROR_net_1;
assign APBS_PRDATA_net_0            = APBS_PRDATA;
assign PRDATA[31:0]                 = APBS_PRDATA_net_0;
assign APBS_PREADY_net_0            = APBS_PREADY;
assign PREADY                       = APBS_PREADY_net_0;
assign APBS_PSLVERR_net_0           = APBS_PSLVERR;
assign PSLVERR                      = APBS_PSLVERR_net_0;
assign PLL0_NW_DRI_DRI_CLK_net_0    = PLL0_NW_DRI_DRI_CLK;
assign DRI_CLK                      = PLL0_NW_DRI_DRI_CLK_net_0;
assign PLL0_NW_DRI_DRI_WDATA_net_0  = PLL0_NW_DRI_DRI_WDATA;
assign DRI_WDATA[32:0]              = PLL0_NW_DRI_DRI_WDATA_net_0;
assign PLL0_NW_DRI_DRI_ARST_N_net_0 = PLL0_NW_DRI_DRI_ARST_N;
assign DRI_ARST_N                   = PLL0_NW_DRI_DRI_ARST_N_net_0;
assign PLL0_NW_DRI_DRI_CTRL_net_0   = PLL0_NW_DRI_DRI_CTRL;
assign PLL0_NW_DRI_CTRL[10:0]       = PLL0_NW_DRI_DRI_CTRL_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DRI_C0_PF_DRI_C0_0_PF_DRI   -   Actel:SgCore:PF_DRI:1.0.101
PF_DRI_C0_PF_DRI_C0_0_PF_DRI PF_DRI_C0_0(
        // Inputs
        .Q0_LANE0_DRI_RDATA         ( Q0_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q0_LANE1_DRI_RDATA         ( Q0_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q0_LANE2_DRI_RDATA         ( Q0_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q0_LANE3_DRI_RDATA         ( Q0_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q1_LANE0_DRI_RDATA         ( Q1_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q1_LANE1_DRI_RDATA         ( Q1_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q1_LANE2_DRI_RDATA         ( Q1_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q1_LANE3_DRI_RDATA         ( Q1_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q2_LANE0_DRI_RDATA         ( Q2_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q2_LANE1_DRI_RDATA         ( Q2_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q2_LANE2_DRI_RDATA         ( Q2_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q2_LANE3_DRI_RDATA         ( Q2_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q3_LANE0_DRI_RDATA         ( Q3_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q3_LANE1_DRI_RDATA         ( Q3_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q3_LANE2_DRI_RDATA         ( Q3_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q3_LANE3_DRI_RDATA         ( Q3_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q4_LANE0_DRI_RDATA         ( Q4_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q4_LANE1_DRI_RDATA         ( Q4_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q4_LANE2_DRI_RDATA         ( Q4_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q4_LANE3_DRI_RDATA         ( Q4_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q5_LANE0_DRI_RDATA         ( Q5_LANE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_LANE0_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q5_LANE1_DRI_RDATA         ( Q5_LANE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_LANE1_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q5_LANE2_DRI_RDATA         ( Q5_LANE2_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_LANE2_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q5_LANE3_DRI_RDATA         ( Q5_LANE3_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_LANE3_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q4_TXPLL_SSC_DRI_RDATA     ( Q4_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q2_TXPLL_SSC_DRI_RDATA     ( Q2_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q0_TXPLL_SSC_DRI_RDATA     ( Q0_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q1_TXPLL_SSC_DRI_RDATA     ( Q1_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q3_TXPLL_SSC_DRI_RDATA     ( Q3_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q5_TXPLL_SSC_DRI_RDATA     ( Q5_TXPLL_SSC_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_TXPLL_SSC_DRI_INTERRUPT ( GND_net ), // tied to 1'b0 from definition
        .Q4_TXPLL_DRI_RDATA         ( Q4_TXPLL_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q4_TXPLL_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q2_TXPLL0_DRI_RDATA        ( Q2_TXPLL0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_TXPLL0_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q2_TXPLL1_DRI_RDATA        ( Q2_TXPLL1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q2_TXPLL1_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q0_TXPLL0_DRI_RDATA        ( Q0_TXPLL0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_TXPLL0_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q0_TXPLL1_DRI_RDATA        ( Q0_TXPLL1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q0_TXPLL1_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q1_TXPLL0_DRI_RDATA        ( Q1_TXPLL0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_TXPLL0_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q1_TXPLL1_DRI_RDATA        ( Q1_TXPLL1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q1_TXPLL1_DRI_INTERRUPT    ( GND_net ), // tied to 1'b0 from definition
        .Q3_TXPLL_DRI_RDATA         ( Q3_TXPLL_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q3_TXPLL_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .Q5_TXPLL_DRI_RDATA         ( Q5_TXPLL_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .Q5_TXPLL_DRI_INTERRUPT     ( GND_net ), // tied to 1'b0 from definition
        .PCIE0_DRI_RDATA            ( PCIE0_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PCIE0_DRI_INTERRUPT        ( GND_net ), // tied to 1'b0 from definition
        .PCIE1_DRI_RDATA            ( PCIE1_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PCIE1_DRI_INTERRUPT        ( GND_net ), // tied to 1'b0 from definition
        .PLL0_NW_DRI_RDATA          ( PLL0_NW_DRI_RDATA ),
        .PLL0_NW_DRI_INTERRUPT      ( PLL0_NW_DRI_INTERRUPT ),
        .PLL1_NW_DRI_RDATA          ( PLL1_NW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL1_NW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL0_NE_DRI_RDATA          ( PLL0_NE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL0_NE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL1_NE_DRI_RDATA          ( PLL1_NE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL1_NE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL0_SE_DRI_RDATA          ( PLL0_SE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL0_SE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL1_SE_DRI_RDATA          ( PLL1_SE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL1_SE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL0_SW_DRI_RDATA          ( PLL0_SW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL0_SW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .PLL1_SW_DRI_RDATA          ( PLL1_SW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .PLL1_SW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL0_NW_DRI_RDATA          ( DLL0_NW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL0_NW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL1_NW_DRI_RDATA          ( DLL1_NW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL1_NW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL0_NE_DRI_RDATA          ( DLL0_NE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL0_NE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL1_NE_DRI_RDATA          ( DLL1_NE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL1_NE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL0_SE_DRI_RDATA          ( DLL0_SE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL0_SE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL1_SE_DRI_RDATA          ( DLL1_SE_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL1_SE_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL0_SW_DRI_RDATA          ( DLL0_SW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL0_SW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .DLL1_SW_DRI_RDATA          ( DLL1_SW_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .DLL1_SW_DRI_INTERRUPT      ( GND_net ), // tied to 1'b0 from definition
        .CRYPTO_DRI_RDATA           ( CRYPTO_DRI_RDATA_const_net_0 ), // tied to 33'h000000000 from definition
        .CRYPTO_DRI_INTERRUPT       ( GND_net ), // tied to 1'b0 from definition
        .PCLK                       ( PCLK ),
        .PSEL                       ( PSEL ),
        .PENABLE                    ( PENABLE ),
        .PWRITE                     ( PWRITE ),
        .PADDR                      ( PADDR ),
        .PSTRB                      ( PSTRB ),
        .PWDATA                     ( PWDATA ),
        .PRESETN                    ( PRESETN ),
        // Outputs
        .DRI_CLK                    ( PLL0_NW_DRI_DRI_CLK ),
        .DRI_WDATA                  ( PLL0_NW_DRI_DRI_WDATA ),
        .DRI_ARST_N                 ( PLL0_NW_DRI_DRI_ARST_N ),
        .Q0_LANE0_DRI_CTRL          (  ),
        .Q0_LANE1_DRI_CTRL          (  ),
        .Q0_LANE2_DRI_CTRL          (  ),
        .Q0_LANE3_DRI_CTRL          (  ),
        .Q1_LANE0_DRI_CTRL          (  ),
        .Q1_LANE1_DRI_CTRL          (  ),
        .Q1_LANE2_DRI_CTRL          (  ),
        .Q1_LANE3_DRI_CTRL          (  ),
        .Q2_LANE0_DRI_CTRL          (  ),
        .Q2_LANE1_DRI_CTRL          (  ),
        .Q2_LANE2_DRI_CTRL          (  ),
        .Q2_LANE3_DRI_CTRL          (  ),
        .Q3_LANE0_DRI_CTRL          (  ),
        .Q3_LANE1_DRI_CTRL          (  ),
        .Q3_LANE2_DRI_CTRL          (  ),
        .Q3_LANE3_DRI_CTRL          (  ),
        .Q4_LANE0_DRI_CTRL          (  ),
        .Q4_LANE1_DRI_CTRL          (  ),
        .Q4_LANE2_DRI_CTRL          (  ),
        .Q4_LANE3_DRI_CTRL          (  ),
        .Q5_LANE0_DRI_CTRL          (  ),
        .Q5_LANE1_DRI_CTRL          (  ),
        .Q5_LANE2_DRI_CTRL          (  ),
        .Q5_LANE3_DRI_CTRL          (  ),
        .Q4_TXPLL_SSC_DRI_CTRL      (  ),
        .Q2_TXPLL_SSC_DRI_CTRL      (  ),
        .Q0_TXPLL_SSC_DRI_CTRL      (  ),
        .Q1_TXPLL_SSC_DRI_CTRL      (  ),
        .Q3_TXPLL_SSC_DRI_CTRL      (  ),
        .Q5_TXPLL_SSC_DRI_CTRL      (  ),
        .Q4_TXPLL_DRI_CTRL          (  ),
        .Q2_TXPLL0_DRI_CTRL         (  ),
        .Q2_TXPLL1_DRI_CTRL         (  ),
        .Q0_TXPLL0_DRI_CTRL         (  ),
        .Q0_TXPLL1_DRI_CTRL         (  ),
        .Q1_TXPLL0_DRI_CTRL         (  ),
        .Q1_TXPLL1_DRI_CTRL         (  ),
        .Q3_TXPLL_DRI_CTRL          (  ),
        .Q5_TXPLL_DRI_CTRL          (  ),
        .PCIE0_DRI_CTRL             (  ),
        .PCIE1_DRI_CTRL             (  ),
        .PLL0_NW_DRI_CTRL           ( PLL0_NW_DRI_DRI_CTRL ),
        .PLL1_NW_DRI_CTRL           (  ),
        .PLL0_NE_DRI_CTRL           (  ),
        .PLL1_NE_DRI_CTRL           (  ),
        .PLL0_SE_DRI_CTRL           (  ),
        .PLL1_SE_DRI_CTRL           (  ),
        .PLL0_SW_DRI_CTRL           (  ),
        .PLL1_SW_DRI_CTRL           (  ),
        .DLL0_NW_DRI_CTRL           (  ),
        .DLL1_NW_DRI_CTRL           (  ),
        .DLL0_NE_DRI_CTRL           (  ),
        .DLL1_NE_DRI_CTRL           (  ),
        .DLL0_SE_DRI_CTRL           (  ),
        .DLL1_SE_DRI_CTRL           (  ),
        .DLL0_SW_DRI_CTRL           (  ),
        .DLL1_SW_DRI_CTRL           (  ),
        .CRYPTO_DRI_CTRL            (  ),
        .PRDATA                     ( APBS_PRDATA ),
        .PREADY                     ( APBS_PREADY ),
        .PSLVERR                    ( APBS_PSLVERR ),
        .PINTERRUPT                 ( PINTERRUPT_net_0 ),
        .PTIMEOUT                   ( PTIMEOUT_net_0 ),
        .BUSERROR                   ( BUSERROR_net_0 ) 
        );


endmodule
