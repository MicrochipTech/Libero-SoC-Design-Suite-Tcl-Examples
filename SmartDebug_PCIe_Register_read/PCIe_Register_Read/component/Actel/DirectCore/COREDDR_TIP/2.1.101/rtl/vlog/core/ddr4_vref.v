// *********************************************************************/ 
// Copyright (c) 2017 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: ddr4_vref.v
//     
// Description: sets the VREFDQ value of MR6 after all other training has been completed
//
// Notes:
// 1/4/18: AS, added output registers to cal_init_mr_w_req, cal_init_mr_addr, cal_init_mr_wr_data, cal_init_mr_wr_mask,

// 
// *********************************************************************/ 

module ddr4_vref (

input                                     SCLK,
input                                     reset_n,
input                                     training_complete,
output reg                                ddr4_vref_complete,
output reg                                cal_init_mr_w_req,
output reg [ 7:0]                         cal_init_mr_addr,
output reg [17:0]                         cal_init_mr_wr_data,
output reg [17:0]                         cal_init_mr_wr_mask,
input                                     cal_init_ack,
input                                     skip_vref_training,
input      [6:0]                          VREF_MR6_VALUE,
output reg [1:0]                          cal_init_cs,
output reg                                select

);


// AS: modified to use a port instead of parameter
// parameter [6:0] VREF_MR6_VALUE  = 0;

reg [3:0] current_state;
reg [3:0] next_state;

localparam SM_IDLE                        = 0;
localparam SM_ENTER_VREF_MODE             = 1;
localparam SM_ENTER_VREF_MODE_WAIT        = 2;
localparam SM_WRITE_VREF_VALUE            = 3;
localparam SM_WRITE_VREF_VALUE_WAIT       = 4;
localparam SM_EXIT_VREF_MODE              = 5;
localparam SM_DONE                        = 6;

// AS: added internal registers for outputs registers
//     for pipeline purposes (1/4/18)
reg                                cal_init_mr_w_req_int;
reg [ 7:0]                         cal_init_mr_addr_int;
reg [17:0]                         cal_init_mr_wr_data_int;
reg [17:0]                         cal_init_mr_wr_mask_int;

// AS: added pipeline output stage
always @ (posedge SCLK or negedge reset_n)
begin : output_reg_process
  if (!reset_n)
  begin
    cal_init_mr_w_req          <= 1'b0;
    cal_init_mr_addr           <= 8'h00;
    cal_init_mr_wr_data        <= 18'h000;
    cal_init_mr_wr_mask        <= 18'h000;
  end
  else
  begin
    cal_init_mr_w_req          <= cal_init_mr_w_req_int;
    cal_init_mr_addr           <= cal_init_mr_addr_int;
    cal_init_mr_wr_data        <= cal_init_mr_wr_data_int;
    cal_init_mr_wr_mask        <= cal_init_mr_wr_mask_int;
  end
end

always @ (*)
begin : output_assignments

  cal_init_mr_w_req_int = 1'b0;
  cal_init_mr_addr_int = 7'b0000000;
  cal_init_mr_wr_mask_int = 18'b000000000000000000;
  cal_init_mr_wr_data_int = 18'b000000000000000000;
  ddr4_vref_complete = 1'b0;
  cal_init_cs = 2'b01;  // only 1 rank for now
                        // TO DO: add multi-rank support
                        
  select <= 1'b0;

  case (current_state)
  
    SM_IDLE:
      begin
        select <= 1'b0;
      end
  
    SM_ENTER_VREF_MODE:
      begin
        cal_init_mr_w_req_int = 1'b1;
        cal_init_mr_addr_int = 7'b0000110;                // MR6
        cal_init_mr_wr_data_int = 18'b000000000010000000; // write a one
        cal_init_mr_wr_mask_int = 18'b111111111100000000; // to bit [7]
      end
    
    SM_WRITE_VREF_VALUE:
      begin
        cal_init_mr_w_req_int = 1'b1;
        cal_init_mr_addr_int = 7'b0000110;                // MR6
        cal_init_mr_wr_data_int = {11'b00000000001,VREF_MR6_VALUE[6:0]}; // write parameter
        cal_init_mr_wr_mask_int = 18'b111111111100000000; // to bits [6:0]
      end

    SM_EXIT_VREF_MODE:
      begin
        cal_init_mr_w_req_int = 1'b1;
        cal_init_mr_addr_int = 7'b0000110;                // MR6
        cal_init_mr_wr_data_int = {11'b00000000000,VREF_MR6_VALUE[6:0]}; // write a zero
        cal_init_mr_wr_mask_int = 18'b111111111100000000; // to bit [7]
      end
    
    SM_DONE:
      begin
        ddr4_vref_complete = 1'b1;
        select <= 1'b0;
      end
  
  endcase 

end

always @ (*)
begin : next_state_comb
  case (current_state)
  
    SM_IDLE:
      if (training_complete)
        if (skip_vref_training)
          next_state = SM_DONE;
        else
          next_state = SM_ENTER_VREF_MODE;
      else
        next_state = SM_IDLE;
    
    SM_ENTER_VREF_MODE:
      if (cal_init_ack)
        next_state = SM_ENTER_VREF_MODE_WAIT;
      else
        next_state = SM_ENTER_VREF_MODE;
    
    SM_ENTER_VREF_MODE_WAIT:
      next_state = SM_WRITE_VREF_VALUE;
    
    SM_WRITE_VREF_VALUE:
      if (cal_init_ack)
        next_state = SM_WRITE_VREF_VALUE_WAIT;
      else
        next_state = SM_WRITE_VREF_VALUE;
    
    SM_WRITE_VREF_VALUE_WAIT:
      next_state = SM_EXIT_VREF_MODE;
    
    SM_EXIT_VREF_MODE:
      if (cal_init_ack)
        next_state = SM_DONE;
      else
        next_state = SM_EXIT_VREF_MODE;

    // sticky state
    SM_DONE:
      next_state = SM_DONE;
    
    default:
      next_state = SM_IDLE;
  
  endcase
end

// state register
always @ (posedge SCLK or negedge reset_n)
begin : current_state_reg
  if (!reset_n)
    current_state <= SM_IDLE;
  else
    current_state <= next_state;
end

endmodule