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
// Title       : uprom_chk.v
// Created     : November-2017
// Description : The uprom check module compares the uprom data with the expected data.
//               If any mismatch occurs it generates error.
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


module uprom_chk( clk, rst_n, wen, data_in, addr_out,uprom_err );
 //input signals
 //Clock,reset and write enable
 input clk, rst_n,wen;
 //Input data from DPRAM
 input [8:0] data_in;
 //output signals
 //UPROM address
 output reg [4:0] addr_out;
 //Uprom error
 output reg uprom_err;
 //Internal data comparison
 reg [8:0] din_cmp;/*synthesis syn_preserve=1 */ //This is to preserve the logic of registers
 reg chk;
 
 //UPROM read and write logic
 always @(posedge clk) begin
  if (rst_n == 1'b0) begin
   addr_out <= 5'h00;
   din_cmp <= 9'b100000000;
   uprom_err <= 1'b0;
   chk <= 1'b0;
  end
  else begin
    chk <= chk + 1'b1;
   if(wen == 1'b1 && addr_out <= 5'h15 && chk == 1'b1) begin
    addr_out <= addr_out+1'b1;
    din_cmp <= din_cmp+1'b1; 
   end
   if(din_cmp != data_in)
    uprom_err <= 1'b1;
  end
 end
endmodule


