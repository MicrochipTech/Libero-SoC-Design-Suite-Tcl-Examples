`timescale 1ns/1ns
// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2017 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI4DMAController user testbench
//
// SVN Revision Information:
// SVN $Revision: 28771 $
// SVN $Date: 2017-02-09 18:57:19 +0000 (Thu, 09 Feb 2017) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module CoreAXI4DMAController_testbench();

// Include file containing the parameter configuration for this instance of
// CoreAXI4DMAController
`include "coreparameters.v"

////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter CLK_HP            = 5; // Clock half period (nanoseconds) - 100 MHz clock
parameter AWIDTH_M          = 32;
parameter AWIDTH_S0         = 13;
parameter AWIDTH_S1         = 13;
parameter AWIDTH_S2         = 13;
parameter AWIDTH_S3         = 11;
parameter DWIDTH            = AXI_DMA_DWIDTH;
parameter DWIDTH_LITE       = 32;
parameter SLV_0_MEM_FILE    = "slave_0_ram_init.mem";
parameter SLV_1_MEM_FILE    = "slave_1_ram_init.mem";
parameter SLV_2_MEM_FILE    = "slave_2_ram_init.mem";
parameter AXI_MSTR_MEM_FILE = "axi_mstr_ram_init.mem";
parameter STR_MSTR_MEM_FILE = "stream_ram_init.mem";
parameter DMA_0_BASE_ADDR   = 32'hC0000000; // Address of CoreAXI4DMAController
                                            // in the AXI4 master's memory map

////////////////////////////////////////////////////////////////////////////////
// Signal Declarations
////////////////////////////////////////////////////////////////////////////////
reg                             sysClk = 1'b0;
reg                             sysReset = 1'b1;

// Master 0 write address channel
wire                            AWVALID_M0;
wire    [AWIDTH_M-1:0]          AWADDR_M0;
wire    [ID_WIDTH-1:0]          AWID_M0;
wire    [7:0]                   AWLEN_M0;
wire    [2:0]                   AWSIZE_M0;
wire    [1:0]                   AWBURST_M0;

// Master 0 write data channel
wire                            WVALID_M0;
wire                            WLAST_M0;
wire    [(DWIDTH/8)-1:0]        WSTRB_M0;
wire    [DWIDTH-1:0]            WDATA_M0;

// Master 0 write response channel
wire                            BREADY_M0;

// Master 0 read address channel
wire                            ARVALID_M0;
wire    [AWIDTH_M-1:0]          ARADDR_M0;
wire    [ID_WIDTH-1:0]          ARID_M0;
wire    [7:0]                   ARLEN_M0;
wire    [2:0]                   ARSIZE_M0;
wire    [1:0]                   ARBURST_M0;

// Master 0 read data channel
wire                            RREADY_M0;

// Master 0 write address channel
wire                            AWREADY_M0;

// Master 0 write data channel
wire                            WREADY_M0;

// Master 0 write response channel
wire                            BVALID_M0;
wire    [1:0]                   BRESP_M0;
wire    [ID_WIDTH-1:0]          BID_M0;

// Master 0 read address channel
wire                            ARREADY_M0;

// Master 0 read data channel
wire                            RVALID_M0;
wire                            RLAST_M0;
wire    [DWIDTH-1:0]            RDATA_M0;
wire    [ID_WIDTH-1:0]          RID_M0;
wire    [1:0]                   RRESP_M0;

// Master 1 write address channel
wire                            AWVALID_M1;
wire    [AWIDTH_M-1:0]          AWADDR_M1;
wire    [ID_WIDTH-1:0]          AWID_M1;
wire    [7:0]                   AWLEN_M1;
wire    [2:0]                   AWSIZE_M1;
wire    [1:0]                   AWBURST_M1;

// Master 1 write data channel
wire                            WVALID_M1;
wire                            WLAST_M1;
wire    [(DWIDTH/8)-1:0]        WSTRB_M1;
wire    [DWIDTH-1:0]            WDATA_M1;

// Master 1 write response channel
wire                            BREADY_M1;

// Master 1 read address channel
wire                            ARVALID_M1;
wire    [AWIDTH_M-1:0]          ARADDR_M1;
wire    [ID_WIDTH-1:0]          ARID_M1;
wire    [7:0]                   ARLEN_M1;
wire    [2:0]                   ARSIZE_M1;
wire    [1:0]                   ARBURST_M1;

// Master 1 read data channel
wire                            RREADY_M1;

// Master 1 write address channel
wire                            AWREADY_M1;

// Master 1 write data channel
wire                            WREADY_M1;

// Master 1 write response channel
wire                            BVALID_M1;
wire    [1:0]                   BRESP_M1;
wire    [ID_WIDTH-1:0]          BID_M1;

// Master 1 read address channel
wire                            ARREADY_M1;

// Master 1 read data channel
wire                            RVALID_M1;
wire                            RLAST_M1;
wire    [DWIDTH-1:0]            RDATA_M1;
wire    [ID_WIDTH-1:0]          RID_M1;
wire    [1:0]                   RRESP_M1;

// Slave 0 write address channel
wire                            AWREADY_S0;

// Slave 0 write data channel
wire                            WREADY_S0;

// Slave 0 write response channel
wire                            BVALID_S0;
wire    [1:0]                   BRESP_S0;
wire    [ID_WIDTH:0]            BID_S0;

// Slave 0 read address channel
wire                            ARREADY_S0;

// Slave 0 read data channel
wire                            RVALID_S0;
wire                            RLAST_S0;
wire    [DWIDTH-1:0]            RDATA_S0;
wire    [ID_WIDTH:0]            RID_S0;
wire    [1:0]                   RRESP_S0;

// Slave 0 write address channel
wire                            AWVALID_S0;
wire    [AWIDTH_S0-1:0]         AWADDR_S0;
wire    [ID_WIDTH:0]            AWID_S0;
wire    [7:0]                   AWLEN_S0;
wire    [2:0]                   AWSIZE_S0;
wire    [1:0]                   AWBURST_S0;

// Slave 0 write data channel
wire                            WVALID_S0;
wire                            WLAST_S0;
wire    [(DWIDTH/8)-1:0]        WSTRB_S0;
wire    [DWIDTH-1:0]            WDATA_S0;

// Slave 0 write response channel
wire                            BREADY_S0;

// Slave 0 read address channel
wire                            ARVALID_S0;
wire    [AWIDTH_S0-1:0]         ARADDR_S0;
wire    [ID_WIDTH:0]            ARID_S0;
wire    [7:0]                   ARLEN_S0;
wire    [2:0]                   ARSIZE_S0;
wire    [1:0]                   ARBURST_S0;

