// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: wrlvl.v
//     
// Description: single DQS group write leveling alignment
//              DFI interface
//              Lane Controller interface
//              IOG RX[7:0] bus (for monitoring DQ)
//              
//
// Notes:

// AS: 9/16:        removed delay line load state
// AS: 4/17:        added check for 1->0 glitches when detecting 0->1
//                  (modified SM)

// *********************************************************************/ 


module WRLVL_BOT
(
  input             sclk,
  input             reset_b,
  // DFI
  input             dfi_wrlvl_en,
  input             dfi_wrlvl_strobe,
  input             dfi_wrlvl_cs_n,
  output reg        dfi_wrlvl_resp,
  // Lane Controller
  input             delay_line_oor,
  output reg        delay_line_load,
  output reg        delay_line_direction,
  output reg        delay_line_move,
  // DQS output enable
  output reg        pause,
  // DQ slice, for monitoring
  input [7:0]       dq_in,
  // delay value
  // for debug interface
  // -> one for each rank
  output reg [6:0]  delay_val0,
  output reg [6:0]  delay_val1,
  output reg        error, // for debug purposes
  input  [6:0]      TAP_OFFSET
);

parameter WAIT_CNT_VAL = 10;

// -------------------------------------------
// STATES
// -------------------------------------------

// AS: 11/14 --> changed to one-hot encoding
// localparam SM_IDLE = 5'd0;
// localparam SM_LOAD = 5'd1;
// localparam SM_STRB = 5'd2;
// localparam SM_DQSO = 5'd3;
// localparam SM_INCR = 5'd4;
// localparam SM_WAI1 = 5'd5;
// localparam SM_WAI2 = 5'd6;
// localparam SM_DERR = 5'd7;
// localparam SM_DONE = 5'd8;
// localparam SM_WAI3 = 5'd9;
// localparam SM_WAI4 = 5'd10;
// localparam SM_PAUS = 5'd11;

localparam SM_IDLE = 19'd0;
localparam SM_LOAD = 19'd1;
localparam SM_STRB = 19'd2;
localparam SM_DQSO = 19'd4;
localparam SM_INCR = 19'd8;
localparam SM_WAI1 = 19'd16;
localparam SM_WAI2 = 19'd32;
localparam SM_DERR = 19'd64;
localparam SM_DONE = 19'd128;
localparam SM_WAI3 = 19'd256;
localparam SM_WAI4 = 19'd512;
localparam SM_PAUS = 19'd1024;
localparam SM_OFF1 = 19'd2048;
localparam SM_OFF2 = 19'd4096;
localparam SM_OFF3 = 19'd8192;
localparam SM_PUS1 = 19'd16384;
localparam SM_PUS2 = 19'd32768;
localparam SM_PUL1 = 19'd65536;
localparam SM_PUL2 = 19'd262144;
//localparam = 14'd524288;


// -------------------------------------------
// WIRES AND REGISTERS
// -------------------------------------------

reg [18:0]          current_state;
reg [18:0]          next_state;

reg [7:0]           dq_in_reg;
reg [7:0]           dq_in_reg_2;
reg [5:0]           wait_cnt;
reg                 load_wait_cnt;
reg [6:0]           tap_count;            // AS: for tracking offset
reg [6:0]           push_count;            // AS: for tracking push count
reg                 transition_found;
reg                 set_transition_found;
reg                 clear_transition_found;

