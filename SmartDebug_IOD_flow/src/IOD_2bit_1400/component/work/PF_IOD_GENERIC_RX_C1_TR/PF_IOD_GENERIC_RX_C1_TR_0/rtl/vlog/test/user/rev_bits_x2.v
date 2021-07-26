///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: rev_bits.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300T> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_rev_bits_x2 ( in_data,out_data);
input [3:0] in_data;
output [3:0] out_data;

assign out_data = {in_data[0],in_data[1],in_data[2],in_data[3]};
//<statements>

endmodule