// Slave 0 read data channel
wire                            RREADY_S0;

// Slave 1 write address channel
wire                            AWREADY_S1;

// Slave 1 write data channel
wire                            WREADY_S1;

// Slave 1 write response channel
wire                            BVALID_S1;
wire    [1:0]                   BRESP_S1;
wire    [ID_WIDTH:0]            BID_S1;

// Slave 1 read address channel
wire                            ARREADY_S1;

// Slave 1 read data channel
wire                            RVALID_S1;
wire                            RLAST_S1;
wire    [DWIDTH-1:0]            RDATA_S1;
wire    [ID_WIDTH:0]            RID_S1;
wire    [1:0]                   RRESP_S1;

// Slave 1 write address channel
wire                            AWVALID_S1;
wire    [AWIDTH_S1-1:0]         AWADDR_S1;
wire    [ID_WIDTH:0]            AWID_S1;
wire    [7:0]                   AWLEN_S1;
wire    [2:0]                   AWSIZE_S1;
wire    [1:0]                   AWBURST_S1;

// Slave 1 write data channel
wire                            WVALID_S1;
wire                            WLAST_S1;
wire    [(DWIDTH/8)-1:0]        WSTRB_S1;
wire    [DWIDTH-1:0]            WDATA_S1;

// Slave 1 write response channel
wire                            BREADY_S1;

// Slave 1 read address channel
wire                            ARVALID_S1;
wire    [AWIDTH_S1-1:0]         ARADDR_S1;
wire    [ID_WIDTH:0]            ARID_S1;
wire    [7:0]                   ARLEN_S1;
wire    [2:0]                   ARSIZE_S1;
wire    [1:0]                   ARBURST_S1;

// Slave 1 read data channel
wire                            RREADY_S1;

// Slave 2 write address channel
wire                            AWREADY_S2;

// Slave 2 write data channel
wire                            WREADY_S2;

// Slave 2 write response channel
wire                            BVALID_S2;
wire    [1:0]                   BRESP_S2;
wire    [ID_WIDTH:0]            BID_S2;

// Slave 2 read address channel
wire                            ARREADY_S2;

// Slave 2 read data channel
wire                            RVALID_S2;
wire                            RLAST_S2;
wire    [DWIDTH-1:0]            RDATA_S2;
wire    [ID_WIDTH:0]            RID_S2;
wire    [1:0]                   RRESP_S2;

// Slave 2 write address channel
wire                            AWVALID_S2;
wire    [AWIDTH_S2-1:0]         AWADDR_S2;
wire    [ID_WIDTH:0]            AWID_S2;
wire    [7:0]                   AWLEN_S2;
wire    [2:0]                   AWSIZE_S2;
wire    [1:0]                   AWBURST_S2;

// Slave 2 write data channel
wire                            WVALID_S2;
wire                            WLAST_S2;
wire    [(DWIDTH/8)-1:0]        WSTRB_S2;
wire    [DWIDTH-1:0]            WDATA_S2;

// Slave 2 write response channel
wire                            BREADY_S2;

// Slave 2 read address channel
wire                            ARVALID_S2;
wire    [AWIDTH_S2-1:0]         ARADDR_S2;
wire    [ID_WIDTH:0]            ARID_S2;
wire    [7:0]                   ARLEN_S2;
wire    [2:0]                   ARSIZE_S2;
wire    [1:0]                   ARBURST_S2;

// Slave 2 read data channel
wire                            RREADY_S2;

// Slave 3 write address channel
wire                            AWREADY_S3;

// Slave 3 write data channel
wire                            WREADY_S3;

// Slave 3 write response channel
wire                            BVALID_S3;
wire    [1:0]                   BRESP_S3;
wire    [ID_WIDTH:0]            BID_S3;

// Slave 3 read address channel
wire                            ARREADY_S3;

// Slave 3 read data channel
wire                            RVALID_S3;
wire                            RLAST_S3;
wire    [DWIDTH-1:0]            RDATA_S3;
wire    [ID_WIDTH:0]            RID_S3;
wire    [1:0]                   RRESP_S3;

// Slave 3 write address channel
wire                            AWVALID_S3;
wire    [AWIDTH_S3-1:0]         AWADDR_S3;
wire    [ID_WIDTH:0]            AWID_S3;
wire    [7:0]                   AWLEN_S3;
wire    [2:0]                   AWSIZE_S3;
wire    [1:0]                   AWBURST_S3;

// Slave 3 write data channel
wire                            WVALID_S3;
wire                            WLAST_S3;
wire    [(DWIDTH/8)-1:0]        WSTRB_S3;
wire    [DWIDTH-1:0]            WDATA_S3;

// Slave 3 write response channel
wire                            BREADY_S3;

// Slave 3 read address channel
wire                            ARVALID_S3;
wire    [AWIDTH_S3-1:0]         ARADDR_S3;
wire    [ID_WIDTH:0]            ARID_S3;
wire    [7:0]                   ARLEN_S3;
wire    [2:0]                   ARSIZE_S3;
wire    [1:0]                   ARBURST_S3;

// Slave 3 read data channel
wire                            RREADY_S3;

// Mirrored slave address outputs
wire    [AWIDTH_M-1:0]          AWADDR_MS0;
wire    [AWIDTH_M-1:0]          ARADDR_MS0;
wire    [AWIDTH_M-1:0]          AWADDR_MS1;
wire    [AWIDTH_M-1:0]          ARADDR_MS1;
wire    [AWIDTH_M-1:0]          AWADDR_MS2;
wire    [AWIDTH_M-1:0]          ARADDR_MS2;
wire    [AWIDTH_M-1:0]          AWADDR_MS3;
wire    [AWIDTH_M-1:0]          ARADDR_MS3;

// AXI4LiteSlave 
wire                            AWREADY_Lite;
wire                            WREADY_Lite;
wire    [1:0]                   BRESP_Lite;
wire                            BVALID_Lite;
wire                            ARREADY_Lite;
wire                            RVALID_Lite;
wire    [DWIDTH_LITE-1:0]       RDATA_Lite;
wire    [1:0]                   RRESP_Lite;
wire                            AWVALID_Lite;
wire    [AWIDTH_S3-1:0]         AWADDR_Lite;
wire                            WVALID_Lite;
wire    [DWIDTH_LITE-1:0]       WDATA_Lite;
wire    [(DWIDTH_LITE/8)-1:0]   WSTRB_Lite;
wire                            BREADY_Lite;
wire                            ARVALID_Lite;
wire    [AWIDTH_S3-1:0]         ARADDR_Lite;
wire                            RREADY_Lite;

