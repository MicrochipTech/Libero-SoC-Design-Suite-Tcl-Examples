// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_COREBCLKSCLKALIGN.v
//     
// Description: training block for aligning BCLK (bank clock) to SCLK
//              (system clock)
//
// Notes:
// *********************************************************************/ 
`timescale 1 ns / 1 ps

module PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_COREBCLKSCLKALIGN
  ( 
    //Sys Clk , Async Rst
    SCLK,              
    RESETN,            

    //PLL Controls 
    PLL_VCOPHSEL_SCLK_SEL,
    PLL_VCOPHSEL_BCLK_SEL,
    PLL_VCOPHSEL_BCLK90_SEL,
    PLL_VCOPHSEL_MCLK_SEL,
    PLL_LOADPHS,
    PLL_PHS_ROTATE,
    PLL_PHS_DIRECTION,
    PLL_BCLKPHS_OFFSET,
    ICB_BCLKPHS_OFFSET,
    CLK_ALGN_RSTRT,
    CLK_ALGN_HOLD,
    CLK_ALGN_SKIP,
    ICB_CLK_ALGN_ERR,

    //Training Control Signals 
    BCLKSCLK_TRAIN_START,
    BCLKSCLK_TRAIN_DONE,
    BCLKSCLK_BCLK_VCOPHSEL,
    ICB_CLK_ALGN_TAPDLY,

    //BCLK IGEAR RX Controls
    BCLK_IGEAR_RX,

    //ICB-IOG DEM Controls
    IOD_EARLY,		    
    IOD_LATE,		    
    IOD_OOR,
    ICB_CLK_ALGN_LOAD,
    ICB_CLK_ALGN_MOV,
    ICB_CLK_ALGN_DIR,
    ICB_CLK_ALGN_CLR_FLGS,
    BCLKSCLK_ALGN_PAUSE
  );

// -------------------------------------------
// PARAMETER Declaration
// -------------------------------------------
parameter IOG_FABRIC_RATIO  	     = 2;     // 2- DDR2 Training Mode , 4 - DDR4 Training Mode 
parameter BCLKSCLK_TRN_MODE 	     = 1;     // 0- RX/TX PLL Based Training , 1 - ICB RX Training
parameter FAMILY            	     = 26;    // PolarFire
parameter CLK_ALGN_SKIP_TRNG         = 1;     // 0 - Perform training,  1 - No training is done
parameter CLK_ALGN_HOLD_TRNG         = 1;     // 0 - Continue training, 1 - Hold training
parameter BCLKSCLK_ICB_MODE          = 1;     // 0 - 128 ICB Tap Delays , 1 - 256 ICB Tap Delays 
parameter BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH  = 3;     // 3 - Default 8 clocks  

localparam  ICB_CLK_ALGN_SKIP_TRNG     = (BCLKSCLK_TRN_MODE == 'd1) ? 1 : 0;     // 0 - Perform training,  1 - No training is done
localparam  ICB_CLK_ALGN_HOLD_TRNG     = (BCLKSCLK_TRN_MODE == 'd1) ? 1 : 0;     // 0 - Continue training, 1 - Hold training
localparam  PLL_CLK_ALGN_SKIP_TRNG     = (BCLKSCLK_TRN_MODE == 'd0) ? 1 : 0;     // 0 - Perform training,  1 - No training is done
localparam  PLL_CLK_ALGN_HOLD_TRNG     = (BCLKSCLK_TRN_MODE == 'd0) ? 1 : 0;     // 0 - Continue training, 1 - Hold training
localparam  BCLKSCLK_ICB_TAP_CNT       = (BCLKSCLK_ICB_MODE == 'd1) ? 'd256 : 'd128;
localparam  BCLKSCLK_ICB_TAP_CNT_WIDTH = (BCLKSCLK_ICB_MODE == 'd1) ? 'd8   : 'd7;


   //Sys Clk , Async Rst
    input SCLK;              
    input RESETN;            

    //PLL Controls 
    output PLL_VCOPHSEL_SCLK_SEL;
    output PLL_VCOPHSEL_BCLK_SEL;
    output PLL_VCOPHSEL_BCLK90_SEL;
    output PLL_VCOPHSEL_MCLK_SEL;
    output PLL_LOADPHS;
    output PLL_PHS_ROTATE;
    output PLL_PHS_DIRECTION;
    input  [2:0] PLL_BCLKPHS_OFFSET;
    input  [7:0] ICB_BCLKPHS_OFFSET;
    input  CLK_ALGN_RSTRT;
    input  CLK_ALGN_HOLD;
    input  CLK_ALGN_SKIP;
    output ICB_CLK_ALGN_ERR;

    //Training Control Signals 
    input  BCLKSCLK_TRAIN_START;
    output BCLKSCLK_TRAIN_DONE;
    output [6:0] BCLKSCLK_BCLK_VCOPHSEL;
    output [7:0] ICB_CLK_ALGN_TAPDLY;

    //BCLK IGEAR RX Controls
    input [IOG_FABRIC_RATIO-1:0] BCLK_IGEAR_RX;

    //ICB-IOG DEM Controls
    input IOD_EARLY;		    
    input IOD_LATE;		    
    input IOD_OOR;
    output ICB_CLK_ALGN_LOAD;
    output ICB_CLK_ALGN_MOV;
    output ICB_CLK_ALGN_DIR;
    output ICB_CLK_ALGN_CLR_FLGS;
    output BCLKSCLK_ALGN_PAUSE;


    wire  PLL_VCOPHSEL_SCLK_SEL;
    wire  PLL_VCOPHSEL_BCLK_SEL;
    wire  PLL_VCOPHSEL_BCLK90_SEL;
    wire  PLL_VCOPHSEL_MCLK_SEL;
    wire  PLL_LOADPHS;
    wire  PLL_PHS_ROTATE;
    wire  PLL_PHS_DIRECTION;
    wire BCLKSCLK_TRAIN_DONE;
    wire PLL_BCLKSCLK_TRAIN_DONE;
    wire ICB_BCLKSCLK_TRAIN_DONE;
    wire [6:0] BCLKSCLK_BCLK_VCOPHSEL;
    wire [7:0] ICB_CLK_ALGN_TAPDLY;
    wire ICB_CLK_ALGN_LOAD;
    wire ICB_CLK_ALGN_MOV;
    wire ICB_CLK_ALGN_DIR;
    wire ICB_CLK_ALGN_CLR_FLGS;
    wire BCLKSCLK_ALGN_PAUSE;

    wire ICB_CLK_ALGN_RSTRT;
    wire ICB_CLK_ALGN_HOLD;
    wire ICB_CLK_ALGN_SKIP;
    wire ICB_CLK_ALGN_ERR;

    wire PLL_CLK_ALGN_RSTRT;
    wire PLL_CLK_ALGN_HOLD;
    wire PLL_CLK_ALGN_SKIP;

    wire  [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] RX_CLK_ALIGN_TAPDLY;
    wire  RX_CLK_ALIGN_LOAD;
    wire  RX_CLK_ALIGN_DIR;
    wire  RX_CLK_ALIGN_MOVE;
    wire  RX_CLK_ALIGN_CLR_FLGS;
    wire  PLL_BCLKSCLK_TRAIN_START;
    wire  ICB_BCLKSCLK_TRAIN_START;
    wire  PLL_CLK_ALGN_PAUSE;
    wire  RX_CLK_ALIGN_PAUSE;


assign PLL_BCLKSCLK_TRAIN_START = (BCLKSCLK_TRN_MODE == 1'b0) ? BCLKSCLK_TRAIN_START : 1'b0;
assign ICB_BCLKSCLK_TRAIN_START = (BCLKSCLK_TRN_MODE == 1'b1) ? BCLKSCLK_TRAIN_START : 1'b0;
assign BCLKSCLK_ALGN_PAUSE      = (BCLKSCLK_TRN_MODE == 1'b0) ? PLL_CLK_ALGN_PAUSE   : RX_CLK_ALIGN_PAUSE;
assign BCLKSCLK_TRAIN_DONE      = (BCLKSCLK_TRN_MODE == 1'b0) ? PLL_BCLKSCLK_TRAIN_DONE : ICB_BCLKSCLK_TRAIN_DONE;
assign ICB_CLK_ALGN_RSTRT	= (BCLKSCLK_TRN_MODE == 1'b1) ? CLK_ALGN_RSTRT    : 1'b0;
assign ICB_CLK_ALGN_HOLD	= (BCLKSCLK_TRN_MODE == 1'b1) ? CLK_ALGN_HOLD     : 1'b0; 
assign ICB_CLK_ALGN_SKIP	= (BCLKSCLK_TRN_MODE == 1'b1) ? CLK_ALGN_SKIP     : 1'b0;
assign PLL_CLK_ALGN_RSTRT	= (BCLKSCLK_TRN_MODE == 1'b0) ? CLK_ALGN_RSTRT    : 1'b0;
assign PLL_CLK_ALGN_HOLD	= (BCLKSCLK_TRN_MODE == 1'b0) ? CLK_ALGN_HOLD     : 1'b0; 
assign PLL_CLK_ALGN_SKIP	= (BCLKSCLK_TRN_MODE == 1'b0) ? CLK_ALGN_SKIP     : 1'b0;

/* synthesis translate_off*/
generate 
if (BCLKSCLK_TRN_MODE == 1'b1) begin
/* synthesis translate_on*/

PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_ICB_BCLKSCLKALIGN #(
                        .ICB_CLK_ALGN_SKIP_TRNG       (ICB_CLK_ALGN_SKIP_TRNG),
                        .ICB_CLK_ALGN_HOLD_TRNG       (ICB_CLK_ALGN_HOLD_TRNG),
                        .BCLKSCLK_ICB_TAP_CNT         (BCLKSCLK_ICB_TAP_CNT),
                        .BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH    (BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH),
                        .BCLKSCLK_ICB_TAP_CNT_WIDTH   (BCLKSCLK_ICB_TAP_CNT_WIDTH)
	               )
  U_ICB_BCLKSCLKALIGN
  (  
  //Sys Clk , Async Rst
  .SCLK				(SCLK),              
  .RESETN			(RESETN),            

  // BIT Align status IN and OUT signals 
  .RX_BCLKSCLKALIGN_TRAIN	(ICB_BCLKSCLK_TRAIN_START),
  .RX_CLK_ALIGN_START		(),
  .RX_CLK_ALIGN_DONE		(ICB_BCLKSCLK_TRAIN_DONE),
  .RX_BCLKPHS_OFFSET		(ICB_BCLKPHS_OFFSET),
  .RX_CLK_ALIGN_ERR		(ICB_CLK_ALGN_ERR),
  .RX_CLK_ALIGN_RSTRT		(ICB_CLK_ALGN_RSTRT),
  .RX_CLK_ALIGN_HOLD		(ICB_CLK_ALGN_HOLD),
  .RX_CLK_ALIGN_SKIP		(ICB_CLK_ALGN_SKIP),

  // IOD Controller IN signals       
  .IOD_EARLY			(IOD_EARLY),   
  .IOD_LATE			(IOD_LATE),
  .IOD_OOR			(IOD_OOR),

  // IOD Controller OUT signals     
  .RX_RESET_LANE		(RX_CLK_ALIGN_PAUSE), 
  .RX_CLK_ALIGN_TAPDLY          (RX_CLK_ALIGN_TAPDLY), 
  .RX_CLK_ALIGN_CLR_FLGS	(RX_CLK_ALIGN_CLR_FLGS),
  .RX_CLK_ALIGN_LOAD		(RX_CLK_ALIGN_LOAD),
  .RX_CLK_ALIGN_DIR		(RX_CLK_ALIGN_DIR),
  .RX_CLK_ALIGN_MOVE		(RX_CLK_ALIGN_MOVE)
 );

/* synthesis translate_off*/
end
endgenerate

generate 
if (BCLKSCLK_TRN_MODE == 1'b0) begin
/* synthesis translate_on*/

PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_PLL_BCLKSCLKALIGN #(
        .PLL_CLK_ALGN_SKIP_TRNG (PLL_CLK_ALGN_SKIP_TRNG),
	.PLL_CLK_ALGN_HOLD_TRNG (PLL_CLK_ALGN_HOLD_TRNG),
	.IOG_FABRIC_RATIO(IOG_FABRIC_RATIO))
  U_PLL_BCLKSCLKALIGN
  (  
  .reset_n			(RESETN),
  .sclk				(SCLK),
  .pll_clk_algn_rstrt           (PLL_CLK_ALGN_RSTRT),
  .pll_clk_algn_hold            (PLL_CLK_ALGN_HOLD),
  .pll_clk_algn_skip            (PLL_CLK_ALGN_SKIP),
  .pll_bclksclkalign_train	(PLL_BCLKSCLK_TRAIN_START),
  .vcophsel_bclk_sel		(PLL_VCOPHSEL_BCLK_SEL),
  .vcophsel_bclk90_sel		(PLL_VCOPHSEL_BCLK90_SEL),
  .vcophsel_sclk_sel		(PLL_VCOPHSEL_SCLK_SEL),
  .vcophsel_mclk_sel		(PLL_VCOPHSEL_MCLK_SEL),
  .vcophsel_dir                 (PLL_PHS_DIRECTION),
  .vcophsel_rotate		(PLL_PHS_ROTATE),
  .loadphs_b			(PLL_LOADPHS),
  .pll_bclksclkalign_done	(PLL_BCLKSCLK_TRAIN_DONE),
  .VCOPHS_OFFSET		(PLL_BCLKPHS_OFFSET),
  .bclk_igear_rx		(BCLK_IGEAR_RX),
  .reset_lane			(PLL_CLK_ALGN_PAUSE),
  .apb_bclk0_vcophs_sel		(BCLKSCLK_BCLK_VCOPHSEL),
  .apb_status_bclk		()
  );

/* synthesis translate_off*/
end
endgenerate   

/* synthesis translate_off*/
generate 
if (BCLKSCLK_TRN_MODE == 1'b1) begin
/* synthesis translate_on*/
assign ICB_CLK_ALGN_LOAD	= RX_CLK_ALIGN_LOAD;
assign ICB_CLK_ALGN_MOV		= RX_CLK_ALIGN_MOVE;
assign ICB_CLK_ALGN_DIR		= RX_CLK_ALIGN_DIR;
assign ICB_CLK_ALGN_CLR_FLGS	= RX_CLK_ALIGN_CLR_FLGS; 
assign ICB_CLK_ALGN_TAPDLY      = (BCLKSCLK_ICB_MODE == 'd1) ? RX_CLK_ALIGN_TAPDLY : {1'b0,RX_CLK_ALIGN_TAPDLY[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]};
/* synthesis translate_off*/
end
endgenerate

generate 
if (BCLKSCLK_TRN_MODE == 1'b0) begin
assign ICB_CLK_ALGN_LOAD	= 1'b0;
assign ICB_CLK_ALGN_MOV		= 1'b0;
assign ICB_CLK_ALGN_DIR		= 1'b1;
assign ICB_CLK_ALGN_CLR_FLGS	= 1'b0;  
assign ICB_CLK_ALGN_TAPDLY      =  'd0;
end
endgenerate   
/* synthesis translate_on*/


endmodule
