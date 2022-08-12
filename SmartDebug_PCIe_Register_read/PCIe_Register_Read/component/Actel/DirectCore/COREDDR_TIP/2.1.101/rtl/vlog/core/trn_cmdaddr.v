// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: trn_cmdaddr.v
//     
// Description: training block for command/address versus refclk traning
// basically, this matches REFCLK to 90 degrees away from the CMD/ADDR at the pad,
// maximizing margins
//
// Notes:

// AS: adding cmd_delay_line_move_trn to separate out the training
//     IOG from the whole CMD bus (so we don't need to move the whole
//     CMD/ADDR bus during OUTDLY and INDLY training steps.

// 3/30/17: made VCOPHS_OFFSET a 3-bit input port

// *********************************************************************/ 

module trn_cmd_addr (
  input                     sclk,
  input                     reset_b,
  input                     train,
  output reg                done,
  output reg                vcophsel_rotate,
  output reg                loadphs_b,
  output reg [2:0]          vco_phsinit,
  output reg                refclk_eye_monitor_clr_flags,
  input                     refclk_eye_monitor_early,
  input                     refclk_eye_monitor_late,
  output reg                refclk_delay_line_load,
  output reg                refclk_delay_line_move,
  output reg                refclk_delay_line_direction,
  input                     cmd_eye_monitor_early,
  input                     cmd_eye_monitor_late,
  output reg                cmd_eye_monitor_clr_flags,
  output reg                cmd_delay_line_load,
  output reg                cmd_delay_line_move,
  output reg                cmd_delay_line_direction,
  output reg                cmd_oe,
  output reg                pause,
  output reg                cmd_delay_line_move_trn,
  input                     refclk_igear_rx8,
  input  [2:0]              VCOPHS_OFFSET,
  input [15:0]              apb_addr,
  output reg [7:0]          addcmd_rddata,
  input [9:0]               WAIT_COUNT
);

// parameters
// AS: made this a port
// parameter WAIT_COUNT = 10'h3ff;
// parameter [2:0] VCOPHS_OFFSET = 4;

// states
// parameter SM_IDLE                     = 0;
// parameter SM_LOAD                     = 1;
// parameter SM_SWEEP_INDLY_CHECK        = 2;
// parameter SM_SWEEP_INDLY_STORE        = 3;
// parameter SM_SWEEP_INDLY_MOVE         = 4;
// parameter SM_SWEEP_INDLY_WAIT         = 5;
// parameter SM_SWEEP_INDLY_CLR_FLAGS    = 6;
// parameter SM_SWEEP_INDLY_ROTATE       = 7;
// parameter SM_RELOAD                   = 8;
// parameter SM_SWEEP_OUTDLY_STORE       = 9;
// parameter SM_SWEEP_OUTDLY_MOVE        = 10;
// parameter SM_SWEEP_OUTDLY_WAIT        = 11;
// parameter SM_SWEEP_OUTDLY_CLR_FLAGS   = 12;
// parameter SM_SWEEP_OUTDLY_ROTATE      = 13;
// parameter SM_SET_CMD_INDLY_MOVE       = 14;
// parameter SM_SET_CMD_INDLY_MOVE_2     = 15;
// parameter SM_SET_CMD_INDLY_LOAD       = 16;
// parameter SM_SWEEP_OUTDLY_CHECK       = 17;
// parameter SM_SWEEP_OUTDLY_LOAD        = 18;
// parameter SM_SWITCH_OE_OUT            = 19;
// parameter SM_FIND_MIN_OUTDLY          = 20;
// parameter SM_SWITCH_OE_IN             = 21;
// parameter SM_SET_OUTDLY_LOAD          = 22;
// parameter SM_SET_OUTDLY_MOVE          = 23;
// parameter SM_SET_OUTDLY_MOVE_2        = 24;
// parameter SM_SET_VCOPHS_OUT           = 25;
// parameter SM_DONE                     = 26;
// parameter SM_SET_VCOPHS_OUT_2         = 27;
// parameter SM_SET_VCOPHS_OUT_3         = 28;