// AXI4-Stream
wire                            TVALID;
wire    [DWIDTH-1:0]            TDATA;
wire    [(DWIDTH/8)-1:0]        TSTRB;
wire    [(DWIDTH/8)-1:0]        TKEEP;
wire                            TLAST;
wire    [ID_WIDTH-1:0]          TID;
wire    [1:0]                   TDEST;
wire                            TREADY;

wire    [NUM_OF_INTS-1:0]       INTERRUPT;
wire    [NUM_INT_BDS-1:0]       STRTDMAOP;

////////////////////////////////////////////////////////////////////////////////
// Clock & reset generation
////////////////////////////////////////////////////////////////////////////////
always
    begin
        #CLK_HP;
        sysClk <= ~sysClk;
    end

initial
    begin
        sysReset <= 1'b0;
        #20;
        sysReset <= 1'b1;
    end

assign STRTDMAOP = {NUM_INT_BDS{1'b0}};

////////////////////////////////////////////////////////////////////////////////
// AXI4 Master
////////////////////////////////////////////////////////////////////////////////
AXI4_Master #(
    .DMA_0_BASE_ADDR    (DMA_0_BASE_ADDR),
    .ID_WIDTH           (ID_WIDTH),
    .DWIDTH             (DWIDTH),
    .MEM_FILE           (AXI_MSTR_MEM_FILE),
    .WRITE_RAM_DEPTH    (256),
    .NUM_OF_INTS        (NUM_OF_INTS),
    .AXI4_STREAM_IF     (AXI4_STREAM_IF)
) U_AXI4_MASTER (
    // General inputs
    .ACLK               (sysClk),
    .ARESETN            (sysReset),
    
    // Write address channel inputs
    .AWREADY            (AWREADY_M0),
    
    // Write data channel inputs
    .WREADY             (WREADY_M0),
    
    // Write response channel inputs
    .BVALID             (BVALID_M0),
    .BID                (BID_M0),
    .BRESP              (BRESP_M0),
    
    // Read address channel inputs
    .ARREADY            (ARREADY_M0),
    
    // Read data channel inputs
    .RID                (RID_M0),
    .RDATA              (RDATA_M0),
    .RRESP              (RRESP_M0),
    .RLAST              (RLAST_M0),
    .RVALID             (RVALID_M0),
    
    // Interrupt inputs
    .interrupt          (INTERRUPT),
    
    // Write address channel outputs
    .AWID               (AWID_M0),
    .AWADDR             (AWADDR_M0),
    .AWLEN              (AWLEN_M0),
    .AWSIZE             (AWSIZE_M0),
    .AWBURST            (AWBURST_M0),
    .AWVALID            (AWVALID_M0),
    
    // Write data channel outputs
    .WDATA              (WDATA_M0),
    .WSTRB              (WSTRB_M0),
    .WLAST              (WLAST_M0),
    .WVALID             (WVALID_M0),
    
    // Write response channel outputs
    .BREADY             (BREADY_M0),
    
    // Read address channel outputs
    .ARID               (ARID_M0),
    .ARADDR             (ARADDR_M0),
    .ARLEN              (ARLEN_M0),
    .ARSIZE             (ARSIZE_M0),
    .ARBURST            (ARBURST_M0),
    .ARVALID            (ARVALID_M0),
    
    // Read data channel outputs
    .RREADY             (RREADY_M0)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4-Stream Master
////////////////////////////////////////////////////////////////////////////////
generate
    if (AXI4_STREAM_IF == 1)
        begin
            AXI4StreamMaster #(
                .ADDR_WIDTH         (13),
                .DATA_WIDTH         (DWIDTH),
                .RAM_INIT_FILE      (STR_MSTR_MEM_FILE),
                .ID_WIDTH           (ID_WIDTH)
            ) U_AXI4_STREAM_MASTER (
                // General inputs
                .clock               (sysClk),
                .resetn              (sysReset),
                
                // AXI4Stream inputs
                .TREADY              (TREADY),
                
                // AXI4Stream outputs
                .TVALID              (TVALID),
                .TID                 (TID),
                .TSTRB               (TSTRB),
                .TKEEP               (TKEEP),
                .TLAST               (TLAST),
                .TDATA               (TDATA),
                .TDEST               (TDEST)
            );
        end
endgenerate

////////////////////////////////////////////////////////////////////////////////
// UUT, CoreAXI4DMAController (AXI4 Master - DMA IF, AXI4-Lite Slave - Control IF)
////////////////////////////////////////////////////////////////////////////////
CoreDMA_Controller_CoreDMA_Controller_0_COREAXI4DMACONTROLLER #(
    .AXI4_STREAM_IF         (AXI4_STREAM_IF),
    .INT_0_QUEUE_DEPTH      (INT_0_QUEUE_DEPTH),
    .INT_1_QUEUE_DEPTH      (INT_1_QUEUE_DEPTH),
    .INT_2_QUEUE_DEPTH      (INT_2_QUEUE_DEPTH),
    .INT_3_QUEUE_DEPTH      (INT_3_QUEUE_DEPTH),
    .NUM_INT_BDS            (NUM_INT_BDS),
    .NUM_OF_INTS            (NUM_OF_INTS),
    .NUM_PRI_LVLS           (NUM_PRI_LVLS),
    .PRI_0_NUM_OF_BEATS     (PRI_0_NUM_OF_BEATS),
    .PRI_1_NUM_OF_BEATS     (PRI_1_NUM_OF_BEATS),
    .PRI_2_NUM_OF_BEATS     (PRI_2_NUM_OF_BEATS),
    .PRI_3_NUM_OF_BEATS     (PRI_3_NUM_OF_BEATS),
    .PRI_4_NUM_OF_BEATS     (PRI_4_NUM_OF_BEATS),
    .PRI_5_NUM_OF_BEATS     (PRI_5_NUM_OF_BEATS),
    .PRI_6_NUM_OF_BEATS     (PRI_6_NUM_OF_BEATS),
    .PRI_7_NUM_OF_BEATS     (PRI_7_NUM_OF_BEATS),
    .ID_WIDTH               (ID_WIDTH),
    .AXI_DMA_DWIDTH         (AXI_DMA_DWIDTH),
    .DSCRPTR_0_INT_ASSOC    (DSCRPTR_0_INT_ASSOC),
    .DSCRPTR_0_PRI_LVL      (DSCRPTR_0_PRI_LVL),
    .DSCRPTR_1_INT_ASSOC    (DSCRPTR_1_INT_ASSOC),
    .DSCRPTR_1_PRI_LVL      (DSCRPTR_1_PRI_LVL),
    .DSCRPTR_2_INT_ASSOC    (DSCRPTR_2_INT_ASSOC),
    .DSCRPTR_2_PRI_LVL      (DSCRPTR_2_PRI_LVL),
    .DSCRPTR_3_INT_ASSOC    (DSCRPTR_3_INT_ASSOC),
    .DSCRPTR_3_PRI_LVL      (DSCRPTR_3_PRI_LVL),
    .DSCRPTR_4_INT_ASSOC    (DSCRPTR_4_INT_ASSOC),
    .DSCRPTR_4_PRI_LVL      (DSCRPTR_4_PRI_LVL),
    .DSCRPTR_5_INT_ASSOC    (DSCRPTR_5_INT_ASSOC),
    .DSCRPTR_5_PRI_LVL      (DSCRPTR_5_PRI_LVL),
    .DSCRPTR_6_INT_ASSOC    (DSCRPTR_6_INT_ASSOC),
    .DSCRPTR_6_PRI_LVL      (DSCRPTR_6_PRI_LVL),
    .DSCRPTR_7_INT_ASSOC    (DSCRPTR_7_INT_ASSOC),
    .DSCRPTR_7_PRI_LVL      (DSCRPTR_7_PRI_LVL),
    .DSCRPTR_8_INT_ASSOC    (DSCRPTR_8_INT_ASSOC),
    .DSCRPTR_8_PRI_LVL      (DSCRPTR_8_PRI_LVL),
    .DSCRPTR_9_INT_ASSOC    (DSCRPTR_9_INT_ASSOC),
    .DSCRPTR_9_PRI_LVL      (DSCRPTR_9_PRI_LVL),
    .DSCRPTR_10_INT_ASSOC   (DSCRPTR_10_INT_ASSOC),
    .DSCRPTR_10_PRI_LVL     (DSCRPTR_10_PRI_LVL),
    .DSCRPTR_11_INT_ASSOC   (DSCRPTR_11_INT_ASSOC),
    .DSCRPTR_11_PRI_LVL     (DSCRPTR_11_PRI_LVL),
    .DSCRPTR_12_INT_ASSOC   (DSCRPTR_12_INT_ASSOC),
    .DSCRPTR_12_PRI_LVL     (DSCRPTR_12_PRI_LVL),
    .DSCRPTR_13_INT_ASSOC   (DSCRPTR_13_INT_ASSOC),
    .DSCRPTR_13_PRI_LVL     (DSCRPTR_13_PRI_LVL),
    .DSCRPTR_14_INT_ASSOC   (DSCRPTR_14_INT_ASSOC),
    .DSCRPTR_14_PRI_LVL     (DSCRPTR_14_PRI_LVL),
    .DSCRPTR_15_INT_ASSOC   (DSCRPTR_15_INT_ASSOC),
    .DSCRPTR_15_PRI_LVL     (DSCRPTR_15_PRI_LVL),
    .DSCRPTR_16_INT_ASSOC   (DSCRPTR_16_INT_ASSOC),
    .DSCRPTR_16_PRI_LVL     (DSCRPTR_16_PRI_LVL),
    .DSCRPTR_17_INT_ASSOC   (DSCRPTR_17_INT_ASSOC),
    .DSCRPTR_17_PRI_LVL     (DSCRPTR_17_PRI_LVL),
    .DSCRPTR_18_INT_ASSOC   (DSCRPTR_18_INT_ASSOC),
    .DSCRPTR_18_PRI_LVL     (DSCRPTR_18_PRI_LVL),
    .DSCRPTR_19_INT_ASSOC   (DSCRPTR_19_INT_ASSOC),
    .DSCRPTR_19_PRI_LVL     (DSCRPTR_19_PRI_LVL),
    .DSCRPTR_20_INT_ASSOC   (DSCRPTR_20_INT_ASSOC),
    .DSCRPTR_20_PRI_LVL     (DSCRPTR_20_PRI_LVL),
    .DSCRPTR_21_INT_ASSOC   (DSCRPTR_21_INT_ASSOC),
    .DSCRPTR_21_PRI_LVL     (DSCRPTR_21_PRI_LVL),
    .DSCRPTR_22_INT_ASSOC   (DSCRPTR_22_INT_ASSOC),
    .DSCRPTR_22_PRI_LVL     (DSCRPTR_22_PRI_LVL),
    .DSCRPTR_23_INT_ASSOC   (DSCRPTR_23_INT_ASSOC),
    .DSCRPTR_23_PRI_LVL     (DSCRPTR_23_PRI_LVL),
    .DSCRPTR_24_INT_ASSOC   (DSCRPTR_24_INT_ASSOC),
    .DSCRPTR_24_PRI_LVL     (DSCRPTR_24_PRI_LVL),
    .DSCRPTR_25_INT_ASSOC   (DSCRPTR_25_INT_ASSOC),
    .DSCRPTR_25_PRI_LVL     (DSCRPTR_25_PRI_LVL),
    .DSCRPTR_26_INT_ASSOC   (DSCRPTR_26_INT_ASSOC),
    .DSCRPTR_26_PRI_LVL     (DSCRPTR_26_PRI_LVL),
    .DSCRPTR_27_INT_ASSOC   (DSCRPTR_27_INT_ASSOC),
    .DSCRPTR_27_PRI_LVL     (DSCRPTR_27_PRI_LVL),
    .DSCRPTR_28_INT_ASSOC   (DSCRPTR_28_INT_ASSOC),
    .DSCRPTR_28_PRI_LVL     (DSCRPTR_28_PRI_LVL),
    .DSCRPTR_29_INT_ASSOC   (DSCRPTR_29_INT_ASSOC),
    .DSCRPTR_29_PRI_LVL     (DSCRPTR_29_PRI_LVL),
    .DSCRPTR_30_INT_ASSOC   (DSCRPTR_30_INT_ASSOC),
    .DSCRPTR_30_PRI_LVL     (DSCRPTR_30_PRI_LVL),
    .DSCRPTR_31_INT_ASSOC   (DSCRPTR_31_INT_ASSOC),
    .DSCRPTR_31_PRI_LVL     (DSCRPTR_31_PRI_LVL)
) UUT_COREAXI4DMACONTROLLER (
    .CLOCK              (sysClk),
    .RESETN             (sysReset),
    
    // AXI4LiteMaster inputs
    .CTRL_AWVALID       (AWVALID_Lite),
    .CTRL_WVALID        (WVALID_Lite),
    .CTRL_BREADY        (BREADY_Lite),
    .CTRL_ARVALID       (ARVALID_Lite),
    .CTRL_RREADY        (RREADY_Lite),
    .CTRL_AWADDR        (AWADDR_Lite),
    .CTRL_WSTRB         (WSTRB_Lite),
    .CTRL_WDATA         (WDATA_Lite),
    .CTRL_ARADDR        (ARADDR_Lite),
    
    // FabricController inputs
    .STRTDMAOP          (STRTDMAOP),
    
    // AXI4Slave inputs
    .DMA_BRESP          (BRESP_M1),
    .DMA_BID            (BID_M1),
    .DMA_RDATA          (RDATA_M1),
    .DMA_RID            (RID_M1),
    .DMA_AWREADY        (AWREADY_M1),
    .DMA_WREADY         (WREADY_M1),
    .DMA_BVALID         (BVALID_M1),
    .DMA_ARREADY        (ARREADY_M1),
    .DMA_RVALID         (RVALID_M1),
    .DMA_RRESP          (RRESP_M1),
    .DMA_RLAST          (RLAST_M1),
    
    // AXI4-Stream inputs
    .TVALID             (TVALID),
    .TDATA              (TDATA),
    .TSTRB              (TSTRB),
    .TKEEP              (TKEEP),
    .TLAST              (TLAST),
    .TID                (TID),
    .TDEST              (TDEST),
    
    // AXI4LiteMaster outputs
    .CTRL_BRESP         (BRESP_Lite),
    .CTRL_RDATA         (RDATA_Lite),
    .CTRL_AWREADY       (AWREADY_Lite),
    .CTRL_WREADY        (WREADY_Lite),
    .CTRL_BVALID        (BVALID_Lite),
    .CTRL_ARREADY       (ARREADY_Lite),
    .CTRL_RVALID        (RVALID_Lite),
    .CTRL_RRESP         (RRESP_Lite),
    
    // AXI4Slave outputs
    .DMA_AWVALID        (AWVALID_M1),
    .DMA_WVALID         (WVALID_M1),
    .DMA_WLAST          (WLAST_M1),
    .DMA_BREADY         (BREADY_M1),
    .DMA_ARVALID        (ARVALID_M1),
    .DMA_RREADY         (RREADY_M1),
    .DMA_AWADDR         (AWADDR_M1),
    .DMA_AWID           (AWID_M1),
    .DMA_AWLEN          (AWLEN_M1),
    .DMA_AWSIZE         (AWSIZE_M1),
    .DMA_AWBURST        (AWBURST_M1),
    .DMA_WSTRB          (WSTRB_M1),
    .DMA_WDATA          (WDATA_M1),
    .DMA_ARADDR         (ARADDR_M1),
    .DMA_ARID           (ARID_M1),
    .DMA_ARLEN          (ARLEN_M1),
    .DMA_ARSIZE         (ARSIZE_M1),
    .DMA_ARBURST        (ARBURST_M1),
    
    // AXI4Stream outputs
    .TREADY             (TREADY),
    
    // MasterController outputs
    .INTERRUPT          (INTERRUPT)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4 Interconnect model (2 Masters, 4 Slaves)
////////////////////////////////////////////////////////////////////////////////
interconnect #(
    .ID_WIDTH           (ID_WIDTH),
    .DWIDTH             (DWIDTH),
    .AWIDTH             (AWIDTH_M)
) U_AXI4_INTERCONNECT (
    // General inputs
    .clock              (sysClk),
    .resetn             (sysReset),
    
    // Master 0 write address channel inputs
    .AWVALID_M0         (AWVALID_M0),
    .AWADDR_M0          (AWADDR_M0),
    .AWID_M0            (AWID_M0),
    .AWLEN_M0           (AWLEN_M0),
    .AWSIZE_M0          (AWSIZE_M0),
    .AWBURST_M0         (AWBURST_M0),

    // Master 0 write data channel inputs
    .WVALID_M0          (WVALID_M0),
    .WLAST_M0           (WLAST_M0),
    .WSTRB_M0           (WSTRB_M0),
    .WDATA_M0           (WDATA_M0),

    // Master 0 write response channel inputs
    .BREADY_M0          (BREADY_M0),

    // Master 0 read address channel inputs
    .ARVALID_M0         (ARVALID_M0),
    .ARADDR_M0          (ARADDR_M0),
    .ARID_M0            (ARID_M0),
    .ARLEN_M0           (ARLEN_M0),
    .ARSIZE_M0          (ARSIZE_M0),
    .ARBURST_M0         (ARBURST_M0),

    // Master 0 read data channel inputs
    .RREADY_M0          (RREADY_M0),

    // Master 1 write address channel inputs
    .AWVALID_M1         (AWVALID_M1),
    .AWADDR_M1          (AWADDR_M1),
    .AWID_M1            (AWID_M1),
    .AWLEN_M1           (AWLEN_M1),
    .AWSIZE_M1          (AWSIZE_M1),
    .AWBURST_M1         (AWBURST_M1),

    // Master 1 write data channel inputs
    .WVALID_M1          (WVALID_M1),
    .WLAST_M1           (WLAST_M1),
    .WSTRB_M1           (WSTRB_M1),
    .WDATA_M1           (WDATA_M1),

    // Master 1 write response channel inputs
    .BREADY_M1          (BREADY_M1),

    // Master 1 read address channel inputs
    .ARVALID_M1         (ARVALID_M1),
    .ARADDR_M1          (ARADDR_M1),
    .ARID_M1            (ARID_M1),
    .ARLEN_M1           (ARLEN_M1),
    .ARSIZE_M1          (ARSIZE_M1),
    .ARBURST_M1         (ARBURST_M1),

    // Master 1 read data channel inputs
    .RREADY_M1          (RREADY_M1),

    // Slave 0 write address channel inputs
    .AWREADY_S0         (AWREADY_S0),
    
    // Slave 0 write data channel inputs
    .WREADY_S0          (WREADY_S0),
    
    // Slave 0 write response channel inputs
    .BVALID_S0          (BVALID_S0),
    .BRESP_S0           (BRESP_S0),
    .BID_S0             (BID_S0),
    
    // Slave 0 read address channel inputs
    .ARREADY_S0         (ARREADY_S0),
    
    // Slave 0 read data channel inputs
    .RVALID_S0          (RVALID_S0),
    .RLAST_S0           (RLAST_S0),
    .RDATA_S0           (RDATA_S0),
    .RID_S0             (RID_S0),
    .RRESP_S0           (RRESP_S0),

    // Slave 1 write address channel inputs
    .AWREADY_S1         (AWREADY_S1),
    
    // Slave 1 write data channel inputs
    .WREADY_S1          (WREADY_S1),
    
    // Slave 1 write response channel inputs
    .BVALID_S1          (BVALID_S1),
    .BRESP_S1           (BRESP_S1),
    .BID_S1             (BID_S1),
    
    // Slave 1 read address channel inputs
    .ARREADY_S1         (ARREADY_S1),
    
    // Slave 1 read data channel inputs
    .RVALID_S1          (RVALID_S1),
    .RLAST_S1           (RLAST_S1),
    .RDATA_S1           (RDATA_S1),
    .RID_S1             (RID_S1),
    .RRESP_S1           (RRESP_S1),

    // Slave 2 write address channel inputs
    .AWREADY_S2         (AWREADY_S2),
    
    // Slave 2 write data channel inputs
    .WREADY_S2          (WREADY_S2),
    
    // Slave 2 write response channel inputs
    .BVALID_S2          (BVALID_S2),
    .BRESP_S2           (BRESP_S2),
    .BID_S2             (BID_S2),
    
    // Slave 2 read address channel inputs
    .ARREADY_S2         (ARREADY_S2),
    
    // Slave 2 read data channel inputs
    .RVALID_S2          (RVALID_S2),
    .RLAST_S2           (RLAST_S2),
    .RDATA_S2           (RDATA_S2),
    .RID_S2             (RID_S2),
    .RRESP_S2           (RRESP_S2),

    // Slave 3 write address channel inputs
    .AWREADY_S3         (AWREADY_S3),
    
    // Slave 3 write data channel inputs
    .WREADY_S3          (WREADY_S3),
    
    // Slave 3 write response channel inputs
    .BVALID_S3          (BVALID_S3),
    .BRESP_S3           (BRESP_S3),
    .BID_S3             (BID_S3),
    
    // Slave 3 read address channel inputs
    .ARREADY_S3         (ARREADY_S3),
    
    // Slave 3 read data channel inputs
    .RVALID_S3          (RVALID_S3),
    .RLAST_S3           (RLAST_S3),
    .RDATA_S3           (RDATA_S3),
    .RID_S3             (RID_S3),
    .RRESP_S3           (RRESP_S3),

    // Master 0 write address channel outputs
    .AWREADY_M0         (AWREADY_M0),
 
    // Master 0 write data channel outputs
    .WREADY_M0          (WREADY_M0),
    
    // Master 0 write response channel outputs
    .BVALID_M0          (BVALID_M0),
    .BRESP_M0           (BRESP_M0),
    .BID_M0             (BID_M0),
    
    // Master 0 read address channel outputs
    .ARREADY_M0         (ARREADY_M0),
    
    // Master 0 read data channel outputs
    .RVALID_M0          (RVALID_M0),
    .RLAST_M0           (RLAST_M0),
    .RDATA_M0           (RDATA_M0),
    .RID_M0             (RID_M0),
    .RRESP_M0           (RRESP_M0),
    
    // Master 1 write address channel outputs
    .AWREADY_M1         (AWREADY_M1),
 
    // Master 1 write data channel outputs
    .WREADY_M1          (WREADY_M1),
    
    // Master 1 write response channel outputs
    .BVALID_M1          (BVALID_M1),
    .BRESP_M1           (BRESP_M1),
    .BID_M1             (BID_M1),
    
    // Master 1 read address channel outputs
    .ARREADY_M1         (ARREADY_M1),
    
    // Master 1 read data channel outputs
    .RVALID_M1          (RVALID_M1),
    .RLAST_M1           (RLAST_M1),
    .RDATA_M1           (RDATA_M1),
    .RID_M1             (RID_M1),
    .RRESP_M1           (RRESP_M1),

    // Slave 0 write address channel outputs
    .AWVALID_S0         (AWVALID_S0),
    .AWADDR_S0          (AWADDR_MS0),
    .AWID_S0            (AWID_S0),
    .AWLEN_S0           (AWLEN_S0),
    .AWSIZE_S0          (AWSIZE_S0),
    .AWBURST_S0         (AWBURST_S0),
    
    // Slave 0 write data channel outputs
    .WVALID_S0          (WVALID_S0),
    .WLAST_S0           (WLAST_S0),
    .WSTRB_S0           (WSTRB_S0),
    .WDATA_S0           (WDATA_S0),
    
    // Slave 0 write response channel outputs
    .BREADY_S0          (BREADY_S0),
    
    // Slave 0 read address channel outputs
    .ARVALID_S0         (ARVALID_S0),
    .ARADDR_S0          (ARADDR_MS0),
    .ARID_S0            (ARID_S0),
    .ARLEN_S0           (ARLEN_S0),
    .ARSIZE_S0          (ARSIZE_S0),
    .ARBURST_S0         (ARBURST_S0),
    
    // Slave 0 read data channel outputs
    .RREADY_S0          (RREADY_S0),
    
    // Slave 1 write address channel outputs
    .AWVALID_S1         (AWVALID_S1),
    .AWADDR_S1          (AWADDR_MS1),
    .AWID_S1            (AWID_S1),
    .AWLEN_S1           (AWLEN_S1),
    .AWSIZE_S1          (AWSIZE_S1),
    .AWBURST_S1         (AWBURST_S1),
    
    // Slave 1 write data channel outputs
    .WVALID_S1          (WVALID_S1),
    .WLAST_S1           (WLAST_S1),
    .WSTRB_S1           (WSTRB_S1),
    .WDATA_S1           (WDATA_S1),
    
    // Slave 1 write response channel outputs
    .BREADY_S1          (BREADY_S1),
    
    // Slave 1 read address channel outputs
    .ARVALID_S1         (ARVALID_S1),
    .ARADDR_S1          (ARADDR_MS1),
    .ARID_S1            (ARID_S1),
    .ARLEN_S1           (ARLEN_S1),
    .ARSIZE_S1          (ARSIZE_S1),
    .ARBURST_S1         (ARBURST_S1),
    
    // Slave 1 read data channel outputs
    .RREADY_S1          (RREADY_S1),
    
    // Slave 2 write address channel outputs
    .AWVALID_S2         (AWVALID_S2),
    .AWADDR_S2          (AWADDR_MS2),
    .AWID_S2            (AWID_S2),
    .AWLEN_S2           (AWLEN_S2),
    .AWSIZE_S2          (AWSIZE_S2),
    .AWBURST_S2         (AWBURST_S2),
    
    // Slave 2 write data channel outputs
    .WVALID_S2          (WVALID_S2),
    .WLAST_S2           (WLAST_S2),
    .WSTRB_S2           (WSTRB_S2),
    .WDATA_S2           (WDATA_S2),
    
    // Slave 2 write response channel outputs
    .BREADY_S2          (BREADY_S2),
    
    // Slave 2 read address channel outputs
    .ARVALID_S2         (ARVALID_S2),
    .ARADDR_S2          (ARADDR_MS2),
    .ARID_S2            (ARID_S2),
    .ARLEN_S2           (ARLEN_S2),
    .ARSIZE_S2          (ARSIZE_S2),
    .ARBURST_S2         (ARBURST_S2),
    
    // Slave 2 read data channel outputs
    .RREADY_S2          (RREADY_S2),
    
    // Slave 3 write address channel outputs
    .AWVALID_S3         (AWVALID_S3),
    .AWADDR_S3          (AWADDR_MS3),
    .AWID_S3            (AWID_S3),
    .AWLEN_S3           (AWLEN_S3),
    .AWSIZE_S3          (AWSIZE_S3),
    .AWBURST_S3         (AWBURST_S3),
    
    // Slave 3 write data channel outputs
    .WVALID_S3          (WVALID_S3),
    .WLAST_S3           (WLAST_S3),
    .WSTRB_S3           (WSTRB_S3),
    .WDATA_S3           (WDATA_S3),
    
    // Slave 3 write response channel outputs
    .BREADY_S3          (BREADY_S3),
    
    // Slave 3 read address channel outputs
    .ARVALID_S3         (ARVALID_S3),
    .ARADDR_S3          (ARADDR_MS3),
    .ARID_S3            (ARID_S3),
    .ARLEN_S3           (ARLEN_S3),
    .ARSIZE_S3          (ARSIZE_S3),
    .ARBURST_S3         (ARBURST_S3),
    
    // Slave 3 read data channel outputs
    .RREADY_S3          (RREADY_S3)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4 SRAM Wrapper (Slave 0 SRAM)
////////////////////////////////////////////////////////////////////////////////
assign AWADDR_S0 = AWADDR_MS0[AWIDTH_S0-1:0];
assign ARADDR_S0 = ARADDR_MS0[AWIDTH_S0-1:0];

AXI4SlaveRAM #(
    .ADDR_WIDTH         (AWIDTH_S0),
    .DATA_WIDTH         (DWIDTH),
    .ID_WIDTH           (1+ID_WIDTH),
    .RAM_INIT_FILE      (SLV_0_MEM_FILE)
) U_AXI4_SRAM_0 (
    // General inputs
    .clock              (sysClk),
    .resetn             (sysReset),
    
    // Write address channel inputs
    .AWVALID            (AWVALID_S0),
    .AWADDR             (AWADDR_S0),
    .AWID               (AWID_S0),
    .AWLEN              (AWLEN_S0),
    .AWSIZE             (AWSIZE_S0),
    .AWBURST            (AWBURST_S0),
    
    // Write data channel inputs
    .WVALID             (WVALID_S0),
    .WDATA              (WDATA_S0),
    .WSTRB              (WSTRB_S0),
    .WLAST              (WLAST_S0),
    
    // Write response channel inputs
    .BREADY             (BREADY_S0),
    
    // Read address channel inputs
    .ARVALID            (ARVALID_S0),
    .ARADDR             (ARADDR_S0),
    .ARID               (ARID_S0),
    .ARLEN              (ARLEN_S0),
    .ARSIZE             (ARSIZE_S0),
    .ARBURST            (ARBURST_S0),
    
    // Read data channel inputs
    .RREADY             (RREADY_S0),
    
    // Write address channel outputs
    .AWREADY            (AWREADY_S0),
    
    // Write data channel outputs
    .WREADY             (WREADY_S0),
    
    // Write response channel outputs
    .BVALID             (BVALID_S0),
    .BRESP              (BRESP_S0),
    .BID                (BID_S0),
    
    // Read address channel outputs
    .ARREADY            (ARREADY_S0),
    
    // Read data channel outputs
    .RVALID             (RVALID_S0),
    .RDATA              (RDATA_S0),
    .RID                (RID_S0),
    .RRESP              (RRESP_S0),
    .RLAST              (RLAST_S0)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4 SRAM Wrapper (Slave 1 SRAM)
////////////////////////////////////////////////////////////////////////////////
assign AWADDR_S1 = AWADDR_MS1[AWIDTH_S1-1:0];
assign ARADDR_S1 = ARADDR_MS1[AWIDTH_S1-1:0];

AXI4SlaveRAM #(
    .ADDR_WIDTH         (AWIDTH_S1),
    .DATA_WIDTH         (DWIDTH),
    .ID_WIDTH           (1+ID_WIDTH),
    .RAM_INIT_FILE      (SLV_1_MEM_FILE)
) U_AXI4_SRAM_1 (
    // General inputs
    .clock              (sysClk),
    .resetn             (sysReset),
    
    // Write address channel inputs
    .AWVALID            (AWVALID_S1),
    .AWADDR             (AWADDR_S1),
    .AWID               (AWID_S1),
    .AWLEN              (AWLEN_S1),
    .AWSIZE             (AWSIZE_S1),
    .AWBURST            (AWBURST_S1),
    
    // Write data channel inputs
    .WVALID             (WVALID_S1),
    .WDATA              (WDATA_S1),
    .WSTRB              (WSTRB_S1),
    .WLAST              (WLAST_S1),
    
    // Write response channel inputs
    .BREADY             (BREADY_S1),
    
    // Read address channel inputs
    .ARVALID            (ARVALID_S1),
    .ARADDR             (ARADDR_S1),
    .ARID               (ARID_S1),
    .ARLEN              (ARLEN_S1),
    .ARSIZE             (ARSIZE_S1),
    .ARBURST            (ARBURST_S1),
    
    // Read data channel inputs
    .RREADY             (RREADY_S1),
    
    // Write address channel outputs
    .AWREADY            (AWREADY_S1),
    
    // Write data channel outputs
    .WREADY             (WREADY_S1),
    
    // Write response channel outputs
    .BVALID             (BVALID_S1),
    .BRESP              (BRESP_S1),
    .BID                (BID_S1),
    
    // Read address channel outputs
    .ARREADY            (ARREADY_S1),
    
    // Read data channel outputs
    .RVALID             (RVALID_S1),
    .RDATA              (RDATA_S1),
    .RID                (RID_S1),
    .RRESP              (RRESP_S1),
    .RLAST              (RLAST_S1)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4 SRAM Wrapper (External Descriptor Store)
////////////////////////////////////////////////////////////////////////////////
assign AWADDR_S2 = AWADDR_MS2[AWIDTH_S2-1:0];
assign ARADDR_S2 = ARADDR_MS2[AWIDTH_S2-1:0];

AXI4SlaveRAM #(
    .ADDR_WIDTH         (AWIDTH_S2),
    .DATA_WIDTH         (DWIDTH),
    .ID_WIDTH           (1+ID_WIDTH),
    .RAM_INIT_FILE      (SLV_2_MEM_FILE)
) U_AXI4_EXT_DSCRPTR_STORE (
    // General inputs
    .clock              (sysClk),
    .resetn             (sysReset),
    
    // Write address channel inputs
    .AWVALID            (AWVALID_S2),
    .AWADDR             (AWADDR_S2),
    .AWID               (AWID_S2),
    .AWLEN              (AWLEN_S2),
    .AWSIZE             (AWSIZE_S2),
    .AWBURST            (AWBURST_S2),
    
    // Write data channel inputs
    .WVALID             (WVALID_S2),
    .WDATA              (WDATA_S2),
    .WSTRB              (WSTRB_S2),
    .WLAST              (WLAST_S2),
    
    // Write response channel inputs
    .BREADY             (BREADY_S2),
    
    // Read address channel inputs
    .ARVALID            (ARVALID_S2),
    .ARADDR             (ARADDR_S2),
    .ARID               (ARID_S2),
    .ARLEN              (ARLEN_S2),
    .ARSIZE             (ARSIZE_S2),
    .ARBURST            (ARBURST_S2),
    
    // Read data channel inputs
    .RREADY             (RREADY_S2),
    
    // Write address channel outputs
    .AWREADY            (AWREADY_S2),
    
    // Write data channel outputs
    .WREADY             (WREADY_S2),
    
    // Write response channel outputs
    .BVALID             (BVALID_S2),
    .BRESP              (BRESP_S2),
    .BID                (BID_S2),
    
    // Read address channel outputs
    .ARREADY            (ARREADY_S2),
    
    // Read data channel outputs
    .RVALID             (RVALID_S2),
    .RDATA              (RDATA_S2),
    .RID                (RID_S2),
    .RRESP              (RRESP_S2),
    .RLAST              (RLAST_S2)
);

