//=================================================================================================
// File Name                           : prbscheck_parallel_fab
//
// Description                         : This module implements a PRBS checker
//
//  Targeted device                    : Microsmi-SoC
//  Author                             : India Solutions Team
//
// SVN Revision Information            :
// SVN $Revision                       :
// SVN $Date                           :
//
// COPYRIGHT 2018 BY MICROSEMI
// THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// CORP. if YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// FILE,  THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//
//=================================================================================================

//=================================================================================================
//  prbscheck_parallel_fab declaration
//=================================================================================================
module PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbscheck_parallel_fab_x2
#(
parameter nbits = 4
)
(
input 			  clk_i,			// clock input
input 			  resetn_i,			// Input activ low asynchronous reset
input 			  prbs_en_i,		// Input to enable prbs checking
input [nbits-1:0] data_in_i,		// Prbs input
output	reg       prbs_chk_error_o	// Prbs error check output
);
//=================================================================================================
// Parameter declarations
//=================================================================================================
parameter poly2 = 3;
parameter poly1 = 1;
//=================================================================================================
// Register declarations
//=================================================================================================
reg     [nbits-1:0]         s_error1;
reg                         s_error0;
reg     [poly2:0]           i;
reg     [poly2-1:0]         s_in_old;
wire    [nbits+poly2-1:0]   s_in1;
wire                        s_prbs_chk_error;
//=================================================================================================
// Top level output assignments
//=================================================================================================

 assign s_prbs_chk_error = ((|(s_error1) || s_error0) == 1'b0) ? 1'b0: 1'b1;

//=================================================================================================
// Internal assignments
//=================================================================================================
assign s_in1 = {s_in_old,data_in_i};
//=================================================================================================
// Synchronous blocks
//=================================================================================================
always @(posedge clk_i or negedge resetn_i) begin
    if(!resetn_i)
	begin
        s_in_old <= 'd0;
        s_error1 <= 'd1;
		s_error0 <= 1'b1;        
    end
    else if(prbs_en_i == 1'b1)
	begin
   		s_error0 <= ~(|(s_in1[poly2-1:0])); // add check for all zeros (jg)
		for (i = 0 ; i < nbits; i = i + 1)
		begin //:  XOR_SECTION
			s_error1[i] <= s_in1[i] ^ s_in1[i+poly2-poly1] ^ s_in1[i+poly2]; // implement X^poly1+X^poly2
		end
        s_in_old <= data_in_i[poly2-1:0];
    end
end

always @(posedge clk_i or negedge resetn_i) begin
    if(!resetn_i)	
        prbs_chk_error_o <= 1'b1;    
    else    
        prbs_chk_error_o <= s_prbs_chk_error;
end
//=================================================================================================
// Module Instantiations
//=================================================================================================
//NA--
endmodule