// AS: changed to one-hot
parameter SM_IDLE                     = 29'b00000000000000000000000000001; // 1
parameter SM_LOAD                     = 29'b00000000000000000000000000010; // 2
parameter SM_SWEEP_INDLY_CHECK        = 29'b00000000000000000000000000100; // 3
parameter SM_SWEEP_INDLY_STORE        = 29'b00000000000000000000000001000; // 4
parameter SM_SWEEP_INDLY_MOVE         = 29'b00000000000000000000000010000; // 5
parameter SM_SWEEP_INDLY_WAIT         = 29'b00000000000000000000000100000; // 6
parameter SM_SWEEP_INDLY_CLR_FLAGS    = 29'b00000000000000000000001000000; // 7
parameter SM_SWEEP_INDLY_ROTATE       = 29'b00000000000000000000010000000; // 8
parameter SM_RELOAD                   = 29'b00000000000000000000100000000; // 9
parameter SM_SWEEP_OUTDLY_STORE       = 29'b00000000000000000001000000000; // 10
parameter SM_SWEEP_OUTDLY_MOVE        = 29'b00000000000000000010000000000; // 11
parameter SM_SWEEP_OUTDLY_WAIT        = 29'b00000000000000000100000000000; // 12
parameter SM_SWEEP_OUTDLY_CLR_FLAGS   = 29'b00000000000000001000000000000; // 13
parameter SM_SWEEP_OUTDLY_ROTATE      = 29'b00000000000000010000000000000; // 14
parameter SM_SET_CMD_INDLY_MOVE       = 29'b00000000000000100000000000000; // 15
parameter SM_SET_CMD_INDLY_MOVE_2     = 29'b00000000000001000000000000000; // 16
parameter SM_SET_CMD_INDLY_LOAD       = 29'b00000000000010000000000000000; // 17
parameter SM_SWEEP_OUTDLY_CHECK       = 29'b00000000000100000000000000000; // 18
parameter SM_SWEEP_OUTDLY_LOAD        = 29'b00000000001000000000000000000; // 19
parameter SM_SWITCH_OE_OUT            = 29'b00000000010000000000000000000; // 20
parameter SM_FIND_MIN_OUTDLY          = 29'b00000000100000000000000000000; // 21
parameter SM_SWITCH_OE_IN             = 29'b00000001000000000000000000000; // 22
parameter SM_SET_OUTDLY_LOAD          = 29'b00000010000000000000000000000; // 23
parameter SM_SET_OUTDLY_MOVE          = 29'b00000100000000000000000000000; // 24
parameter SM_SET_OUTDLY_MOVE_2        = 29'b00001000000000000000000000000; // 25
parameter SM_SET_VCOPHS_OUT           = 29'b00010000000000000000000000000; // 26
parameter SM_DONE                     = 29'b00100000000000000000000000000; // 27
parameter SM_SET_VCOPHS_OUT_2         = 29'b01000000000000000000000000000; // 28
parameter SM_SET_VCOPHS_OUT_3         = 29'b10000000000000000000000000000; // 29

// -------------------------------------------
// WIRES AND REGISTERS
// -------------------------------------------

// reg [8:0] current_state;
// reg [8:0] next_state;

reg [28:0] current_state;
reg [28:0] next_state;

// for interating through
reg [2:0] vcophsel_index;

// wait counter for SM
reg [9:0] dly_cnt;
reg load_dly_cnt;

// wait counter for CLR, specifically
reg [1:0] clr_cnt;
reg load_clr_cnt;

// tap count trackers
reg [7:0] tap_count_first, tap_count_last, tap_count_middle, tap_count_refclk, tap_count_cmd;

// flags
wire refclk_flag, cmd_flag;
reg refclk_flag_reg, cmd_flag_reg;

