// **********************out ***********************************************/ 
// Copyright (c) 2017 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: write_callibrator.v
//     
// Description: performs post-training write callibration using NWL cal_* interface
//
// Notes:
// AS: 1/4/2018 registered all cal_l_* outputs
// 
// 
// *********************************************************************/ 

module write_callibrator #(
  parameter IOG_DQS_LANES = 9,
  parameter WRITE_CALLIBRATION_PATTERN_PARAM = 64'h6644_99FF_AACC_3355
)(

input                                     sclk,
input                                     reset_n,
input                                     dfi_ctrlr_ready,            // to NWL CTRLR
output reg                                cal_l_r_req,                // to NWL CTRLR
output reg                                cal_l_w_req,                // to NWL CTRLR
output reg [IOG_DQS_LANES*64-1:0]         cal_l_datain,               // to NWL CTRLR
output reg [IOG_DQS_LANES*8-1:0]          cal_l_dm_in,                // to NWL CTRLR
input                                     cal_l_busy,                 // to NWL CTRLR
input                                     cal_l_d_req,                // to NWL CTRLR
input      [IOG_DQS_LANES*64-1:0]         cal_l_dataout,              // to NWL CTRLR
input                                     cal_l_r_valid,              // to NWL CTRLR  
output reg [IOG_DQS_LANES*3-1:0]          write_callibration_offset,  // to PHY_SIG_MOD,
output reg                                select,
output reg                                write_callibration_done,
input      [15:0]                         apb_addr,
output reg [7:0]                          wrcal_rddata,
input      [7:0]                          WRITE_COUNTER_VALUE

);

// ---------------------------------------------------------
// STATES
// ---------------------------------------------------------

localparam SM_WAIT_FOR_CTRLR_READY                = 0;
localparam SM_DO_WRITE_WAIT_FOR_BUS               = 1;
localparam SM_DO_WRITE_REQ                        = 2;
localparam SM_DO_WRITE_WAIT_FOR_D_REQ             = 3; 
localparam SM_DO_WRITE                            = 4; 
localparam SM_WAIT                                = 5;
localparam SM_DO_READ_WAIT_FOR_BUS                = 6;
localparam SM_DO_READ_REQ                         = 7;
localparam SM_WAIT_FOR_R_VALID                    = 8;
localparam SM_INCREMENT_LANE                      = 9;
localparam SM_ADD_OFSET                           = 10;
localparam SM_DO_WRITE_ZERO_WAIT_FOR_BUS          = 11;
localparam SM_DO_WRITE_ZERO_REQ                   = 12;
localparam SM_DO_WRITE_ZERO_WAIT_FOR_D_REQ        = 13;
localparam SM_DO_WRITE_ZERO                       = 14;
localparam SM_CHECK_DATA                          = 15;
localparam SM_DONE                                = 16;

localparam [3:0] WAIT_COUNTER_VALUE               = 4'b1111;

// AS: added output registers
reg                                cal_l_r_req_int; 
reg                                cal_l_w_req_int; 
reg [IOG_DQS_LANES*64-1:0]         cal_l_datain_int;
reg [IOG_DQS_LANES*8-1:0]          cal_l_dm_in_int; 


// AS: changed to input instead of constant
// localparam [7:0] WRITE_COUNTER_VALUE              = 8'hFF;
// ---------------------------------------------------------
// WIRES & REGISTERS
// ---------------------------------------------------------

reg [6:0]                                 current_state;
reg [6:0]                                 next_state;

reg [3:0]                                 current_lane;

reg                                       incr_write_callibration_offset;
reg                                       incr_lane;

reg                                       load_wait_counter;
reg [3:0]                                 wait_counter;

reg                                       load_write_counter;
reg                                       decr_write_counter;
reg [7:0]                                 write_counter;

wire [IOG_DQS_LANES*64-1:0]               lane_mapped_dataout;
reg [63:0]                                current_lane_mapped_dataout;
reg [IOG_DQS_LANES-1:0]                   data_match;
reg select_i;

