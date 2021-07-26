// *********************************************************************/ 
// Copyright (c) 2019 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Microsemi license agreement and must be approved 
// in advance in writing.  
//  
// File: pf_lanectrl_pause_sync.v
//     
// *********************************************************************


module TXIOD_COMP_LANECTRL_ADDR_CMD_0_PF_LANECTRL_PAUSE_SYNC( CLK, RESET, HS_IO_CLK_PAUSE, HS_IO_CLK_PAUSE_SYNC );
	
	input CLK, RESET, HS_IO_CLK_PAUSE;
	output HS_IO_CLK_PAUSE_SYNC;

	parameter ENABLE_PAUSE_EXTENSION = 2'b00;

	reg pause_reg_0, pause_reg_1, pause;
	wire pause_sync_0_i;

	generate 
		if( ENABLE_PAUSE_EXTENSION == 3'b000 ) begin : feed
			assign HS_IO_CLK_PAUSE_SYNC = HS_IO_CLK_PAUSE;
		end else if( ENABLE_PAUSE_EXTENSION == 3'b001 ) begin : pipe
			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync_0(
				.CLK( CLK ),
				.D( HS_IO_CLK_PAUSE ),
				.Q( pause_sync_0_i ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);

			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync (
				.CLK( CLK ),
				.D( pause_sync_0_i ),
				.Q( HS_IO_CLK_PAUSE_SYNC ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);
		end else if ( ENABLE_PAUSE_EXTENSION == 3'b010 ) begin : ext_pipe
			always @(posedge CLK or posedge RESET) begin : ext
				if( RESET == 1'b1 ) begin
					pause_reg_0 <= 1'b0;
					pause_reg_1 <= 1'b0;
					pause <= 1'b0;
				end else begin
					pause_reg_0 <= HS_IO_CLK_PAUSE;
					pause_reg_1 <= pause_reg_0;
					if( HS_IO_CLK_PAUSE == 1'b0 && pause_reg_0 ==1'b1 && pause_reg_1 == 1'b0 )
						pause <= 1'b1; // Extend by 1 cycle if the pulse is less than a cycle
					else
						pause <= HS_IO_CLK_PAUSE;
				end
			end

			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync (
				.CLK( CLK ),
				.D( pause ),
				.Q( HS_IO_CLK_PAUSE_SYNC ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);
		end else if ( ENABLE_PAUSE_EXTENSION == 3'b011 ) begin : pipe_fall 
			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync_0 (
				.CLK( CLK ),
				.D( HS_IO_CLK_PAUSE ),
				.Q( pause_sync_0_i ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);

			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync (
				.CLK( ~CLK ),
				.D( pause_sync_0_i ),
				.Q( HS_IO_CLK_PAUSE_SYNC ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);
		end else if ( ENABLE_PAUSE_EXTENSION == 3'b100 ) begin : ext_pipe_fall 
			always @(posedge CLK or posedge RESET) begin : ext
				if( RESET == 1'b1 ) begin
					pause_reg_0 <= 1'b0;
					pause_reg_1 <= 1'b0;
					pause <= 1'b0;
				end else begin
					pause_reg_0 <= HS_IO_CLK_PAUSE;
					pause_reg_1 <= pause_reg_0;
					if( HS_IO_CLK_PAUSE == 1'b0 && pause_reg_0 ==1'b1 && pause_reg_1 == 1'b0 )
						pause <= 1'b1; // Extend by 1 cycle if the pulse is less than a cycle
					else
						pause <= HS_IO_CLK_PAUSE;
				end
			end

			(* HS_IO_CLK_PAUSE_SYNC = 1, syn_keep = 1 *) SLE pause_sync (
				.CLK( ~CLK ),
				.D( pause ),
				.Q( HS_IO_CLK_PAUSE_SYNC ),
				.LAT( 1'b0 ),
				.EN( 1'b1 ),
				.ALn( ~RESET ),
				.ADn( 1'b1 ),
				.SLn( 1'b1 ),
				.SD( 1'b0 )
				);
		end
	endgenerate

endmodule