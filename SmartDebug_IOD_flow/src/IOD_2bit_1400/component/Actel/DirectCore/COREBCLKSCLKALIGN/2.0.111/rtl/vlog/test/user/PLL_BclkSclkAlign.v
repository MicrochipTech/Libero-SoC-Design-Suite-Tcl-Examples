// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_PLL_BCLKSCLKALIGN.v
//     
// Description: training block for aligning BCLK (bank clock) to SCLK
//              (system clock)
//
// Notes:
// *********************************************************************/ 
`timescale 1 ns / 1 ps

module PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_PLL_BCLKSCLKALIGN
  (  
  reset_n,
  sclk,
  pll_bclksclkalign_train,
  pll_clk_algn_rstrt,
  pll_clk_algn_hold,
  pll_clk_algn_skip,

  // PLL Signals
  vcophsel_bclk_sel,
  vcophsel_bclk90_sel,
  vcophsel_sclk_sel,
  vcophsel_mclk_sel,
  vcophsel_dir,
  vcophsel_rotate,
  loadphs_b,
  pll_bclksclkalign_done,
  VCOPHS_OFFSET,
  
  // IOG/IOD Signals 
  bclk_igear_rx,
  reset_lane,

  // APB Status
  apb_bclk0_vcophs_sel,
  apb_status_bclk
);

parameter IOG_FABRIC_RATIO           = 2;     // 2- DDR2 Training Mode , 4 - DDR4 Training Mode 
parameter PLL_CLK_ALGN_SKIP_TRNG     = 1;     // 0 - Perform training,  1 - No training is done
parameter PLL_CLK_ALGN_HOLD_TRNG     = 1;     // 0 - Continue training, 1 - Hold training

// -------------------------------------------
// PARAMETER FSM Declaration
// -------------------------------------------
localparam SM_IDLE = 5'h0;
localparam SM_LOAD = 5'h1;
localparam SM_DEM1 = 5'h2;
localparam SM_DEM2 = 5'h3;
localparam SM_CFLG = 5'h4;
localparam SM_STOR = 5'h5;
localparam SM_VSET = 5'h6;
localparam SM_DONE = 5'h7;
localparam SM_VSE2 = 5'h8;
localparam SM_PAUS = 5'h9;
localparam SM_WAIT = 5'hA;
localparam SM_RESE = 5'hB;
localparam SM_RESW = 5'hC;
localparam SM_MRST = 5'hD;
localparam SM_MRSW = 5'hE;
localparam SM_RREG = 5'hF;
localparam SM_HOLD = 5'h10;

  input reset_n;
  input sclk;
  input pll_bclksclkalign_train;
  input  pll_clk_algn_rstrt;      
  input  pll_clk_algn_hold;       
  input  pll_clk_algn_skip;       

  // PLL Signals
  output vcophsel_bclk_sel;
  output vcophsel_bclk90_sel;
  output vcophsel_sclk_sel;
  output vcophsel_mclk_sel;
  output vcophsel_dir;
  output vcophsel_rotate;
  output loadphs_b;
  output pll_bclksclkalign_done;
  input [2:0]         VCOPHS_OFFSET;
  
  // IOG/IOD Signals 
  input [IOG_FABRIC_RATIO-1:0]  bclk_igear_rx;
  output reset_lane;

  // APB Status
  output [6:0]  apb_bclk0_vcophs_sel;
  output 	apb_status_bclk;

  wire vcophsel_bclk_sel;
  wire vcophsel_bclk90_sel;
  wire vcophsel_sclk_sel;
  wire vcophsel_mclk_sel;
  wire vcophsel_dir;
  wire vcophsel_rotate;
  wire loadphs_b;
  wire pll_bclksclkalign_done;
  wire reset_lane;
  reg [6:0]    apb_bclk0_vcophs_sel;
  reg          apb_status_bclk;
  reg          hold_state_flag; 

// -------------------------------------------
// WIRES AND REGISTERS
// -------------------------------------------

wire load_vcophsel;
wire incr_vcophsel;
wire set_apb_status_bclk;
wire clear_apb_status_bclk;

// register for keeping track internally
// support up to 32 rotations instead of 8
reg [6:0] vcophsel_bclk;

// FSM state
reg [4:0] hold_state;
reg [4:0] current_state;
reg [4:0] next_state;

// wait state counters
reg [4:0] dly_cnt;

// Transition Detection L
reg       transition_detected;
reg [IOG_FABRIC_RATIO-1:0] bclk_igear_rx_reg;
reg       error;
reg [2:0] rotate_count;
reg [3:0] reset_cycle_count;
reg [9:0] transition_check_counter;

reg [2:0] skip_trng_reg;
reg [2:0] restart_reg;
reg [3:0] restart_edge_reg;
wire      Restart_trng_edge_det;
wire      restart_trng_fg;
wire      rst_clk_align_trng;

// -------------------------------------------
// INTERNAL SIGNAL ASSIGNMENTS
// -------------------------------------------

// PLL INCR/ROT Phase select
assign load_vcophsel = (current_state == SM_LOAD) ? 1'b1 : 1'b0;
assign incr_vcophsel = (current_state == SM_CFLG) ? 1'b1 : 1'b0;

// APB sticky status bit
assign set_apb_status_bclk 	= (current_state == SM_DONE) ? 1'b1 : 1'b0;
assign clear_apb_status_bclk 	= (current_state == SM_RESE) ? 1'b1 : 1'b0;

// -------------------------------------------
// OUTPUT ASSIGNMENTS
// -------------------------------------------

assign pll_bclksclkalign_done 		= (skip_trng_reg || (current_state == SM_DONE)) ? 1'b1 : 1'b0;
assign vcophsel_rotate			= (current_state == SM_CFLG) | (current_state == SM_VSE2) ? 1'b1 : 1'b0;
assign vcophsel_bclk_sel 		= ((current_state != SM_IDLE) && (current_state != SM_DONE)) ? 1'b1 : 1'b0;
assign vcophsel_bclk90_sel 		= vcophsel_bclk_sel;
assign vcophsel_sclk_sel 		= 1'b0;
assign vcophsel_mclk_sel 		= 1'b0;
assign vcophsel_dir	 		= 1'b1;
assign reset_lane 			= ((current_state == SM_PAUS) | (current_state == SM_RESE) | (current_state == SM_MRST))  ? 1'b1 : 1'b0;
assign loadphs_b 			= (current_state == SM_LOAD) ? 1'b0 : 1'b1;

// -------------------------------------------
// SYNCHRONOUS LOGIC
// ------------------------------------------

// Counter to do multiple checks for transition
wire [9:0] transition_check_counter_length=10'h3ff;
always @ (posedge sclk or negedge reset_n)
begin : trans_check_cnt
  if (!reset_n)
    transition_check_counter <= transition_check_counter_length;
  else if (rst_clk_align_trng)
    transition_check_counter <= transition_check_counter_length;
  else
    if (current_state == SM_STOR)
      transition_check_counter <= transition_check_counter - 10'h01;
    else
      transition_check_counter <= transition_check_counter_length;
end

// APB apb status of bclk for read back 
always @ (posedge sclk or negedge reset_n)
begin : stick_status_bit
  if (!reset_n)
    apb_status_bclk <= 1'b0;
  else if (rst_clk_align_trng)
    apb_status_bclk <= 1'b0;
  else
    if (clear_apb_status_bclk)
      apb_status_bclk <= 1'b0;
    else if (set_apb_status_bclk)
      apb_status_bclk <= 1'b1;
    else
      apb_status_bclk <= apb_status_bclk;
end


// Register rx bits for transition detection
always@(posedge sclk or negedge reset_n)
begin : register_rx
  if (!reset_n)
  begin
    rotate_count <= 3'b000;
    bclk_igear_rx_reg <= {IOG_FABRIC_RATIO{1'b0}};
    transition_detected <= 1'b0;
    error <= 1'b0;
  end
  else if (rst_clk_align_trng)
  begin
    rotate_count <= 3'b000;
    bclk_igear_rx_reg <= {IOG_FABRIC_RATIO{1'b0}};
    transition_detected <= 1'b0;
    error <= 1'b0;
  end
  else
  begin

    if (IOG_FABRIC_RATIO == 'd2)	  
      transition_detected <= (((bclk_igear_rx_reg[0]==1'b0) && (bclk_igear_rx[0]==1'b1)) || ((bclk_igear_rx_reg[1]==1'b0) && (bclk_igear_rx[1]==1'b1)));
    if (IOG_FABRIC_RATIO == 'd4)	  
      transition_detected <=  |((bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0] ^ bclk_igear_rx[IOG_FABRIC_RATIO-1:0]) && bclk_igear_rx[IOG_FABRIC_RATIO-1:0] && {bclk_igear_rx_reg[IOG_FABRIC_RATIO-2:0], bclk_igear_rx_reg[IOG_FABRIC_RATIO-1]});

    error <= &bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0] || &(~bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0]);
    if (current_state == SM_STOR || current_state == SM_LOAD || current_state == SM_RREG)
      bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0] <= bclk_igear_rx[IOG_FABRIC_RATIO-1:0];
    else
      bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0] <= bclk_igear_rx_reg[IOG_FABRIC_RATIO-1:0];
      
    if (current_state == SM_VSE2)
      rotate_count <= rotate_count + 3'b001;
    else
      rotate_count <= rotate_count;
  end
  

end


// Support 32 rotations instead of 8
always @ (posedge sclk or negedge reset_n)
begin: vcophsel_bclk_ctrl
  if (!reset_n)
    vcophsel_bclk <= 7'b0000000;
  else if (rst_clk_align_trng)
    vcophsel_bclk <= 7'b0000000;
  else
  begin
    if (load_vcophsel == 1'b1)
      vcophsel_bclk <= 7'b0000000;
    else if ((incr_vcophsel == 1'b1))
      vcophsel_bclk <= vcophsel_bclk + 7'b0000001;
    else
      vcophsel_bclk <= vcophsel_bclk;
  end
end

// Reset cycle count for every 8 rotate 
always @ (posedge sclk or negedge reset_n)
begin: reset_cycle_counter
  if (!reset_n)
    reset_cycle_count <= 4'b0000;
  else if (rst_clk_align_trng)
    reset_cycle_count <= 4'b0000;
  else
  begin
    if (load_vcophsel == 1'b1)
      reset_cycle_count <= 4'b0000;
    else if ((incr_vcophsel == 1'b1))
      if (reset_cycle_count == 4'b1000) // 8 rotates (+1)
        reset_cycle_count <= 4'b0000;
      else 
        reset_cycle_count <= reset_cycle_count + 4'b0001;
    else
      reset_cycle_count <= reset_cycle_count;
  end
end

// wait counter
always @ (posedge sclk or negedge reset_n)
begin
  if (!reset_n)
    dly_cnt[4:0] <= 4'h0;
  else if (rst_clk_align_trng)
    dly_cnt[4:0] <= 4'h0;
  else
  begin
    if ((current_state == SM_RESE) | (current_state == SM_MRST))
      dly_cnt[4:0] <= 5'h1F; //  31 clock cycles after reset
    else if ((current_state == SM_CFLG) | (current_state == SM_PAUS) ) // when entering DEM control stage
      dly_cnt[4:0] <= 5'h4; // 4 clock cycles
    else if (dly_cnt[4:0] > 5'h0)
      dly_cnt[4:0] <= dly_cnt[4:0] - 5'h1;
    else
      dly_cnt[4:0] <= dly_cnt[4:0];
  end
end


// -------------------------------------------
// STATE MACHINE
// -------------------------------------------

always @ (posedge sclk or negedge reset_n)
begin: SM
  if (!reset_n) begin
    current_state   <= SM_IDLE;
    hold_state_flag <= 1'b0; 
    hold_state      <= SM_IDLE;         
  end  
  else if (rst_clk_align_trng) begin
    current_state   <= SM_IDLE;
    hold_state_flag <= 1'b0; 
    hold_state      <= SM_IDLE;         
  end  
  else if ((!hold_state_flag) && (pll_clk_algn_hold == 1'b1) && (PLL_CLK_ALGN_HOLD_TRNG == 1'b1)) begin
    hold_state       <= current_state; 
    current_state    <= SM_HOLD;
    hold_state_flag  <= 1'b1; 
  end
  else if ((hold_state_flag) && (current_state == SM_HOLD) && (pll_clk_algn_hold == 1'b0)) begin
    current_state         <= hold_state;
    hold_state_flag       <= 1'b0; 
    hold_state            <= SM_IDLE;         
  end	      
  else
    current_state <= next_state;    
end

always@(*)
begin
  case (current_state)
    SM_HOLD:
      next_state = SM_HOLD;

    SM_IDLE:
      if (pll_bclksclkalign_train==1'b1)
        next_state = SM_RESE;
      else
        next_state = SM_IDLE;

    SM_RESE:
      next_state = SM_RESW;
      
    SM_RESW:
      if (dly_cnt[4:0] == 5'b00000)
        next_state = SM_LOAD;
      else
        next_state = SM_RESW;
        
    SM_LOAD:
      next_state = SM_DEM1;
    
    SM_CFLG:
        next_state = SM_DEM1;
    
    SM_DEM1:
      if (dly_cnt[4:0] == 5'b00000)
        next_state = SM_DEM2;
      else
        next_state = SM_DEM1;
    
    SM_DEM2:
      if (dly_cnt[4:0] == 5'b00000)
        next_state = SM_STOR;
      else
        next_state = SM_DEM2;

    SM_STOR:
      // check phsel to rotate up to 32 times
      if ( vcophsel_bclk == 7'b1001000 || transition_detected )
        next_state = SM_VSET;
      else if (transition_check_counter != 10'h000) // 8/10 repeat 32 times
        next_state = SM_STOR;
      else if (reset_cycle_count == 4'b1000) // multiple of nine, do a reset
        next_state = SM_MRST;
      else
        next_state = SM_CFLG;

    SM_MRST:
      next_state = SM_MRSW;

    SM_MRSW:
      if (dly_cnt[4:0] == 5'b00000)
        next_state = SM_RREG;
      else
        next_state = SM_MRSW;
    
    // re-register data to accound for gearbox reset
    SM_RREG:
      next_state = SM_CFLG;
    
    
    SM_VSET:
      // Rotate for known phase with sclk , bclk and bclk90
      if (rotate_count == VCOPHS_OFFSET[2:0])
        next_state = SM_PAUS;
      else
        next_state = SM_VSE2; // do a rotate/increment
        
    SM_VSE2:
      next_state = SM_VSET;
    
    SM_PAUS:
      next_state = SM_WAIT;
    
    SM_WAIT:
      if (dly_cnt[4:0] == 5'b00000)
        next_state = SM_DONE;
      else
        next_state = SM_WAIT;
    
    // NON-sticky DONE 
    SM_DONE:
      if (pll_bclksclkalign_train == 1'b0)
        next_state = SM_IDLE;
      else
        next_state = SM_DONE;
        
    default: next_state = SM_IDLE;
  endcase
end

// APB Registers
always@(*)
begin : bclk_rddata_output
  apb_bclk0_vcophs_sel = vcophsel_bclk[6:0];
end

//positive Edge det on Restart training signal
assign Restart_trng_edge_det = (!restart_reg[2] & restart_reg[1]);
assign restart_trng_fg       = |restart_edge_reg; //Stretch the Restart pulse

assign rst_clk_align_trng    = (restart_trng_fg || skip_trng_reg); 

//Synchronise RESTART_TRNG Signal with SCLK
always @ (posedge sclk or negedge reset_n)
begin
 if (!reset_n) begin
   restart_reg <= 3'b000;
   restart_edge_reg <= 4'b0000;
 end else begin
   restart_reg <= {restart_reg[1:0],pll_clk_algn_rstrt};
   restart_edge_reg <= {restart_edge_reg[2:0],Restart_trng_edge_det};     
 end
end

// SKIP_TRNG SYNCHRONIZER //
always @ (posedge sclk or negedge reset_n)
begin
 if (!reset_n) begin
   skip_trng_reg <= 0;
 end else if (PLL_CLK_ALGN_SKIP_TRNG) begin
   skip_trng_reg <= {skip_trng_reg[1:0],pll_clk_algn_skip};
 end     
end

endmodule //PF_IOD_GENERIC_RX_C1_COREBCLKSCLKALIGN_0_PLL_BCLKSCLKALIGN
