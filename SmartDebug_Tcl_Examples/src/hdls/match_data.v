///////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------
//                                                                
//  © 2022 Microchip Technology Inc. and its subsidiaries
//  All rights reserved.
//                                                                 
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
//  ACCORDANCE WITH THE MICROCHIP LICENSE AGREEMENT AND MUST BE APPROVED
//  IN ADVANCE IN WRITING.
//
//-------------------------------------------------------------------------
// Title       : match_data.v
// Created     : December-2017
// Description : The match data module checks the uRAM data.
// Hierarchy   :
//               -- top
//                   -- Fabric_Debug 
//                     -- count
//                     -- count_chk
//                     -- Fabric_Debug_DPSRAM_0_DPSRAM_K
//                     -- match_data
//                     -- Micro_ROM_0
//                     -- uprom_chk
//                     -- URAM_0 
//                          
//-------------------------------------------------------------------------



module match_data( clk, rst_n, data_in, match_out );
 //input signals
 //Clock and reset
 input clk, rst_n;
 //Input data
 input [15:0] data_in;
 //output signal data match
 output reg match_out;
 
 //Data comparison logic
 always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
   match_out <= 1'b1;
  end
  else begin
   if(data_in[15:8] == data_in[7:0])
    match_out <= 1'b1;
   else
    match_out <= 1'b0;
  end
 end
endmodule

