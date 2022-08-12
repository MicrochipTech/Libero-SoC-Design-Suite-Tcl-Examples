///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: corereset_pf.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300T_ES> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module PF_RESET_PF_RESET_0_CORERESET_PF(CLK,EXT_RST_N, PLL_LOCK, SS_BUSY, INIT_DONE, FF_US_RESTORE, FABRIC_RESET_N  );
input  CLK,EXT_RST_N, PLL_LOCK, SS_BUSY, INIT_DONE, FF_US_RESTORE;
output FABRIC_RESET_N;

wire A;
wire B;
wire C;
wire INTERNAL_RST;
reg dff_0 = 1'b1;
reg dff_1 = 1'b1;

assign A = !(!EXT_RST_N  | !PLL_LOCK);
assign B = !(!A & !SS_BUSY);
assign C = !(!B | !INIT_DONE);
assign INTERNAL_RST = !(!C & !FF_US_RESTORE);


always@(posedge CLK or negedge INTERNAL_RST)
begin
   if (!INTERNAL_RST)
      begin
         dff_0 <= 1'b0;
      end
   else
      begin
         dff_0 <= 1'b1;
      end
end

always@(posedge CLK or negedge INTERNAL_RST)
begin
   if (!INTERNAL_RST)
      begin
         dff_1 <= 1'b0;
      end
   else
      begin
         dff_1 <= dff_0;
      end
end

assign FABRIC_RESET_N = !(!dff_1 & !FF_US_RESTORE);

endmodule

