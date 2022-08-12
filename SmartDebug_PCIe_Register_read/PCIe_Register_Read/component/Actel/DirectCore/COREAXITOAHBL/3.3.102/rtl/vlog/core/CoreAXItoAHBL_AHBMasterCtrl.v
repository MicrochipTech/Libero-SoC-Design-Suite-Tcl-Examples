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
// SVN $Revision: 30622 $
// SVN $Date: 2017-09-25 12:48:39 +0530 (Mon, 25 Sep 2017) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//	SAR#82615 - Added support for 32-bit AXI data width
//	SAR#90363 - Added support for 16-bit and 8-bit AXI data transfer size
// ****************************************************************************/
module COREAXITOAHBL_AHBMasterCtrl    (
                        // Global inputs
                        HCLK,
                        HRESETN,
                        
                        // AXISlaveCtrl inputs
                        AHBWrTranPend,
                        AHBRdTranPend,
                        validByteCnt,
                        AXIAddr,
                        AXIBurst,
                        AXILen,
                        AXISize, 
                        // AHB Slave inputs
                        HREADYIN,
                        HRDATA,
                        HRESP,
                        
                        // wrFIFORAM inputs
                        wrFIFORdData,
                        
                        // AHB Slave outputs
                        HWRITE,
                        HSIZE,
                        HWDATA,
                        HADDR,
                        HTRANS,
                        HBURST,
                        
                        // AXISlaveCtrl outputs
                        AHBWrDone,
                        AHBRdDone,
                        AHBError,
                        
                        // wrFIFORAM outputs
                        wrFIFORdAddr,
                        
                        // rdFIFORAM outputs
                        rdFIFOWrEn,
                        rdFIFOWrAddr,
                        rdFIFOWrData
                        );
////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter NO_BURST_TRANS = 0; // Prevents AHB-Lite burst transfers being generated
                              // when equal to 1. Burst transfers are enabled 
                              // by default.
parameter WRAP_SUPPORT = 0;   // Enables this block to handle AXI wrapping burst
                              // transactions. Wrapping burst transactions are
                              // disabled by default.			
parameter AXI_DWIDTH = 64;    // Sets the AXI data width - 32/64.
parameter AXI_STRBWIDTH = 8;  // Sets the AXI strobe width depending on AXI data width.
////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////

// AXI data width
localparam AXI_DW = (AXI_DWIDTH == 64) ? 1'b1 : 1'b0;  

                        // Global inputs
input                   HCLK;
input                   HRESETN;

                        // AXISlaveCtrl inputs
input                   AHBWrTranPend;
input                   AHBRdTranPend;
input   [7:0]           validByteCnt;
input   [31:0]          AXIAddr;
input   [1:0]           AXIBurst;
input   [3:0]           AXILen;
input   [2:0]           AXISize; 

                        // AHB Slave inputs
input                   HREADYIN;
input                   HRESP;
input   [31:0]          HRDATA;

                        // wrFIFORAM inputs
input   [AXI_DWIDTH-1:0] wrFIFORdData;

                        // AHB Slave outputs
output                  HWRITE;
output  [2:0]           HSIZE;
output  [31:0]          HWDATA;
output  [31:0]          HADDR;
output  [1:0]           HTRANS;
output  [2:0]           HBURST;

                        // AXISlaveCtrl outputs
output                  AHBWrDone;
output                  AHBRdDone;
output                  AHBError;

                        // wrFIFORAM outputs
output  [3:0]           wrFIFORdAddr;

                        // rdFIFORAM outputs
output                  rdFIFOWrEn;
output  [3:0]           rdFIFOWrAddr;
output  [AXI_DWIDTH-1:0] rdFIFOWrData;

////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////////////////////////
                        // AHB Slave outputs
reg                     HWRITE;
reg     [2:0]           HSIZE;
reg     [31:0]          HWDATA;
reg     [31:0]          HADDR;
reg     [1:0]           HTRANS;
reg     [2:0]           HBURST;

                        // AXI SlaveCtrl outputs
reg                     AHBWrDone;
reg                     AHBRdDone;
reg                     AHBError;

                        // wrFIFO outputs
reg     [3:0]           wrFIFORdAddr;

reg                     rdFIFOWrEn;
reg     [3:0]           rdFIFOWrAddr;
reg     [AXI_DWIDTH-1:0] rdFIFOWrData;

////////////////////////////////////////////////////////////////////////////////
// Internal signal declarations
////////////////////////////////////////////////////////////////////////////////
reg     [3:0]           currState;
reg     [3:0]           nxtState;
reg                     AHBWrTranPendReg;
wire                    AHBWrTranPend_edge;
reg                     AHBRdTranPendReg;
wire                    AHBRdTranPend_edge;
reg     [7:0]           validByteCntInt;
reg     [7:0]           validByteCntInt_d;
wire    [7:0]           validByteCntInt_q;
reg     [31:0]          HADDRInt;
reg     [31:0]          HADDRInt_d;
wire    [31:0]          HADDRInt_q;
reg     [1:0]           AXIBurstInt;
reg     [1:0]           AXIBurstInt_d;
wire    [1:0]           AXIBurstInt_q;
reg     [3:0]           AXILenInt;
reg     [3:0]           AXILenInt_d;
wire    [3:0]           AXILenInt_q;
reg     [2:0]           HBURSTInt;
reg     [2:0]           HBURSTInt_d;
wire    [2:0]           HBURSTInt_q;
reg     [2:0]           HSIZEInt;
reg     [2:0]           HSIZEInt_d;
wire    [2:0]           HSIZEInt_q;
reg     [3:0]           wrFIFORdAddr_d;
wire    [3:0]           wrFIFORdAddr_q;
reg     [3:0]           rdFIFOWrAddr_d;
wire    [3:0]           rdFIFOWrAddr_q;
reg                     AHBWrDone_d;
wire                    AHBWrDone_q;
reg                     AHBRdDone_d;
wire                    AHBRdDone_q;
reg                     AHBError_d;
wire                    AHBError_q;
reg     [3:0]           beatCnt;
reg     [3:0]           beatCnt_d;
wire    [3:0]           beatCnt_q;
reg     [55:0]          rdFIFOWrDataReg;
reg     [55:0]          rdFIFOWrDataReg_d;
wire    [55:0]          rdFIFOWrDataReg_q;
reg     [63:0]          rdFIFOWrData_reg32;
reg	[63:0]		rdFIFOWrData_d32;
wire	[63:0]		rdFIFOWrData_q32;

////////////////////////////////////////////////////////////////////////////////
// Edge detect on AHBWrTranPend
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AHBWrTranPendReg <= 1'b0;
    else
        AHBWrTranPendReg <= AHBWrTranPend;
end

assign AHBWrTranPend_edge = AHBWrTranPendReg ^ AHBWrTranPend;

////////////////////////////////////////////////////////////////////////////////
// Edge detect on AHBRdTranPend
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AHBRdTranPendReg <= 1'b0;
    else
        AHBRdTranPendReg <= AHBRdTranPend;
end

assign AHBRdTranPend_edge = AHBRdTranPendReg ^ AHBRdTranPend;

////////////////////////////////////////////////////////////////////////////////
// validByteCntInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        validByteCntInt <= 8'b0;
    else
        validByteCntInt <= validByteCntInt_d;
end

assign validByteCntInt_q = validByteCntInt;

////////////////////////////////////////////////////////////////////////////////
// HADDRInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        HADDRInt <= 32'b0;
    else
        HADDRInt <= HADDRInt_d;
end

assign HADDRInt_q = HADDRInt;

////////////////////////////////////////////////////////////////////////////////
// AXIBurstInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AXIBurstInt <= 2'b0;
    else
        AXIBurstInt <= AXIBurstInt_d;
end

assign AXIBurstInt_q = AXIBurstInt;

////////////////////////////////////////////////////////////////////////////////
// AXILenInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AXILenInt <= 4'b0;
    else
        AXILenInt <= AXILenInt_d;
end

assign AXILenInt_q = AXILenInt;

////////////////////////////////////////////////////////////////////////////////
// HBURSTInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        HBURSTInt <= 3'b0;
    else
        HBURSTInt <= HBURSTInt_d;
end

assign HBURSTInt_q = HBURSTInt;

////////////////////////////////////////////////////////////////////////////////
// HSIZEInt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        HSIZEInt <= 3'b0;
    else
        HSIZEInt <= HSIZEInt_d;
end

assign HSIZEInt_q = HSIZEInt;

////////////////////////////////////////////////////////////////////////////////
// wrFIFORdAddr Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        wrFIFORdAddr <= 4'b0;
    else
        wrFIFORdAddr <= wrFIFORdAddr_d;
end

assign wrFIFORdAddr_q = wrFIFORdAddr;

////////////////////////////////////////////////////////////////////////////////
// rdFIFOWrAddr Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        rdFIFOWrAddr <= 4'b0;
    else
        rdFIFOWrAddr <= rdFIFOWrAddr_d;
end

assign rdFIFOWrAddr_q = rdFIFOWrAddr;

////////////////////////////////////////////////////////////////////////////////
// rdFIFOWrDataReg Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        rdFIFOWrDataReg <= 56'b0;
    else
        rdFIFOWrDataReg <= rdFIFOWrDataReg_d;
end

assign rdFIFOWrDataReg_q = rdFIFOWrDataReg;

////////////////////////////////////////////////////////////////////////////////
// AHBWrDone Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AHBWrDone <= 1'b0;
    else
        AHBWrDone <= AHBWrDone_d;
end

assign AHBWrDone_q = AHBWrDone;

////////////////////////////////////////////////////////////////////////////////
// AHBRdDone Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AHBRdDone <= 1'b0;
    else
        AHBRdDone <= AHBRdDone_d;
end

assign AHBRdDone_q = AHBRdDone;

////////////////////////////////////////////////////////////////////////////////
// beatCnt Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        beatCnt <= 4'b0;
    else
        beatCnt <= beatCnt_d;
end

assign beatCnt_q = beatCnt;

////////////////////////////////////////////////////////////////////////////////
// AHBError Register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        AHBError <= 1'b0;
    else
        AHBError <= AHBError_d;
end

assign AHBError_q = AHBError;

