// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  CoreAXI4SRAM
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
//       --------------------------
//       Changes for v2.3 - Jan18
//       --------------------------
//       1. Added port MEM_WBYTE_EN [AXI4_DWIDTH/8] and removed individual
//       byte enable ports such as MEM_WENA, MEM_WENB, MEM_WENA_MSB, 
//       MEM_WENB_MSB
//       2. Added support for 128, 256 and 512 DW.
//
//               
//
//  Structure:
//            CoreAXI4SRAM (TOP) _   
//                               |
//                               |_ CoreAXI4_SLVIF
//                               |
//                               |_ CoreAXI4_MAINCTRL
//               
//
// ********************************************************************/
module SRAM_AXI_COREAXI4SRAM_0_COREAXI4SRAM(
                              ACLK,
                              ARESETN,
                              AWID,
                              AWADDR,
                              AWLEN,
                              AWSIZE,
                              AWBURST,
                              AWCACHE,
                              AWPROT,
                              AWLOCK,
                              AWVALID,
                              AWREADY,
                              WDATA,
                              WSTRB,
                              WLAST,
                              WVALID,
                              WREADY,
                              BID,
                              BRESP,
                              BVALID,
                              BREADY,
                              ARID,
                              ARADDR,
                              ARLEN,
                              ARSIZE,
                              ARBURST,
                              ARCACHE,
                              ARPROT,
                              ARLOCK,
                              ARVALID,
                              ARREADY,
                              RID,
                              RDATA,
                              RRESP,
                              RLAST,
                              RVALID,
                              RREADY,
			      // SRAM Memory interface
			                  MEM_WBYTE_EN, 
			                  MEM_WADDR,
			                  MEM_WDATA,
			                  MEM_WEN,
			                  MEM_REN,
			                  MEM_RADDR,
			                  MEM_RDATA
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
   parameter AXI4_IDWIDTH     = 4;

   parameter WRAP_SUPPORT     = 0; // Enables to handle the AXI wapping burst type.
                                    // Must be enabled in order for the wrapping burst
                                    // transactions to work.
   parameter ECC     = 1;
   parameter PIPE     = 2;
   parameter FAMILY   = 25;
   
      // --------------------------------------------------------------------------
   // Function to calculate the ceiling value of log.
   // --------------------------------------------------------------------------
   function [31:0] ceil_log2;
      input  integer x;
      integer tmp, res;
      begin
         tmp = 1;
         res = 0;
         while (tmp < x) begin
            tmp = tmp * 2;
            res = res + 1;
         end
         ceil_log2 = res;
      end
   endfunction // ceil_log2
   

   // --------------------------------------------------------------------------
   // Local Parameter
   // --------------------------------------------------------------------------   
   localparam MEM_AWIDTH      = ceil_log2(MEM_DEPTH);
  
   // -------------------------------------------------------------------------
   // I/O Signals
   // -------------------------------------------------------------------------
   // Clock and Clock control signals
   input               ACLK;
   input               ARESETN;
   // AXI4 Slave interface signals
   input [AXI4_IDWIDTH - 1:0] AWID;
   input [AXI4_AWIDTH - 1:0]  AWADDR;
   input [7:0]                AWLEN;
   input [2:0]                AWSIZE;
   input [1:0]                AWBURST;
   input [3:0]                AWCACHE;
   input [2:0]                AWPROT;
   input [1:0]                AWLOCK;
   input                      AWVALID;
   output                     AWREADY;
   input [AXI4_DWIDTH - 1:0]  WDATA;
   input [AXI4_DWIDTH/8-1:0]  WSTRB;
   input                      WLAST;
   input                      WVALID;
   output                     WREADY;
   output [AXI4_IDWIDTH - 1:0] BID;
   output [1:0]                BRESP;
   output                      BVALID;
   input                       BREADY;
   input [AXI4_IDWIDTH - 1:0]  ARID;
   input [AXI4_AWIDTH - 1:0]   ARADDR;
   input [7:0]                 ARLEN;
   input [2:0]                 ARSIZE;
   input [1:0]                 ARBURST;
   input [3:0]                 ARCACHE;
   input [2:0]                 ARPROT;
   input [1:0]                 ARLOCK;
   input                       ARVALID;
   output                      ARREADY;
   output [AXI4_IDWIDTH - 1:0] RID;
   output [AXI4_DWIDTH - 1:0]  RDATA;
   output [1:0]                RRESP;
   output                      RLAST;
   output                      RVALID;
   input                       RREADY;
   
   // SRAM memory interface
   output [(AXI4_DWIDTH/8)-1:0]  MEM_WBYTE_EN;
   output [MEM_AWIDTH-1:0]       MEM_WADDR;
   output [AXI4_DWIDTH-1:0]      MEM_WDATA;
   output                        MEM_WEN;   
   output                        MEM_REN;   
   output [MEM_AWIDTH-1:0]       MEM_RADDR;
   input  [AXI4_DWIDTH-1:0]      MEM_RDATA;   


   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   wire                        bvalid_mc;
   wire [AXI4_IDWIDTH-1:0]     bid_mc;   
   wire [1:0]                  bresp_mc;
   wire [AXI4_IDWIDTH-1:0]     AWID_slvif;
   wire [AXI4_AWIDTH - 1:0]    AWADDR_slvif;   
   wire [2:0]                  AWSIZE_slvif;   
   wire [7:0]                  AWLEN_slvif;   
   wire                        AWVALID_slvif;   
   wire [1:0]                  AWBURST_slvif;
   
   wire [AXI4_DWIDTH - 1:0]    WDATA_slvif;
   wire [AXI4_DWIDTH/8-1:0]    WSTRB_slvif;
   wire                        WLAST_slvif;
   wire                        WVALID_slvif;
   wire                        rvalid_mc;
   wire [AXI4_IDWIDTH-1:0]     rid_mc;   
   wire [1:0]                  rresp_mc;
   wire [AXI4_DWIDTH - 1:0]    rdata_mc;
   wire                        rlast_mc;
   wire [AXI4_IDWIDTH-1:0]     ARID_slvif;
   wire [AXI4_AWIDTH - 1:0]    ARADDR_slvif;   
   wire [2:0]                  ARSIZE_slvif;   
   wire                        ARVALID_slvif;   
   wire [7:0]                  ARLEN_slvif;
   wire [1:0]                  ARBURST_slvif;
   wire [(AXI4_DWIDTH/8)-1:0]  MEM_WBYTE_EN;  
   wire [MEM_AWIDTH-1:0]       MEM_WADDR;
   wire [AXI4_DWIDTH-1:0]      MEM_WDATA;
   wire                                       MEM_WEN;   
   wire                                       MEM_REN;   
   wire [MEM_AWIDTH-1:0]                      MEM_RADDR;
   wire [AXI4_DWIDTH-1:0] MEM_RDATA;
   
   // --------------------------------------------------------------------------
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // ||                                                                      ||
   // ||                     Start - of - Code                                ||
   // ||                                                                      ||
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // --------------------------------------------------------------------------

   // --------------------------------------------------------------------------
   // Top-level outputs
   // --------------------------------------------------------------------------         



   // --------------------------------------------------------------------------
   // Instance:: AXI4 Slave Interface 
   // --------------------------------------------------------------------------
   //            Contains logic to:
   //                              1. Generate AWREADY/ARREADY/WREADY
   //                              2. Generate BID/BVALID/BRESP
   //                              3. Generate RID/RVALID/RRESP/RLAST
   //                
   // --------------------------------------------------------------------------         
   SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_SLVIF #(
                        //.FAMILY        (FAMILY         ),         
                        .AXI4_DWIDTH   (AXI4_DWIDTH    ),   
                        .AXI4_AWIDTH   (AXI4_AWIDTH    ),
                        .AXI4_IDWIDTH  (AXI4_IDWIDTH   ),
                        .AXI4_IFTYPE_WR(AXI4_IFTYPE_WR ),
                        .AXI4_IFTYPE_RD(AXI4_IFTYPE_RD ),
                        .SEL_SRAM_TYPE (SEL_SRAM_TYPE  ),  
                        .MEM_DEPTH     (MEM_DEPTH      ),
                        .PIPE       (PIPE        )
                        )
     U_SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_SLVIF(
                          .ACLK        (ACLK           ),
                          .ARESETN     (ARESETN        ),
                          .AWID_S      (AWID           ),
                          .AWADDR_S    (AWADDR         ),
                          .AWLEN_S     (AWLEN          ),
                          .AWSIZE_S    (AWSIZE         ),
                          .AWBURST_S   (AWBURST        ),
                          .AWVALID_S   (AWVALID        ),
                          .AWREADY_S   (AWREADY        ),
                          .WDATA_S     (WDATA          ),
                          .WSTRB_S     (WSTRB          ),
                          .WLAST_S     (WLAST          ),
                          .WVALID_S    (WVALID         ),
                          .WREADY_S    (WREADY         ),
                          .BID_S       (BID            ),
                          .BRESP_S     (BRESP          ),
                          .BVALID_S    (BVALID         ),
                          .ARID_S      (ARID           ),
                          .ARADDR_S    (ARADDR         ),
                          .ARLEN_S     (ARLEN          ),
                          .ARSIZE_S    (ARSIZE         ),
                          .ARBURST_S   (ARBURST        ),
                          .ARVALID_S   (ARVALID        ),
                          .ARREADY_S   (ARREADY        ),
                          .RID_S       (RID            ),
                          .RDATA_S     (RDATA          ),
                          .RRESP_S     (RRESP          ),
                          .RLAST_S     (RLAST          ),
                          .RVALID_S    (RVALID         ),
                          .RREADY_S    (RREADY         ),
                          // To Main Control block
                          .AWID_slvif    (AWID_slvif   ),
                          .AWADDR_slvif  (AWADDR_slvif ),
                          .AWSIZE_slvif  (AWSIZE_slvif ),
                          .AWLEN_slvif   (AWLEN_slvif  ),
                          .AWVALID_slvif (AWVALID_slvif),
                          .AWBURST_slvif (AWBURST_slvif),
                          .WDATA_slvif   (WDATA_slvif  ),
                          .WSTRB_slvif   (WSTRB_slvif  ),
                          .WLAST_slvif   (WLAST_slvif  ),
                          .WVALID_slvif  (WVALID_slvif ),
                          .ARID_slvif    (ARID_slvif   ),
                          .ARADDR_slvif  (ARADDR_slvif ),
                          .ARSIZE_slvif  (ARSIZE_slvif ),
                          .ARVALID_slvif (ARVALID_slvif),
                          .ARLEN_slvif   (ARLEN_slvif  ),
                          .ARBURST_slvif (ARBURST_slvif),
                          .RREADY_slvif  (RREADY_slvif ),
                          // From Main Control block
                          .waddrchset_mc (waddrchset_mc),
                          .raddrchset_mc (raddrchset_mc),
                          .awready_mc    (awready_mc   ),
                          .wready_mc     (wready_mc    ),
                          .arready_mc    (arready_mc   ),
                          .bvalid_mc     (bvalid_mc    ),
                          .bid_mc        (bid_mc       ),
                          .bresp_mc      (bresp_mc     ),
                          .rvalid_mc     (rvalid_mc    ),
                          .rid_mc        (rid_mc       ),  
                          .rlast_mc      (rlast_mc     ),
                          .rresp_mc      (rresp_mc     ),
                          .rdata_mc      (rdata_mc     )
                          
                          );

   // --------------------------------------------------------------------------
   // Instance:: Main Control block
   // --------------------------------------------------------------------------
   //            Contains : 
   //                      1. Write/Read State Machine
   //                      2. Generates control signals to the memory
   //
   // --------------------------------------------------------------------------        

