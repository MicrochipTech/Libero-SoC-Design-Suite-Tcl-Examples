// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: trn_bclksclk.v
//     
// Description: training block for aligning BCLK (bank clock) to SCLK
//              (system clock)
//
// Notes:

// AS: Modified to remove use of Enable signal, because this is not an EIP
//     signal, but an SCB signal.
//     Changed dem_mvdone to eye_monitor_clr_flags

// *********************************************************************/ 
`timescale 1 ns / 1 ps

module trn_bclksclk (
  input       reset_b,
  input       sclk,
  input       train,
  // Data eye monitor signsls
  input       eye_monitor_early,
  input       eye_monitor_late,
  output      eye_monitor_clr_flags,
  
  // Phase select
  output wire vcophsel_bclk_sel,
  output wire vcophsel_rotate,
  output wire loadphs_b,
  output wire done,
  
  // AS: added new signals for training
  input [3:0]         bclk_igear_rx,
  output wire         cmd_reset_lane,
  input [2:0]         VCOPHS_OFFSET,
  input [15:0]        apb_addr,
  output reg [7:0]    bclk_rddata
);

//parameter [2:0]       VCOPHS_OFFSET = 4;
parameter             SKIP_TRAINING = 1;

// states
parameter SM_IDLE = 0;
parameter SM_LOAD = 1;
parameter SM_DEM1 = 2;
parameter SM_DEM2 = 3;
parameter SM_CFLG = 4;
parameter SM_STOR = 5;
parameter SM_CALC = 6;
parameter SM_VSET = 7;
parameter SM_DONE = 8;
parameter SM_VSE2 = 9;
parameter SM_PAUS = 10;
parameter SM_WAIT = 11;
parameter SM_RESE = 12;
parameter SM_RESW = 13;
parameter SM_MRST = 14;
parameter SM_MRSW = 15;
parameter SM_RREG = 16; // re-register the data


// -------------------------------------------
// WIRES AND REGISTERS
// -------------------------------------------

wire load_vcophsel, incr_vcophsel;

// register for keeping track internally
// reg [2:0] vcophsel_bclk;
// AS: support up to 32 rotations instead of 8
reg [6:0] vcophsel_bclk;
reg [2:0] vcophsel_target;

// state
reg [4:0] current_state;
reg [4:0] next_state;

// register for storing flag values
reg [7:0] early_flags, late_flags;


// wait state counters
reg [4:0] dly_cnt;

// calc registers
reg [2:0] flag_cnt, early_val, late_val;
reg calc_early_set;
reg calc_late_set;
reg calc_done;

// AS: eye monitor workaround
reg       transition_detected;
reg [3:0] bclk_igear_rx_reg;
reg       error;
reg [2:0] rotate_count;
reg [3:0] reset_cycle_count;
reg [9:0] transition_check_counter;


// -------------------------------------------
// INTERNAL SIGNAL ASSIGNMENTS
// -------------------------------------------
//assign load_vcophsel = ((current_state == SM_LOAD) || (current_state == SM_CALC)) ? 1'b1 : 1'b0;
assign load_vcophsel = (current_state == SM_LOAD) ? 1'b1 : 1'b0;
//assign incr_vcophsel = (current_state == SM_VSE2) ? 1'b1 : 1'b0;

// AS (4/18/17): fix for BCLK/SCLk training getting stuck
assign incr_vcophsel = (current_state == SM_CFLG) ? 1'b1 : 1'b0;

// -------------------------------------------
// OUTPUT ASSIGNMENTS
// -------------------------------------------

assign done = (current_state == SM_DONE) ? 1'b1 : 1'b0;
//assign eye_monitor_clr_flags = ((current_state == SM_CFLG) || (current_state == SM_LOAD)) ? 1'b1 : 1'b0;
assign eye_monitor_clr_flags = 1'b0;
//assign vcophsel_rotate = ((current_state == SM_CFLG) || (current_state == SM_VSE2) || (current_state == SM_CALC)) ? 1'b1 : 1'b0;
assign vcophsel_rotate = (current_state == SM_CFLG) | (current_state == SM_VSE2) ? 1'b1 : 1'b0;
assign vcophsel_bclk_sel = ((current_state != SM_IDLE) && (current_state != SM_DONE)) ? 1'b1 : 1'b0;
assign cmd_reset_lane = ((current_state == SM_PAUS) | (current_state == SM_RESE) | (current_state == SM_MRST))  ? 1'b1 : 1'b0;

// reload the phs (to 0) during calculation, that way we're ready
// to load the new VCOPH_SEL value when we're done

// AS: because we don't want to reload 0's anymore (for SAR 82438)
//     we need to never load, using rotate and direction instead
// assign loadphs_b = ((current_state == SM_CALC) || (current_state == SM_LOAD)) ? 1'b0 : 1'b1;
assign loadphs_b = 1'b1; // tied off

// -------------------------------------------
// SYNCHRONOUS LOGIC
// ------------------------------------------

// AS: 8/10/17 Added counter to do multiple checks for transition
always @ (posedge sclk or negedge reset_b)
begin : trans_cnt
  if (!reset_b)
    transition_check_counter <= 10'h3FF;
  else
    if (current_state == SM_STOR)
      transition_check_counter <= transition_check_counter - 10'h01;
    else
      transition_check_counter <= 10'h3FF;
end


// AS: eye monitor workaround
// register rx bits
always@(posedge sclk or negedge reset_b)
begin : register_rx
  if (!reset_b)
  begin
    rotate_count <= 3'b000;
    bclk_igear_rx_reg <= 4'h0;
    transition_detected <= 1'b0;
    error <= 1'b0;
  end
  else
  begin
    //transition_detected <=  |((bclk_igear_rx_reg[3:0] ^ bclk_igear_rx[3:0]) && bclk_igear_rx[3:0]);
    transition_detected <=  |((bclk_igear_rx_reg[3:0] ^ bclk_igear_rx[3:0]) && bclk_igear_rx[3:0] && {bclk_igear_rx_reg[2:0], bclk_igear_rx_reg[3]});
    error <= &bclk_igear_rx_reg[3:0] || &(!bclk_igear_rx_reg[3:0]);
    if (current_state == SM_STOR || current_state == SM_LOAD || current_state == SM_RREG)
      bclk_igear_rx_reg[3:0] <= bclk_igear_rx[3:0];
    else
      bclk_igear_rx_reg[3:0] <= bclk_igear_rx_reg[3:0];
      
    if (current_state == SM_VSE2)
      rotate_count <= rotate_count + 3'b001;
    else
      rotate_count <= rotate_count;
  end
  

end


// AS: deprecated, but leaving it in for now
// calculate midpoint after all flags are stored
always@(posedge sclk or negedge reset_b)
begin: calc_proc
  if (!reset_b)
  begin
    flag_cnt <= 3'b000;
    early_val <= 3'b000;
    late_val <= 3'b000;
    calc_early_set <= 1'b0;
    calc_late_set <= 1'b0;
    vcophsel_target <= 3'b000;
    calc_done <= 1'b0;
  end
  else
  begin
    if (current_state == SM_CALC)
    begin
      // always increment
      flag_cnt <= flag_cnt + 3'b001;
      
      if (calc_late_set && calc_early_set)
      begin
        if (early_val < late_val)
          vcophsel_target <= (early_val + late_val) >> 1;
        else
          vcophsel_target <= early_val; // Fix: need a more complex algorith, good for now
        calc_done <= 1'b1;
      end
      else if (calc_early_set==1'b1)
      begin
        if (late_flags[flag_cnt] == 1'b1)
        begin
          late_val <= flag_cnt;
          calc_late_set <= 1'b1;
        end
      end
      else 
      begin
        if (early_flags[flag_cnt] == 1'b1)
        begin
          early_val <= flag_cnt;
          calc_early_set <= 1'b1;
        end
      end
    end
    else
    begin
      flag_cnt <= 3'b000;
    end
  end
end

// AS: 5/1: support 32 rotations instead of 8
always @ (posedge sclk or negedge reset_b)
begin: vcophsel_bclk_ctrl
  if (!reset_b)
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

// AS: 5/10, added new counter to obviate
//     the need for a modulus (%) operation
always @ (posedge sclk or negedge reset_b)
begin: reset_cycle_counter
  if (!reset_b)
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
always @ (posedge sclk or negedge reset_b)
begin
  if (!reset_b)
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

// AS: deprecated, but leaving it in for now
// store flags
always @ (posedge sclk or negedge reset_b)
begin
  if (!reset_b)
  begin
    early_flags[7:0] <= 8'h00;
    late_flags[7:0] <= 8'h00;
  end
  else
  begin
    if (current_state == SM_STOR)
    begin
      early_flags[vcophsel_bclk] <= eye_monitor_early;
      late_flags[vcophsel_bclk] <= eye_monitor_late;
    end
    
  end
end


// -------------------------------------------
// STATE MACHINE
// -------------------------------------------

always @ (posedge sclk or negedge reset_b)
begin: SM
  if (!reset_b)
    current_state <= SM_IDLE;
  else
    current_state <= next_state;    
end

always@(*)
begin
  case (current_state)
    SM_IDLE:
      if (train==1'b1)
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
      // next_state = SM_CALC;
      // AS: if we get all the way to the end, we're done
      // AS: 5/1/17: modified to allow phsel to rotate up to 32 times
      if ( vcophsel_bclk == 7'b1001000 || transition_detected )
        next_state = SM_VSET;
      else if (transition_check_counter != 10'h000) // AS: 8/10 repeat 32 times
        next_state = SM_STOR;
      else if (reset_cycle_count == 4'b1000) // multiple of nine, do a reset
        next_state = SM_MRST;
      else
        next_state = SM_CFLG;
        
    SM_CALC:
      if (calc_done == 1'b1)
        next_state = SM_VSET;
      else
        next_state = SM_CALC;

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
      // AS: eye monitor workaround
      // if (vcophsel_target[2:0] == vcophsel_bclk[2:0])
      // if (rotate_count == 3'b100) // rotate 4 times after alignment
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
    
    SM_DONE:
      next_state = SM_DONE;
        
    default: next_state = SM_IDLE;
  endcase
end

// AS: added APB registers
always@(*)
begin : bclk_rddata_output
  bclk_rddata = {1'b0, vcophsel_bclk[6:0]};
end

endmodule
