`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROSEMI
//
// IP Core: COREAXI4INTERCONNECT
//
//  Description  : The AMBA AXI4 Interconnect core connects one or more AXI memory-mapped master devices to one or
//                 more memory-mapped slave devices. The AMBA AXI protocol supports high-performance, high-frequency
//                 system designs.
//
//      Abstract  : This module handles the B channel signals within the up converter.              
//                  It instantiates two modules:              
//                  - caxi4interconnect_FIFO storing the useful information of the address phase (i.e. whether
//                    the current transaction is split into multiple ones or not)
//                  - B response control assigns the master B response channel signals
//                    based on the caxi4interconnect_FIFO output and the slave B response signal
//
//  COPYRIGHT 2017 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 



module caxi4interconnect_DWC_UpConv_BChannel #

	(
		parameter integer	ID_WIDTH	= 1,
		parameter integer	USER_WIDTH	= 1,
		parameter integer	ADDR_FIFO_DEPTH	= 3

	)
	(

		input wire sysReset,
		input wire ACLK,

		// W channel
		output wire[ID_WIDTH-1:0]       MASTER_BID,
		output wire[1:0] 		     MASTER_BRESP,
		output wire[USER_WIDTH-1:0]          MASTER_BUSER,
		output wire MASTER_BVALID,
		input wire MASTER_BREADY,

		// W channel
		input wire[ID_WIDTH-1:0] SLAVE_BID,
		input wire[1:0] SLAVE_BRESP,
		input wire[USER_WIDTH-1:0] SLAVE_BUSER,
		input wire SLAVE_BVALID,
		output wire SLAVE_BREADY,

    output wire                           bchan_cmd_fifo_full,
		input wire			      wr_en_cmd,
		input wire[ID_WIDTH:0]			      BRespFifoWrData
	);

	wire cmd_fifo_one_from_full;
	wire cmd_fifo_full;
	wire cmd_fifo_empty;
	wire [ID_WIDTH:0] BRespFifoRdData;

	wire rd_en_cmd;

	assign bchan_cmd_fifo_full = cmd_fifo_full;

	caxi4interconnect_FIFO #
		(
			.MEM_DEPTH( ADDR_FIFO_DEPTH ),
			.DATA_WIDTH_IN ( 1 + ID_WIDTH ),
			.DATA_WIDTH_OUT ( 1 +  ID_WIDTH ), 
			.NEARLY_FULL_THRESH ( ADDR_FIFO_DEPTH - 1 ),
			.NEARLY_EMPTY_THRESH ( 0 )
		)
	cmd_fifo (
			.rst (sysReset ),
			.clk ( ACLK ),
			.wr_en ( wr_en_cmd ),
			.rd_en ( rd_en_cmd ),
			.data_in ( BRespFifoWrData ),
			.data_out ( BRespFifoRdData ),
			.zero_data ( 1'b0 ),
			.fifo_full ( ),
			.fifo_empty ( cmd_fifo_empty ),
			.fifo_nearly_full ( cmd_fifo_full ),
			.fifo_nearly_empty ( ),
			.fifo_one_from_full (cmd_fifo_one_from_full )
	);

	caxi4interconnect_DWC_brespCtrl #
		(
			.ID_WIDTH ( ID_WIDTH ),
			.USER_WIDTH ( USER_WIDTH )
		)
	brespCtrl( 
       .SLAVE_BREADY(SLAVE_BREADY),
       .SLAVE_BRESP(SLAVE_BRESP),
       .SLAVE_BUSER(SLAVE_BUSER),
       .SLAVE_BVALID(SLAVE_BVALID),
       .BRespFifoRdData(BRespFifoRdData),
       .bresp_fifo_empty(cmd_fifo_empty),
       .brespFifore(rd_en_cmd),
       .ACLK(ACLK),
       .sysReset(sysReset),
       .MASTER_BID(MASTER_BID),
       .MASTER_BREADY(MASTER_BREADY),
       .MASTER_BRESP(MASTER_BRESP),
       .MASTER_BUSER(MASTER_BUSER),
       .MASTER_BVALID(MASTER_BVALID) 
       );

endmodule