wire [63:0] WRITE_CALLIBRATION_PATTERN = (WRITE_CALLIBRATION_PATTERN_PARAM << (write_counter[2:0]*8)) | (WRITE_CALLIBRATION_PATTERN_PARAM >> (64-write_counter[2:0]*8));




wire [7:0] pattern7, pattern6, pattern5, pattern4, pattern3, pattern2, pattern1, pattern0;
assign pattern7 = ( WRITE_CALLIBRATION_PATTERN & 64'hFF00_0000_0000_0000 ) >> 56;
assign pattern6 = ( WRITE_CALLIBRATION_PATTERN & 64'h00FF_0000_0000_0000 ) >> 48;
assign pattern5 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_FF00_0000_0000 ) >> 40;
assign pattern4 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_00FF_0000_0000 ) >> 32;
assign pattern3 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_FF00_0000 ) >> 24;
assign pattern2 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_00FF_0000 ) >> 16;
assign pattern1 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_0000_FF00 ) >> 08;
assign pattern0 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_0000_00FF )      ;


// ---------------------------------------------------------
// OUTPUT ASSIGNMENTS
// ---------------------------------------------------------

// AS: 1/4/18, added output registers for performance/ pipelining
always @ (posedge sclk or negedge reset_n)
begin : output_register_process
  if (!reset_n)
  begin
    cal_l_r_req   <= 1'b0;
    cal_l_w_req   <= 1'b0;
    cal_l_datain  <= {(IOG_DQS_LANES*64){1'b0}};
    cal_l_dm_in   <= {(IOG_DQS_LANES*8){1'b0}};
  end
  else
  begin
    cal_l_r_req   <= cal_l_r_req_int; 
    cal_l_w_req   <= cal_l_w_req_int; 
    cal_l_datain  <= cal_l_datain_int;
    cal_l_dm_in   <= cal_l_dm_in_int; 
  end
end

always @ (*)
begin: output_assignments
  cal_l_r_req_int <= 1'b0;
  cal_l_w_req_int <= 1'b0;
  cal_l_datain_int <= {{(IOG_DQS_LANES){pattern7}},
                   {(IOG_DQS_LANES){pattern6}},
                   {(IOG_DQS_LANES){pattern5}},
                   {(IOG_DQS_LANES){pattern4}},
                   {(IOG_DQS_LANES){pattern3}},
                   {(IOG_DQS_LANES){pattern2}},
                   {(IOG_DQS_LANES){pattern1}},
                   {(IOG_DQS_LANES){pattern0}}};
  cal_l_dm_in_int <= {(IOG_DQS_LANES*8){1'b0}};
  incr_write_callibration_offset <= 1'b0;
  incr_lane <= 1'b0;
  select_i <= 1'b1;
  load_wait_counter = 1'b0;
  write_callibration_done <= 1'b0;
  load_write_counter <= 1'b0;
  decr_write_counter <= 1'b0;
  
  case (current_state)
  
    SM_WAIT_FOR_CTRLR_READY: begin
      select_i <= 1'b0;
      write_callibration_done <= 1'b0;
      load_write_counter <= 1'b1;
    end
    
    SM_DONE: begin
      select_i <= 1'b0;
      write_callibration_done <= 1'b1;
    end
  
    SM_DO_WRITE_REQ:
      cal_l_w_req_int <= 1'b1;
    
    SM_DO_WRITE:
    begin
      load_wait_counter = 1'b1;
//      decr_write_counter <= 1'b1;//AL:Moving the decrement to after the read.
    end



    SM_DO_WRITE_ZERO_REQ:
    begin
      cal_l_w_req_int <= 1'b1;
      cal_l_datain_int <= {(IOG_DQS_LANES*8){8'h00}};
    end
    
    SM_CHECK_DATA:
    begin
//      cal_l_datain_int <= {(IOG_DQS_LANES*8){8'h00}};
      decr_write_counter <= 1'b1;//AL:Moving the decrement to after the read (so write & read are matching).
    end

    SM_DO_WRITE_ZERO:
    begin
      cal_l_datain_int <= {(IOG_DQS_LANES*8){8'h00}};
      //decr_write_counter <= 1'b1;//AL:Moving the decrement to after the read (so write & read are matching).
    end

    SM_DO_READ_REQ:
      cal_l_r_req_int <= 1'b1;
      
    SM_ADD_OFSET:
    begin
      incr_write_callibration_offset <= 1'b1;
      load_write_counter <= 1'b1;
    end
    
    SM_INCREMENT_LANE:
    begin
      incr_lane <= 1'b1;
      load_write_counter <= 1'b1;
    end
  endcase
  
end


// ---------------------------------------------------------
// ASYNC LOGIC
// ---------------------------------------------------------

always @ (*)
begin : next_state_assignments
  case (current_state)
    SM_WAIT_FOR_CTRLR_READY:
      if (dfi_ctrlr_ready)
        next_state = SM_DO_WRITE_WAIT_FOR_BUS;
      else
        next_state = SM_WAIT_FOR_CTRLR_READY;
        
    SM_DO_WRITE_WAIT_FOR_BUS:
      if (cal_l_busy == 1'b0)
        next_state = SM_DO_WRITE_REQ;
      else
        next_state = SM_DO_WRITE_WAIT_FOR_BUS;
        
    SM_DO_WRITE_REQ:
      next_state = SM_DO_WRITE_WAIT_FOR_D_REQ;
      
    SM_DO_WRITE_WAIT_FOR_D_REQ:
      if (cal_l_d_req)
        next_state = SM_DO_WRITE;
      else
        next_state = SM_DO_WRITE_WAIT_FOR_D_REQ;
    
    SM_DO_WRITE:
      next_state = SM_WAIT;
    
    SM_WAIT:
      if (wait_counter == 4'b0000)
        next_state = SM_DO_READ_WAIT_FOR_BUS;
      else
        next_state = SM_WAIT;
    
    SM_DO_READ_WAIT_FOR_BUS:
      if (cal_l_busy == 1'b0)
        next_state = SM_DO_READ_REQ;
      else
        next_state = SM_DO_READ_WAIT_FOR_BUS;
    
    SM_DO_READ_REQ:
      next_state = SM_WAIT_FOR_R_VALID;
    
    SM_WAIT_FOR_R_VALID:
      if (cal_l_r_valid)
        next_state = SM_DO_WRITE_ZERO_WAIT_FOR_BUS;
      else
        next_state = SM_WAIT_FOR_R_VALID;
    
    SM_DO_WRITE_ZERO_WAIT_FOR_BUS:
      if (cal_l_busy == 1'b0)
        //next_state = SM_DO_WRITE_ZERO_REQ;
        next_state = SM_CHECK_DATA; //skipping write 0 phase.
      else
        next_state = SM_DO_WRITE_ZERO_WAIT_FOR_BUS;
    
    SM_DO_WRITE_ZERO_REQ:
      next_state = SM_DO_WRITE_ZERO_WAIT_FOR_D_REQ;
      
    SM_DO_WRITE_ZERO_WAIT_FOR_D_REQ:
      if (cal_l_d_req)
        next_state = SM_DO_WRITE_ZERO;
      else
        next_state = SM_DO_WRITE_ZERO_WAIT_FOR_D_REQ;
        
    SM_DO_WRITE_ZERO:
      next_state = SM_CHECK_DATA;
      
    SM_CHECK_DATA:
      if (data_match[current_lane])
        if (write_counter == 8'h00)
          next_state = SM_INCREMENT_LANE;
        else
          next_state = SM_DO_WRITE_WAIT_FOR_BUS;
      else
        next_state = SM_ADD_OFSET;
        
    SM_ADD_OFSET:
      next_state = SM_DO_WRITE_WAIT_FOR_BUS;
        
    SM_INCREMENT_LANE:
      if (current_lane < IOG_DQS_LANES-1)
        next_state = SM_DO_WRITE_WAIT_FOR_BUS;
      else
        next_state = SM_DONE;
    
    SM_DONE:
      next_state = SM_DONE;
    
    default:
      next_state = SM_WAIT_FOR_CTRLR_READY;
    
  endcase
end


// MAPPING
// LSB                                                                                        MSB
// burst 0 lane 0 | burst 0 lane 1 | ... | burst 1 lane 0 | burst 1 lane 1 | ... | burst 8 lane N
genvar i;
generate
  for (i=0; i < IOG_DQS_LANES; i = i + 1)
  begin
    assign lane_mapped_dataout[(i+1)*64-1:i*64] = {
      cal_l_dataout[IOG_DQS_LANES*56+7+i*8:IOG_DQS_LANES*56+i*8],
      cal_l_dataout[IOG_DQS_LANES*48+7+i*8:IOG_DQS_LANES*48+i*8],
      cal_l_dataout[IOG_DQS_LANES*40+7+i*8:IOG_DQS_LANES*40+i*8],
      cal_l_dataout[IOG_DQS_LANES*32+7+i*8:IOG_DQS_LANES*32+i*8],
      cal_l_dataout[IOG_DQS_LANES*24+7+i*8:IOG_DQS_LANES*24+i*8],
      cal_l_dataout[IOG_DQS_LANES*16+7+i*8:IOG_DQS_LANES*16+i*8],
      cal_l_dataout[IOG_DQS_LANES*8+7+i*8:IOG_DQS_LANES*8+i*8],
      cal_l_dataout[i*8+7:i*8]

    };
  end
endgenerate

// grab the correct slice of data for the current lane (64-bits)
//always@(*)
//begin : current_lane_mapper
  //integer y;
  //current_lane_mapped_dataout[63:0] = 64'hz;
  //for (y=0; y < IOG_DQS_LANES; y=y+1)
  //begin
    //if (current_lane[3:0] == y)
      //current_lane_mapped_dataout[63:0] = lane_mapped_dataout[y*64+:64];
  //end
//end


//AL replacing the 'z'
always @ (*) begin
    if (IOG_DQS_LANES==9) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else if (current_lane[3:0] == 4) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[4*64+:64];
        else if (current_lane[3:0] == 5) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[5*64+:64];
        else if (current_lane[3:0] == 6) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[6*64+:64];
        else if (current_lane[3:0] == 7) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[7*64+:64];
        else if (current_lane[3:0] == 8) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[8*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==8) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else if (current_lane[3:0] == 4) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[4*64+:64];
        else if (current_lane[3:0] == 5) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[5*64+:64];
        else if (current_lane[3:0] == 6) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[6*64+:64];
        else if (current_lane[3:0] == 7) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[7*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==7) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else if (current_lane[3:0] == 4) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[4*64+:64];
        else if (current_lane[3:0] == 5) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[5*64+:64];
        else if (current_lane[3:0] == 6) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[6*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==6) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else if (current_lane[3:0] == 4) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[4*64+:64];
        else if (current_lane[3:0] == 5) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[5*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==5) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else if (current_lane[3:0] == 4) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[4*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==4) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else if (current_lane[3:0] == 3) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[3*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==3) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else if (current_lane[3:0] == 2) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[2*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==2) begin
        if (current_lane[3:0] == 0) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
        else if (current_lane[3:0] == 1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[1*64+:64];
        else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;
    end
    else if (IOG_DQS_LANES==1) current_lane_mapped_dataout[63:0] = lane_mapped_dataout[0+:64];
    else current_lane_mapped_dataout[63:0] = 64'h0000000000000000;

end


// ---------------------------------------------------------
// SYNC LOGIC
// ---------------------------------------------------------

// wait counter
always @ (posedge sclk or negedge reset_n)
begin : wait_counter_register
  if (!reset_n)
    wait_counter <= WAIT_COUNTER_VALUE;
  else
    if (load_wait_counter)
      wait_counter <= WAIT_COUNTER_VALUE;
    else if (load_wait_counter)
      wait_counter <= wait_counter;
    else
      wait_counter <= wait_counter - 4'b0001;
end

// write counter
always @ (posedge sclk or negedge reset_n)
begin : write_counter_register
  if (!reset_n)
    write_counter <= WRITE_COUNTER_VALUE;
  else
    if (load_write_counter)
      write_counter <= WRITE_COUNTER_VALUE;
    else if (load_write_counter)
      write_counter <= write_counter;
    else if (decr_write_counter)
      write_counter <= write_counter - 8'h01;
    else
      write_counter <= write_counter;
end

// state
always @ (posedge sclk or negedge reset_n)
begin : current_state_register
  if (!reset_n)
    current_state <= SM_WAIT_FOR_CTRLR_READY;
  else
    current_state <= next_state;
end

always @ (posedge sclk or negedge reset_n)
begin : data_register
  if (!reset_n)
  begin
    data_match <= {IOG_DQS_LANES{1'b0}};
    select <= 1'b0;
  end
  else
  begin
    if (cal_l_r_valid)
    begin
      if (current_lane_mapped_dataout[63:0] == WRITE_CALLIBRATION_PATTERN)
        data_match[current_lane] <= 1'b1;
      else
        data_match[current_lane] <= 1'b0;
    end
    else
      data_match <= data_match;
      
    select <= select_i;
  end
end

// current lane
always @ (posedge sclk or negedge reset_n)
begin : current_lane_register
  if (!reset_n)
    current_lane <= 3'b000;
  else
    if (incr_lane)
      current_lane <= current_lane + 3'b001;
    else
      current_lane <= current_lane;
end

genvar z;
generate
for (z=0; z<IOG_DQS_LANES; z=z+1)
begin
  always @ (posedge sclk or negedge reset_n)
  begin : offset_register_per_lane
    if (!reset_n)
      write_callibration_offset[3*(z+1)-1:3*z] <= 3'b000;
    else
    begin
      if (incr_write_callibration_offset)
        if (current_lane == z)
          write_callibration_offset[3*(z+1)-1:3*z] <= write_callibration_offset[3*(z+1)-1:3*z] + 3'b001;
      else
        write_callibration_offset[3*(z+1)-1:3*z] <= write_callibration_offset[3*(z+1)-1:3*z];
    end
  end
end
endgenerate

// AS: added apb signals
generate
if (IOG_DQS_LANES == 9)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      4'h4:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[14:12]};  
      4'h5:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[17:15]}; 
      4'h6:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[20:18]}; 
      4'h7:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[23:21]}; 
      4'h8:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[26:24]}; 
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 8)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      4'h4:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[14:12]};  
      4'h5:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[17:15]}; 
      4'h6:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[20:18]}; 
      4'h7:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[23:21]}; 
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 7)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      4'h4:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[14:12]};  
      4'h5:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[17:15]}; 
      4'h6:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[20:18]}; 
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 6)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      4'h4:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[14:12]};  
      4'h5:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[17:15]}; 
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 5)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      4'h4:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[14:12]};  
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 4)
begin
    always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      4'h3:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[11:9]};
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 3)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      4'h2:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[8:6]};
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else if (IOG_DQS_LANES == 2)
begin
  always@(*)
  begin : wrcal_rddata_output
    case (apb_addr[3:0])
      4'h0:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
      4'h1:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[5:3]};
      default:
        wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
    endcase
  end
end
else
begin
  always@(*)
  begin : wrcal_rddata_output
    wrcal_rddata[7:0] = {5'b00000, write_callibration_offset[2:0]};
  end
end
endgenerate

endmodule