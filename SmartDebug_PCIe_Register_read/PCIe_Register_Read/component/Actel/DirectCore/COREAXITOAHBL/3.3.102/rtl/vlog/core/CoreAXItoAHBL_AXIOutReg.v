// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: 
//
// SVN Revision Information:
// SVN $Revision: 27754 $
// SVN $Date: 2016-11-08 08:10:59 +0530 (Tue, 08 Nov 2016) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module COREAXITOAHBL_AXIOutReg(
                // Global inputs,
                ACLK,
                ARESETN,
                
                // AXISlaveCtrl inputs
                BRESPOut,
                BIDOut,
                AWREADYOut,
                WREADYOut,
                BVALIDOut,
                ARREADYOut,
                RVALIDOut,
                RLASTOut,
                RDATAOut,
                RIDOut,
                RRESPOut,
                
                // AXIMaster outputs
                BRESP,
                BID,
                AWREADY,
                WREADY,
                BVALID,
                ARREADY,
                RVALID,
                RLAST,
                RDATA,
                RID,
                RRESP
                );
////////////////////////////////////////////////////////////////////////////////
// User modifiable parameters
////////////////////////////////////////////////////////////////////////////////
parameter ID_WIDTH = 4;         // Sets the width of the ID field supported.
parameter AXI_DWIDTH = 64;      // Sets the AXI data width - 32/64.
parameter AXI_STRBWIDTH = 8;    // Sets the AXI strobe width depending on AXI data width.
////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////
                        // Global inputs,
input                   ACLK;
input                   ARESETN;

                        // AXISlaveCtrl inputs
input  [1:0]            BRESPOut;
input  [ID_WIDTH-1:0]   BIDOut;
input                   AWREADYOut;
input                   WREADYOut;
input                   BVALIDOut;
input                   ARREADYOut;
input                   RVALIDOut;
input                   RLASTOut;
input  [AXI_DWIDTH-1:0] RDATAOut;
input  [ID_WIDTH-1:0]   RIDOut;
input  [1:0]            RRESPOut;

                        // AXIMaster outputs
output  [1:0]           BRESP;
output  [ID_WIDTH-1:0]  BID;
output                  AWREADY;
output                  WREADY;
output                  BVALID;
output                  ARREADY;
output                  RVALID;
output                  RLAST;
output  [AXI_DWIDTH-1:0] RDATA;
output  [ID_WIDTH-1:0]  RID;
output  [1:0]           RRESP;

reg     [1:0]           BRESP;
reg     [ID_WIDTH-1:0]  BID;
reg                     AWREADY;
reg                     WREADY;
reg                     BVALID;
reg                     ARREADY;
reg                     RVALID;
reg                     RLAST;
reg     [AXI_DWIDTH-1:0] RDATA;
reg     [ID_WIDTH-1:0]  RID;
reg     [1:0]           RRESP;

////////////////////////////////////////////////////////////////////////////////
// Output register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge ACLK or negedge ARESETN)
begin
    if (!ARESETN)
    begin
        BRESP[1:0] <= 2'b0;
        BID[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
        AWREADY <= 1'b0;
        WREADY <= 1'b0;
        BVALID <= 1'b0;
        ARREADY <= 1'b0;
        RVALID <= 1'b0;
        RLAST <= 1'b0;
        RDATA <= 'h0;
        RID[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
        RRESP[1:0] <= 2'b0;
    end
    else
    begin
        BRESP <= BRESPOut;
        BID <= BIDOut;
        AWREADY <= AWREADYOut;
        WREADY <= WREADYOut;
        BVALID <= BVALIDOut;
        ARREADY <= ARREADYOut;
        RVALID <= RVALIDOut;
        RLAST <= RLASTOut;
        RDATA <= RDATAOut;
        RID <= RIDOut;
        RRESP <= RRESPOut;
    end
end

endmodule // COREAXITOAHBL_AXIOutReg
