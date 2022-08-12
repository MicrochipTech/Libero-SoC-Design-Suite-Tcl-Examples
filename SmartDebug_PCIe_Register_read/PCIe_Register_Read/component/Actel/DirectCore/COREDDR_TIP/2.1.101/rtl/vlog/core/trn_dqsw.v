// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: trn_dqsw.v
//     
// Description: training block for DQSW/DQSW270 to match delay between the two
//
// Notes:

// AS: Added 2/1/2016
//     Added new outputs for txdly and wrdly control
//     Added pause signal
// *********************************************************************/ 

module trn_dqsw (
  input                     sclk,
  input                     reset_b,
  input                     train,
  output reg               done,
  output reg         dqsw_loadphs_b,
  output reg             dqsw_eye_monitor_clr_flags,
  input              dqsw_eye_monitor_early,
  input              dqsw_eye_monitor_late,
  output reg             dqsw270_eye_monitor_clr_flags,
  input                 dqsw270_eye_monitor_early,
  input                 dqsw270_eye_monitor_late,
  output reg [2:0]        vco_phsinit_bclk,
  output reg [2:0]        vco_phsinit_bclk90,
  output reg             dqsw_delay_line_load,
  output reg             dqsw_delay_line_move,
  output reg             dqsw_delay_line_direction,
  output reg             dqsw270_delay_line_load,
  output reg             dqsw270_delay_line_move,
  output reg             dqsw270_delay_line_direction,
  output reg             wrdly_delay_line_load,
  output reg             wrdly_delay_line_move,
  output reg             wrdly_delay_line_direction,
  output reg             txdly_delay_line_load,
  output reg             txdly_delay_line_move,
  output reg             txdly_delay_line_direction,
  output reg             pause,
  output reg             vcophsel_rotate,
  input                  dqsw270_igear_rx8,
  // AS: added skip input
  input                  skip
  
);

// parameters
parameter [3:0] WAIT_COUNT = 4'h8;    // wait count for

// states
parameter SM_IDLE                       = 0;
parameter SM_LOAD                       = 1;
parameter SM_SWEEP_DQSW_START           = 2;
parameter SM_SWEEP_DQSW_MOVE            = 3;
parameter SM_SWEEP_DQSW_STORE           = 4;
parameter SM_SWEEP_DQSW_CLR_FLAGS       = 5;
parameter SM_SWEEP_DQSW_WAIT            = 7;
parameter SM_SWEEP_DQSW270_START        = 8;
parameter SM_SWEEP_DQSW270_MOVE         = 9;
parameter SM_SWEEP_DQSW270_STORE        = 10;
parameter SM_SWEEP_DQSW270_CLR_FLAGS    = 11;
parameter SM_SWEEP_DQSW270_WAIT         = 12;
parameter SM_CALCULATE_OFFSET           = 13;
parameter SM_CALCULATE_OFFSET_2         = 14;
parameter SM_RELOAD                     = 15;
parameter SM_DONE                       = 16;
parameter SM_SET_DELAY_MOVE             = 17;
parameter SM_SET_DELAY_WAIT             = 18;
parameter SM_PAUSE                      = 19;

// SAR 82438: added states for rotating twice instead
// of using vco_phsinit* signals
parameter SM_SET_PHS                    = 20;
parameter SM_SET_PHS_2                  = 21;
parameter SM_SET_PHS_3                  = 22;
parameter SM_WAIT_LOAD                  = 23;

// -------------------------------------------
// WIRES AND REGISTERS
// -------------------------------------------

reg [8:0] current_state;
reg [8:0] next_state;

// register for storing flag values
reg [7:0] tap_count_first, tap_count_last;
reg [7:0] tap_count_dqsw, tap_count_dqsw270;
reg [7:0] tap_offset, tap_offset_move_count;
reg dqsw_select;

wire dqsw_flag, dqsw270_flag;
reg dqsw_flag_reg, dqsw270_flag_reg;

reg noise_start;

// wait state counters for SM
reg [3:0] dly_cnt;
reg load_dly_cnt;