reg noise_start;

// ADDED BY ALISTER 9/8/2017
reg found_zero;
reg found_one;
reg indly_found;
reg [3:0] push_counter;

// LUT
reg [7:0] indly [0:7];
reg [7:0] outdly [0:7];

// result registers
reg [2:0] min_vcophsel_index, vcophsel_calc;
reg [7:0] min_outdly_val;

// -------------------------------------------
// INTERNAL SIGNAL ASSIGNMENTS
// -------------------------------------------

assign refclk_flag = refclk_eye_monitor_early | refclk_eye_monitor_late;
assign cmd_flag = cmd_eye_monitor_early | cmd_eye_monitor_late;

// -------------------------------------------
// OUTPUT ASSIGNMENTS
// -------------------------------------------

always@(*)
begin : MOORE
  // output
  done = 1'b0;
  loadphs_b = 1'b1;
  refclk_eye_monitor_clr_flags = 1'b0;
  refclk_delay_line_load = 1'b0;
  refclk_delay_line_move = 1'b0;
  refclk_delay_line_direction = 1'b1;
  cmd_eye_monitor_clr_flags = 1'b0;
  cmd_delay_line_load = 1'b0;
  cmd_delay_line_move = 1'b0;         // (whole bus)
  cmd_delay_line_direction = 1'b1;
  pause = 1'b0;
  vcophsel_rotate = 1'b0;
  load_dly_cnt = 1'b0;
  load_clr_cnt = 1'b0;
  vco_phsinit = 3'b000;
  cmd_oe = 1'b0;
  tap_count_middle = 8'h00;
  cmd_delay_line_move_trn = 1'b0;     // (middle cmd port only - for training)
  
  case (current_state)
      
    SM_LOAD:
    begin
      // AS: SAR 82438 --> Cannot toggle LOADPHS_B, and must rely on ROTATE only
      // loadphs_b = 1'b0;
      refclk_delay_line_load = 1'b1;
      pause = 1'b1;
    end
    
    SM_SWEEP_INDLY_MOVE:
    begin
      refclk_delay_line_move = 1'b1;
      pause = 1'b1;
    end

