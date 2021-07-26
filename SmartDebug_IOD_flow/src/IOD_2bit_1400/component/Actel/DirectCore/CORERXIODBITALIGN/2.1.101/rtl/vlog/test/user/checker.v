///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: checker.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF100T> <Package::FCG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module checker( pixclk, rstn, pixdata,line_valid, error );
input pixclk, rstn,line_valid;
input [7:0] pixdata;
output reg error;


reg [7:0] data;
wire lv;
reg line_valid1;
reg line_valid2;


always @(posedge pixclk or negedge rstn)
 if(!rstn) begin
    line_valid1 <= 0;
    line_valid2 <= 0;
end
else begin
     line_valid1 <= line_valid;
    line_valid2 <= line_valid1;
 end 

assign lv = line_valid & line_valid2;
 always @(posedge pixclk or negedge rstn)
 if(!rstn) begin
    error <= 0;
    data <= 0;
end
  else if(lv)  begin
      error <= (pixdata == data) ? 1'b0 : 1'b1;
      data <= data + 8'b1;
end
   else begin
      error <= 0;
       data <= 0;
end





endmodule