// -------------------------------------------
// INTERNAL SIGNAL ASSIGNMENTS
// -------------------------------------------

assign dqsw_flag = dqsw_eye_monitor_early | dqsw_eye_monitor_late;
assign dqsw270_flag = dqsw270_eye_monitor_early | dqsw270_eye_monitor_late;
// -------------------------------------------
// OUTPUT ASSIGNMENTS
// -------------------------------------------

always@(*)
begin : MOORE
  // output
  done = 1'b0;
  dqsw_loadphs_b = 1'b1;
  dqsw_eye_monitor_clr_flags = 1'b0;
  dqsw270_eye_monitor_clr_flags = 1'b0;
  vco_phsinit_bclk[2:0] = 3'b000;
  vco_phsinit_bclk90[2:0] = 3'b000;
  dqsw_delay_line_load = 1'b0;
  dqsw_delay_line_direction = 1'b1;
  dqsw270_delay_line_load = 1'b0;
  dqsw270_delay_line_direction = 1'b1;
  dqsw_delay_line_move = 1'b0;  
  dqsw270_delay_line_move = 1'b0;
  load_dly_cnt = 1'b0;
  wrdly_delay_line_load = 1'b0;
  wrdly_delay_line_move = 1'b0;
  wrdly_delay_line_direction = 1'b1;
  txdly_delay_line_load = 1'b0;
  txdly_delay_line_move = 1'b0;
  txdly_delay_line_direction = 1'b1;
  pause = 1'b0;
  vcophsel_rotate = 1'b0;
  
  case (current_state)
    SM_DONE:
      begin
        done = 1'b1;
        vco_phsinit_bclk90 = 3'b010; // 90 degree offset when done
      end
      
    SM_LOAD:
      begin
        dqsw_delay_line_load = 1'b1;
        dqsw270_delay_line_load = 1'b1;
        dqsw_loadphs_b = 1'b0;
        dqsw_eye_monitor_clr_flags = 1'b1;
        dqsw270_eye_monitor_clr_flags = 1'b1;
        wrdly_delay_line_load = 1'b1;
        txdly_delay_line_load = 1'b1;
        pause = 1'b1;
      end 
      
    SM_SWEEP_DQSW_MOVE:
      dqsw_delay_line_move = 1'b1;
    
    //SM_SWEEP_DQSW_STORE:
    //  tap_count_middle = (tap_count_first + tap_count_last) / 2;
      
    SM_SWEEP_DQSW_CLR_FLAGS:
    begin
      dqsw_eye_monitor_clr_flags = 1'b1;
      load_dly_cnt = 1'b1;
    end 
    
    
    SM_SWEEP_DQSW270_MOVE:
      dqsw270_delay_line_move = 1'b1;
    
    //SM_SWEEP_DQSW270_STORE:
    //  tap_count_middle = (tap_count_first + tap_count_last) / 2;
      
    SM_SWEEP_DQSW270_CLR_FLAGS:
    begin
      dqsw270_eye_monitor_clr_flags = 1'b1;
      load_dly_cnt = 1'b1;
    end 
    
    SM_SET_DELAY_MOVE:
    begin
      // select between wrdly (DQSW delay) and tsdly (DQSW270 delay)
      if (dqsw_select)
        wrdly_delay_line_move = 1'b1;
      else  
        txdly_delay_line_move = 1'b1;
    end
    
    SM_CALCULATE_OFFSET:
    begin
      wrdly_delay_line_load = 1'b1;
      txdly_delay_line_load = 1'b1;
      pause = 1'b1;
    end
    
    SM_PAUSE:
      pause = 1'b1;
    
    // SAR 82438: added states for rotating twice instead
    // of using vco_phsinit* signals
    SM_SET_PHS:
      vcophsel_rotate = 1'b1;
      
    SM_SET_PHS_3:
      vcophsel_rotate = 1'b1;
      
    SM_RELOAD:
    begin 
      vco_phsinit_bclk90 = 3'b010;
      dqsw_loadphs_b = 1'b0;
    end 
      
    
    // default:
    
  endcase
