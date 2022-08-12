///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROSEMI
//
// File: SB_PRBS_CHKR.v
//
//  Description  : This module implements the PRBS generator to be used in the Tx section and
//                 also the PRBS checker to be used in the Rx section.
//                 The input bit 'Mode' defines the generator/checker mode for the module.
//
//  COPYRIGHT 2013 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE.
// 
// Targeted device: <Family::PolarFire>
// Author: Tommy Smyth
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//--------------------------------------------------------------------
// Module Declaration
//--------------------------------------------------------------------
module SB_PRBS_GEN (
  // Inputs
   TX_CLK, 
   TX_CLK_STABLE,
   SYS_RESET_N,
   PRBS_ERR_GEN,
   PRBS_SEL,
   TX_DATA_EN,
   RX_ALIGN,
  // Outputs
   TX_DATA
   );

//--------------------------------------------------------------------
// Parameter
//--------------------------------------------------------------------
parameter DATA_WIDTH = 64;
parameter PRBS_INIT_VAL = 97;         // Any value except for zero
parameter PATTERN_PRBS7 = 1;
parameter PATTERN_PRBS9 = 1;
parameter PATTERN_PRBS23 = 1;
parameter PATTERN_PRBS31 = 1;
parameter ALIGN_DATA = 80'h1F0B92B4AE2E4AD2B87C;
//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        TX_CLK;
input        TX_CLK_STABLE;
input        SYS_RESET_N;
input        PRBS_ERR_GEN;
input        TX_DATA_EN;
input [1:0]  PRBS_SEL;               // 0=PRBS7, 1=PRBS9, 2=PRBS23 & 3=PRBS31
input        RX_ALIGN;

//--------------------------------------------------------------------
// Output 
//--------------------------------------------------------------------
output  [DATA_WIDTH-1:0] TX_DATA;

//--------------------------------------------------------------------
// Reg & Wire 
//--------------------------------------------------------------------
reg  [DATA_WIDTH-1:0] TX_DATA;
reg  [(DATA_WIDTH*2)-1:0] prbs7 ,prbs9, prbs23, prbs31;


//--------------------------------------------------------------------
// Logic
//--------------------------------------------------------------------
always @(posedge TX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N) || (!TX_CLK_STABLE) || (!TX_DATA_EN)) begin
        TX_DATA <= PRBS_INIT_VAL;
    end else begin
	    if(RX_ALIGN) begin
            prbs7 = TX_DATA;
            repeat(DATA_WIDTH) prbs7 = {prbs7, prbs7[6] ^ prbs7[5]};
		    
            prbs9 = TX_DATA;
            repeat(DATA_WIDTH) prbs9 = {prbs9, prbs9[8] ^ prbs9[4]};
            
            prbs23 = TX_DATA;
            repeat(DATA_WIDTH) prbs23 = {prbs23, prbs23[22] ^ prbs23[17]};
            
            prbs31 = TX_DATA;
            repeat(DATA_WIDTH) prbs31 = {prbs31, prbs31[30] ^ prbs31[27]};
            
            case(PRBS_SEL)
                 2'd0: begin
		    	         if(PATTERN_PRBS7) begin
                             TX_DATA[DATA_WIDTH-1:1] <= prbs7[DATA_WIDTH-1:1];
                             TX_DATA[0] <= PRBS_ERR_GEN ^ prbs7[0];
		    			 end else begin
                             TX_DATA[DATA_WIDTH-1:0] <= PRBS_INIT_VAL;
		    			 end
                       end
                 2'd1: begin
		    	         if(PATTERN_PRBS9) begin
                             TX_DATA[DATA_WIDTH-1:1] <= prbs9[DATA_WIDTH-1:1];
                             TX_DATA[0] <= PRBS_ERR_GEN ^ prbs9[0];
		    			 end else begin
                             TX_DATA[DATA_WIDTH-1:0] <= PRBS_INIT_VAL;
		    			 end
                       end
                 2'd2: begin
		    	         if(PATTERN_PRBS23) begin
                             TX_DATA[DATA_WIDTH-1:1] <= prbs23[DATA_WIDTH-1:1];
                             TX_DATA[0] <= PRBS_ERR_GEN ^ prbs23[0];
		    			 end else begin
                             TX_DATA[DATA_WIDTH-1:0] <= PRBS_INIT_VAL;
		    			 end
                       end
                 2'd3: begin
		    	         if(PATTERN_PRBS31) begin
                             TX_DATA[DATA_WIDTH-1:1] <= prbs31[DATA_WIDTH-1:1];
                             TX_DATA[0] <= PRBS_ERR_GEN ^ prbs31[0];
		    			 end else begin
                             TX_DATA[DATA_WIDTH-1:0] <= PRBS_INIT_VAL;
		    			 end
                       end
              default: TX_DATA <= PRBS_INIT_VAL;
            endcase
		end else begin
		    if(DATA_WIDTH == 80) begin
		        TX_DATA <= ALIGN_DATA; 
			end else begin
		        TX_DATA <= ALIGN_DATA[9:0];   
			end
		end
    end 
  end
endmodule