generate 
  if(ECC != 0)   
    SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_MAINCTRL_ECC  #(
                            .FAMILY        (FAMILY         ),         
                            .AXI4_DWIDTH   (AXI4_DWIDTH    ),   
                            .AXI4_AWIDTH   (AXI4_AWIDTH    ),
                            .AXI4_IDWIDTH  (AXI4_IDWIDTH   ),
                            .AXI4_IFTYPE_WR(AXI4_IFTYPE_WR ),
                            .AXI4_IFTYPE_RD(AXI4_IFTYPE_RD ),
                            .SEL_SRAM_TYPE (SEL_SRAM_TYPE  ),  
                            .MEM_DEPTH     (MEM_DEPTH      ),
                            .MEM_AWIDTH    (MEM_AWIDTH     ),
                            .PIPE          (PIPE           ),
                            .WRAP_SUPPORT  (WRAP_SUPPORT   ),
                            .ECC           (ECC            )
                            )
     U_SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_MAINCTRL_ECC(
                             .ACLK          (ACLK          ),
                             .ARESETN       (ARESETN       ),
                             // From Slave Interface block
                             .AWID_slvif    (AWID_slvif    ),
                             .AWADDR_slvif  (AWADDR_slvif  ),
                             .AWSIZE_slvif  (AWSIZE_slvif  ),
                             .AWLEN_slvif   (AWLEN_slvif   ),
                             .AWVALID_slvif (AWVALID_slvif ),
                             .AWBURST_slvif (AWBURST_slvif ),
                             .WDATA_slvif   (WDATA_slvif   ),
                             .WSTRB_slvif   (WSTRB_slvif   ),
                             .WLAST_slvif   (WLAST_slvif   ),
                             .WVALID_slvif  (WVALID_slvif  ),
                             .BREADY_slvif  (BREADY        ),
                             .AWADDR        (AWADDR        ),
                             .AWSIZE        (AWSIZE        ),
                             .AWVALID       (AWVALID       ),
                             .AWBURST       (AWBURST       ),
                             .ARID_slvif    (ARID_slvif    ),
                             .ARADDR_slvif  (ARADDR_slvif  ),
                             .ARBURST_slvif (ARBURST_slvif ),
                             .ARSIZE_slvif  (ARSIZE_slvif  ),
                             .ARVALID_slvif (ARVALID_slvif ),
                             .ARLEN_slvif   (ARLEN_slvif   ),
                             .RREADY_slvif  (RREADY_slvif  ),
                             .ARADDR        (ARADDR        ), 
                             .ARVALID       (ARVALID       ),
                             .ARSIZE        (ARSIZE        ),
                             .ARLEN         (ARLEN         ),
                             .ARBURST       (ARBURST       ),
                             // To Slave Interface block
                             .waddrchset_mc (waddrchset_mc ),
                             .raddrchset_mc (raddrchset_mc ),
                             .awready_mc    (awready_mc    ),
                             .wready_mc     (wready_mc     ),
                             .arready_mc    (arready_mc    ),
                             .bvalid_mc     (bvalid_mc     ),
                             .bid_mc        (bid_mc        ),
                             .bresp_mc      (bresp_mc      ),
                             .rvalid_mc     (rvalid_mc     ),
                             .rid_mc        (rid_mc        ),  
                             .rlast_mc      (rlast_mc      ),
                             .rresp_mc      (rresp_mc      ),
                             .rdata_mc      (rdata_mc      ),
                             // To SRAM Memory Interface
                             .wbyteen_sc    (MEM_WBYTE_EN  ),
                             .waddr_sc      (MEM_WADDR     ),
                             .wdata_sc      (MEM_WDATA     ),
                             .wen_sc        (MEM_WEN       ),
                             .ren_sc        (MEM_REN       ),
                             .raddr_sc      (MEM_RADDR     ),
                             .rdata_sc      (MEM_RDATA     )
                             );
  else 
      SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_MAINCTRL  #(
                            //.FAMILY        (FAMILY         ),         
                            .AXI4_DWIDTH   (AXI4_DWIDTH    ),   
                            .AXI4_AWIDTH   (AXI4_AWIDTH    ),
                            .AXI4_IDWIDTH  (AXI4_IDWIDTH   ),
                            .AXI4_IFTYPE_WR(AXI4_IFTYPE_WR ),
                            .AXI4_IFTYPE_RD(AXI4_IFTYPE_RD ),
                            .SEL_SRAM_TYPE (SEL_SRAM_TYPE  ),  
                            .MEM_DEPTH     (MEM_DEPTH      ),
                            .MEM_AWIDTH    (MEM_AWIDTH     ),
                            .PIPE          (PIPE           ),
                            .WRAP_SUPPORT  (WRAP_SUPPORT   )
                            )
     U_SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_MAINCTRL(
                             .ACLK          (ACLK          ),
                             .ARESETN       (ARESETN       ),
                             // From Slave Interface block
                             .AWID_slvif    (AWID_slvif    ),
                             .AWADDR_slvif  (AWADDR_slvif  ),
                             .AWSIZE_slvif  (AWSIZE_slvif  ),
                             .AWLEN_slvif   (AWLEN_slvif   ),
                             .AWVALID_slvif (AWVALID_slvif ),
                             .AWBURST_slvif (AWBURST_slvif ),
                             .WDATA_slvif   (WDATA_slvif   ),
                             .WSTRB_slvif   (WSTRB_slvif   ),
                             .WLAST_slvif   (WLAST_slvif   ),
                             .WVALID_slvif  (WVALID_slvif  ),
                             .BREADY_slvif  (BREADY        ),
                             .AWADDR        (AWADDR        ),
                             .AWSIZE        (AWSIZE        ),
                             .AWVALID       (AWVALID       ),
                             .AWBURST       (AWBURST       ),
                             .ARID_slvif    (ARID_slvif    ),
                             .ARADDR_slvif  (ARADDR_slvif  ),
                             .ARBURST_slvif (ARBURST_slvif ),
                             .ARSIZE_slvif  (ARSIZE_slvif  ),
                             .ARVALID_slvif (ARVALID_slvif ),
                             .ARLEN_slvif   (ARLEN_slvif   ),
                             .RREADY_slvif  (RREADY_slvif  ),
                             .ARADDR        (ARADDR        ), 
                             .ARVALID       (ARVALID       ),
                             .ARSIZE        (ARSIZE        ),
                             .ARLEN         (ARLEN         ),
                             .ARBURST       (ARBURST       ),
                             // To Slave Interface block
                             .waddrchset_mc (waddrchset_mc ),
                             .raddrchset_mc (raddrchset_mc ),
                             .awready_mc    (awready_mc    ),
                             .wready_mc     (wready_mc     ),
                             .arready_mc    (arready_mc    ),
                             .bvalid_mc     (bvalid_mc     ),
                             .bid_mc        (bid_mc        ),
                             .bresp_mc      (bresp_mc      ),
                             .rvalid_mc     (rvalid_mc     ),
                             .rid_mc        (rid_mc        ),  
                             .rlast_mc      (rlast_mc      ),
                             .rresp_mc      (rresp_mc      ),
                             .rdata_mc      (rdata_mc      ),
                             // To SRAM Memory Interface
                             .wbyteen_sc    (MEM_WBYTE_EN  ),
                             .waddr_sc      (MEM_WADDR     ),
                             .wdata_sc      (MEM_WDATA     ),
                             .wen_sc        (MEM_WEN       ),
                             .ren_sc        (MEM_REN       ),
                             .raddr_sc      (MEM_RADDR     ),
                             .rdata_sc      (MEM_RDATA     )
                             );

endgenerate   
endmodule // SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM

   
   