end


// -------------------------------------------
// STATE MACHINE COMBINATORIAL LOGIC
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
    // AS: added skip option, goes right to LOAD + PHS adjust
    SM_IDLE:
      if (train==1'b1)
          next_state = SM_LOAD;
      else
          next_state = SM_IDLE;
    
    SM_LOAD:
        if (skip==1'b1)
            next_state = SM_RELOAD;
        else
            next_state = SM_SWEEP_DQSW_START;
    
    SM_SWEEP_DQSW_START: 
      if (dqsw_flag_reg && !dqsw_flag && noise_start)
        next_state = SM_SWEEP_DQSW_STORE;
      else 
        next_state = SM_SWEEP_DQSW_MOVE;
    
    SM_SWEEP_DQSW_MOVE:
      next_state = SM_SWEEP_DQSW_CLR_FLAGS;
    
    SM_SWEEP_DQSW_CLR_FLAGS:
       next_state = SM_SWEEP_DQSW_WAIT;
    
    SM_SWEEP_DQSW_WAIT:
      if (dly_cnt == 4'b000)
        next_state = SM_SWEEP_DQSW_START;
      else
        next_state = SM_SWEEP_DQSW_WAIT;

    SM_SWEEP_DQSW_STORE:
      next_state = SM_SWEEP_DQSW270_START;
    
    // AS: added dqsw270_igear_rx8 (RX data) to check for negedge/[posedge]
    SM_SWEEP_DQSW270_START: 
      if (dqsw270_flag_reg && !dqsw270_flag && noise_start && !dqsw270_igear_rx8)
        next_state = SM_SWEEP_DQSW270_STORE;
      else 
        next_state = SM_SWEEP_DQSW270_MOVE;
    
    SM_SWEEP_DQSW270_MOVE:
      next_state = SM_SWEEP_DQSW270_CLR_FLAGS;
    
    SM_SWEEP_DQSW270_CLR_FLAGS:
       next_state = SM_SWEEP_DQSW270_WAIT;
    
    SM_SWEEP_DQSW270_WAIT:
      if (dly_cnt == 4'b000)
        next_state = SM_SWEEP_DQSW270_START;
      else
        next_state = SM_SWEEP_DQSW270_WAIT;

    SM_SWEEP_DQSW270_STORE:
      next_state = SM_CALCULATE_OFFSET;
    
    SM_CALCULATE_OFFSET:
      next_state = SM_CALCULATE_OFFSET_2;
    
    SM_CALCULATE_OFFSET_2:
      if (tap_offset == 8'h00)
        next_state = SM_RELOAD;
      else
        next_state = SM_SET_DELAY_MOVE;

    
    SM_SET_DELAY_MOVE:
      next_state = SM_SET_DELAY_WAIT;
    
    SM_SET_DELAY_WAIT:
      if (tap_offset == tap_offset_move_count)
        next_state = SM_RELOAD;
      else
        next_state = SM_SET_DELAY_MOVE;
    
    SM_RELOAD:
      next_state = SM_WAIT_LOAD;
    
    SM_WAIT_LOAD:
      next_state = SM_SET_PHS;
    
    
    //  SAR 82438: additional states to put bclk90 90 degrees out of phase
    SM_PAUSE:
      next_state = SM_DONE;
      
    SM_SET_PHS:
      next_state = SM_SET_PHS_2;
      
    SM_SET_PHS_2:
      next_state = SM_SET_PHS_3;
      
    SM_SET_PHS_3:
      next_state = SM_PAUSE;
    
    SM_DONE:
      next_state = SM_DONE;

        
    default: next_state = SM_IDLE;
  endcase
end

// -------------------------------------------
// SYNCHRONOUS LOGIC
// -------------------------------------------

// various registers

// delay counter
always @ (posedge sclk or negedge reset_b)
begin: dly
  if (!reset_b)
    dly_cnt <= 4'h0;
  else
  begin
    if (load_dly_cnt)
      dly_cnt <= WAIT_COUNT;
    else if (dly_cnt == 4'h0)
      dly_cnt <= dly_cnt;
    else
      dly_cnt <= dly_cnt - 4'h1;
  end
end

// tap tracking for DQSW and DQSW270
// flag storage
// offset calculation
always @ (posedge sclk or negedge reset_b)
begin: move
  if (!reset_b)
  begin
    noise_start <= 1'b0;
    tap_count_dqsw <= 8'h00;
    tap_count_dqsw270 <= 8'h00;
    dqsw_flag_reg <= 1'b1;
    dqsw270_flag_reg <= 1'b1;
    tap_count_first <= 8'h00;
    tap_count_last <= 8'h00;
    dqsw_select <= 1'b0;
    tap_offset <= 8'h00;
    tap_offset_move_count <= 8'h00;
  end
  else
  begin
  
    // only store when flags are valid (DQSW_
    if (current_state == SM_SWEEP_DQSW_START)
    begin
      dqsw_flag_reg <= dqsw_flag;
      if (!dqsw_flag_reg && dqsw_flag) // 0 --> 1, start of noisy area
      begin
        tap_count_first <= tap_count_dqsw;
        noise_start <= 1'b1;
      end
      else if (dqsw_flag_reg && !dqsw_flag) // 1 --> 0, end of noisy area
        tap_count_last <= tap_count_dqsw;
    end
    else if (current_state == SM_SWEEP_DQSW_STORE)
    begin
      // tap_count_dqsw <= tap_count_middle;
      tap_count_dqsw <= (tap_count_first + tap_count_last) / 2;
      noise_start <= 1'b0;
    end
    else if (current_state == SM_SWEEP_DQSW270_START)
    begin
      dqsw270_flag_reg <= dqsw270_flag;
      if (!dqsw270_flag_reg && dqsw270_flag) // 0 --> 1, start of noisy area
      begin
        tap_count_first <= tap_count_dqsw270;
        noise_start <= 1'b1;
      end
      else if (dqsw270_flag_reg && !dqsw270_flag) // 1 --> 0, end of noisy area
        tap_count_last <= tap_count_dqsw270;
    end
    else if (current_state == SM_SWEEP_DQSW270_STORE)
    begin
      //tap_count_dqsw270 <= tap_count_middle;
      tap_count_dqsw270 <= (tap_count_first + tap_count_last) / 2;
      noise_start <= 1'b0;
    end
    else
    begin
      // AS: added this else block to prevent
      //     race condition on tap_count_dqsw* signals
      
      // tap counts for DQSW
      if (dqsw_delay_line_load == 1'b1)
        tap_count_dqsw <= 8'h00;
      else if (dqsw_delay_line_move == 1'b1)
        tap_count_dqsw <= tap_count_dqsw + 1;
      else 
        tap_count_dqsw <= tap_count_dqsw;
        
      // tap counts for DQSW270
      if (dqsw270_delay_line_load == 1'b1)
        tap_count_dqsw270 <= 8'h00;  
      else if (dqsw270_delay_line_move == 1'b1)
        tap_count_dqsw270 <= tap_count_dqsw270 + 1;
      else
        tap_count_dqsw270 <= tap_count_dqsw270;
        
    end
    
    // calculate offset when we're done, set appropriate flag values
    if (current_state == SM_CALCULATE_OFFSET)
    begin
      if (tap_count_dqsw270 < tap_count_dqsw)
      begin
        dqsw_select <= 1'b1;
        tap_offset <= tap_count_dqsw - tap_count_dqsw270;
      end
      else if (tap_count_dqsw270 > tap_count_dqsw)
      begin
        dqsw_select <= 1'b0;
        tap_offset <= tap_count_dqsw270 - tap_count_dqsw;
      end
      else
      begin
        dqsw_select <= 1'b1;
        tap_offset <= 8'h00;
      end 
    end
  
    if (current_state == SM_SET_DELAY_MOVE)
      tap_offset_move_count <= tap_offset_move_count + 1;
      
   
  end
end


endmodule