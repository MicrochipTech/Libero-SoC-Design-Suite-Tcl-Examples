//---------------------------------------------------------------------
// File: top.v
// Description: Unit design to demonstrate SmartTime Tcl commands.
//---------------------------------------------------------------------

module top(
	input clk,
    	input rst,
    	output clk_out
    	);
   reg clk_out;
   always @ (posedge(clk), posedge(rst))
     if (rst) begin
       clk_out <= 1'b0;
     end
     else begin
       clk_out <= ~clk_out;
     end
 
endmodule
