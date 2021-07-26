//=================================================================================================
// File Name                           : prbsgen_parallel_fab
//
// Description                         : This module generates PRBS patterns
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
//  prbsgen_parallel_fab declaration
//=================================================================================================
module PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_prbsgen_parallel_fab_x2
#(
parameter nbits = 4
)
(
input  wire				  clk_i, 		// clock input
input  wire				  resetn_i,		// Input activ low asynchronous reset
input  wire				  clear_i, 		// Input to clear the calculated prbs output
input  wire				  prbs_en_i, 	// Input to enable prbs generation
output reg   [nbits-1:0]  prbs_out_o, 	// Prbs output
output [nbits-1:0]  prbs_out_msb_o
);
//=================================================================================================
// Parameter declarations
//=================================================================================================
// MSB should be serialized first
// nbits must be greater than poly2
parameter poly2 = 3;
parameter poly1 = 1;
//=================================================================================================
// Register declarations
//=================================================================================================
// self healing mode if all outputs are zero
wire [nbits+poly2-1:0] s_prbsin;
//=================================================================================================
// Internal assignments
//=================================================================================================
assign s_prbsin[nbits+poly2-1:nbits] = prbs_out_o[poly2-1:0];
assign s_prbsin[nbits-1:0]           = s_prbsin[nbits+poly2-1:poly2] ^ s_prbsin[nbits+poly2-poly1-1:poly2-poly1];
//=================================================================================================
// Synchronous blocks
//=================================================================================================
always @(posedge clk_i or negedge resetn_i) begin
    if(!resetn_i) begin
        prbs_out_o <= {(nbits){1'b1}};
    end
    else if(prbs_en_i == 1'b1)
	begin
        if (clear_i)
			prbs_out_o <= {(nbits){1'b1}};
        else
			prbs_out_o <= s_prbsin;
    end
    else 
			prbs_out_o <= 'hA5;
end

assign prbs_out_msb_o = {prbs_out_o[0],prbs_out_o[1],prbs_out_o[2],prbs_out_o[3]};
//=================================================================================================
// Module Instantiations
//=================================================================================================
//NA--
endmodule





