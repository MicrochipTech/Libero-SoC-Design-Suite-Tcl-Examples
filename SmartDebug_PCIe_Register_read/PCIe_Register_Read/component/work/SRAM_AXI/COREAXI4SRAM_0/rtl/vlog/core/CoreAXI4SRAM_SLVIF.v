// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  CoreAXI4SRAM_SLVIF
//               
//               
//
//
// Revision Information:
// Date     Description
//
// SVN Revision Information:
// SVN $Revision: 4805 $
// SVN $Date: 2012-06-21 17:48:48 +0530 (Thu, 21 Jun 2012) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
//               
//
//  Structure:
//            CoreAXI4SRAM (TOP) _   
//                               |
//                               |_ CoreAXI4_SLVIF
//                               |
//                               |_ CoreAXI4_MainCtrl
//               
//
// ********************************************************************/
module SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_SLVIF(
                          ACLK,
                          ARESETN,
                          AWID_S,
                          AWADDR_S,
                          AWLEN_S,
                          AWSIZE_S,
                          AWBURST_S,
                          AWVALID_S,
                          AWREADY_S,
                          WDATA_S,
                          WSTRB_S,
                          WLAST_S,
                          WVALID_S,
                          WREADY_S,
                          BID_S,
                          BRESP_S,
                          BVALID_S,
                          ARID_S,
                          ARADDR_S,
                          ARLEN_S,
                          ARSIZE_S,
                          ARBURST_S,
                          ARVALID_S,
                          ARREADY_S,
                          RID_S,
                          RDATA_S,
                          RRESP_S,
                          RLAST_S,
                          RVALID_S,
                          RREADY_S,

                          // From Main Control block
                          waddrchset_mc,
                          raddrchset_mc,
                          awready_mc,
                          wready_mc,
                          arready_mc,
                          bvalid_mc,
                          bid_mc,
                          bresp_mc,
                          rvalid_mc,
                          rid_mc,
                          rresp_mc,
                          rlast_mc,
                          rdata_mc,
                          // To Main Control block
                          AWID_slvif,
                          AWVALID_slvif,
                          AWSIZE_slvif,
                          AWLEN_slvif,
                          AWADDR_slvif,
                          AWBURST_slvif,
                          WDATA_slvif,
                          WSTRB_slvif,
                          WLAST_slvif,
                          WVALID_slvif,
                          ARID_slvif,
                          ARVALID_slvif,
                          ARBURST_slvif,
                          ARSIZE_slvif,
                          ARADDR_slvif,
                          ARLEN_slvif,
                          RREADY_slvif


                          );


   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
  // parameter FAMILY           = 19;
   parameter AXI4_DWIDTH      = 64;
   parameter AXI4_AWIDTH      = 32;
   parameter AXI4_IFTYPE_WR   = 1;
   parameter AXI4_IFTYPE_RD   = 1;
   parameter SEL_SRAM_TYPE    = 1;
   parameter MEM_DEPTH        = 512;
   parameter PIPE          = 1;
   parameter AXI4_IDWIDTH     = 4;

   // -------------------------------------------------------------------------
   // I/O Signals
   // -------------------------------------------------------------------------
   // Clock and Clock control signals
   input               ACLK;
   input               ARESETN;
   // AXI4 Slave interface signals
   input [AXI4_IDWIDTH - 1:0] AWID_S;
   input [AXI4_AWIDTH - 1:0]  AWADDR_S;
   input [7:0]                AWLEN_S;
   input [2:0]                AWSIZE_S;
   input [1:0]                AWBURST_S;
   input                      AWVALID_S;
   output                     AWREADY_S;
   input [AXI4_DWIDTH - 1:0]  WDATA_S;
   input [AXI4_DWIDTH/8-1:0]  WSTRB_S;
   input                      WLAST_S;
   input                      WVALID_S;
   output                     WREADY_S;
   output [AXI4_IDWIDTH - 1:0] BID_S;
   output [1:0]                BRESP_S;
   output                      BVALID_S;
   input [AXI4_IDWIDTH - 1:0]  ARID_S;
   input [AXI4_AWIDTH - 1:0]   ARADDR_S;
   input [7:0]                 ARLEN_S;
   input [2:0]                 ARSIZE_S;
   input [1:0]                 ARBURST_S;
   input                       ARVALID_S;
   output                      ARREADY_S;
   output [AXI4_IDWIDTH - 1:0] RID_S;
   output [AXI4_DWIDTH - 1:0]  RDATA_S;
   output [1:0]                RRESP_S;
   output                      RLAST_S;
   output                      RVALID_S;
   input                       RREADY_S;
   // From Main Control block
   input                       waddrchset_mc;
   input                       raddrchset_mc;
   input                       awready_mc;
   input                       wready_mc;
   input                       arready_mc;
   input                       bvalid_mc;   
   input [AXI4_IDWIDTH-1:0]    bid_mc;  
   input [1:0]                 bresp_mc; 
   input                       rvalid_mc;   
   input [AXI4_IDWIDTH-1:0]    rid_mc;  
   input [1:0]                 rresp_mc; 
   input                       rlast_mc;
   input [AXI4_DWIDTH - 1:0]   rdata_mc;
   
   // To Main Control block
   output [AXI4_IDWIDTH - 1: 0] AWID_slvif;
   output                       AWVALID_slvif;   
   output [AXI4_AWIDTH - 1:0]   AWADDR_slvif;
   output [2:0]                 AWSIZE_slvif;
   output [7:0]                 AWLEN_slvif;
   output [1:0]                 AWBURST_slvif;
   output [AXI4_DWIDTH - 1:0]   WDATA_slvif;
   output [AXI4_DWIDTH/8-1:0]   WSTRB_slvif;
   output                       WLAST_slvif;
   output                       WVALID_slvif;
   output [AXI4_IDWIDTH - 1: 0] ARID_slvif;
   output                       ARVALID_slvif;
   output [1:0]                 ARBURST_slvif;   
   output [AXI4_AWIDTH - 1:0]   ARADDR_slvif;
   output [2:0]                 ARSIZE_slvif;
   output [7:0]                 ARLEN_slvif;
   output                       RREADY_slvif;
   
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [AXI4_IDWIDTH - 1:0]    AWID_slvif;
   reg [AXI4_AWIDTH - 1:0]     AWADDR_slvif;
   reg [2:0]                   AWSIZE_slvif;
   reg [7:0]                   AWLEN_slvif;
   reg [1:0]                   AWBURST_slvif;
   reg [AXI4_IDWIDTH - 1:0]    ARID_slvif;
   reg [AXI4_AWIDTH - 1:0]     ARADDR_slvif;
   reg [2:0]                   ARSIZE_slvif;
   reg [1:0]                   ARBURST_slvif;
   reg [7:0]                   ARLEN_slvif;
   reg [AXI4_DWIDTH - 1:0]     WDATA_slvif;
   reg [AXI4_DWIDTH/8-1:0]     WSTRB_slvif;
   reg                         WLAST_slvif;
   reg                         WVALID_slvif;

   wire                        AWVALID_slvif;   
   wire                        AWREADY_S;
   wire                        ARREADY_S;
   wire                        WREADY_S;
   wire                        ARVALID_slvif;   
   wire [AXI4_IDWIDTH - 1:0]   RID_S;
   wire [AXI4_DWIDTH - 1:0]    RDATA_S;
   wire [1:0]                  RRESP_S;
   wire                        RLAST_S;
   wire                        RVALID_S;

   // --------------------------------------------------------------------------
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // ||                                                                      ||
   // ||                     Start - of - Code                                ||
   // ||                                                                      ||
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // --------------------------------------------------------------------------

   // ------------------------------------ //
   // Latch the write/read channel signals //
   // ------------------------------------ //
   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         AWADDR_slvif  <= 'h0;
         AWID_slvif    <= 'h0;
         AWBURST_slvif <= 'h0;
         AWSIZE_slvif  <= 'h0;
         AWLEN_slvif   <= 'h0;

         ARADDR_slvif  <= 'h0;
         ARID_slvif    <= 'h0;
         ARBURST_slvif <= 'h0;
         ARSIZE_slvif  <= 'h0;
         ARLEN_slvif   <= 'h0;
      end
      else begin
         // From Main Control block: WR FSM 
         if(waddrchset_mc == 1'b1) begin
            AWADDR_slvif  <= AWADDR_S;
            AWID_slvif    <= AWID_S;
            AWBURST_slvif <= AWBURST_S;
            AWSIZE_slvif  <= AWSIZE_S;
			AWLEN_slvif   <= AWLEN_S;
         end
         
		 // From Main Control block: RD FSM 
         if(raddrchset_mc == 1'b1) begin
            ARADDR_slvif  <= ARADDR_S;
            ARID_slvif    <= ARID_S;
            ARBURST_slvif <= ARBURST_S;
            ARSIZE_slvif  <= ARSIZE_S;
			ARLEN_slvif   <= ARLEN_S;
         end
         
      end
   end

   assign AWVALID_slvif = AWVALID_S;
   assign ARVALID_slvif = ARVALID_S;   
   assign RREADY_slvif  = RREADY_S;
   
   // ---------------------------------------------- //
   // Latch the write data channel signals           //
   // These signals are output to Main Control block //
   // ---------------------------------------------- //
   always @(*) begin  // perf  
         WLAST_slvif    = WLAST_S;
         WSTRB_slvif    = WSTRB_S;
         WDATA_slvif    = WDATA_S;
   end

   always @(*) begin
      WVALID_slvif   = WVALID_S;
   end
   // ------------------------------------------------------------------------ //
   // Generate the ready signals for write address/read address and write data //
   // ------------------------------------------------------------------------ //
   assign AWREADY_S = (AXI4_IFTYPE_WR) ? awready_mc : 1'b0;
   assign ARREADY_S = (AXI4_IFTYPE_RD) ? arready_mc : 1'b0;
   assign WREADY_S  = (AXI4_IFTYPE_WR) ? wready_mc  : 1'b0;  
   
   // ------------------------------------------------------------------- //
   // Generate the Write response channel output signals to the top-level //
   // ------------------------------------------------------------------- //
   assign BVALID_S = bvalid_mc;
   assign BRESP_S  = bresp_mc;
   assign BID_S    = bid_mc;

   // ----------------------------------------------------------------------- //
   // Generate the Read data response channel output signals to the top-level //
   // ----------------------------------------------------------------------- //
   assign RVALID_S = rvalid_mc;
   assign RRESP_S  = rresp_mc;
   assign RID_S    = rid_mc;
   assign RLAST_S  = rlast_mc;
   assign RDATA_S  = rdata_mc;
   


endmodule // SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM
