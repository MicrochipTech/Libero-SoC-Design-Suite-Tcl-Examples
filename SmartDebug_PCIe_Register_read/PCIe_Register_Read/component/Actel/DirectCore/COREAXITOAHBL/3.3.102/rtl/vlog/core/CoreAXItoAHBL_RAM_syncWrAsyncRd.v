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
module COREAXITOAHBL_RAM_syncWrAsyncRd (
                // Inputs
                wrCLK,
                RESETN,
                wrEn,
                wrAddr,
                wrData,
                rdAddr,
                
                // Outputs
                rdData
               );

////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter AXI_DWIDTH = 64;    // Sets the AXI data width - 32/64.
parameter AXI_STRBWIDTH = 8;  // Sets the AXI strobe width depending on AXI 
                              // data width.
////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////
input           wrCLK;
input           RESETN;
input           wrEn;
input   [3:0]   wrAddr;
input   [AXI_DWIDTH-1:0]  wrData;
input   [3:0]   rdAddr;

output  [AXI_DWIDTH-1:0]  rdData;

////////////////////////////////////////////////////////////////////////////////
// RAM Inference
////////////////////////////////////////////////////////////////////////////////
reg     [AXI_DWIDTH-1:0]  mem [15:0];     
reg     [3:0]   wrAddrReg;
reg     [AXI_DWIDTH-1:0]  wrDataReg;
reg             wrEnReg;

always @ (posedge wrCLK or negedge RESETN)
begin
    if (!RESETN)
    begin
        wrAddrReg <= 4'b0;
        wrDataReg <= 'h0;
        wrEnReg <= 1'b0;
    end
    else
    begin
        wrAddrReg <= wrAddr;
        wrDataReg <= wrData;
        wrEnReg <= wrEn;
    end
end

// Synchronous write
always @ (posedge wrCLK)
begin
    if (wrEnReg)
        mem[wrAddrReg] <= wrDataReg;
end

// Asynchronous read
assign rdData = mem[rdAddr];

endmodule // COREAXITOAHBL_RAM_syncWrAsyncRd