////////////////////////////////////////////////////////////////////////////////
// AXI4-To-AXI4-Lite protocol bridge
////////////////////////////////////////////////////////////////////////////////
assign AWADDR_S3 = AWADDR_MS3[AWIDTH_S3-1:0];
assign ARADDR_S3 = ARADDR_MS3[AWIDTH_S3-1:0];

AXI4ToAXI4LiteBridge #(
    .ADDR_WIDTH         (AWIDTH_S3),
    .DATA_WIDTH         (DWIDTH),
    .ID_WIDTH           (1+ID_WIDTH)
) U_AXI4_2_AXI4_LITE_BRDG (
    // General inputs
    .clock              (sysClk),
    .resetn             (sysReset),
    
    // AXI4 Master Write address channel inputs
    .AWVALID            (AWVALID_S3),
    .AWADDR             (AWADDR_S3),
    .AWID               (AWID_S3),
    .AWLEN              (AWLEN_S3),
    .AWSIZE             (AWSIZE_S3),
    .AWBURST            (AWBURST_S3),
    
    // AXI4 Master Write data channel inputs
    .WVALID             (WVALID_S3),
    .WDATA              (WDATA_S3),
    .WSTRB              (WSTRB_S3),
    .WLAST              (WLAST_S3),
    
    // AXI4 Master Write response channel inputs
    .BREADY             (BREADY_S3),
    
    // AXI4 Master Read address channel inputs
    .ARVALID            (ARVALID_S3),
    .ARADDR             (ARADDR_S3),
    .ARID               (ARID_S3),
    .ARLEN              (ARLEN_S3),
    .ARSIZE             (ARSIZE_S3),
    .ARBURST            (ARBURST_S3),
    
    // AXI4 Master Read data channel inputs
    .RREADY             (RREADY_S3),
    
    // AXI4-Lite Slave Write address channel inputs
    .AWREADY_Lite       (AWREADY_Lite),
    
    // AXI4-Lite Slave Write data channel inputs
    .WREADY_Lite        (WREADY_Lite),
    
    // AXI4-Lite Slave Write response channel inputs
    .BVALID_Lite        (BVALID_Lite),
    .BRESP_Lite         (BRESP_Lite),
    
    // AXI4-Lite Slave Read address channel inputs
    .ARREADY_Lite       (ARREADY_Lite),
    
    // AXI4-Lite Slave Read data channel inputs
    .RVALID_Lite        (RVALID_Lite),
    .RDATA_Lite         (RDATA_Lite),
    .RRESP_Lite         (RRESP_Lite),
    
    // AXI4 Master Write address channel outputs
    .AWREADY            (AWREADY_S3),
    
    // AXI4 Master Write data channel outputs
    .WREADY             (WREADY_S3),
    
    // AXI4 Master Write response channel outputs
    .BVALID             (BVALID_S3),
    .BRESP              (BRESP_S3),
    .BID                (BID_S3),
    
    // AXI4 Master Read address channel outputs
    .ARREADY            (ARREADY_S3),
    
    // AXI4 Master Read data channel outputs
    .RVALID             (RVALID_S3),
    .RDATA              (RDATA_S3),
    .RID                (RID_S3),
    .RRESP              (RRESP_S3),
    .RLAST              (RLAST_S3),
    
    // AXI4-Lite Slave Write address channel outputs
    .AWVALID_Lite       (AWVALID_Lite),
    .AWADDR_Lite        (AWADDR_Lite),
    
    // AXI4-Lite Slave Write data channel outputs
    .WVALID_Lite        (WVALID_Lite),
    .WDATA_Lite         (WDATA_Lite),
    .WSTRB_Lite         (WSTRB_Lite),
    
    // AXI4-Lite Slave Write response channel outputs
    .BREADY_Lite        (BREADY_Lite),
    
    // AXI4-Lite Slave Read address channel outputs
    .ARVALID_Lite       (ARVALID_Lite),
    .ARADDR_Lite        (ARADDR_Lite),
    
    // AXI4-Lite Slave Read data channel outputs
    .RREADY_Lite        (RREADY_Lite)
);

endmodule