// SAR#82615
always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        rdFIFOWrData_reg32 <= 'h0;
    else begin
        if(rdFIFOWrEn && AXISize == 3'b010)
            rdFIFOWrData_reg32 <= rdFIFOWrData;
	else
	    rdFIFOWrData_reg32 <= rdFIFOWrData_d32;
    end
end

assign rdFIFOWrData_q32 = rdFIFOWrData_reg32;

////////////////////////////////////////////////////////////////////////////////
// AHB Write FSM
////////////////////////////////////////////////////////////////////////////////
// State encoding
localparam AHB_IDLE                     = 4'h0;
localparam AHB_WR_SETUP                 = 4'h1;
localparam AHB_WR_NON_SEQ_ADDR          = 4'h2;
localparam AHB_WR_NON_SEQ_DATA          = 4'h3;
localparam AHB_WR_ERROR                 = 4'h4;
localparam AHB_WR_SEQ_ADDR              = 4'h5;
localparam AHB_WR_SEQ_DATA              = 4'h6;
localparam AHB_WR_SEQ_LAST_BEAT         = 4'h7;
localparam AHB_RD_SETUP                 = 4'h8;
localparam AHB_RD_NON_SEQ_ADDR          = 4'h9;
localparam AHB_RD_ERROR                 = 4'hA;
localparam AHB_RD_NON_SEQ_DATA          = 4'hB;
localparam AHB_RD_SEQ_ADDR              = 4'hC;
localparam AHB_RD_SEQ_DATA              = 4'hD;
localparam AHB_RD_SEQ_DATA_LAST_BEAT    = 4'hE;


always @ (posedge HCLK or negedge HRESETN)
begin
    if (!HRESETN)
        currState <= AHB_IDLE;
    else
        currState <= nxtState;
end

always @ (*)
begin
    // Defaults
    nxtState <= currState;
    validByteCntInt_d <= validByteCntInt_q;
    HADDRInt_d <= HADDRInt_q;
    AXIBurstInt_d <= AXIBurstInt_q;
    AXILenInt_d <= AXILenInt_q;
    HBURSTInt_d <= HBURSTInt_q;
    HSIZEInt_d <= HSIZEInt_q;
    wrFIFORdAddr_d <= wrFIFORdAddr_q;
    rdFIFOWrAddr_d <= rdFIFOWrAddr_q;
    rdFIFOWrData_d32 <= rdFIFOWrData_q32;
    AHBWrDone_d <= AHBWrDone_q;
    AHBRdDone_d <= AHBRdDone_q;
    AHBError_d <= AHBError_q;
    beatCnt_d <= beatCnt_q;
    rdFIFOWrData <= 'h0;
    rdFIFOWrEn <= 1'b0;
    HWRITE <= 1'b0;
    HSIZE <= 3'b0;
    HWDATA <= 32'b0;
    HADDR <= 32'b0;
    HTRANS <= 2'b0;
    HBURST <= 3'b0;

    case (currState)

        AHB_IDLE:
            begin
		rdFIFOWrData_d32 <= 64'b0;
                rdFIFOWrDataReg_d <= 56'b0;
                if (AHBWrTranPend_edge)
                begin
                    // Only clear the AHBError if we've detected the start of 
                    // another transfer. Otherwisw this signal needs to remain
                    // level for sampling in the AXI clock domain.
                    validByteCntInt_d <= validByteCnt;
                    HADDRInt_d <= AXIAddr;
                    AXIBurstInt_d <= AXIBurst;
                    AXILenInt_d <= AXILen;
                    nxtState <= AHB_WR_SETUP;
                    AHBError_d <= 1'b0;
                end
                else if (AHBRdTranPend_edge)
                begin
                    // Only clear the AHBError if we've detected the start of 
                    // another transfer. Otherwise this signal needs to remain
                    // level for sampling in the AXI clock domain.
                    validByteCntInt_d <= validByteCnt;
                    HADDRInt_d <= AXIAddr;
                    AXIBurstInt_d <= AXIBurst;
                    AXILenInt_d <= AXILen;
                    nxtState <= AHB_RD_SETUP;
                    AHBError_d <= 1'b0;
                end
            end

        AHB_WR_SETUP:
            begin
                // The contents of the rdFIFOWrDataReg register needs to be 
                // maintained as the previous transfer may not have completed 
                // on a 64-bit boundary.
                rdFIFOWrDataReg_d <= 56'b0;
                if (HADDRInt[1:0] == 2'b0)
                begin
                    // We can only start AHBL burst transfers on 32-bit aligned
                    // addresses.

                    if ((validByteCntInt >= 8'd64) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd960))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01) 		// Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))  // Wrappping burst
			// 64-bit AXI transfers
                        // SAR#82615
	                // Added support for 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd64)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd96)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else    // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd32)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010) && (AXILenInt == 4'd15)) 
			// 32-bit AXI transfers
			// 16-beat wrapping burst on AXI
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if ((HADDRInt[5:0]) == 6'd0)  
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd32) 
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                        end
                        else	// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b000;
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
                        end
                    end

                    else if ((validByteCntInt >= 8'd32) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd992))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there's sufficient
                        // data and if they're supported by the slave/sub-system.
                        // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        if (AXIBurstInt[1:0] == 2'b01 && (AXISize == 3'b011 || AXISize == 3'b010)) // Incrementing bursts
			// 64-bit or 32-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b101;  // 8-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 
			// 16-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b001;   // half-word
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping bursts
			// 64-bit AXI transfers 
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd96)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd32)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else    // 4-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers  
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if ((HADDRInt[5:0]) <= 6'd32)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else    // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                // For 32-bit AXI data width support
                                if (HADDRInt[4:0] == 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                // SAR#82615
                                // For 32-bit AXI data transfer support
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001) && (AXILenInt == 4'd15))  
			// 16-bit AXI transfers
			// 16-beat wrapping burst on AXI
			begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if ((HADDRInt[4:0]) <= 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b000;  // single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                        end
                        else	// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
			    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                            if(AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI transfers
			    begin
                                validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                HSIZEInt_d <= 3'b010;
                                HBURSTInt_d <= 3'b000;
                                nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
			    else	// 16-bit AXI transfers
			    begin
                                validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                HSIZEInt_d <= 3'b001;    // half-word
                                HBURSTInt_d <= 3'b000;   // single
                                nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                        end
                    end

                    else if ((validByteCntInt >= 8'd16) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd1008))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there's sufficient
                        // data and if they're supported by the slave/sub-system.
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        if (AXIBurstInt[1:0] == 2'b01 && (AXISize == 3'b011 || AXISize == 3'b010)) // Incrementing burst
			// 64-bit or 32-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b011;  // 4-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 
			// 16-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b001;   // half-word
                            HBURSTInt_d <= 3'b101;  // 8-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000) 
			// 8-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b000;   // byte
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))  // wrapping burst
			// 64-bit AXI transfers 
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else // 2-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR#82615 
			// Added 32-bit AXI transfer support
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))  
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd48)	// -p (modified)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else    // 4-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary  
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001)) 
			// 16-bit AXI transfers 
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;    // half-word
                                    HBURSTInt_d <= 3'b000;   // single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;    // half-word
                                    HBURSTInt_d <= 3'b000;   // simgle
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end			
			end
			else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000) && (AXILenInt == 4'd15))  
			// 8-bit AXI transfers
			// 16-beat wrapping burst on AXI
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;    // byte
                                    HBURSTInt_d <= 3'b000;   // single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
			end
                        else	// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                            if (AXISize == 3'b011 || AXISize == 3'b010)	    // 64-bit and 32-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b000;
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            HSIZEInt_d <= 3'b001;    // half-word
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            HSIZEInt_d <= 3'b000;    // byte
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                        end
                    end

		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    else if (validByteCntInt >= 8'd8 && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 1016))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 		// Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b011;	// 4-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
			else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000)
                        begin
                            HSIZEInt_d <= 3'b000;	// byte-word
                            HBURSTInt_d <= 3'b101;	// 8-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))  // wrapping burst
			// 16-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else			// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] == 3'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
			end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))  // wrapping burst
			// 8-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b101;	// 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
				else if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else		// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] == 3'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b101;	// 8-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
				else if (HADDRInt[2:0] <= 3'd4)
				begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
				end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
			end
			else		// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            if (AXISize == 3'b011 || AXISize == 3'b010)	    // 64-bit and 32-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            HSIZEInt_d <= 3'b001;    // half-word
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            HSIZEInt_d <= 3'b000;    // byte
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                        end
		    end	

		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    else if (validByteCntInt >= 8'd4 && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 1020))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000) 		// Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b011;	// 4-beat 
                            nxtState <= AHB_WR_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))  // wrapping burst
			// 8-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] <= 3'd4)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
                            else 		// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[1:0] <= 2'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_WR_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                                end
                            end
			end
			else		// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            if (AXISize == 3'b011 || AXISize == 3'b010)	    // 64-bit and 32-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            HSIZEInt_d <= 3'b001;    // half-word
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            HSIZEInt_d <= 3'b000;    // byte
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			    end
                        end
		    end

                    else if (validByteCntInt >= 8'd4) 
                    begin
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;  
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			end
			else if (AXISize == 3'b001)			// 16-bit AXI transfers
			begin
			    validByteCntInt_d <= validByteCntInt_q - 3'd2;  
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			end
			else						// 8-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;  
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			end
                    end

                    else if (validByteCntInt >= 8'd2)
                    begin
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			if (AXISize == 3'b000)	// 8-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 2'd1;
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			end
			else			// 64/32/16-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;  
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_WR_NON_SEQ_ADDR;
			end
                    end

                    else
                    begin
                        validByteCntInt_d <= validByteCntInt_q - 1'b1;
                        HSIZEInt_d <= 3'b000;		// byte
                        HBURSTInt_d <= 3'b000;		// single
                        nxtState <= AHB_WR_NON_SEQ_ADDR;
                    end
                end

                else if ((HADDRInt[1:0] == 2'b10) && (validByteCntInt >= 8'd2))
                begin
		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    if (AXISize == 3'b000)	// 8-bit AXI transfers
		    begin
                        validByteCntInt_d <= validByteCntInt_q - 2'd1;
                        HSIZEInt_d <= 3'b000;	// byte
                        HBURSTInt_d <= 3'b000;	// single
                        nxtState <= AHB_WR_NON_SEQ_ADDR;
		    end
		    else			// 64/32/16-bit AXI transfers
		    begin
                        validByteCntInt_d <= validByteCntInt_q - 2'd2;
                        HSIZEInt_d <= 3'b001;	// half-word
                        HBURSTInt_d <= 3'b000;	// single
                        nxtState <= AHB_WR_NON_SEQ_ADDR;
		    end
                end

                else
                begin
                    validByteCntInt_d <= validByteCntInt_q - 1'b1;
                    HSIZEInt_d <= 3'b000;
                    HBURSTInt_d <= 3'b000;
                    nxtState <= AHB_WR_NON_SEQ_ADDR;
                end
            end

        AHB_WR_NON_SEQ_ADDR:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                HADDR <= HADDRInt;
                HWRITE <= 1'b1;
                HTRANS <= 2'b10; // Non-sequential transfer
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
                if (HREADYIN)
                    nxtState <= AHB_WR_NON_SEQ_DATA;
                else if (HRESP)
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_WR_ERROR;
            end

        AHB_WR_NON_SEQ_DATA:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
		if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI data transfer
		begin
                    if (HADDRInt[2])
                    begin
                    	HWDATA <= wrFIFORdData[63:32];
                    end
                    else
                    begin
                    	HWDATA <= wrFIFORdData[31:0];
                    end
		end
		else if (AXISize == 3'b001)		// 16-bit AXI transfer
		begin
		    if (HADDRInt[2:1] == 2'b00 || HADDRInt[2:1] == 2'b01)
			HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end
		else		// 8-bit AXI transfer
		begin
		    if (HADDRInt[2:0] == 3'b000 || HADDRInt[2:0] == 3'b001 || HADDRInt[2:0] == 3'b010 || HADDRInt[2:0] == 3'b011)
			HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end
               
                if (HREADYIN)
                begin
                    if (HSIZEInt[2:0] == 3'b010) // 32-bit transfers on AHBL interface
                    begin
                        // SAR#82615
			// Added support for 32 bit AXI transfers	
                        if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd4) && (AXISize == 3'b011)) begin    // Fixed burst
			    // 64-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach double word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd0) && (AXISize == 3'b010)) begin
			    // 32-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        else
                        begin
                            if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))    // Wrapping burst
                            begin
				// 64-bit AXI transfers
                                // WRAP_SUPPORT reference here to aid synthesis 
                                // pruning logic. The AXISlaveCtrl block won't alert
                                // this block that there is an AXI wrapping burst
                                // transaction pending in the wrFIFORAM if this
                                // parameter isn't set.
                                if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                                begin
                                    if ((HADDRInt[6:0] == 7'd124)) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[5:0] == 6'd60) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[4:0] == 5'd28) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if (HADDRInt[3:0] == 4'd12) begin // 2-beat wrapping burst on AXI
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                end
                                else
                                    // AXI wrapping transaction. Address hasn't yet 
                                    // reached the wrap boundary.
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010)) 
                            begin
				// 32-bit AXI transfers
                                // WRAP_SUPPORT reference here to aid synthesis 
                                // pruning logic. The AXISlaveCtrl block won't alert
                                // this block that there is an AXI wrapping burst
                                // transaction pending in the wrFIFORAM if this
                                // parameter isn't set.
                                if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                                begin
                                    // SAR#82615 
                                    if ((HADDRInt[5:0] == 6'd60)) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                                begin
                                    // SAR#82615
                                    if ((HADDRInt[4:0] == 5'd28)) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                                begin
                                    // SAR#82615 
                                    if ((HADDRInt[3:0] == 4'd12)) begin
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                    end
                                    else
                                        HADDRInt_d <= HADDRInt_q + 3'd4;
                                end
                                else if ((HADDRInt[2:0] == 3'd4)) begin // 2-beat wrapping burst on AXI
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                end
                                else
                                    // AXI wrapping transaction. Address hasn't yet 
                                    // reached the wrap boundary.
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else
                                // Responding to either an incrementing burst
                                // or fixed address AXI transaction (where the 
                                // fixed address hasn't reached a double word
                                // boundary for 64-bit AXI transfers or word 
                                // boundary for 32-bit AXI transfers).
                                // The AXISlaveCtrl block filters out 
                                // transactions with a burst type of 2'b11
                                // as it's 'reserved' in the AXI specification.
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                        end
                    end

                    else if (HSIZEInt[2:0] == 3'b001) //16-bit transfers on AHBL interface
                    begin
			// SAR#82615
			// Added support for 32 bit AXI transfer
                        if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd6) && (AXISize == 3'b011)) begin   // Fixed burst
			    // 64-bit AXI tansfers
                            // Return the address to the start address for fixed
                            // address burst once we reach double word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
			end
			else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd2) && (AXISize == 3'b010)) begin
			    // 32-bit AXI transfers
			    // Return the address to the start address for fixed
                            // address burst once we reach word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
			end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[0] == 1'd0) && (AXISize == 3'b001)) begin
			    // 16-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach half-word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        else
                        begin
                            if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b011))    // Wrapping burst
                            begin
				// 64-bit AXI transfers
                                // WRAP_SUPPORT reference here to aid synthesis 
                                // pruning logic. The AXISlaveCtrl block won't alert
                                // this block that there is an AXI wrapping burst
                                // transaction pending in the wrFIFORAM if this
                                // parameter isn't set.
                                if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[6:0] == 7'd126)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[5:0] == 6'd62)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[4:0] == 5'd30)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (HADDRInt[3:0] == 4'd14) // 2-beat wrapping burst on AXI
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
			    // SAR82615
			    // Added support for 32 bit AXI transfers
                            else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b010))
                            begin
				// 32-bit AXI transfers
                                // WRAP_SUPPORT reference here to aid synthesis 
                                // pruning logic. The AXISlaveCtrl block won't alert
                                // this block that there is an AXI wrapping burst
                                // transaction pending in the wrFIFORAM if this
                                // parameter isn't set.
                                if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[5:0] == 6'd62)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[4:0] == 5'd30)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[3:0] == 4'd14)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (HADDRInt[2:0] == 3'd6) // 2-beat wrapping burst on AXI
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
			    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                            else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b001))
			    // 16-bit AXI transfers
                            begin
                                // WRAP_SUPPORT reference here to aid synthesis 
                                // pruning logic. The AXISlaveCtrl block won't alert
                                // this block that there is an AXI wrapping burst
                                // transaction pending in the wrFIFORAM if this
                                // parameter isn't set.
                                if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[4:0] == 5'd30)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[3:0] == 4'd14)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                                begin
                                    if (HADDRInt[2:0] == 3'd6)
                                        // We've reached the wrap boundary so 
                                        // return to the lower wrap boundary
                                        // address
                                        HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                    else
                                        HADDRInt_d <= HADDRInt_q + 2'd2;
                                end
                                else if (HADDRInt[1:0] == 2'd2) // 2-beat wrapping burst on AXI
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else
                                // Responding to either an incrementing burst
                                // or fixed address AXI transaction (where the 
                                // fixed address hasn't reached a double word 
                                // boundary). The AXISlaveCtrl block filters 
                                // out transactions with a burst type of 2'b11
                                // as it's 'reserved' in the AXI specification.
                                HADDRInt_d <= HADDRInt_q + 2'd2;
                        end
                    end

		    // SAR#82615
		    // Added support for 32 bit AXI transfer
		    // 8-bit transfers on AHBL interface
		    else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd7) && (AXISize == 3'b011)) begin    // Fixed burst
			    // 64-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach double word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
		    end
		    else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd3) && (AXISize == 3'b010)) begin
			    // 32-bit AXI transfers
			    // Return the address to the start address for fixed
                            // address burst once we reach word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
		    end
		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer sixe
		    else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[0] == 1'd1) && (AXISize == 3'b001)) begin
			    // 16-bit AXI transfers
			    // Return the address to the start address for fixed
                            // address burst once we reach half-word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
		    end
		    else if ((AXIBurstInt[1:0] == 2'b00) && (AXISize == 3'b000)) begin
			    // 8-bit AXI transfers
			    // Return the address to the start address for fixed
                            // address burst once we reach byte aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
		    end
                    else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b011))	// Wrapping burst
                    begin
			// 64-bit AXI transfers
                        // WRAP_SUPPORT reference here to aid synthesis 
                        // pruning logic. The AXISlaveCtrl block won't alert
                        // this block that there is an AXI wrapping burst
                        // transaction pending in the wrFIFORAM if this
                        // parameter isn't set.
                        if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[6:0] == 7'd127)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[5:0] == 6'd63)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[4:0] == 5'd31)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (HADDRInt[3:0] == 4'd15) // 2-beat wrapping burst on AXI
                            // We've reached the wrap boundary so 
                            // return to the lower wrap boundary
                            // address
                            HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                        else
                            // AXI wrapping transaction. Address hasn't yet 
                            // reached the wrap boundary.
                            HADDRInt_d <= HADDRInt_q + 1'd1;
                    end
		    // SAR#82615
		    // Added support for 32-bit AXI transfers
                    else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b010))
                    begin
			// 32-bit AXI transfers
                        // WRAP_SUPPORT reference here to aid synthesis 
                        // pruning logic. The AXISlaveCtrl block won't alert
                        // this block that there is an AXI wrapping burst
                        // transaction pending in the wrFIFORAM if this
                        // parameter isn't set.
                        if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[5:0] == 6'd63)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[4:0] == 5'd31)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[3:0] == 4'd15)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (HADDRInt[2:0] == 3'd7) // 2-beat wrapping burst on AXI
                            // We've reached the wrap boundary so 
                            // return to the lower wrap boundary
                            // address
                            HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                        else
                            // AXI wrapping transaction. Address hasn't yet 
                            // reached the wrap boundary.
                            HADDRInt_d <= HADDRInt_q + 1'd1;
                    end
		    // SAR90363 - Added support for 16-bit and 8-bit AXI data taransfer size
                    else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b001))
                    begin
			// 16-bit AXI transfers
                        // WRAP_SUPPORT reference here to aid synthesis 
                        // pruning logic. The AXISlaveCtrl block won't alert
                        // this block that there is an AXI wrapping burst
                        // transaction pending in the wrFIFORAM if this
                        // parameter isn't set.
                        if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[4:0] == 5'd31)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[3:0] == 4'd15)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[2:0] == 3'd7)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (HADDRInt[1:0] == 2'd3) // 2-beat wrapping burst on AXI
                            // We've reached the wrap boundary so 
                            // return to the lower wrap boundary
                            // address
                            HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                        else
                            // AXI wrapping transaction. Address hasn't yet 
                            // reached the wrap boundary.
                            HADDRInt_d <= HADDRInt_q + 1'd1;
                    end
                    else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) & (AXISize == 3'b000))
                    begin
			// 8-bit AXI transfers
                        // WRAP_SUPPORT reference here to aid synthesis 
                        // pruning logic. The AXISlaveCtrl block won't alert
                        // this block that there is an AXI wrapping burst
                        // transaction pending in the wrFIFORAM if this
                        // parameter isn't set.
                        if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[3:0] == 5'd15)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[2:0] == 3'd7)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                        begin
                            if (HADDRInt[1:0] == 2'd3)
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                        end
                        else if (HADDRInt[0] == 1'd1) // 2-beat wrapping burst on AXI
                            // We've reached the wrap boundary so 
                            // return to the lower wrap boundary
                            // address
                            HADDRInt_d <= {HADDRInt[31:1], 1'b0};
                        else
                            // AXI wrapping transaction. Address hasn't yet 
                            // reached the wrap boundary.
                            HADDRInt_d <= HADDRInt_q + 1'd1;
                    end
                    else
                    begin
                        // Responding to either an incrementing burst
                        // or fixed address AXI transaction (where the 
                        // fixed address hasn't reached a double word 
                        // boundary). The AXISlaveCtrl block filters 
                        // out transactions with a burst type of 2'b11
                        // as it's 'reserved' in the AXI specification.
                        HADDRInt_d <= HADDRInt_q + 1'd1;
                    end

                    if (validByteCntInt == 8'b0) // Last transfer
                    begin
                        wrFIFORdAddr_d <= 4'b0;
                        AHBWrDone_d <= !AHBWrDone_q;
                        nxtState <= AHB_IDLE;
                    end
                    else
                    begin
                       // More transfers to follow so increment the FIFO
                       // address if required
                       nxtState <= AHB_WR_SETUP;
		       // SAR#82615
                       if(AXISize == 3'b011) begin
		       // 64-bit AXI transfers
                          if ((HSIZEInt[2:0] == 3'b010) && (HADDRInt[2:0] == 3'b100))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                          else if ((HSIZEInt[2:0] == 3'b001) && (HADDRInt[2:0] == 3'b110))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                          else if ((HSIZEInt[2:0] == 3'b000) && (HADDRInt[2:0] == 3'b111))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                       end
                       else if(AXISize == 3'b010) begin
		       // 32-bit AXI transfers
                          if ((HSIZEInt[2:0] == 3'b010) && (HADDRInt[1:0] == 2'b00))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                          else if ((HSIZEInt[2:0] == 3'b001) && (HADDRInt[1:0] == 2'b10))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                          else if ((HSIZEInt[2:0] == 3'b000) && (HADDRInt[1:0] == 2'b11))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                       end
		       // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                       else if(AXISize == 3'b001) begin
		       // 16-bit AXI transfers
                          if ((HSIZEInt[2:0] == 3'b001) && (HADDRInt[0] == 1'b0))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                          else if ((HSIZEInt[2:0] == 3'b000) && (HADDRInt[0] == 1'b1))
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                       end
                       else begin
		       // 8-bit AXI transfers
                          if (HSIZEInt[2:0] == 3'b000)
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                       end
                    end
                end

                else if (HRESP)
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_WR_ERROR;
            end

        AHB_WR_ERROR:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                if (HREADYIN)
                begin
                    wrFIFORdAddr_d <= 4'b0;
                    validByteCntInt_d <= 8'b0;
                    beatCnt_d <= 4'b0;
                    AHBError_d <= 1'b1;
                    AHBWrDone_d <= !AHBWrDone_q;
                    nxtState <= AHB_IDLE;
                end
            end

        AHB_WR_SEQ_ADDR:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                HADDR <= HADDRInt;
                HWRITE <= 1'b1;
                HTRANS <= 2'b10; // Non-sequential transfer
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
                if (HREADYIN)
                begin
                    // Can't reach wrap boundary in the middle of sequential
                    // transfers, only possible during the last beat, so 
                    // always increment the address by the transfer size in this
                    // state.
                    // SAR90363 - added support for 16-bit and 8-bit AXI data transfer size
                    if (AXISize == 3'b011 || AXISize == 3'b010)		// 64-bit and 32-bit AXI transfers
                    	HADDRInt_d <= HADDRInt_q + 3'd4;
		    else if (AXISize == 3'b001)				// 16-bit AXI transfers
			HADDRInt_d <= HADDRInt_q + 3'd2;
		    else						// 8-bit AXI transfers
			HADDRInt_d <= HADDRInt_q + 3'd1;
                    nxtState <= AHB_WR_SEQ_DATA;
                end
                else if (HRESP)
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_WR_ERROR;
            end

        AHB_WR_SEQ_DATA:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                HADDR <= HADDRInt;
                HWRITE <= 1'b1;
                HTRANS <= 2'b11; // Sequential transfer
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
	        // SAR#82615
		// Added support for 32-bit AXI data transfers
		// SAR90363 - Added support for 16-bit and 8-bit AXI transfers
		if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI transfers
		begin
                    if (HADDRInt[2])
                    begin
                    	// HADDR[2] must have been a '0' during the previous
                    	// address phase, so send out the data related to that
                    	// address -> lower word from the wrFIFO
                    	HWDATA <= wrFIFORdData[31:0]; 
                    end
                    else
                    begin
                    	//HWDATA <= wrFIFORdData[AXI_DW*32+31:AXI_DW*32];
		    	HWDATA <= wrFIFORdData[63:32]; 
                    end
		end
		else if (AXISize == 3'b001)		// 16-bit AXI transfers
		begin
		    if (HADDRInt[2:1] == 2'b01 || HADDRInt[2:1] == 2'b10)
		    	HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end
		else		// 8-bit AXI transfers
		begin
		    if (HADDRInt[2:0] == 3'b001 || HADDRInt[2:0] == 3'b010 || HADDRInt[2:0] == 3'b011 || HADDRInt[2:0] == 3'b100)
			HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end

                if (HREADYIN)
                begin
		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    if (AXISize == 3'b011 || AXISize == 3'b010)		// 64-bit or 32-bit AXI transfers
                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
		    else if (AXISize == 3'b001)				// 16-bit AXI transfers
                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
		    else						// 8-bit AXI transfers
                    validByteCntInt_d <= validByteCntInt_q - 3'd1;

                    // SAR#82615
                    // Added support for 32-bit AXI data width
                    if (AXISize == 3'b011) begin  
                       if (!HADDRInt[2])
                         begin
                            // HADDR[2] must have a '1' during the address previous
                            // address phase. Finished with that data now so move
                            // to the next double word location
                            wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                         end
                    end
                    else begin  
                       wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                    end

                    if ((beatCnt == 4'd14) && (HBURSTInt[2:0] == 3'b111))
                        nxtState <= AHB_WR_SEQ_LAST_BEAT;
                    else if ((beatCnt == 4'd6) && (HBURSTInt[2:0] == 3'b101)) begin
                        nxtState <= AHB_WR_SEQ_LAST_BEAT;
                    end
                    else if ((beatCnt == 4'd2) && (HBURSTInt[2:0] == 3'b011))
                        nxtState <= AHB_WR_SEQ_LAST_BEAT;
                    else
                    begin
                        beatCnt_d <= beatCnt_q + 1'b1;
                        // Can't reach wrap boundary in the middle of sequential
                        // transfers, only possible during the last beat, so 
                        // always increment the address by the transfer size in this
                        // state.
                        // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI transfers
                        HADDRInt_d <= HADDRInt_q + 3'd4;
                        else if (AXISize == 3'b001)			// 16-bit AXI transfers
                        HADDRInt_d <= HADDRInt_q + 3'd2;
                        else						// 8-bit AXI transfers
                        HADDRInt_d <= HADDRInt_q + 3'd1;
                    end
                end

                else if (HRESP)
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_WR_ERROR;
            end

        AHB_WR_SEQ_LAST_BEAT:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                beatCnt_d <= 4'b0;
		if(AXISize == 3'b011 || AXISize == 3'b010)
		begin
                    if (HADDRInt[2])
                    begin
                    	// HADDR wasn't incremented coming from the AHB_WR_SEQ_DATA
                    	// state as the phase is only a data phase, no address 
                    	// sent to the AHB-Lite slave (last data beat).
                    	HWDATA <= wrFIFORdData[63:32]; 
                    end
                    else
                    begin
                    	HWDATA <= wrFIFORdData[31:0];
                    end
		end
		else if (AXISize == 3'b001)		// 16-bit AXI transfer
		begin
		    if (HADDRInt[2:1] == 2'b00 || HADDRInt[2:1] == 2'b01)
			HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end
		else		// 8-bit AXI transfer
		begin
		    if (HADDRInt[2:0] == 3'b000 || HADDRInt[2:0] == 3'b001 || HADDRInt[2:0] == 3'b010 || HADDRInt[2:0] == 3'b011)
			HWDATA <= wrFIFORdData[31:0];
		    else
			HWDATA <= wrFIFORdData[63:32];
		end

               
	       // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
               if (HREADYIN)
                begin
                     if ((validByteCntInt == 8'd4 && (AXISize == 3'b011 || AXISize == 3'b010))
			|| (validByteCntInt == 8'd2 && AXISize == 3'b001)
			|| (validByteCntInt == 8'b1 && AXISize == 3'b000))
                     begin
                        nxtState <= AHB_IDLE;
                        wrFIFORdAddr_d <= 4'b0;
                        validByteCntInt_d <= 8'b0;
                        AHBWrDone_d <= !AHBWrDone_q;
                     end
                     else
                     begin
			if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit and 32-bit AXI transfers
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
			else if (AXISize == 3'b001)			// 16-bit AXI transfers
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
			else						// 8-bit AXI transfers
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;

                        // SAR#82615
                        if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[6:0] == 7'd124) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[5:0] == 6'd60) begin 
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd28) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (HADDRInt[3:0] == 4'd12) begin // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            end
                            else
                                // AXI wrapping transaction. Address hasn't yet 
                                // reached the wrap boundary.
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // SAR#82615 
                                if (HADDRInt[5:0] == 6'd60) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                // SAR#82615 
                                if (HADDRInt[4:0] == 5'd28) begin 
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                // SAR#82615 
                                if (HADDRInt[3:0] == 4'd12) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            // SAR#82615 
                            else if (HADDRInt[2:0] == 3'd4) begin // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                end
                            else
                                // AXI wrapping transaction. Address hasn't yet 
                                // reached the wrap boundary.
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))
			// 16-bit AXI data transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd30) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[3:0] == 4'd14) begin 
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[2:0] == 3'd6) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end 
                            else if (HADDRInt[1:0] == 2'd2) begin // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                            end
                            else
                                // AXI wrapping transaction. Address hasn't yet 
                                // reached the wrap boundary.
                                HADDRInt_d <= HADDRInt_q + 3'd2;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))
			// 8-bit AXI data transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[3:0] == 4'd15) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd1;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[2:0] == 3'd7) begin 
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd1;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[1:0] == 2'd3) begin
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                                end
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd1;
                            end 
                            else if (HADDRInt[0] == 1'd1) begin // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:1], 1'b0};
                            end
                            else
                                // AXI wrapping transaction. Address hasn't yet 
                                // reached the wrap boundary.
                                HADDRInt_d <= HADDRInt_q + 3'd1;
                        end
                        else
                        begin
                            // Responding to an incrementing burst AXI
                            // transaction
                            // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer sise
                            if (AXISize == 3'b011 || AXISize == 3'b010)		// 64-bit and 32-bit AXI transfers
                            HADDRInt_d <= HADDRInt_q + 3'd4;
			    else if (AXISize == 3'b001)				// 16-bit AXI transfers
                            HADDRInt_d <= HADDRInt_q + 3'd2;
			    else						// 8-bit AXI transfers
                            HADDRInt_d <= HADDRInt_q + 3'd1;
                        end
                        nxtState <= AHB_WR_SETUP;

                        // SAR#82615
                        if(AXISize == 3'b011) begin
                           if (HADDRInt[2]) begin   
                              wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                           end
                        end
                        else begin//if (AXISize == 3'b010) begin
                           wrFIFORdAddr_d <= wrFIFORdAddr_q + 1'b1;
                        end 
                     end
                end

                else if (HRESP)
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_WR_ERROR;
            end

        AHB_RD_SETUP:
            begin
		rdFIFOWrData_d32 <= rdFIFOWrData_q32;
                rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
                if (HADDRInt[1:0] == 2'b0) // 32-bit aligned
                begin

                    if ((validByteCntInt >= 8'd64) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd960))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01) // Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping burst
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt[3:0] == 4'd15)	// 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd64)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111; // 16-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd96)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else	// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111; // 16-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd32)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010) && (AXILenInt[3:0] == 4'd15))
			// 32-bit AXI transfers
			// 16-beat wrapping burst on AXI
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd0) 
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b111; // 16-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd32) 
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                        end
                        else		// Fixed bursts
                        begin
                            // AXISlaveCtrl block filters out transfers with
                            // a burst type of '11' as it's 'reserved' in the 
                            // AXI specification so this must be a fixed address
                            // AXI transaction. 
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b000;
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
                        end
                    end

                    else if ((validByteCntInt >= 8'd32) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd992))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        if (AXIBurstInt[1:0] == 2'b01 && (AXISize == 3'b011 || AXISize == 3'b010)) // Incrementing burst
			// 64-bit or 32-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b101;  // 8-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 
			// 16-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b001;   // half-word
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping bursts
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt[3:0] == 4'd15)	// 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd96)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt[3:0] == 4'd7)	// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd32)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else	// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt[3:0] == 4'd15)	// 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd32) 
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else			// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b101; // 8-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001) && (AXILenInt == 4'd15))  
			// 16-bit AXI transfers
			// 16-beat wrapping burst on AXI
			begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if ((HADDRInt[4:0]) <= 5'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b000;  // single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                        end
                        else		// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out transfers with
                            // a burst type of '11' as it's 'reserved' in the 
                            // AXI specification so this must be a fixed address
                            // AXI transaction. 
                            if (AXISize == 3'b011 || AXISize == 3'b010)
			    begin	// 64-bit or 32-bit AXI transfers
                            	validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            	HSIZEInt_d <= 3'b010;
                            	HBURSTInt_d <= 3'b000;
                            	nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
			    else	// 16-bit AXI transfers
			    begin
                                validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                HSIZEInt_d <= 3'b001;    // half-word
                                HBURSTInt_d <= 3'b000;   // single
                                nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                        end
                    end

                    else if ((validByteCntInt >= 8'd16) && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 10'd1008))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size 
                        if (AXIBurstInt[1:0] == 2'b01 && (AXISize == 3'b011 || AXISize == 3'b010)) // Incrementing burst
			// 64-bit or 32-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b010;
                            HBURSTInt_d <= 3'b011;  // 4-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 
			// 16-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b001;   // half-word
                            HBURSTInt_d <= 3'b101;  // 8-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000) 
			// 8-bit AXI transfers
                        begin
                            HSIZEInt_d <= 3'b000;   // byte
                            HBURSTInt_d <= 3'b111;  // 16-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping burst
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt[3:0] == 4'd15)	// 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[6:0] <= 7'd112)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt[3:0] == 4'd7)	// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd48)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt[3:0] == 4'd3)	// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else		// 2-beat wrapping burst on AXI
                            begin
                                // AXISlaveCtrl block filters out wrapping burst
                                // transactions with transfer lengths other
                                // than 2, 4, 8 or 16 so this must be a 2 beat
                                // burst
                                if (HADDRInt[3:0] <= 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt[3:0] == 4'd15)	// 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[5:0] <= 6'd32) 
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt[3:0] == 4'd7)	// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)  
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else			// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary 
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b011; // 4-beat burst
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd4;
                                    HSIZEInt_d <= 3'b010;
                                    HBURSTInt_d <= 3'b000;
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001)) 
			// 16-bit AXI transfers 
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd16)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;    // half-word
                                    HBURSTInt_d <= 3'b000;   // single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else // 8-beat wrapping burst on AXI
                            begin 
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b001;   // half-word
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;    // half-word
                                    HBURSTInt_d <= 3'b000;   // simgle
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end			
			end
			else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000) && (AXILenInt == 4'd15))  
			// 8-bit AXI transfers
			// 16-beat wrapping burst on AXI
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] == 4'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b111;  // 16-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b101;  // 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;   // byte
                                    HBURSTInt_d <= 3'b011;  // 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;    // byte
                                    HBURSTInt_d <= 3'b000;   // single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
			end
                        else	// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out transfers with
                            // a burst type of '11' as it's 'reserved' in the 
                            // AXI specification so this must be a fixed address
                            // AXI transaction. 
                            // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                            if (AXISize == 3'b011 || AXISize == 3'b010)		// 64-bit or 32-bit AXI transfers
			    begin
                            	validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            	HSIZEInt_d <= 3'b010;
                            	HBURSTInt_d <= 3'b000;
                            	nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            	validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            	HSIZEInt_d <= 3'b001;    // half-word
                            	HBURSTInt_d <= 3'b000;   // single
                            	nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            	validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            	HSIZEInt_d <= 3'b000;    // byte
                            	HBURSTInt_d <= 3'b000;   // single
                            	nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                        end
                    end

		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    else if (validByteCntInt >= 8'd8 && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 1016))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b001) 		// Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b011;	// 4-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
			else if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000)
                        begin
                            HSIZEInt_d <= 3'b000;	// byte-word
                            HBURSTInt_d <= 3'b101;	// 8-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))  // wrapping burst
			// 16-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[4:0] <= 5'd24)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else			// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] == 3'd0)
                                begin
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd2;
                                    HSIZEInt_d <= 3'b001;	// half-word
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
			end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))  // wrapping burst
			// 8-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd8)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b101;	// 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
				else if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else		// 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] == 3'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b101;	// 8-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else if (HADDRInt[2:0] <= 3'd4)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
			end
			else		// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            if (AXISize == 3'b011 || AXISize == 3'b010)	    // 64-bit and 32-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            HSIZEInt_d <= 3'b001;    // half-word
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            HSIZEInt_d <= 3'b000;    // byte
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                        end
		    end	

		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    else if (validByteCntInt >= 8'd4 && (NO_BURST_TRANS == 0) && (HADDRInt[9:0] <= 1020))
                    begin
                        // Don't cross 1 KB address boundaries with sequential transfer. 
                        // Only perform sequential transfers if there is sufficient
                        // data and if they're supported by the slave/sub-system.
                        if (AXIBurstInt[1:0] == 2'b01 && AXISize == 3'b000) 		// Incrementing burst
                        begin
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b011;	// 4-beat 
                            nxtState <= AHB_RD_SEQ_ADDR;
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))  // wrapping burst
			// 8-bit AXI transfers
			begin 
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[3:0] <= 4'd12)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[2:0] <= 3'd4)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
                            else 		// 4-beat wrapping burst on AXI
                            begin
                                // Ensure that sequential transfers don't cross
                                // the wrap boundary
                                if (HADDRInt[1:0] <= 2'd0)
                                begin
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b011;	// 4-beat 
                                    nxtState <= AHB_RD_SEQ_ADDR;
                                end
                                else
                                begin
                                    // Perform a non-sequential transfer as 
                                    // we're too close to the wrap boundary
                                    // to fit in a burst transfer
                                    validByteCntInt_d <= validByteCntInt_q - 3'd1;
                                    HSIZEInt_d <= 3'b000;	// byte
                                    HBURSTInt_d <= 3'b000;	// single
                                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                                end
                            end
			end
			else		// Fixed burst
                        begin
                            // AXISlaveCtrl block filters out burst transfers 
                            // of type 2b'11 as it's reserved in the AXI spec.
                            // Therefore, this must be a fixed address
                            // transaction on the AXI side
                            if (AXISize == 3'b011 || AXISize == 3'b010)	    // 64-bit and 32-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else if (AXISize == 3'b001)	    // 16-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;
                            HSIZEInt_d <= 3'b001;    // half-word
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                            else	    // 8-bit AXI transfers
			    begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;
                            HSIZEInt_d <= 3'b000;    // byte
                            HBURSTInt_d <= 3'b000;   // single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			    end
                        end
		    end

                    else if (validByteCntInt >= 8'd4) 
                    begin
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			if (AXISize == 3'b011 || AXISize == 3'b010)	// 64-bit or 32-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd4;  
                            HSIZEInt_d <= 3'b010;	// word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			end
			else if (AXISize == 3'b001)			// 16-bit AXI transfers
			begin
			    validByteCntInt_d <= validByteCntInt_q - 3'd2;  
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			end
			else						// 8-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd1;  
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			end
                    end

                    else if (validByteCntInt >= 8'd2)
                    begin
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			if (AXISize == 3'b000)	// 8-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 2'd1;
                            HSIZEInt_d <= 3'b000;	// byte
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			end
			else			// 64/32/16-bit AXI transfers
			begin
                            validByteCntInt_d <= validByteCntInt_q - 3'd2;  
                            HSIZEInt_d <= 3'b001;	// half-word
                            HBURSTInt_d <= 3'b000;	// single
                            nxtState <= AHB_RD_NON_SEQ_ADDR;
			end
                    end

                    else
                    begin
                        validByteCntInt_d <= validByteCntInt_q - 1'b1;
                        HSIZEInt_d <= 3'b000;		// byte
                        HBURSTInt_d <= 3'b000;		// single
                        nxtState <= AHB_RD_NON_SEQ_ADDR;
                    end
                end

                else if ((HADDRInt[1:0] == 2'b10) && (validByteCntInt >= 8'd2))
                begin
		    // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
		    if (AXISize == 3'b000)	// 8-bit AXI transfers
		    begin
                        validByteCntInt_d <= validByteCntInt_q - 2'd1;
                        HSIZEInt_d <= 3'b000;	// byte
                        HBURSTInt_d <= 3'b000;	// single
                        nxtState <= AHB_RD_NON_SEQ_ADDR;
		    end
		    else			// 64/32/16-bit AXI transfers
		    begin
                        validByteCntInt_d <= validByteCntInt_q - 2'd2;
                        HSIZEInt_d <= 3'b001;	// half-word
                        HBURSTInt_d <= 3'b000;	// single
                        nxtState <= AHB_RD_NON_SEQ_ADDR;
		    end
                end

                else
                begin
                    validByteCntInt_d <= validByteCntInt_q - 1'b1;
                    HSIZEInt_d <= 3'b000;
                    HBURSTInt_d <= 3'b000;
                    nxtState <= AHB_RD_NON_SEQ_ADDR;
                end
            end

        AHB_RD_NON_SEQ_ADDR:
            begin
                HADDR <= HADDRInt;
                HWRITE <= 1'b0;
                HTRANS <= 2'b10;
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
                if (HREADYIN)
                begin
                    nxtState <= AHB_RD_NON_SEQ_DATA;
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
                end
                else if(HRESP)
                begin
                    nxtState <= AHB_RD_ERROR;
                    rdFIFOWrDataReg_d <= 56'b0;
                end
                else
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
            end

        AHB_RD_ERROR:
            begin
                rdFIFOWrDataReg_d <= 56'b0;
                if (HREADYIN)
                begin
                    rdFIFOWrAddr_d <= 4'b0;
                    validByteCntInt_d <= 8'b0;
                    beatCnt_d <= 4'b0;
                    AHBError_d <= 1'b1;
                    AHBRdDone_d <= !AHBRdDone_q;
                    nxtState <= AHB_IDLE;
                end
            end

        AHB_RD_NON_SEQ_DATA:
            begin
                if (HREADYIN)
                begin
                    if (HSIZEInt[2:0] == 3'b010)	// 32-bit transfers on AHBL interface
                    begin
                        // SAR#82615
			// Added support for 32 bit AXI transfer
                        if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd4) && (AXISize == 3'b011)) begin	// Fixed burst
			    // 64-bit AXI transfers
                            // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        // SAR#82615
			// Added support for 32 bit AXI transfer	
                        else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd0) && (AXISize == 3'b010)) begin
			    // 32-bit AXI transfers
                            // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping burst
                        begin
			    // 64-bit AXI transfers
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)		// 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[6:0] == 7'd124)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7)		// 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[5:0] == 6'd60)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3)		// 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd28)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (HADDRInt[3:0] == 4'd12)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            end
                            else				// 2-beat wrapping burst on AXI
                            begin
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                        end
                        // SAR#82615
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
                        begin
			    // 32-bit AXI transfers
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)		// 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[5:0] == 6'd60)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7)		// 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd28)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3)		// 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[3:0] == 4'd12)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (HADDRInt[2:0] == 4'd4)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            end
                            else				// 2-beat wrapping burst on AXI
                            begin
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                        end
                        else
                        begin
                            // Either an incrementing burst transaction or a
                            // fixed burst transaction which isn't at a double
                            // word boundary.
                            HADDRInt_d <= HADDRInt + 3'd4;
                        end

                        // SAR#82615
                        if(AXISize == 3'b011 ) begin	// 64-bit AXI transfers                 
                          if (HADDRInt[2])
                          begin
                            rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            rdFIFOWrDataReg_d <= 56'b0;
                            rdFIFOWrData <= {HRDATA[31:0], rdFIFOWrDataReg[31:0]};
                            rdFIFOWrEn <= 1'b1;
                          end
                          else
                          begin
                            rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                            rdFIFOWrDataReg_d[31:0] <= HRDATA[31:0];
                          end
                        end
                       	else begin			// 32-bit AXI transfers                   
                          if (HADDRInt[1:0] == 2'b00)
                          begin
                            rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            rdFIFOWrDataReg_d <= 56'b0;
                            rdFIFOWrData <= HADDRInt[2] ? {HRDATA[31:0], rdFIFOWrData_q32[31:0]} : {rdFIFOWrData_q32[63:32],HRDATA[31:0]};
                            rdFIFOWrEn <= 1'b1;
                          end
                          else
                          begin
                            rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                            rdFIFOWrDataReg_d[31:0] <= HRDATA[31:0];
                            rdFIFOWrData <= rdFIFOWrData_q32;
                          end
                        end
                    end

                    else if (HSIZEInt[2:0] == 3'b001)		// 16-bit transfers on AHBL interface
                    begin // 16-bit transfer
			// SAR#82615
			// Added support 32 bit AXI transfer
			if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd6) && (AXISize == 3'b011)) begin	// Fixed burst
			    // 64-bit AXI transfers
                            // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
			end
			else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd2) && (AXISize == 3'b010)) begin
			    // 32-bit AXI transfers
                            // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
			end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[0] == 1'd0) && (AXISize == 3'b001)) begin
			    // 16-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach half-word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping burst
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)		// 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[6:0] == 7'd126)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd7)		// 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[5:0] == 6'd62)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd3)		// 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd30)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (HADDRInt[3:0] == 4'd14)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            end
                            else				// 2-beat wrapping burst on AXI
                            begin
                                HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
			end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
			    // 32-bit AXI transfers
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[5:0] == 6'd62)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd30)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[3:0] == 4'd14)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (HADDRInt[2:0] == 3'd6) // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 2'd2;
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))
			// 16-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is an AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15) // 16-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[4:0] == 5'd30)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd7) // 8-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[3:0] == 4'd14)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (AXILenInt == 4'd3) // 4-beat wrapping burst on AXI
                            begin
                                if (HADDRInt[2:0] == 3'd6)
                                    // We've reached the wrap boundary so 
                                    // return to the lower wrap boundary
                                    // address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 2'd2;
                            end
                            else if (HADDRInt[1:0] == 2'd2) // 2-beat wrapping burst on AXI
                                // We've reached the wrap boundary so 
                                // return to the lower wrap boundary
                                // address
                                HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                            else
                                HADDRInt_d <= HADDRInt_q + 2'd2;
                        end
                        else
			begin
                            // Either an incrementing burst transaction or a
                            // fixed burst transaction which isn't at a double
                            // word boundary.
                            HADDRInt_d <= HADDRInt_q + 2'd2;
                    	end

			// SAR#82615
			// 32-bit AXI data transfer support
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        if(AXISize == 3'b011) begin	// 64-bit AXI transfers
                           if (HADDRInt[2:1] == 2'b00)
                             begin
                                rdFIFOWrDataReg_d[55:16] <= rdFIFOWrDataReg_q[55:16];
                                rdFIFOWrDataReg_d[15:0] <= HRDATA[15:0];
                             end
                           else if (HADDRInt[2:1] == 2'b01)
                             begin
                                rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                                rdFIFOWrDataReg_d[31:16] <= HRDATA[31:16];
                                rdFIFOWrDataReg_d[15:0] <= rdFIFOWrDataReg_q[15:0];
                             end
                           else if (HADDRInt[2:1] == 2'b10)
                             begin
                                rdFIFOWrDataReg_d[55:48] <= rdFIFOWrDataReg_q[55:48];
                                rdFIFOWrDataReg_d[47:32] <= HRDATA[15:0];
                                rdFIFOWrDataReg_d[31:0] <= rdFIFOWrDataReg_q[31:0];
                             end
                           else
                             begin
                                rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                                rdFIFOWrDataReg_d <= 56'b0;
                                rdFIFOWrData <= {HRDATA[31:16], rdFIFOWrDataReg[47:0]};
                                rdFIFOWrEn <= 1'b1;
                             end
                        end
                        else if (AXISize == 3'b010) begin	// 32-bit AXI transfers
                           if (HADDRInt[2:1] == 2'b00)
                             begin
                                rdFIFOWrDataReg_d[55:16] <= rdFIFOWrDataReg_q[55:16];
                                rdFIFOWrDataReg_d[15:0] <= HRDATA[15:0];
                                rdFIFOWrData <= {rdFIFOWrData_q32[63:16],HRDATA[15:0]};
                            rdFIFOWrEn <= 1'b1;
                             end
                           else if (HADDRInt[2:1] == 2'b01)
                             begin
                                rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                                rdFIFOWrDataReg_d[31:16] <= HRDATA[31:16];
                                rdFIFOWrDataReg_d[15:0] <= rdFIFOWrDataReg_q[15:0];
                                rdFIFOWrData <= {rdFIFOWrData_q32[63:32],HRDATA[31:16],rdFIFOWrData_q32[15:0]};
                            rdFIFOWrEn <= 1'b1;
                                rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                             end
                           else if (HADDRInt[2:1] == 2'b10)
                             begin
                                rdFIFOWrDataReg_d[55:48] <= rdFIFOWrDataReg_q[55:48];
                                rdFIFOWrDataReg_d[47:32] <= HRDATA[15:0];
                                rdFIFOWrDataReg_d[31:0] <= rdFIFOWrDataReg_q[31:0];
                                rdFIFOWrData <= {rdFIFOWrData_q32[63:48],HRDATA[15:0], rdFIFOWrData_q32[31:0]};
                            rdFIFOWrEn <= 1'b1;
                             end
                           else
                             begin
                                rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                                rdFIFOWrDataReg_d <= 56'b0;
                                rdFIFOWrData <= {HRDATA[31:16], rdFIFOWrData_q32[47:0]};
                                rdFIFOWrEn <= 1'b1;
                             end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
			else begin		// 16-bit AXI transfers
			   rdFIFOWrDataReg_d <= 56'b0;
                           if (HADDRInt[2:1] == 2'b00)
			   begin
				rdFIFOWrData <= {48'b0, HRDATA [15:0]};
				rdFIFOWrEn <= 1'b1;
				rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			   end
                           else if (HADDRInt[2:1] == 2'b01)
			   begin
				rdFIFOWrData <= {32'b0, HRDATA[31:16], 16'b0};
				rdFIFOWrEn <= 1'b1;
				rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			   end
                           else if (HADDRInt[2:1] == 2'b10)
			   begin
				rdFIFOWrData <= {16'b0, HRDATA[15:0], 32'b0};
				rdFIFOWrEn <= 1'b1;
				rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			   end
                           else
			   begin
				rdFIFOWrData <= {HRDATA[31:16], 48'b0};
				rdFIFOWrEn <= 1'b1;
				rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			   end
			end
                    end

                    else	// 8-bit transfers on AHBL interface
                    begin
			// SAR#82615
			// Added support for 32 bit AXI transfers
			if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[2:0] == 3'd7) && (AXISize == 3'b011)) begin	// Fixed burst
                            // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
			end
			else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[1:0] == 2'd3) && (AXISize == 3'b010)) begin
  			    // Return the address to the AXI start address if 
                            // this is an AXI fixed address transaction(handles
                            // cases where the fixed address is unaligned)
                            HADDRInt_d <= AXIAddr[31:0];
			end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b00) && (HADDRInt[0] == 1'd1) && (AXISize == 3'b001)) begin
			    // 16-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach half-word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
			end
                        else if ((AXIBurstInt[1:0] == 2'b00) && (AXISize == 3'b000)) begin
			    // 16-bit AXI transfers
                            // Return the address to the start address for fixed
                            // address burst once we reach half-word aligned
                            // boundaries.
                            HADDRInt_d <= AXIAddr[31:0];
			end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))	// Wrapping burst
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[6:0] == 7'd127)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[5:0] == 6'd63)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[4:0] == 5'd31)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (HADDRInt[3:0] == 4'd15)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            end
                            else
                            begin
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[5:0] == 6'd63)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[4:0] == 5'd31)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[3:0] == 4'd15)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (HADDRInt[2:0] == 3'd7)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            end
                            else
                            begin
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))
			// 16-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[4:0] == 5'd31)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[3:0] == 4'd15)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[2:0] == 3'd8)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (HADDRInt[1:0] == 2'd3)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                            end
                            else
                            begin
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))
			// 8-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[3:0] == 4'd15)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[2:0] == 3'd7)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[1:0] == 2'd3)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                            else if (HADDRInt[0] == 1'd1)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:1], 1'b0};
                            end
                            else
                            begin
                                HADDRInt_d <= HADDRInt_q + 1'd1;
                            end
                        end
                        else
                        begin
                            // Either an incrementing burst transaction or a
                            // fixed burst transaction which isn't at a double
                            // word boundary.
                            HADDRInt_d <= HADDRInt + 1'd1;
                        end

			// SAR#82615
			// 32-bit AXI data transfer support
                       if(AXISize == 3'b011) begin // 64-bit AXI transfers 
                          if (HADDRInt[2:0] == 3'b000)
                            begin
                               rdFIFOWrDataReg_d[55:8] <= rdFIFOWrDataReg_q[55:8];
                               rdFIFOWrDataReg_d[7:0] <= HRDATA[7:0];
                            end
                          else if (HADDRInt[2:0] == 3'b001)
                            begin
                               rdFIFOWrDataReg_d[55:16] <= rdFIFOWrDataReg_q[55:16];
                               rdFIFOWrDataReg_d[15:8] <= HRDATA[15:8];
                               rdFIFOWrDataReg_d[7:0] <= rdFIFOWrDataReg_q[7:0];
                            end
                          else if (HADDRInt[2:0] == 3'b010)
                            begin
                               rdFIFOWrDataReg_d[55:24] <= rdFIFOWrDataReg_q[55:24];
                               rdFIFOWrDataReg_d[23:16] <= HRDATA[23:16];
                               rdFIFOWrDataReg_d[15:0] <= rdFIFOWrDataReg_q[15:0];
                            end
                          else if (HADDRInt[2:0] == 3'b011)
                            begin
                               rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                               rdFIFOWrDataReg_d[31:24] <= HRDATA[31:24];
                               rdFIFOWrDataReg_d[23:0] <= rdFIFOWrDataReg_q[23:0];
                            end
                          else if (HADDRInt[2:0] == 3'b100)
                            begin
                               rdFIFOWrDataReg_d[55:40] <= rdFIFOWrDataReg_q[55:40];
                               rdFIFOWrDataReg_d[39:32] <= HRDATA[7:0];
                               rdFIFOWrDataReg_d[31:0] <= rdFIFOWrDataReg_q[31:0];
                            end
                          else if (HADDRInt[2:0] == 3'b101)
                            begin
                               rdFIFOWrDataReg_d[55:48] <= rdFIFOWrDataReg_q[55:48];
                               rdFIFOWrDataReg_d[47:40] <= HRDATA[15:8];
                               rdFIFOWrDataReg_d[39:0] <= rdFIFOWrDataReg_q[39:0];
                            end
                          else if (HADDRInt[2:0] == 3'b110)
                            begin
                               rdFIFOWrDataReg_d[55:48] <= HRDATA[23:16];
                               rdFIFOWrDataReg_d[47:0] <= rdFIFOWrDataReg_q[47:0];
                            end
                          else
                            begin
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrDataReg_d <= 56'b0;
                               rdFIFOWrData <= {HRDATA[31:24], rdFIFOWrDataReg[55:0]};
                               rdFIFOWrEn <= 1'b1;
                            end
                       end
                       else if (AXISize == 3'b010) begin	// 32-bit AXI transfers
                          if (HADDRInt[2:0] == 3'b000)
                            begin
                               	rdFIFOWrDataReg_d[55:8] <= rdFIFOWrDataReg_q[55:8];
                               	rdFIFOWrDataReg_d[7:0] <= HRDATA[7:0];
                               	rdFIFOWrData <= {rdFIFOWrData_q32[63:8],HRDATA[7:0]};
                            	rdFIFOWrEn <= 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b001)
                            begin
                               rdFIFOWrDataReg_d[55:16] <= rdFIFOWrDataReg_q[55:16];
                               rdFIFOWrDataReg_d[15:8] <= HRDATA[15:8];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:16],HRDATA[15:8],rdFIFOWrData_q32[7:0]};
                               rdFIFOWrDataReg_d[7:0] <= rdFIFOWrDataReg_q[7:0];
                            rdFIFOWrEn <= 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b010)
                            begin
                               rdFIFOWrDataReg_d[55:24] <= rdFIFOWrDataReg_q[55:24];
                               rdFIFOWrDataReg_d[23:16] <= HRDATA[23:16];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:24],HRDATA[23:16],rdFIFOWrData_q32[15:0]};
                               rdFIFOWrDataReg_d[15:0] <= rdFIFOWrDataReg_q[15:0];
                            rdFIFOWrEn <= 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b011)
                            begin
                               rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                               rdFIFOWrDataReg_d[31:24] <= HRDATA[31:24];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:32],HRDATA[31:24],rdFIFOWrData_q32[23:0]};
                               rdFIFOWrDataReg_d[23:0] <= rdFIFOWrDataReg_q[23:0];
                            rdFIFOWrEn <= 1'b1;
                                rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b100)
                            begin
                               rdFIFOWrDataReg_d[55:40] <= rdFIFOWrDataReg_q[55:40];
                               rdFIFOWrDataReg_d[39:32] <= HRDATA[7:0];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:40],HRDATA[7:0],rdFIFOWrData_q32[31:0]};
                               rdFIFOWrDataReg_d[31:0] <= rdFIFOWrDataReg_q[31:0];
                            rdFIFOWrEn <= 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b101)
                            begin
                               rdFIFOWrDataReg_d[55:48] <= rdFIFOWrDataReg_q[55:48];
                               rdFIFOWrDataReg_d[47:40] <= HRDATA[15:8];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:48],HRDATA[15:8],rdFIFOWrData_q32[39:0]};
                               rdFIFOWrDataReg_d[39:0] <= rdFIFOWrDataReg_q[39:0];
                            rdFIFOWrEn <= 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b110)
                            begin
                               rdFIFOWrDataReg_d[55:48] <= HRDATA[23:16];
                               rdFIFOWrData <= {rdFIFOWrData_q32[63:56],HRDATA[23:16],rdFIFOWrData_q32[47:0]};
                               rdFIFOWrDataReg_d[47:0] <= rdFIFOWrDataReg_q[47:0];
                            rdFIFOWrEn <= 1'b1;
                            end
                          else
                            begin
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrDataReg_d <= 56'b0;
                               rdFIFOWrData <= {HRDATA[31:24], rdFIFOWrData_q32[55:0]};
                               rdFIFOWrEn <= 1'b1;
                            end
                        end
			// SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                       else if(AXISize == 3'b001) begin // 16-bit AXI transfers
                          if (HADDRInt[2:0] == 3'b000)
                            begin
                               rdFIFOWrDataReg_d <= {48'b0, HRDATA[7:0]};
                            end
                          else if (HADDRInt[2:0] == 3'b001)
                            begin
                               rdFIFOWrDataReg_d <= 56'd0;
                               rdFIFOWrData <= {48'b0, HRDATA[15:8], 8'b0};
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b010)
                            begin
                               rdFIFOWrDataReg_d <= {32'b0, HRDATA[23:16], 16'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b011)
                            begin
                               rdFIFOWrDataReg_d <= 56'd0;
                               rdFIFOWrData <= {32'b0, HRDATA[31:24], 24'b0};
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b100)
                            begin
                               rdFIFOWrDataReg_d <= {16'b0, HRDATA[7:0], 32'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b101)
                            begin
                               rdFIFOWrDataReg_d <= 56'd0;
                               rdFIFOWrData <= {16'b0, HRDATA[15:8], 40'b0};
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                            end
                          else if (HADDRInt[2:0] == 3'b110)
                            begin
                               rdFIFOWrDataReg_d <= {HRDATA[23:16], 48'b0};
                            end
                          else
                            begin
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrDataReg_d <= 56'b0;
                               rdFIFOWrData <= {HRDATA[31:24], 56'b0};
                               rdFIFOWrEn <= 1'b1;
                            end
                       end
                       else begin // 8-bit AXI transfers
			  rdFIFOWrDataReg_d <= 56'b0;
                          if (HADDRInt[2:0] == 3'b000)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {56'b0, HRDATA[7:0]};
                            end
                          else if (HADDRInt[2:0] == 3'b001)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {48'b0, HRDATA[15:8], 8'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b010)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {40'b0, HRDATA[23:16], 16'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b011)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {32'b0, HRDATA[31:24], 24'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b100)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {24'b0, HRDATA[7:0], 32'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b101)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {16'b0, HRDATA[15:8], 40'b0};
                            end
                          else if (HADDRInt[2:0] == 3'b110)
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {8'b0, HRDATA[23:16], 48'b0};
                            end
                          else
                            begin
                               rdFIFOWrEn <= 1'b1;
                               rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                               rdFIFOWrData <= {HRDATA[31:24], 56'b0};
                            end
                       end
                    end

                    if (validByteCntInt == 8'b0)
                    begin
                        rdFIFOWrAddr_d <= 4'b0;
                        AHBRdDone_d <= !AHBRdDone;
                        nxtState <= AHB_IDLE;
                    end
                    else
                        nxtState <= AHB_RD_SETUP;
                end

                else if(HRESP)
                begin
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    rdFIFOWrDataReg_d <= 56'b0;
                    nxtState <= AHB_RD_ERROR;
                end
                else
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
            end

        AHB_RD_SEQ_ADDR:
            begin
                HADDR <= HADDRInt;
                HWRITE <= 1'b0;
                HTRANS <= 2'b10;
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
                if (HREADYIN)
                begin
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
                    nxtState <= AHB_RD_SEQ_DATA;
		    if (AXISize == 3'b011 || AXISize == 3'b010)
                    	HADDRInt_d <= HADDRInt_q + 3'd4;
		    else if (AXISize == 3'b001)
                    	HADDRInt_d <= HADDRInt_q + 3'd2;
		    else
                    	HADDRInt_d <= HADDRInt_q + 3'd1;
                end
                else if(HRESP)
                begin
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_RD_ERROR;
                    rdFIFOWrDataReg_d <= 56'b0;
                end
                else
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
            end

        AHB_RD_SEQ_DATA:
            begin
                HADDR <= HADDRInt;
                HWRITE <= 1'b0;
                HTRANS <= 2'b11;
                HSIZE <= HSIZEInt;
                HBURST <= HBURSTInt;
                if (HREADYIN)
                begin
		   // SAR#82615
		   // 32-bit AXI data transfer support
                   if(AXISize == 3'b011) begin 		// 64-bit AXI transfers 
                      if (!HADDRInt[2])
                        begin
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                           rdFIFOWrData <= {HRDATA[31:0], rdFIFOWrDataReg[31:0]};
                           rdFIFOWrDataReg_d <= 56'b0;
                           rdFIFOWrEn <= 1'b1;
                        end
                      else
                        begin
                           rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                           rdFIFOWrDataReg_d[31:0] <= HRDATA[31:0];
                        end
                   end
                   else if (AXISize == 3'b010)		// 32-bit AXI transfers
                     begin
                      rdFIFOWrDataReg_d <= 56'b0;
                      if (!HADDRInt[2])
                        begin
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                           rdFIFOWrData   <= {HRDATA[31:0], HRDATA[31:0]};
                           rdFIFOWrEn <= 1'b1;
                        end
                      else
                        begin
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                           rdFIFOWrData   <= {HRDATA[31:0],HRDATA[31:0]};
                           rdFIFOWrEn     <= 1'b1;
                        end
                     end
		   // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                   else if (AXISize == 3'b001)		// 16-bit AXI transfers
                     begin
                     	rdFIFOWrDataReg_d <= 56'b0;
			if (HADDRInt[1])
			begin
			    rdFIFOWrData <= {HRDATA[15:0], HRDATA[15:0], HRDATA[15:0], HRDATA[15:0]};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else
			begin
			    rdFIFOWrData <= {HRDATA[31:16], HRDATA[31:16], HRDATA[31:16], HRDATA[31:16]};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
                     end
                   else					// 8-bit AXI transfers
                     begin
                     	rdFIFOWrDataReg_d <= 56'b0;
			if (HADDRInt[1:0] == 2'b00)
			begin
			    rdFIFOWrData <= {8{HRDATA[31:24]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else if (HADDRInt[1:0] == 2'b01)
			begin
			    rdFIFOWrData <= {8{HRDATA[7:0]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else if (HADDRInt[1:0] == 2'b10)
			begin
			    rdFIFOWrData <= {8{HRDATA[15:8]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else
			begin
			    rdFIFOWrData <= {8{HRDATA[23:16]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
                     end

		    if (AXISize == 3'b011 || AXISize == 3'b010)
			validByteCntInt_d <= validByteCntInt_q - 3'd4;
		    else if (AXISize == 3'b001)
			validByteCntInt_d <= validByteCntInt_q - 3'd2;
		    else
			validByteCntInt_d <= validByteCntInt_q - 3'd1;

                    if ((beatCnt[3:0] == 4'd14) && (HBURSTInt[2:0] == 3'b111))
                        nxtState <= AHB_RD_SEQ_DATA_LAST_BEAT;
                    else if ((beatCnt[3:0] == 4'd6) && (HBURSTInt[2:0] == 3'b101))
                        nxtState <= AHB_RD_SEQ_DATA_LAST_BEAT;
                    else if ((beatCnt[3:0] == 4'd2) && (HBURSTInt[2:0] == 3'b011))
                        nxtState <= AHB_RD_SEQ_DATA_LAST_BEAT;
                    else
                    begin
                        beatCnt_d <= beatCnt_q + 1'b1;
                        // Always increment the address as AHBL doesn't support
                        // fixed address bursts.
                        if (AXISize == 3'b011 || AXISize == 3'b010)
                            HADDRInt_d <= HADDRInt_q + 3'd4;
                        else if (AXISize == 3'b001)
                            HADDRInt_d <= HADDRInt_q + 3'd2;
                        else
                            HADDRInt_d <= HADDRInt_q + 3'd1;
                    end
                end

                else if(HRESP)
                begin
                    // Slave indicating that an error has occured as HRESP was
                    // driven high whilst HREADYIN is low. Go to the
                    // AHB_WR_ERROR state to wait for HREADYIN to return high, 
                    // indicating the end of the transfer.
                    nxtState <= AHB_RD_ERROR;
                    rdFIFOWrDataReg_d <= 56'b0;
                end

                else
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
            end

        AHB_RD_SEQ_DATA_LAST_BEAT:
            begin
                beatCnt_d <= 4'b0;
                if (HREADYIN)
                begin
		   // SAR#82615
		   // 32-bit AXI data transfer support
                   if(AXISize == 3'b011) begin		// 64-bit AXI transfers 
                      if (HADDRInt[2])
                        begin
                           rdFIFOWrData[63:0] <= {HRDATA[31:0], rdFIFOWrDataReg[31:0]};
                           rdFIFOWrEn <= 1'b1;
                           rdFIFOWrDataReg_d <= 56'b0;
                        end
                      else
                        begin
                           // Read transfer can only finish on a 64-bit aligned 
                           // address, so buffer the data as there's more data to
                           // come
                           rdFIFOWrDataReg_d[31:0] <= HRDATA[31:0];
                           rdFIFOWrDataReg_d[55:32] <= rdFIFOWrDataReg_q[55:32];
                        end
                   end
                   else if (AXISize == 3'b010)		// 32-bit AXI transfer
                   begin
                      rdFIFOWrDataReg_d <= 56'b0;
                      if (HADDRInt[2])
                        begin
                           rdFIFOWrData <= {HRDATA[31:0], HRDATA[31:0]};
                           rdFIFOWrEn <= 1'b1;
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                        end
                      else
                        begin
                           // Read transfer can only finish on a 64-bit aligned 
                           // address, so buffer the data as there's more data to
                           // come
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                           rdFIFOWrData <= {HRDATA[31:0], HRDATA[31:0]};
                           rdFIFOWrEn <= 1'b1;
                        end
		    end
		   // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                   else if (AXISize == 3'b001)		// 16-bit AXI transfers
                     begin
                     	rdFIFOWrDataReg_d <= 56'b0;
			if (HADDRInt[1])
			begin
			    rdFIFOWrData <= {HRDATA[31:16], HRDATA[31:16], HRDATA[31:16], HRDATA[31:16]};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else
			begin
			    rdFIFOWrData <= {HRDATA[15:0], HRDATA[15:0], HRDATA[15:0], HRDATA[15:0]};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
                     end
                   else					// 8-bit AXI transfers
                     begin
                     	rdFIFOWrDataReg_d <= 56'b0;
			if (HADDRInt[1:0] == 2'b00)
			begin
			    rdFIFOWrData <= {8{HRDATA[7:0]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else if (HADDRInt[1:0] == 2'b01)
			begin
			    rdFIFOWrData <= {8{HRDATA[15:8]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else if (HADDRInt[1:0] == 2'b10)
			begin
			    rdFIFOWrData <= {8{HRDATA[23:16]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
			else
			begin
			    rdFIFOWrData <= {8{HRDATA[31:24]}};
			    rdFIFOWrEn <= 1'b1;
			    rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
			end
                     end

		    if (AXISize == 3'b011 || AXISize == 3'b010)
			validByteCntInt_d <= validByteCntInt_q - 3'd4;
		    else if (AXISize == 3'b001)
			validByteCntInt_d <= validByteCntInt_q - 3'd2;
		    else
			validByteCntInt_d <= validByteCntInt_q - 3'd1;

                    if ((validByteCntInt == 8'd4 && (AXISize == 3'b011 || AXISize == 3'b010))
			|| (validByteCntInt == 8'd2 && AXISize == 3'b001)
			|| (validByteCntInt == 8'b1 && AXISize == 3'b000))
                    begin
                        validByteCntInt_d <= 8'b0;
                        rdFIFOWrAddr_d <= 4'b0;
                        AHBRdDone_d <= !AHBRdDone_q;
                        nxtState <= AHB_IDLE;
                    end
                    else
                    begin
                        // SAR#82615            
                        if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b011))
			// 64-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[6:0] == 7'd124)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:7], {7{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[5:0] == 6'd60)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[4:0] == 5'd28)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (HADDRInt[3:0] == 4'd12)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                            end
                            else
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                        end
                        // SAR#82615            
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b010))
			// 32-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[5:0] == 6'd60)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:6], {6{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[4:0] == 6'd28)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[3:0] == 5'd12)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                            else if (HADDRInt[2:0] == 3'd4)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                            end
                           else begin
                                HADDRInt_d <= HADDRInt_q + 3'd4;
                            end
                        end
                        // SAR90363 - Added support for 16-bit and 8-bit AXI data transfer size
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b001))
			// 16-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending if this parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[4:0] == 5'd30)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:5], {5{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[3:0] == 4'd14)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[2:0] == 3'd6)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (HADDRInt[1:0] == 2'd2)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                            end
                           else begin
                                HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                        end
                        else if ((AXIBurstInt[1:0] == 2'b10) && (WRAP_SUPPORT == 1) && (AXISize == 3'b000))
			// 8-bit AXI transfers
                        begin
                            // WRAP_SUPPORT reference here to aid synthesis 
                            // pruning logic. The AXISlaveCtrl block won't alert
                            // this block that there is a AXI wrapping burst
                            // transaction pending in the wrFIFORAM if this
                            // parameter isn't set.
                            if (AXILenInt == 4'd15)
                            begin
                                if (HADDRInt[3:0] == 4'd15)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:4], {4{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd1;
                            end
                            else if (AXILenInt == 4'd7)
                            begin
                                if (HADDRInt[2:0] == 3'd7)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:3], {3{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd1;
                            end
                            else if (AXILenInt == 4'd3)
                            begin
                                if (HADDRInt[1:0] == 2'd3)
                                    // Address has reached the wrap boundary so
                                    // return to the lower wrap boundary address
                                    HADDRInt_d <= {HADDRInt[31:2], {2{1'b0}}};
                                else
                                    HADDRInt_d <= HADDRInt_q + 3'd2;
                            end
                            else if (HADDRInt[0] == 1'd1)
                            begin
                                // Address has reached the wrap boundary so
                                // return to the lower wrap boundary address
                                HADDRInt_d <= {HADDRInt[31:1], 1'b0};
                            end
                           else begin
                                HADDRInt_d <= HADDRInt_q + 3'd1;
                            end
                        end
                        else
                        begin
                            // Incrementing burst AXI transaction
                            if (AXISize == 3'b011 || AXISize == 3'b010)
                            	HADDRInt_d <= HADDRInt + 3'd4;
                            else if (AXISize == 3'b001)
                            	HADDRInt_d <= HADDRInt + 3'd2;
                            else
                            	HADDRInt_d <= HADDRInt + 3'd1;
                        end

                        if(AXISize == 3'b011) begin
                           if (HADDRInt[2])
                             begin
                                rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                             end
                        end
                        else begin
                           rdFIFOWrAddr_d <= rdFIFOWrAddr_q + 1'b1;
                        end
                        nxtState <= AHB_RD_SETUP;
                    end
                end

                else if(HRESP)
                begin
                    nxtState <= AHB_RD_ERROR;
                    rdFIFOWrDataReg_d <= 56'b0;
                end
                else
                    rdFIFOWrDataReg_d <= rdFIFOWrDataReg_q;
            end

        default:
        begin
	    nxtState <= AHB_IDLE;
            rdFIFOWrDataReg_d <= 56'b0;
        end
    endcase
end

endmodule // COREAXITOAHBL_AHBMasterCtrl
