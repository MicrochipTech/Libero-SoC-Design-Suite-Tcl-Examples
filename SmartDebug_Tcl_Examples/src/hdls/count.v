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
// Title       : count.v
// Created     : December-2017
// Description : The count module generates address and data for the RAMS.
//               Both the counter outputs are 8bit.
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


module count( clk, rst_n, coutA, coutB );
 //input signals
 //Clock,reset and write enable
 input clk;
 input rst_n;
 //output signals
 //Address and data generation
 output reg [7:0] coutA;
 output reg [7:0] coutB;

//Counter logic
 always @(posedge clk or negedge rst_n) begin
   if (rst_n == 1'b0)begin
    coutA <= 8'h00;
    coutB <= 8'h01;
   end
   else begin
    coutA <= coutA + 1'b1;
    coutB <= coutB + 1'b1;
   end
 end
endmodule

