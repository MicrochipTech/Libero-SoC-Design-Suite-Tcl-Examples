// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: DELAY_CTRL.v
//     
// Description: takes in delay line controls, outputs a configurable register
//
// Notes:

// AS: Added 2/11/2016
// *********************************************************************/ 

module DELAY_CTRL # (
  parameter WIDTH=7,
  parameter RESET_VAL=1
)(
  input sclk,
  input reset_n,
  input direction,
  input load,
  input move,
  input enable,
  output reg [WIDTH-1:0] out_reg,
  output reg out_of_range
);

// for transition detection
reg move_reg;




always@(posedge sclk or negedge reset_n)
begin: out_reg_proc
  if (reset_n == 1'b0)
  begin
    out_reg <= RESET_VAL;
    move_reg <= 1'b0;
    out_of_range <= 1'b0;
  end
  else
  begin
    // out of range
    if ((out_reg == {WIDTH{1'b0}}) || (out_reg == {WIDTH{1'b1}}))
      out_of_range <= 1'b1;
    else
      out_of_range <= 1'b0;
    
    move_reg <= move;
    
    // output register
    if (enable == 1'b1)
    begin
      if (out_of_range == 1'b0)
      begin
        if (load == 1'b1)
          out_reg <= RESET_VAL;      
        else if (move_reg == 1'b0 && move == 1'b1) // 0-->1 edge
          if (direction == 1'b1)
            out_reg <= out_reg + 1;
          else
            out_reg <= out_reg - 1;
      end 
    end
  end
end

endmodule