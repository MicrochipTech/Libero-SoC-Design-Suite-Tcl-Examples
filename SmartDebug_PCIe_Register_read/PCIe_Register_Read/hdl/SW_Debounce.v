///////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------
//                                                                 
//  Microsemi Corporation Proprietary and Confidential
//  Copyright 2017 Microsemi Corporation. All rights reserved.
//                                                                  
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
//  ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
//  IN ADVANCE IN WRITING.
//
//-------------------------------------------------------------------
// Title       : <SW_Debounce>
// Created     : <June 2017>
// Description : This module instantiates the debounce logic for the  
//               required number of inputs (N).
// Hierarchy   :
//               SW_Debounce            <-- This module
//                 -- DEBOUNCE          
//-------------------------------------------------------------------

module sw_debounce(
 clk_i, 
 resetn_i, 
 switch_i,
 interrupt_o
);
//configurable number of switches/debounce instances
 parameter N = 4;

 input            clk_i;
 input            resetn_i;
 input  [N-1 : 0] switch_i;
 output [N-1 : 0] interrupt_o;

 genvar i;

 generate
 for (i=0;i<N;i = i+1)
 begin: 
 //instantiating debounce logic
  switch_debounce debounce deb(
   .clk_i(clk_i),
   .resetn_i(resetn_i),
   .switch_i(switch_i[i]),
   .interrupt_o(interrupt_o[i])
   );
 end
 endgenerate
endmodule

