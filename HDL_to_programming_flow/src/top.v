
//---------------------------------------------------------------------
// File: top.v
// Description: Unit design to demonstrate Libero Flow
//---------------------------------------------------------------------

module top (
            input clk, rst_n,
            input din_a, din_b,
            output reg dout_q
            );

   reg din_a_q;
   reg din_b_q;
   reg dout_q1;

   always @ (posedge clk)
     if (!rst_n) begin
        din_a_q <= 1'b0;
        din_b_q <= 1'b0;

        dout_q1 <= 1'b0;
        dout_q  <= 1'b0;
     end
     else begin
        din_a_q <= din_a;
        din_b_q <= din_b;

        dout_q1 <= din_a_q & din_b_q;
        dout_q  <= dout_q1;
     end

endmodule