//    SM_SWEEP_INDLY_MOVE:
//    begin
//      cmd_delay_line_move_trn = 1'b1;
//      pause = 1'b1;
//    end 
    
    SM_SWEEP_INDLY_CLR_FLAGS:
    begin
      refclk_eye_monitor_clr_flags = 1'b1;
      load_dly_cnt = 1'b1;
    end
    
    SM_SWEEP_INDLY_ROTATE:
    begin
      vcophsel_rotate = 1'b1;
      refclk_eye_monitor_clr_flags = 1'b1;
      refclk_delay_line_load = 1'b1;
      load_dly_cnt = 1'b1;
    end
    
    SM_SWEEP_INDLY_STORE:
      tap_count_middle = (tap_count_first + tap_count_last) / 2;
    
    SM_RELOAD:
    begin
      // AS: SAR 82438 --> Cannot toggle LOADPHS_B, and must rely on ROTATE only
      // loadphs_b = 1'b0;
      vcophsel_rotate = 1'b1;
    end
    
    SM_SET_CMD_INDLY_LOAD:
      cmd_delay_line_load = 1'b1;
      
    SM_SET_CMD_INDLY_MOVE:
      load_dly_cnt = 1'b1;
    
    SM_SET_CMD_INDLY_MOVE_2:
      cmd_delay_line_move_trn = 1'b1;

    SM_SWITCH_OE_OUT:
      cmd_oe = 1'b1;
      
    SM_SWEEP_OUTDLY_LOAD:
    begin
      load_dly_cnt = 1'b1;
      cmd_delay_line_load = 1'b1;
      cmd_oe = 1'b1;
    end
    
    SM_SWEEP_OUTDLY_CHECK:
      cmd_oe = 1'b1;
    
    SM_SWEEP_OUTDLY_MOVE:
    begin
      load_clr_cnt = 1'b1;
      cmd_delay_line_move_trn = 1'b1;
      cmd_oe = 1'b1;
    end
    
  
    SM_SWEEP_OUTDLY_CLR_FLAGS:
    begin
      load_dly_cnt = 1'b1;
      cmd_eye_monitor_clr_flags = 1'b1;
      cmd_oe = 1'b1;
    end
    
    SM_SWEEP_OUTDLY_WAIT:
      cmd_oe = 1'b1;
    
    SM_SWEEP_OUTDLY_STORE:
    begin
      cmd_oe = 1'b1;
      tap_count_middle = (tap_count_first + tap_count_last) / 2;
    end
    
    SM_SWEEP_OUTDLY_ROTATE:
    begin
      vcophsel_rotate = 1'b1;
      load_dly_cnt = 1'b1;
    end
    
    SM_FIND_MIN_OUTDLY:
      cmd_oe = 1'b1;
    
    SM_SET_OUTDLY_LOAD:
    begin
      cmd_oe = 1'b1;
      cmd_delay_line_load = 1'b1;
    end
    
    SM_SET_OUTDLY_MOVE:
      cmd_oe = 1'b1;
    
    SM_SET_OUTDLY_MOVE_2:
    begin
      cmd_oe = 1'b1;
      // move both the middle pin and the rest of the bus
      cmd_delay_line_move_trn = 1'b1;
      cmd_delay_line_move = 1'b1;
    end
    
    SM_SET_VCOPHS_OUT:
    begin
      // loadphs_b = 1'b0;
      // AS: SAR 82438 - no longer make use of phsinit signals; use load/rotate instead
      // vco_phsinit = min_vcophsel_index + VCOPHS_OFFSET;
      // ROTATE instead of LOADPHS_B
      vcophsel_rotate = 1'b1;
      cmd_oe = 1'b1;
    end
    
    SM_SET_VCOPHS_OUT_2:
    begin
      cmd_oe = 1'b1;
    end
    
    SM_SET_VCOPHS_OUT_3:
    begin
      cmd_oe = 1'b1;
      vcophsel_rotate = 1'b1;
    end
    
    SM_DONE:
    begin
      cmd_oe = 1'b1;
      // AS: SAR 82438 - no longer make use of phsinit signals; use load/rotate instead
      // vco_phsinit = min_vcophsel_index + VCOPHS_OFFSET;
      done = 1'b1;
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
    
    SM_IDLE:
      if (train)
        next_state = SM_LOAD;
      else
        next_state = SM_IDLE;
        
    SM_LOAD:
      next_state = SM_SWEEP_INDLY_CHECK;
    
    // AS: added refclk_igear_rx8 (RX data) to check for negedge/[posedge]
    SM_SWEEP_INDLY_CHECK:
      if (indly_found)
        next_state = SM_SWEEP_INDLY_STORE;
      else
        next_state = SM_SWEEP_INDLY_MOVE;
    
    SM_SWEEP_INDLY_STORE: 
      if (vcophsel_index != 3'b111)
        next_state = SM_SWEEP_INDLY_ROTATE;
      else
        next_state = SM_RELOAD;
    
    SM_SWEEP_INDLY_MOVE:
      next_state = SM_SWEEP_INDLY_CLR_FLAGS;
    
    SM_SWEEP_INDLY_CLR_FLAGS:
      next_state = SM_SWEEP_INDLY_WAIT;
    
    SM_SWEEP_INDLY_WAIT:
      if (dly_cnt == 0)
        next_state = SM_SWEEP_INDLY_CHECK;
      else
        next_state = SM_SWEEP_INDLY_WAIT;
    
    SM_SWEEP_INDLY_ROTATE:
      next_state = SM_SWEEP_INDLY_WAIT;
    
    SM_RELOAD:
      next_state = SM_SET_CMD_INDLY_LOAD;
    
    SM_SET_CMD_INDLY_LOAD:
      next_state = SM_SET_CMD_INDLY_MOVE;
    
    SM_SET_CMD_INDLY_MOVE:
      if (tap_count_cmd < indly[vcophsel_index])
        next_state = SM_SET_CMD_INDLY_MOVE_2;
      else
        next_state = SM_SWITCH_OE_OUT;
        
    SM_SWITCH_OE_OUT:
      if (dly_cnt == 0)
        next_state = SM_SWEEP_OUTDLY_LOAD;
      else
        next_state = SM_SWITCH_OE_OUT;
    
    SM_SET_CMD_INDLY_MOVE_2:
      next_state = SM_SET_CMD_INDLY_MOVE;
    
    // AS: added wait after LOAD
    SM_SWEEP_OUTDLY_LOAD:
      next_state = SM_SWEEP_OUTDLY_WAIT;
      
    SM_SWEEP_OUTDLY_CHECK:
      if (cmd_flag_reg && !cmd_flag && noise_start)
        next_state = SM_SWEEP_OUTDLY_STORE;
      else
        next_state = SM_SWEEP_OUTDLY_MOVE;
    
    SM_SWEEP_OUTDLY_MOVE:
      next_state = SM_SWEEP_OUTDLY_CLR_FLAGS;
    
    SM_SWEEP_OUTDLY_CLR_FLAGS:
      if (clr_cnt == 2'b00)
        next_state = SM_SWEEP_OUTDLY_WAIT;
      else
        next_state = SM_SWEEP_OUTDLY_CLR_FLAGS;
      
    SM_SWEEP_OUTDLY_WAIT:
      if (dly_cnt == 0)
        next_state = SM_SWEEP_OUTDLY_CHECK;
      else
        next_state = SM_SWEEP_OUTDLY_WAIT;
    
    SM_SWEEP_OUTDLY_STORE:
      if (vcophsel_index != 3'b111)
        next_state = SM_SWEEP_OUTDLY_ROTATE;
      else
        next_state = SM_FIND_MIN_OUTDLY;
    
    SM_SWEEP_OUTDLY_ROTATE:
        next_state = SM_SWITCH_OE_IN;
    
    SM_SWITCH_OE_IN:
      if (dly_cnt == 0)
        next_state = SM_SET_CMD_INDLY_LOAD;
      else
        next_state = SM_SWITCH_OE_IN;
    
    SM_FIND_MIN_OUTDLY:
      if (vcophsel_calc == 3'b111)
        next_state = SM_SET_OUTDLY_LOAD;
      else
        next_state = SM_FIND_MIN_OUTDLY;
    
    SM_SET_OUTDLY_LOAD:
      next_state = SM_SET_OUTDLY_MOVE;
    
    SM_SET_OUTDLY_MOVE:
      if (tap_count_cmd < min_outdly_val)
        next_state = SM_SET_OUTDLY_MOVE_2;
      else
        next_state = SM_SET_VCOPHS_OUT;
    
    SM_SET_OUTDLY_MOVE_2:
      next_state = SM_SET_OUTDLY_MOVE;
    
    // SAR 82438
    SM_SET_VCOPHS_OUT:
      next_state = SM_SET_VCOPHS_OUT_2;
    
    SM_SET_VCOPHS_OUT_2:
      if (vcophsel_index[2:0] == min_vcophsel_index[2:0] + VCOPHS_OFFSET[2:0])
        next_state = SM_DONE;
      else
        next_state = SM_SET_VCOPHS_OUT_3;
    
    // SAR 82438
    SM_SET_VCOPHS_OUT_3:
      next_state = SM_SET_VCOPHS_OUT_2;
    
    SM_DONE:
      next_state = SM_DONE;
    
    default: 
      next_state = SM_IDLE;
  endcase
end

// -------------------------------------------
// SEQUENTIAL LOGIC
// -------------------------------------------

// delay counter
always @ (posedge sclk or negedge reset_b)
begin: dly
  if (!reset_b)
    dly_cnt <= 0;
  else
  begin
    if (load_dly_cnt)
      dly_cnt <= WAIT_COUNT;
    else if (dly_cnt == 0)
      dly_cnt <= dly_cnt;
    else
      dly_cnt <= dly_cnt - 4'h1;
  end
end

// clear counter
always @ (posedge sclk or negedge reset_b)
begin: clr_dly
  if (!reset_b)
    clr_cnt <= 2'b00;
  else
  begin
    if (load_clr_cnt)
      clr_cnt <= 2'b11;
    else if (clr_cnt == 2'b00)
      clr_cnt <= clr_cnt;
    else
      clr_cnt <= clr_cnt - 2'b01;
  end
end

// indices n flags n stuff
always @ (posedge sclk or negedge reset_b)
begin: seq
  if (!reset_b)
  begin
    vcophsel_index <= 3'b000;
    tap_count_refclk <= 8'h00;
    tap_count_cmd <= 8'h00;
    tap_count_first <= 8'h00;
    tap_count_last <= 8'h00;
    refclk_flag_reg <= 1'b1;
    cmd_flag_reg <= 1'b1;
    noise_start <= 1'b0;
    vcophsel_calc <= 3'b000;
    min_vcophsel_index <= 3'b000;
    min_outdly_val <= 8'hFF;
	
    //edited by alister 9/8/2017
    found_zero<=1'b0;
    found_one<=1'b0;
    indly_found<=1'b0;
    push_counter<=4'b0000;
	
  end
  else
  begin
    
    // ---------------------
    // CHECK & STORE
    // ---------------------
    
    // check values for refclk sweep
    if (current_state == SM_SWEEP_INDLY_CHECK)
    begin
	
	  //goes to 1 and sticks at 1 if 0 detected on rx8
      found_zero<= refclk_igear_rx8?found_zero:1'b1;

      //if still looking for transition
      if (!indly_found) begin
        //set found_one if we read a 1 after a 0 is found, 0-1 transition
        if (found_zero & refclk_igear_rx8==1'b1 & !found_one) begin
          found_one <= 1'b1;
          //store tap count
          tap_count_first <= tap_count_refclk;
        end
        //after pushing 10 more times, check refclk, if 1, store copy tap_count_first to tap_count_last and set indly_found flag (true transition found, end sweep)
        else if (found_one & push_counter == 10 & refclk_igear_rx8==1'b1) begin
          tap_count_last <= tap_count_first;
          indly_found <= 1'b1;
        end
        //after pushing 10 more times, check refclk, if 0, reset push counter and set found_one back to 0 (false edge, continue looking)
        else if (found_one & push_counter == 10 & refclk_igear_rx8==1'b0) begin
          found_one <= 1'b0;
          push_counter <= 4'b0000;         
        end 
        //increment push counter if we detected a suspected 0-1 transition
        else if (found_one) push_counter <= push_counter+1;
      end
	//ALISTER: REPLACED INDLY CHECK
/*       refclk_flag_reg <= refclk_flag;
      if (!refclk_flag_reg && refclk_flag) // 0--> 1, beginning of noisy area
      begin
        noise_start <= 1'b1;
        tap_count_first <= tap_count_refclk;
      end
      else if (noise_start && refclk_flag_reg && !refclk_flag) // 1 --> 0, end of noisy area
      begin
        tap_count_last <= tap_count_refclk;
      end */
    end
    else if (current_state == SM_SWEEP_INDLY_STORE)
    begin
	
	  //ALISTER: SET INDLY COUNTER/FLAGS BACK TO 0
	  found_zero<=1'b0;
      found_one<=1'b0;
      indly_found<=1'b0;
      push_counter<=4'b0000;
	  
      // reset noise & other flags, store indly value for this VCO phase
      // (reset it to 1 because we need to see a 0 first)
      noise_start <= 1'b0;
      // AS: put this in separate process (below)
      //indly[vcophsel_index] <= tap_count_middle;
      refclk_flag_reg <= 1'b1;
    end
    else if (current_state == SM_SWEEP_OUTDLY_CHECK)
    begin
      cmd_flag_reg <= cmd_flag;
      if (!cmd_flag_reg && cmd_flag) // 0--> 1, beginning of noisy area
      begin
        noise_start <= 1'b1;
        tap_count_first <= tap_count_cmd;
      end
      else if (noise_start && cmd_flag_reg && !cmd_flag) // 1 --> 0, end of noisy area
      begin
        tap_count_last <= tap_count_cmd;
      end
    end
    else if (current_state == SM_SWEEP_OUTDLY_STORE)
    begin
      // reset noise & other flags, store indly value for this VCO phase
      // (reset it to 1 because we need to see a 0 first)
      noise_start <= 1'b0;
      // AS: put this in separate process (below)
      //outdly[vcophsel_index] <= tap_count_middle;
      cmd_flag_reg <= 1'b1;
    end
  
    // ----------------------
    // MIN OUTDLY CALCULATION
    // ----------------------
    if (current_state == SM_FIND_MIN_OUTDLY)
    begin
      vcophsel_calc <= vcophsel_calc + 1;
      
      if (outdly[vcophsel_calc] < min_outdly_val)
      begin
        min_outdly_val <= outdly[vcophsel_calc];
        min_vcophsel_index <= vcophsel_calc;
      end
    end
    
  
    // ---------------------
    // TAP/VCOPHSEL TRACKING
    // ---------------------
    
    // vcoph_sel phase index tracking
    if (!loadphs_b)
      vcophsel_index <= 3'b000;
    else if (vcophsel_rotate)
      vcophsel_index <= vcophsel_index + 3'b001;
    else
      vcophsel_index <= vcophsel_index;
      
    // refclk tap count tracking
    if (refclk_delay_line_load)
      tap_count_refclk <= 8'h00;
    else if (refclk_delay_line_move)
      tap_count_refclk <= tap_count_refclk + 1;
    else
      tap_count_refclk <= tap_count_refclk;
      
    // cmd tap count tracking
    if (cmd_delay_line_load)
      tap_count_cmd <= 8'h00;
    else if (cmd_delay_line_move_trn)
      tap_count_cmd <= tap_count_cmd + 1;
    else
      tap_count_cmd <= tap_count_cmd;
  end
end

// AS: added 1/4/18
always @ (posedge sclk)
begin: dly_seq_process
  if (current_state == SM_SWEEP_INDLY_STORE)
      indly[vcophsel_index] <= tap_count_middle;

  if (current_state == SM_SWEEP_OUTDLY_STORE)
    outdly[vcophsel_index] <= tap_count_middle;
end


// AS: APB readback (8/4/17)
always @ (*)
begin : addcmd_rddata_output

  case (apb_addr[3:0])
    4'h0:
      addcmd_rddata[7:0] = outdly[0];
    4'h1:
      addcmd_rddata[7:0] = outdly[1];
    4'h2:
      addcmd_rddata[7:0] = outdly[2];
    4'h3:
      addcmd_rddata[7:0] = outdly[3];
    4'h4:
      addcmd_rddata[7:0] = outdly[4];
    4'h5:
      addcmd_rddata[7:0] = outdly[5];
    4'h6:
      addcmd_rddata[7:0] = outdly[6];
    4'h7:
      addcmd_rddata[7:0] = outdly[7];
    4'h8:
      addcmd_rddata[7:0] = {5'b00000,vcophsel_index[2:0]};
    default:
      addcmd_rddata[7:0] = 8'h00;
  
  endcase

end




endmodule
