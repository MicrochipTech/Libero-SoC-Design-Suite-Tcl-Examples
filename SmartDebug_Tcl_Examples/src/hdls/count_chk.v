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
// Title       : count_chk.v
// Created     : December-2017
// Description : The count check module compares the ram data with the expected data.
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
//-------------------------------------------------------------------------


module count_chk(A_WEN, clk, rst_n, cin, error,mem_out,B_ADDR,wen_out,raddr,waddr);
 //input signals
 //Clock and reset
 input clk;
 input rst_n;
 //Write Enable
 input A_WEN;
 //Input data from DPRAM
 input [7:0] cin;
 //Address
 input [7:0] B_ADDR;
 //output signals
 //Error and write enable to uram
 output reg error,wen_out;
 output reg [15:0] mem_out;
 output reg [7:0] raddr,waddr;
 //internal registers count check and number of matchs
 //reg [7:0] cin_chk;
 reg [7:0] match_cnt;
 //reg sync;
 reg awen_reg,awen_regd;
 
 //compares the ram data with the expected data
 //If any mismatch occurs it generates error
 always @(posedge clk or negedge rst_n) begin 
   if (rst_n == 1'b0) begin
    error <= 1'b0;
    awen_reg <= 1'b0;
    awen_regd <= 1'b0;
    wen_out <= 1'b0;
    raddr <= 8'h00;
    waddr <= 8'h00;
    match_cnt <= 8'h00;  
   end
   else begin
    raddr <= waddr;
    awen_reg <= A_WEN;
    awen_regd <= awen_reg;
    wen_out <= 1'b1;
    mem_out <= {waddr,cin};
     if(B_ADDR == 8'h00) begin
       waddr <= 8'h00;
       if(cin == waddr)
         match_cnt <= 8'h01;
       else
         match_cnt <= 8'h00;
     if((awen_regd ^ awen_reg == 1'b1) || (match_cnt == 8'hFF))
       error <= 1'b0;
     end 
	 else begin
      waddr <= waddr + 1'b1;
       if((awen_regd ^ awen_reg == 1'b1) || (match_cnt == 8'hFF))
        error <= 1'b0;
       else if(cin == waddr)
         match_cnt <= match_cnt+1'b1; 
       else if ((cin != waddr)) begin
         error <= 1'b1;
         match_cnt <= 8'h00;
       end
     end
   end
 end
endmodule