// -------------------------------------------
// SYNCHRONOUS LOGIC
// -------------------------------------------
always@(posedge sclk or negedge reset_b)
begin: NEXT_STATE_REG
  if (reset_b == 1'b0)
  begin
    current_state <= SM_IDLE;
  end
  else
  begin
    current_state <= next_state;
  end
end

always@(posedge sclk or negedge reset_b)
begin: REG_RDDATA
  if (reset_b == 1'b0)
  begin
    dq_in_reg <= 8'hFF;
    dq_in_reg_2 <= 8'hFF;
  end
  else
  begin
    if (current_state == SM_INCR)
    begin
      dq_in_reg <= dq_in;
      dq_in_reg_2 <= dq_in_reg;
    end
    else
    begin
      dq_in_reg <= dq_in_reg;
      dq_in_reg_2 <= dq_in_reg_2;
    end
  end
end

always@(posedge sclk or negedge reset_b)
begin: REG_DELAY_PROC
  if (reset_b == 1'b0)
  begin
    delay_val0 <= 7'b0000000;
    delay_val1 <= 7'b0000000;
    
  end
  else
  begin
    if (current_state == SM_LOAD)
    begin
      if(dfi_wrlvl_cs_n == 1'b1)
        delay_val0 <= 7'b0000000;
      else
        delay_val1 <= 7'b0000000;
    end
    else if (current_state == SM_INCR)
      if (dfi_wrlvl_cs_n == 1'b1)
        delay_val0 <= delay_val0 + 1;
      else
        delay_val1 <= delay_val1 + 1;
    else
    begin
      delay_val0 <= delay_val0;
      delay_val1 <= delay_val1;
    end
  end
end


always@(posedge sclk or negedge reset_b)
begin : CNTR
  if (reset_b == 1'b0)
    wait_cnt <= 6'b000000;
  else
  begin
    if (load_wait_cnt == 1'b1)
      wait_cnt <= WAIT_CNT_VAL;
    else if (wait_cnt != 6'b000000)
      wait_cnt <= wait_cnt - 6'b000001;
    else
      wait_cnt <= wait_cnt;
  end
end

always@(posedge sclk or negedge reset_b)
begin : TAP_COUNTER
  if (reset_b == 1'b0)
    tap_count[6:0] <= 7'b000000;
  else
  begin
    if (delay_line_load == 1'b1)
      tap_count[6:0] <= 7'b000000;
    else if (current_state == SM_OFF2)
      tap_count[6:0] <= tap_count[6:0] + 7'h1;
    else
      tap_count[6:0] <= tap_count[6:0];
  end
end

always@(posedge sclk or negedge reset_b)
begin : PUSH_COUNT
  if (reset_b == 1'b0)
    push_count[6:0] <= 7'b000000;
  else
  begin
    if (current_state == SM_PUS2) // push out
      push_count[6:0] <= push_count[6:0] + 7'h1;
    else if (current_state == SM_PUL2) // pull back
      push_count[6:0] <= push_count[6:0] - 7'h1;
    else
      push_count[6:0] <= push_count[6:0];
  end
end

always@(posedge sclk or negedge reset_b)
begin : TRANSITION_FLAG
  if (reset_b == 1'b0)
    transition_found <= 1'b0;
  else
  begin
    if (clear_transition_found == 1'b1)
      transition_found <= 1'b0;
    else if (set_transition_found == 1'b1)
      transition_found <= 1'b1;
    else
      transition_found <= transition_found;
    
  end
end


// -------------------------------------------
// COMBINATORIAL LOGIC
// -------------------------------------------

// next states
always@(*)
begin: NEXT_STATE_ASSIGN
  case(current_state)
  
    // AS: removed LOAD state
    SM_IDLE:
      if (dfi_wrlvl_en == 1'b1)
        next_state = SM_STRB;
      else
        next_state = SM_IDLE;

    // AS: added state transition condition so that
    //     we don't retrain until WRLVL is done
    SM_DONE:
      if (dfi_wrlvl_en == 1'b0)
        next_state = SM_IDLE;
      else
        next_state = SM_DONE;
        
    SM_LOAD:
      next_state = SM_STRB;
    
    // AS: fixed this to make oe a pause signal
    SM_STRB:
      if (dfi_wrlvl_strobe == 1'b1)
        next_state = SM_WAI1;
      else
        next_state = SM_STRB;
        
/*     SM_STRB:
      if (dfi_wrlvl_strobe == 1'b1)
        next_state = SM_DQSO;
      else
        next_state = SM_STRB; */
  
    SM_WAI1:
      next_state = SM_WAI2;
    
    // AS: modified to OR entire bus
    // AS: added states to ascertain correct 0->1 transition
    SM_WAI2:
    begin
      if (delay_line_oor == 1'b1)
        next_state = SM_DERR;
      else
      begin
        if (transition_found == 1'b0)    // if we've not already detected a transition, 
        begin 
          if (!(|dq_in_reg_2[7:0]) && (|dq_in_reg[7:0])) // 0->1 transition
            next_state = SM_PUS1;          
          else
            next_state = SM_INCR;
        end
        else
        begin
          if (|dq_in[7:0])              // transition was real, pull back!
            next_state = SM_PUL1;       
          else                          // transition was a glitch, keep going
            next_state = SM_INCR;
        end
      end
    end

    
    SM_PUS1:
      if (push_count[6:0] == 7'd12)      // TO-DO: parametrize this 
        next_state = SM_PAUS;
      else
        next_state = SM_PUS2;
      
    SM_PUS2:
      next_state = SM_PUS1;

      
    SM_PUL1:
      if (push_count[6:0] == 7'd00)
        next_state = SM_OFF1;
      else
        next_state = SM_PUL2;
      
    SM_PUL2:
      next_state = SM_PUL1;
      
      
      
      
    SM_INCR:
      next_state = SM_PAUS;
      
    SM_PAUS:
      next_state = SM_WAI3;
        
    SM_WAI3:
      if (wait_cnt == 6'b000000)
        next_state = SM_WAI4;
      else 
        next_state = SM_WAI3;
        
    SM_WAI4:
      next_state = SM_STRB;

    
    // 4/3/2017 AS: added tap offset states  
    SM_OFF1:
      if (tap_count[6:0] == TAP_OFFSET)
        next_state = SM_DONE;
      else if (delay_line_oor == 1'b1)
        next_state = SM_DERR;
      else
        next_state = SM_OFF2;
      
    SM_OFF2:
      next_state = SM_OFF3;
    
    SM_OFF3:
      if (wait_cnt == 6'b000000)
        next_state = SM_OFF1;
      else
        next_state = SM_OFF3;
      
    // AS 2/17/2017, making error sticky
    SM_DERR:
      next_state = SM_DERR;
      
    default:
      next_state = SM_IDLE;
  
  endcase
end

// output assignments
always@(*)
begin
  delay_line_direction = 1'b1;
  dfi_wrlvl_resp = 1'b0;
  delay_line_load = 1'b0;
  delay_line_move = 1'b0;
  pause = 1'b0;
  error = 1'b0;
  load_wait_cnt = 1'b0;
  set_transition_found = 1'b0;
  clear_transition_found = 1'b0;
  case (current_state)
    SM_LOAD:
      delay_line_load = 1'b1;
    SM_INCR:
      delay_line_move = 1'b1;
    SM_DONE:
      dfi_wrlvl_resp = 1'b1;
    SM_DERR:
    begin
      dfi_wrlvl_resp = 1'b1;
      error = 1'b1;
    end
    SM_PAUS:
    begin
      pause = 1'b1;
      load_wait_cnt = 1'b1;
    end
    SM_OFF2:
    begin
      delay_line_move = 1'b1;
      load_wait_cnt = 1'b1;
    end
    SM_OFF3:
      pause = 1'b1;
    SM_PUS1:
      set_transition_found = 1'b1;
    SM_PUS2:
      delay_line_move = 1'b1;
    SM_PUL1:
      delay_line_direction = 1'b0;
    SM_PUL2:
    begin
      delay_line_direction = 1'b0;
      delay_line_move = 1'b1;
    end
    SM_WAI2:
      clear_transition_found = 1'b1;
  endcase
end


endmodule