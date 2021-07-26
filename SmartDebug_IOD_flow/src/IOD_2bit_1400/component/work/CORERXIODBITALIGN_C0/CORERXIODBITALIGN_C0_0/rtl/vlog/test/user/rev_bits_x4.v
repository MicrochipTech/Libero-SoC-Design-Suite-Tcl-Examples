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

module CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_rev_bits_x4 ( in_data,out_data);
input [7:0] in_data;
output [7:0] out_data;

assign out_data = {in_data[0],in_data[1],in_data[2],in_data[3],in_data[4],in_data[5],in_data[6],in_data[7]};
//<statements>

endmodule

