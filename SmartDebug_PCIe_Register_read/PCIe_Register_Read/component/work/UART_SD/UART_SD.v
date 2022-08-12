//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:02:10 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// UART_SD
module UART_SD(
    // Inputs
    CLK,
    RESET_N,
    RX,
    arready_i,
    awready_i,
    bid_i,
    bresp_i,
    bvalid_i,
    clk_count_i,
    coredma_int_i,
    rdata_i,
    rid_i,
    rlast_i,
    rresp_i,
    rvalid_i,
    wready_i,
    // Outputs
    TX,
    araddr_o,
    arburst_o,
    arid_o,
    arlen_o,
    arsize_o,
    arvalid_o,
    awaddr_o,
    awburst_o,
    awid_o,
    awlen_o,
    awsize_o,
    awvalid_o,
    bready_o,
    coredma_ch0_type_o,
    coredma_ch1_type_o,
    coredma_size_o,
    rready_o,
    wdata_o,
    wlast_o,
    wstrb_o,
    wvalid_o
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK;
input         RESET_N;
input         RX;
input         arready_i;
input         awready_i;
input  [3:0]  bid_i;
input  [1:0]  bresp_i;
input         bvalid_i;
input  [63:0] clk_count_i;
input  [1:0]  coredma_int_i;
input  [63:0] rdata_i;
input  [3:0]  rid_i;
input         rlast_i;
input  [1:0]  rresp_i;
input         rvalid_i;
input         wready_i;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        TX;
output [31:0] araddr_o;
output [1:0]  arburst_o;
output [3:0]  arid_o;
output [7:0]  arlen_o;
output [1:0]  arsize_o;
output        arvalid_o;
output [31:0] awaddr_o;
output [1:0]  awburst_o;
output [3:0]  awid_o;
output [7:0]  awlen_o;
output [1:0]  awsize_o;
output        awvalid_o;
output        bready_o;
output [2:0]  coredma_ch0_type_o;
output [2:0]  coredma_ch1_type_o;
output [24:0] coredma_size_o;
output        rready_o;
output [63:0] wdata_o;
output        wlast_o;
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
wire          CLK;
wire   [63:0] clk_count_i;
wire   [31:0] cmd_ctrlr_0_mem_address_o;
wire          cmd_ctrlr_0_mem_init_o;
wire          cmd_ctrlr_0_mem_read_o;
wire   [16:0] cmd_ctrlr_0_mem_size_o;
wire          cmd_ctrlr_0_mem_test_o;
wire   [31:0] cmd_ctrlr_0_offset_data_o;
wire   [2:0]  cmd_ctrlr_0_pattern_o;
wire   [11:0] cmd_ctrlr_0_ram_addr_o;
wire   [7:0]  cmd_ctrlr_0_uart_data_out_o;
wire          cmd_ctrlr_0_uart_oen_o;
wire          cmd_ctrlr_0_uart_wen_o;
wire   [7:0]  CORE_UART_0_DATA_OUT;
wire          CORE_UART_0_RXRDY;
wire          CORE_UART_0_TXRDY;
wire   [2:0]  coredma_ch0_type_o_net_0;
wire   [2:0]  coredma_ch1_type_o_net_0;
wire   [1:0]  coredma_int_i;
wire   [24:0] coredma_size_o_net_0;
wire   [31:0] pattern_gen_checker_0_err_loc_o;
wire          pattern_gen_checker_0_mem_init_done_o;
wire          pattern_gen_checker_0_mem_read_status_o;
wire          pattern_gen_checker_0_mem_test_done_o;
wire          pattern_gen_checker_0_mem_test_err_o;
wire   [7:0]  pattern_gen_checker_0_ram_data_o;
wire          RESET_N;
wire          RX;
wire          TX_net_0;
wire          TX_net_1;
wire          AXI4_M_RREADY_net_0;
wire          AXI4_M_ARVALID_net_0;
wire          AXI4_M_BREADY_net_0;
wire          AXI4_M_WVALID_net_0;
wire          AXI4_M_WLAST_net_0;
wire          AXI4_M_AWVALID_net_0;
wire   [2:0]  coredma_ch1_type_o_net_1;
wire   [24:0] coredma_size_o_net_1;
wire   [2:0]  coredma_ch0_type_o_net_1;
wire   [1:0]  AXI4_M_ARBURST_net_0;
wire   [1:0]  AXI4_M_ARSIZE_net_0;
wire   [7:0]  AXI4_M_ARLEN_net_0;
wire   [31:0] AXI4_M_ARADDR_net_0;
wire   [3:0]  AXI4_M_ARID_net_0;
wire   [7:0]  AXI4_M_WSTRB_net_0;
wire   [63:0] AXI4_M_WDATA_net_0;
wire   [1:0]  AXI4_M_AWBURST_net_0;
wire   [1:0]  AXI4_M_AWSIZE_net_0;
wire   [7:0]  AXI4_M_AWLEN_net_0;
wire   [31:0] AXI4_M_AWADDR_net_0;
wire   [3:0]  AXI4_M_AWID_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [12:0] BAUD_VAL_const_net_0;
wire          VCC_net;
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign BAUD_VAL_const_net_0 = 13'h006C;
assign VCC_net              = 1'b1;
assign GND_net              = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign TX_net_1                 = TX_net_0;
assign TX                       = TX_net_1;
assign AXI4_M_RREADY_net_0      = AXI4_M_RREADY;
assign rready_o                 = AXI4_M_RREADY_net_0;
assign AXI4_M_ARVALID_net_0     = AXI4_M_ARVALID;
assign arvalid_o                = AXI4_M_ARVALID_net_0;
assign AXI4_M_BREADY_net_0      = AXI4_M_BREADY;
assign bready_o                 = AXI4_M_BREADY_net_0;
assign AXI4_M_WVALID_net_0      = AXI4_M_WVALID;
assign wvalid_o                 = AXI4_M_WVALID_net_0;
assign AXI4_M_WLAST_net_0       = AXI4_M_WLAST;
assign wlast_o                  = AXI4_M_WLAST_net_0;
assign AXI4_M_AWVALID_net_0     = AXI4_M_AWVALID;
assign awvalid_o                = AXI4_M_AWVALID_net_0;
assign coredma_ch1_type_o_net_1 = coredma_ch1_type_o_net_0;
assign coredma_ch1_type_o[2:0]  = coredma_ch1_type_o_net_1;
assign coredma_size_o_net_1     = coredma_size_o_net_0;
assign coredma_size_o[24:0]     = coredma_size_o_net_1;
assign coredma_ch0_type_o_net_1 = coredma_ch0_type_o_net_0;
assign coredma_ch0_type_o[2:0]  = coredma_ch0_type_o_net_1;
assign AXI4_M_ARBURST_net_0     = AXI4_M_ARBURST;
assign arburst_o[1:0]           = AXI4_M_ARBURST_net_0;
assign AXI4_M_ARSIZE_net_0      = AXI4_M_ARSIZE;
assign arsize_o[1:0]            = AXI4_M_ARSIZE_net_0;
assign AXI4_M_ARLEN_net_0       = AXI4_M_ARLEN;
assign arlen_o[7:0]             = AXI4_M_ARLEN_net_0;
assign AXI4_M_ARADDR_net_0      = AXI4_M_ARADDR;
assign araddr_o[31:0]           = AXI4_M_ARADDR_net_0;
assign AXI4_M_ARID_net_0        = AXI4_M_ARID;
assign arid_o[3:0]              = AXI4_M_ARID_net_0;
assign AXI4_M_WSTRB_net_0       = AXI4_M_WSTRB;
assign wstrb_o[7:0]             = AXI4_M_WSTRB_net_0;
assign AXI4_M_WDATA_net_0       = AXI4_M_WDATA;
assign wdata_o[63:0]            = AXI4_M_WDATA_net_0;
assign AXI4_M_AWBURST_net_0     = AXI4_M_AWBURST;
assign awburst_o[1:0]           = AXI4_M_AWBURST_net_0;
assign AXI4_M_AWSIZE_net_0      = AXI4_M_AWSIZE;
assign awsize_o[1:0]            = AXI4_M_AWSIZE_net_0;
assign AXI4_M_AWLEN_net_0       = AXI4_M_AWLEN;
assign awlen_o[7:0]             = AXI4_M_AWLEN_net_0;
assign AXI4_M_AWADDR_net_0      = AXI4_M_AWADDR;
assign awaddr_o[31:0]           = AXI4_M_AWADDR_net_0;
assign AXI4_M_AWID_net_0        = AXI4_M_AWID;
assign awid_o[3:0]              = AXI4_M_AWID_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------cmd_ctrlr
cmd_ctrlr cmd_ctrlr_0(
        // Inputs
        .clk_i              ( CLK ),
        .resetn_i           ( RESET_N ),
        .uart_data_in_i     ( CORE_UART_0_DATA_OUT ),
        .uart_rxrdy_i       ( CORE_UART_0_RXRDY ),
        .uart_txrdy_i       ( CORE_UART_0_TXRDY ),
        .mem_init_done_i    ( pattern_gen_checker_0_mem_init_done_o ),
        .mem_test_done_i    ( pattern_gen_checker_0_mem_test_done_o ),
        .mem_test_err_i     ( pattern_gen_checker_0_mem_test_err_o ),
        .err_loc_i          ( pattern_gen_checker_0_err_loc_o ),
        .mem_read_status_i  ( pattern_gen_checker_0_mem_read_status_o ),
        .ram_data_i         ( pattern_gen_checker_0_ram_data_o ),
        .clk_count_i        ( clk_count_i ),
        .coredma_int_i      ( coredma_int_i ),
        // Outputs
        .uart_oen_o         ( cmd_ctrlr_0_uart_oen_o ),
        .uart_wen_o         ( cmd_ctrlr_0_uart_wen_o ),
        .uart_data_out_o    ( cmd_ctrlr_0_uart_data_out_o ),
        .pattern_o          ( cmd_ctrlr_0_pattern_o ),
        .mem_init_o         ( cmd_ctrlr_0_mem_init_o ),
        .mem_test_o         ( cmd_ctrlr_0_mem_test_o ),
        .mem_read_o         ( cmd_ctrlr_0_mem_read_o ),
        .mem_size_o         ( cmd_ctrlr_0_mem_size_o ),
        .mem_address_o      ( cmd_ctrlr_0_mem_address_o ),
        .offset_data_o      ( cmd_ctrlr_0_offset_data_o ),
        .ram_addr_o         ( cmd_ctrlr_0_ram_addr_o ),
        .coredma_size_o     ( coredma_size_o_net_0 ),
        .coredma_ch0_type_o ( coredma_ch0_type_o_net_0 ),
        .coredma_ch1_type_o ( coredma_ch1_type_o_net_0 ) 
        );

//--------Core_UART
Core_UART CORE_UART_0(
        // Inputs
        .BAUD_VAL    ( BAUD_VAL_const_net_0 ),
        .BIT8        ( VCC_net ),
        .CLK         ( CLK ),
        .CSN         ( GND_net ),
        .DATA_IN     ( cmd_ctrlr_0_uart_data_out_o ),
        .ODD_N_EVEN  ( GND_net ),
        .OEN         ( cmd_ctrlr_0_uart_oen_o ),
        .PARITY_EN   ( GND_net ),
        .RESET_N     ( RESET_N ),
        .RX          ( RX ),
        .WEN         ( cmd_ctrlr_0_uart_wen_o ),
        // Outputs
        .DATA_OUT    ( CORE_UART_0_DATA_OUT ),
        .OVERFLOW    (  ),
        .PARITY_ERR  (  ),
        .RXRDY       ( CORE_UART_0_RXRDY ),
        .TX          ( TX_net_0 ),
        .TXRDY       ( CORE_UART_0_TXRDY ),
        .FRAMING_ERR (  ) 
        );

//--------pattern_gen_checker
pattern_gen_checker pattern_gen_checker_0(
        // Inputs
        .clk_i             ( CLK ),
        .resetn_i          ( RESET_N ),
        .mem_size_i        ( cmd_ctrlr_0_mem_size_o ),
        .pattern_i         ( cmd_ctrlr_0_pattern_o ),
        .mem_init_i        ( cmd_ctrlr_0_mem_init_o ),
        .mem_test_i        ( cmd_ctrlr_0_mem_test_o ),
        .mem_address_i     ( cmd_ctrlr_0_mem_address_o ),
        .offset_data_i     ( cmd_ctrlr_0_offset_data_o ),
        .mem_read_i        ( cmd_ctrlr_0_mem_read_o ),
        .ram_addr_i        ( cmd_ctrlr_0_ram_addr_o ),
        .awready_i         ( awready_i ),
        .wready_i          ( wready_i ),
        .bid_i             ( bid_i ),
        .bresp_i           ( bresp_i ),
        .bvalid_i          ( bvalid_i ),
        .arready_i         ( arready_i ),
        .rid_i             ( rid_i ),
        .rdata_i           ( rdata_i ),
        .rresp_i           ( rresp_i ),
        .rlast_i           ( rlast_i ),
        .rvalid_i          ( rvalid_i ),
        // Outputs
        .mem_init_done_o   ( pattern_gen_checker_0_mem_init_done_o ),
        .mem_test_done_o   ( pattern_gen_checker_0_mem_test_done_o ),
        .mem_test_err_o    ( pattern_gen_checker_0_mem_test_err_o ),
        .err_loc_o         ( pattern_gen_checker_0_err_loc_o ),
        .mem_read_status_o ( pattern_gen_checker_0_mem_read_status_o ),
        .ram_data_o        ( pattern_gen_checker_0_ram_data_o ),
        .awid_o            ( AXI4_M_AWID ),
        .awaddr_o          ( AXI4_M_AWADDR ),
        .awlen_o           ( AXI4_M_AWLEN ),
        .awsize_o          ( AXI4_M_AWSIZE ),
        .awburst_o         ( AXI4_M_AWBURST ),
        .awvalid_o         ( AXI4_M_AWVALID ),
        .wstrb_o           ( AXI4_M_WSTRB ),
        .wlast_o           ( AXI4_M_WLAST ),
        .wvalid_o          ( AXI4_M_WVALID ),
        .wdata_o           ( AXI4_M_WDATA ),
        .bready_o          ( AXI4_M_BREADY ),
        .arid_o            ( AXI4_M_ARID ),
        .araddr_o          ( AXI4_M_ARADDR ),
        .arlen_o           ( AXI4_M_ARLEN ),
        .arsize_o          ( AXI4_M_ARSIZE ),
        .arburst_o         ( AXI4_M_ARBURST ),
        .arvalid_o         ( AXI4_M_ARVALID ),
        .rready_o          ( AXI4_M_RREADY ) 
        );


endmodule
