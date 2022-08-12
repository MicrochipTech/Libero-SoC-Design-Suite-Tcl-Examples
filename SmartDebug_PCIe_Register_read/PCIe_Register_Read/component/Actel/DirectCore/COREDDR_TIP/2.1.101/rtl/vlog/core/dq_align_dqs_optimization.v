//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                      
//--    Crevinn Teoranta                                                                                                                                                                                               
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                      
//-- Author      : $Author:      darrenc                                                                                                                                                             
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                                                                      
//-- Revision    : $Revision: 1.11 $                                                                                                                                                                                                      
//-- Location    : $URL: $                                                                                                                                                                                                      
//-- -----------------------------------------------------------------------------                                                                                                                         // AS: 1/7/18
//     - made apb_data_out async (gets synced in APB wrapper block) for timing
//       purposes
//--------------------------------------------------
 
 
module dq_align_dqs_optimization (
                               //  input ports
                               dfi_rdlvl_en,
                               dfi_rddata_valid,
                               sclk,
                               reset_n,
                               dq_out_of_range,
                               dqs_out_of_range,
                               dfi_rdlvl_cs_1_n,
                               dfi_rddata,
                               training_pattern,
                               apb_addr,
                               read_access,
                               dfi_rddata_en,
                               pinselect_8,
 
                               //  output ports
                               rd_dq_move,
                               rd_dq_load,
                               rd_dq_direction,
                               rd_dqs_move,
                               rd_dqs_load,
                               rd_dqs_direction,
                               dfi_rdlvl_resp,
                               apb_data_out,
                               dqs_pause,
                               dq_dqs_error,
                               dq_dqs_block_fifo  //  Signal to protect the fifo from receiving X signals.
                               );
 
   parameter        VALID_DATA_THRESHOLD   = 4'b0101;     //  Must be greater than 0
   parameter        MAX_DQS_MOVE_CNT       = 8'hff;
   parameter        MAX_DQ_MOVE_CNT        = 8'hff;
   parameter        PAUSE_DELAY            = 5;
   parameter        HOLD_FB_CNT            = 3;
//  input ports
   input            dfi_rdlvl_en;
   wire             dfi_rdlvl_en;
   input            dfi_rddata_valid;
   wire             dfi_rddata_valid;
   input            sclk;
   wire             sclk;
   input            reset_n;
   wire             reset_n;
   input     [7:0]  dq_out_of_range;
   wire      [7:0]  dq_out_of_range;
   input            dqs_out_of_range;
   wire             dqs_out_of_range;
   input            dfi_rdlvl_cs_1_n;
   wire             dfi_rdlvl_cs_1_n;
   input     [63:0] dfi_rddata;
   wire      [63:0] dfi_rddata;
   input     [7:0]  training_pattern;
   wire      [7:0]  training_pattern;
   input     [15:0] apb_addr;
   wire      [15:0] apb_addr;
   input            read_access;
   wire             read_access;
   input            dfi_rddata_en;
   wire             dfi_rddata_en;
   input            pinselect_8;
   wire             pinselect_8;
//  output ports
   output    [7:0]  rd_dq_move;
   wire      [7:0]  rd_dq_move;
   output    [7:0]  rd_dq_load;
   wire      [7:0]  rd_dq_load;
   output    [7:0]  rd_dq_direction;
   wire      [7:0]  rd_dq_direction;
   output           rd_dqs_move;
   reg              rd_dqs_move;
   output           rd_dqs_load;
   reg              rd_dqs_load;
   output           rd_dqs_direction;
   wire             rd_dqs_direction;
   output           dfi_rdlvl_resp;
   reg              dfi_rdlvl_resp;
   output    [7:0]  apb_data_out;
   reg       [7:0]  apb_data_out;
   output           dqs_pause;
   reg              dqs_pause;
   output           dq_dqs_error;
   reg              dq_dqs_error;
   output           dq_dqs_block_fifo;
   reg              dq_dqs_block_fifo;
//  local signals
   reg       [7:0]  delay_cnt;
   reg       [7:0]  good_cnt;                             //  Count signal used to record the amount of good data within a window before we start
   reg       [7:0]  data_gone_bad;
   reg              start_bad_data_check;
   wire             db0;
   wire             db1;
   wire             db2;
   wire             db3;
   wire             db4;
   wire             db5;
   wire             db6;
   wire             db7;
   reg              db0_reg;                              //  14/11/16 Dcre: Register db0 to help meet timing
   reg              db1_reg;                              //  14/11/16 Dcre: Register db1 to help meet timing
   reg              db2_reg;                              //  14/11/16 Dcre: Register db2 to help meet timing
   reg              db3_reg;                              //  14/11/16 Dcre: Register db3 to help meet timing
   reg              db4_reg;                              //  14/11/16 Dcre: Register db4 to help meet timing
   reg              db5_reg;                              //  14/11/16 Dcre: Register db5 to help meet timing
   reg              db6_reg;                              //  14/11/16 Dcre: Register db6 to help meet timing
   reg              db7_reg;                              //  14/11/16 Dcre: Register db7 to help meet timing
   wire      [7:0]  db7_to_0;
   reg              reset_delta;
   reg       [7:0]  initlDqs_2_stw;
   reg       [7:0]  initlDqs_2_stw_0;
   reg       [7:0]  initlDqs_2_stw_1;
   wire      [7:0]  stw_2_initlDqs;
   reg       [7:0]  stw_2_initlDqs_0;
   reg       [7:0]  stw_2_initlDqs_1;
   reg       [7:0]  initlDqsOrStw_2_endw;
   wire      [7:0]  initlDqs_2_mid;
   reg       [7:0]  initlDqs_2_mid_0;
   reg       [7:0]  initlDqs_2_mid_1;
   wire      [7:0]  mid_2_initlDqs;
   reg       [7:0]  mid_2_initlDqs_reg;                   //  14/11/16 Dcre: Adding to meet timing
   wire      [7:0]  mid_2_initlDqs_div2;
   reg       [7:0]  mid_2_initlDqs_0;
   reg       [7:0]  mid_2_initlDqs_1;
   wire             irs_gt_ils;
   wire             center_with_dqs;
   wire      [7:0]  dqs_moves_rqd;
   wire      [7:0]  dq_moves_rqd;
   wire      [7:0]  mov7_to_0;
   reg       [7:0]  mov7_to_0_reg;                        //  14/11/16 Dcre: Registering mov7_to_0 to help meet timing
   wire             mov0;
   wire             mov1;
   wire             mov2;
   wire             mov3;
   wire             mov4;
   wire             mov5;
   wire             mov6;
   wire             mov7;
   reg              reset_data_gone_bad;
   reg              record_delta_delays;
   reg              dq_alignment_done;
   reg              dq_out_of_range_error;
   reg              dqs_out_of_range_error_0;
   reg              dqs_out_of_range_error_1;
   reg       [7:0]  delta_delay_0;
   reg       [7:0]  delta_delay_1;
   reg       [7:0]  delta_delay_2;
   reg       [7:0]  delta_delay_3;
   reg       [7:0]  delta_delay_4;
   reg       [7:0]  delta_delay_5;
   reg       [7:0]  delta_delay_6;
   reg       [7:0]  delta_delay_7;
   reg       [7:0]  init_delay;
   wire      [7:0]  data_dq0;
   wire      [7:0]  data_dq1;
   wire      [7:0]  data_dq2;
   wire      [7:0]  data_dq3;
   wire      [7:0]  data_dq4;
   wire      [7:0]  data_dq5;
   wire      [7:0]  data_dq6;
   wire      [7:0]  data_dq7;
   reg              start_dqs_in_bad_data;
   wire      [7:0]  dq_dqs_error_done;
   wire      [7:0]  dq_dqs_state;
   wire      [7:0]  irs;
   wire      [7:0]  ils;
   reg       [7:0]  irs_reg;                              //  15/11/16 Dcre: Registering irs to help meet timing
   reg       [7:0]  ils_reg;                              //  15/11/16 Dcre: Registering ils to help meet timing
   reg       [7:0]  bit_width;
   reg              record_extra_dq_delays;
   reg       [7:0]  dqs_delays_0;
   reg       [7:0]  dqs_delays_1;
   reg              dqs_set_error;
   reg              apb_clear_error;
   reg              dq_set_error;
   wire             sm_dqs_oor;
   wire             sm_dq_oor;
   wire             delay_exceed_max_dqs;
   wire             delay_exceed_max_dq;
   reg       [7:0]  ils_0;
   reg       [7:0]  ils_1;
   reg       [7:0]  irs_0;
   reg       [7:0]  irs_1;
   wire      [7:0]  bit_width_div2;
   reg              wait_rxvalid101;
   reg              rxvalid_wait_done;
   reg              rxvalid_wait_done_reg;                //  14/11/16 Dcre: Register rxvalid_wait_done_reg to help meet timing
   reg       [7:0]  pre_rd_dq_load;
   reg       [7:0]  pre_rd_dq_move;
   wire      [4:0]  no_of_pins;
   reg              rank0_sel;
   wire      [7:0]  initlDqsOrStw_2_thresh;
   wire      [7:0]  pin_mask;
   reg       [7:0]  pause_delay_cnt;
   reg       [2:0]  hold_fifo_block_cnt;
   reg              dfi_rddata_valid_reg;                 //  14/11/16 Dcre: Register dfi_rddata_valid to help meet timing
   reg       [7:0]  delay_cnt_minus1;                     //  15/11/16 Dcre: Adding to help need timing
 
   parameter CAL_DELTA_DELAYS        = 5'b00000,
             CENTERING_PATH_CHOSEN   = 5'b00001,
             CHECK_DQS_START         = 5'b00010,
             CHOOSE_CENTERING_PATH   = 5'b00011,
             FIND_UPPERVAL           = 5'b00100,
             FINISH_DQS_CENTERING    = 5'b00101,
             FINISH_DQ_ALIGNMENT     = 5'b00110,
             GET_CHIP_SEL            = 5'b00111,
             INITIAL                 = 5'b01000,
             LATCH_CS                = 5'b01001,
             MOVE_DELAY_DQS          = 5'b01010,
             MOVE_LEFT_START_DQS     = 5'b01011,
             MOVE_LEFT_START_DQS_1   = 5'b01100,
             MOVE_RIGHT_START_DQ     = 5'b01101,
             MOVE_RIGHT_START_DQ_1   = 5'b01110,
             MOVE_TO_DELTA_DELAYS    = 5'b01111,
             MOVE_TO_DELTA_DELAYS_0  = 5'b10000,
             UPPER_DQS_OPTIMIZATION  = 5'b10001,
             UP_MOVE_DQS_1           = 5'b10010,
             WAIT_FOR_ANY_BIT_BAD    = 5'b10011,
             WAIT_FOR_DATA_BAD_CAL_1 = 5'b10100,
             WAIT_FOR_DATA_BAD_CAL_2 = 5'b10101,
             WAIT_FOR_DATA_BAD_CAL_4 = 5'b10110,
             WAIT_FOR_RDLVL_EN_0     = 5'b10111,
             WAIT_FOR_RXVALID_DONE_0 = 5'b11000,
             WAIT_GOOD_CNT_INC       = 5'b11001,
             WAIT_ILS                = 5'b11010,
             WAIT_VALID_DONE         = 5'b11011,
             WAIT_VALID_DONE_1       = 5'b11100;
 
 
   reg [4:0] visual_dq_dqs_optimisation_current, visual_dq_dqs_optimisation_next;
 
 
   parameter WAIT_CLK_DELAY       = 3'b000,
             WAIT_FOR_RX_VALID101 = 3'b001,
             WAIT_RDDATA_VAL      = 3'b010,
             WAIT_RDDATA_VAL_0    = 3'b011,
             WAIT_RDDATA_VAL_1    = 3'b100;
 
 
   reg [2:0] visual_rx_valid_current, visual_rx_valid_next;
 
 
   parameter INITIAL_LFP   = 2'b00,
             WAIT_HOLD_CNT = 2'b01,
             WAIT_PAUSE    = 2'b10;
 
 
   reg [1:0] visual_Lane_Fifo_Protect_current, visual_Lane_Fifo_Protect_next;
 
   reg              visual_rd_dqs_move_next;
   reg              visual_rd_dqs_load_next;
   reg              visual_dfi_rdlvl_resp_next;
   reg              visual_dqs_pause_next;
   reg              visual_dq_dqs_error_next;
   reg       [7:0]  visual_delay_cnt_next;
   reg       [7:0]  visual_good_cnt_next;
   reg              visual_start_bad_data_check_next;
   reg              visual_reset_delta_next;
   reg       [7:0]  visual_initlDqs_2_stw_next;
   reg       [7:0]  visual_initlDqs_2_stw_0_next;
   reg       [7:0]  visual_initlDqs_2_stw_1_next;
   reg       [7:0]  visual_stw_2_initlDqs_0_next;
   reg       [7:0]  visual_stw_2_initlDqs_1_next;
   reg       [7:0]  visual_initlDqsOrStw_2_endw_next;
   reg       [7:0]  visual_initlDqs_2_mid_0_next;
   reg       [7:0]  visual_initlDqs_2_mid_1_next;
   reg       [7:0]  visual_mid_2_initlDqs_0_next;
   reg       [7:0]  visual_mid_2_initlDqs_1_next;
   reg              visual_reset_data_gone_bad_next;
   reg              visual_record_delta_delays_next;
   reg              visual_dq_alignment_done_next;
   reg       [7:0]  visual_init_delay_next;
   reg              visual_start_dqs_in_bad_data_next;
   reg       [7:0]  visual_bit_width_next;
   reg              visual_record_extra_dq_delays_next;
   reg              visual_dqs_set_error_next;
   reg              visual_dq_set_error_next;
   reg       [7:0]  visual_ils_0_next;
   reg       [7:0]  visual_ils_1_next;
   reg       [7:0]  visual_irs_0_next;
   reg       [7:0]  visual_irs_1_next;
   reg              visual_wait_rxvalid101_next;
   reg       [7:0]  visual_pre_rd_dq_load_next;
   reg       [7:0]  visual_pre_rd_dq_move_next;
   reg              visual_rank0_sel_next;
   reg       [7:0]  visual_pause_delay_cnt_next;
   reg       [2:0]  visual_hold_fifo_block_cnt_next;
   reg       [7:0]  visual_delay_cnt_minus1_next;
 
 
   // Combinational process
   always  @(delay_cnt or good_cnt or start_bad_data_check or initlDqs_2_stw or initlDqs_2_stw_0 or initlDqs_2_stw_1 or stw_2_initlDqs_0 or stw_2_initlDqs_1 or initlDqsOrStw_2_endw or initlDqs_2_mid_0 or
             initlDqs_2_mid_1 or mid_2_initlDqs_0 or mid_2_initlDqs_1 or record_delta_delays or dq_alignment_done or init_delay or start_dqs_in_bad_data or bit_width or ils_0 or ils_1 or irs_0 or
             irs_1 or rank0_sel or delay_cnt_minus1 or rxvalid_wait_done_reg or initlDqs_2_mid or mid_2_initlDqs or stw_2_initlDqs or ils_reg or irs_reg or dqs_out_of_range_error_0 or
             dqs_out_of_range_error_1 or dq_out_of_range_error or dfi_rdlvl_en or dfi_rddata_valid or dfi_rdlvl_cs_1_n or sm_dqs_oor or dqs_moves_rqd or dq_moves_rqd or mov7_to_0_reg or data_gone_bad or
             sm_dq_oor or pin_mask or initlDqsOrStw_2_thresh or db7_to_0 or center_with_dqs or visual_dq_dqs_optimisation_current)
   begin : dq_dqs_optimisation_comb
      visual_rd_dqs_move_next <= 1'b0;
      visual_rd_dqs_load_next <= 1'b0;
      visual_dfi_rdlvl_resp_next <= 1'b0;
      visual_dq_dqs_error_next <= 1'b0;
      visual_reset_delta_next <= 1'b0;
      visual_reset_data_gone_bad_next <= 1'b0;
      visual_record_extra_dq_delays_next <= 1'b0;
      visual_dqs_set_error_next <= 1'b0;
      visual_dq_set_error_next <= 1'b0;
      visual_wait_rxvalid101_next <= 1'b0;
      visual_pre_rd_dq_load_next <= 0;
      visual_pre_rd_dq_move_next <= 0;
      visual_delay_cnt_next <= delay_cnt;
      visual_good_cnt_next <= good_cnt;
      visual_start_bad_data_check_next <= start_bad_data_check;
      visual_initlDqs_2_stw_next <= initlDqs_2_stw;
      visual_initlDqs_2_stw_0_next <= initlDqs_2_stw_0;
      visual_initlDqs_2_stw_1_next <= initlDqs_2_stw_1;
      visual_stw_2_initlDqs_0_next <= stw_2_initlDqs_0;
      visual_stw_2_initlDqs_1_next <= stw_2_initlDqs_1;
      visual_initlDqsOrStw_2_endw_next <= initlDqsOrStw_2_endw;
      visual_initlDqs_2_mid_0_next <= initlDqs_2_mid_0;
      visual_initlDqs_2_mid_1_next <= initlDqs_2_mid_1;
      visual_mid_2_initlDqs_0_next <= mid_2_initlDqs_0;
      visual_mid_2_initlDqs_1_next <= mid_2_initlDqs_1;
      visual_record_delta_delays_next <= record_delta_delays;
      visual_dq_alignment_done_next <= dq_alignment_done;
      visual_init_delay_next <= init_delay;
      visual_start_dqs_in_bad_data_next <= start_dqs_in_bad_data;
      visual_bit_width_next <= bit_width;
      visual_ils_0_next <= ils_0;
      visual_ils_1_next <= ils_1;
      visual_irs_0_next <= irs_0;
      visual_irs_1_next <= irs_1;
      visual_rank0_sel_next <= rank0_sel;
      visual_delay_cnt_minus1_next <= delay_cnt_minus1;
 
 
 
      case (visual_dq_dqs_optimisation_current)
         CAL_DELTA_DELAYS:
            begin
               visual_start_bad_data_check_next <= 1'b1;
               visual_record_delta_delays_next <= 1'b1;
               if (rxvalid_wait_done_reg)
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_DATA_BAD_CAL_2;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= CAL_DELTA_DELAYS;
               end
            end
 
         CENTERING_PATH_CHOSEN:
            begin
               if (rank0_sel == 1)
               begin
                  visual_initlDqs_2_mid_0_next <= initlDqs_2_mid;
                  visual_mid_2_initlDqs_0_next <= mid_2_initlDqs;
                  visual_stw_2_initlDqs_0_next <= stw_2_initlDqs;
                  visual_initlDqs_2_stw_0_next <= initlDqs_2_stw;
                  visual_ils_0_next <= ils_reg;
                  visual_irs_0_next <= irs_reg;
                  visual_dq_dqs_optimisation_next <= WAIT_ILS;
               end
               else
               begin
                  visual_initlDqs_2_mid_1_next <= initlDqs_2_mid;
                  visual_mid_2_initlDqs_1_next <= mid_2_initlDqs;
                  visual_stw_2_initlDqs_1_next <= stw_2_initlDqs;
                  visual_initlDqs_2_stw_1_next <= initlDqs_2_stw;
                  visual_ils_1_next <= ils_reg;
                  visual_irs_1_next <= irs_reg;
                  visual_dq_dqs_optimisation_next <= WAIT_ILS;
               end
            end
 
         CHECK_DQS_START:
            begin
               if (rank0_sel == 1)
               begin
                  visual_bit_width_next <= stw_2_initlDqs + initlDqsOrStw_2_endw + 1;
                  visual_dq_dqs_optimisation_next <= CHOOSE_CENTERING_PATH;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= CHOOSE_CENTERING_PATH;
               end
            end
 
         CHOOSE_CENTERING_PATH:
            begin
               visual_dq_dqs_optimisation_next <= CENTERING_PATH_CHOSEN;
            end
 
         FIND_UPPERVAL:
            begin
               visual_start_bad_data_check_next <= 1'b1;
               if (rxvalid_wait_done_reg)
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_DATA_BAD_CAL_4;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= FIND_UPPERVAL;
               end
            end
 
         FINISH_DQS_CENTERING:
            begin
               visual_dfi_rdlvl_resp_next <= 1'b1;
               visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
               visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
            end
 
         FINISH_DQ_ALIGNMENT:
            begin
               visual_delay_cnt_next <= 0;
               visual_dq_alignment_done_next <= 1'b1;
               visual_wait_rxvalid101_next <= 1'b1;
               visual_dq_dqs_optimisation_next <= UPPER_DQS_OPTIMIZATION;
            end
 
         GET_CHIP_SEL:
            begin
               visual_delay_cnt_next <= 0;
               visual_good_cnt_next <= 0;
               visual_wait_rxvalid101_next <= 1'b1;
               if (rank0_sel == 1)
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_ANY_BIT_BAD;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= UPPER_DQS_OPTIMIZATION;
               end
            end
 
         INITIAL:
            begin
               visual_reset_data_gone_bad_next <= 1'b1;
               visual_good_cnt_next <= 0;
               visual_delay_cnt_next <= 0;
               visual_initlDqs_2_stw_next <= 8'h0;
               visual_initlDqsOrStw_2_endw_next <= 8'h0;
               visual_dfi_rdlvl_resp_next <= 1'b0;
               visual_start_bad_data_check_next <= 1'b0;
               visual_dq_alignment_done_next <= 1'b0;
               visual_record_delta_delays_next <= 1'b0;
               visual_start_dqs_in_bad_data_next <= 1'b0;
               visual_record_extra_dq_delays_next <= 1'b0;
               visual_dqs_set_error_next <= 1'b0;
               visual_dq_set_error_next <= 1'b0;
               visual_delay_cnt_minus1_next <= 0;
               if (dfi_rdlvl_en & dfi_rddata_valid)
               begin
                  if (dfi_rdlvl_cs_1_n == 0)
                  begin
                     visual_rank0_sel_next <= 1'b0;
                     visual_dq_dqs_optimisation_next <= LATCH_CS;
                  end
                  else
                  begin
                     visual_rank0_sel_next <= 1'b1;
                     visual_init_delay_next <= 1'b0;
                     visual_dq_dqs_optimisation_next <= LATCH_CS;
                  end
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= INITIAL;
               end
            end
 
         LATCH_CS:
            begin
               if (rank0_sel == 1'b1)
               begin
                  visual_pre_rd_dq_load_next <= 'hff;
                  visual_rd_dqs_load_next <= 1'b1;
                  visual_reset_delta_next <= 1'b1;
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RXVALID_DONE_0;
               end
               else
               begin
                  visual_rd_dqs_load_next <= 1'b1;
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RXVALID_DONE_0;
               end
            end
 
         MOVE_DELAY_DQS:
            begin
               visual_rd_dqs_move_next <= 1'b1;
               visual_delay_cnt_next <= delay_cnt + 1;
               visual_wait_rxvalid101_next <= 1'b1;
               if (sm_dqs_oor == 1)
               begin
                  visual_dqs_set_error_next <= 1'b1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RXVALID_DONE_0;
               end
            end
 
         MOVE_LEFT_START_DQS:
            begin
               if (rxvalid_wait_done_reg)
               begin
                  if (delay_cnt == dqs_moves_rqd)
                  begin
                     visual_dq_dqs_optimisation_next <= FINISH_DQS_CENTERING;
                  end
                  else
                  begin
                     visual_dq_dqs_optimisation_next <= MOVE_LEFT_START_DQS_1;
                  end
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= MOVE_LEFT_START_DQS;
               end
            end
 
         MOVE_LEFT_START_DQS_1:
            begin
               visual_rd_dqs_move_next <= 1'b1;
               visual_delay_cnt_next <= delay_cnt + 1;
               visual_wait_rxvalid101_next <= 1'b1;
               visual_dq_dqs_optimisation_next <= MOVE_LEFT_START_DQS;
            end
 
         MOVE_RIGHT_START_DQ:
            begin
               if (delay_cnt == dq_moves_rqd)
               begin
                  visual_rd_dqs_load_next <= 1'b1;
                  visual_record_extra_dq_delays_next <= 1'b1;
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= WAIT_VALID_DONE_1;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= MOVE_RIGHT_START_DQ_1;
               end
            end
 
         MOVE_RIGHT_START_DQ_1:
            begin
               visual_pre_rd_dq_move_next <= 'hff;
               visual_delay_cnt_next <= delay_cnt + 1;
               visual_dq_dqs_optimisation_next <= MOVE_RIGHT_START_DQ;
            end
 
         MOVE_TO_DELTA_DELAYS:
            begin
               if (mov7_to_0_reg == 'h0)
               begin
                  visual_delay_cnt_next <= 0;
                  visual_record_delta_delays_next <= 1'b0;
                  visual_dq_dqs_optimisation_next <= FINISH_DQ_ALIGNMENT;
               end
               else
               begin
                  visual_delay_cnt_next <= delay_cnt + 1;
                  visual_pre_rd_dq_move_next <= mov7_to_0_reg;
                  visual_dq_dqs_optimisation_next <= MOVE_TO_DELTA_DELAYS_0;
               end
            end
 
         MOVE_TO_DELTA_DELAYS_0:
            begin
               visual_dq_dqs_optimisation_next <= MOVE_TO_DELTA_DELAYS;
            end
 
         UPPER_DQS_OPTIMIZATION:
            begin
               visual_reset_data_gone_bad_next <= 1'b1;
               if (rxvalid_wait_done_reg)
               begin
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= FIND_UPPERVAL;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= UPPER_DQS_OPTIMIZATION;
               end
            end
 
         UP_MOVE_DQS_1:
            begin
               visual_rd_dqs_move_next <= 1'b1;
               visual_wait_rxvalid101_next <= 1'b1;
               if (sm_dqs_oor == 1)
               begin
                  visual_dqs_set_error_next <= 1'b1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= FIND_UPPERVAL;
               end
            end
 
         WAIT_FOR_ANY_BIT_BAD:
            begin
               visual_start_bad_data_check_next <= 1'b1;
               if (rxvalid_wait_done_reg)
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_DATA_BAD_CAL_1;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_ANY_BIT_BAD;
               end
            end
 
         WAIT_FOR_DATA_BAD_CAL_1:
            begin
               if (data_gone_bad != 'h0)
               begin
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= CAL_DELTA_DELAYS;
               end
               else
               begin
                  visual_init_delay_next <= init_delay + 1;
                  visual_pre_rd_dq_move_next <= 'hff;
                  visual_wait_rxvalid101_next <= 1'b1;
                  if (sm_dq_oor != 'h0)
                  begin
                     visual_dq_set_error_next <= 1'b1;
                     visual_dfi_rdlvl_resp_next <= 1'b1;
                     visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
                     visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
                  end
                  else
                  begin
                     visual_dq_dqs_optimisation_next <= WAIT_FOR_ANY_BIT_BAD;
                  end
               end
            end
 
         WAIT_FOR_DATA_BAD_CAL_2:
            begin
               if (data_gone_bad == pin_mask)
               begin
                  visual_delay_cnt_next <= 0;
                  visual_pre_rd_dq_load_next <= 'hff;
                  visual_dq_dqs_optimisation_next <= MOVE_TO_DELTA_DELAYS_0;
               end
               else
               begin
                  visual_delay_cnt_next <= delay_cnt + 1;
                  visual_pre_rd_dq_move_next <= ~(data_gone_bad);
                  visual_wait_rxvalid101_next <= 1'b1;
                  if (sm_dq_oor != 'h0)
                  begin
                     visual_dq_set_error_next <= 1'b1;
                     visual_dfi_rdlvl_resp_next <= 1'b1;
                     visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
                     visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
                  end
                  else
                  begin
                     visual_dq_dqs_optimisation_next <= CAL_DELTA_DELAYS;
                  end
               end
            end
 
         WAIT_FOR_DATA_BAD_CAL_4:
            begin
               if (data_gone_bad == 'h0)
               begin
                  visual_delay_cnt_minus1_next <= delay_cnt;
                  visual_delay_cnt_next <= delay_cnt + 1;
                  visual_dq_dqs_optimisation_next <= UP_MOVE_DQS_1;
               end
               else
               begin
                  visual_initlDqsOrStw_2_endw_next <= initlDqsOrStw_2_thresh + delay_cnt_minus1;
                  visual_delay_cnt_next <= 0;
                  visual_dq_dqs_optimisation_next <= CHECK_DQS_START;
               end
            end
 
         WAIT_FOR_RDLVL_EN_0:
            begin
               if (dfi_rdlvl_en == 0)
               begin
                  visual_dq_dqs_optimisation_next <= INITIAL;
               end
               else
               begin
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_dq_dqs_error_next <= dqs_out_of_range_error_0 | dqs_out_of_range_error_1 | dq_out_of_range_error;
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RDLVL_EN_0;
               end
            end
 
         WAIT_FOR_RXVALID_DONE_0:
            begin
               if (rxvalid_wait_done_reg)
               begin
                  if (db7_to_0 == 'h0)
                  begin
                     visual_good_cnt_next <= good_cnt + 1;
                     visual_dq_dqs_optimisation_next <= WAIT_GOOD_CNT_INC;
                  end
                  else
                  begin
                     visual_good_cnt_next <= 0;
                     visual_start_dqs_in_bad_data_next <= 1'b1;
                     visual_dq_dqs_optimisation_next <= MOVE_DELAY_DQS;
                  end
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_FOR_RXVALID_DONE_0;
               end
            end
 
         WAIT_GOOD_CNT_INC:
            begin
               if (good_cnt == VALID_DATA_THRESHOLD)
               begin
                  visual_initlDqs_2_stw_next <= delay_cnt - initlDqsOrStw_2_thresh;
                  visual_dq_dqs_optimisation_next <= GET_CHIP_SEL;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= MOVE_DELAY_DQS;
               end
            end
 
         WAIT_ILS:
            begin
               if (center_with_dqs == 1'b1)
               begin
                  visual_rd_dqs_load_next <= 1'b1;
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= WAIT_VALID_DONE;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= MOVE_RIGHT_START_DQ;
               end
            end
 
         WAIT_VALID_DONE:
            begin
               if (rxvalid_wait_done_reg)
               begin
                  visual_wait_rxvalid101_next <= 1'b1;
                  visual_dq_dqs_optimisation_next <= MOVE_LEFT_START_DQS;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_VALID_DONE;
               end
            end
 
         WAIT_VALID_DONE_1:
            begin
               if (rxvalid_wait_done_reg)
               begin
                  visual_dq_dqs_optimisation_next <= FINISH_DQS_CENTERING;
               end
               else
               begin
                  visual_dq_dqs_optimisation_next <= WAIT_VALID_DONE_1;
               end
            end
 
         default:
            begin
               visual_dq_dqs_optimisation_next <= INITIAL;
            end
      endcase
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : dq_dqs_optimisation
 
      if (reset_n == 1'b0)
      begin
         dq_dqs_error <= 1'b0;
         wait_rxvalid101 <= 1'b0;
         good_cnt <= 0;
         delay_cnt <= 0;
         initlDqs_2_stw <= 0;
         dfi_rdlvl_resp <= 0;
         start_bad_data_check <= 0;
         dq_alignment_done <= 0;
         init_delay <= 0;
         reset_delta <= 0;
         reset_data_gone_bad <= 0;
         record_delta_delays <= 0;
         start_dqs_in_bad_data <= 0;
         record_extra_dq_delays <= 0;
         dqs_set_error <= 0;
         dq_set_error <= 0;
         ils_0 <= 0;
         ils_1 <= 0;
         irs_0 <= 0;
         irs_1 <= 0;
         initlDqs_2_mid_0 <= 0;
         initlDqs_2_mid_1 <= 0;
         mid_2_initlDqs_0 <= 0;
         mid_2_initlDqs_1 <= 0;
         stw_2_initlDqs_0 <= 0;
         stw_2_initlDqs_1 <= 0;
         initlDqs_2_stw_0 <= 0;
         initlDqs_2_stw_1 <= 0;
         initlDqsOrStw_2_endw <= 0;
         bit_width <= 0;
         pre_rd_dq_load <= 0;
         pre_rd_dq_move <= 0;
         rd_dqs_load <= 0;
         rd_dqs_move <= 0;
         rank0_sel <= 0;
         delay_cnt_minus1 <= 0;
         visual_dq_dqs_optimisation_current <= INITIAL;
      end
      else
      begin
         rd_dqs_move <= visual_rd_dqs_move_next;
         rd_dqs_load <= visual_rd_dqs_load_next;
         dfi_rdlvl_resp <= visual_dfi_rdlvl_resp_next;
         dq_dqs_error <= visual_dq_dqs_error_next;
         delay_cnt <= visual_delay_cnt_next;
         good_cnt <= visual_good_cnt_next;
         start_bad_data_check <= visual_start_bad_data_check_next;
         reset_delta <= visual_reset_delta_next;
         initlDqs_2_stw <= visual_initlDqs_2_stw_next;
         initlDqs_2_stw_0 <= visual_initlDqs_2_stw_0_next;
         initlDqs_2_stw_1 <= visual_initlDqs_2_stw_1_next;
         stw_2_initlDqs_0 <= visual_stw_2_initlDqs_0_next;
         stw_2_initlDqs_1 <= visual_stw_2_initlDqs_1_next;
         initlDqsOrStw_2_endw <= visual_initlDqsOrStw_2_endw_next;
         initlDqs_2_mid_0 <= visual_initlDqs_2_mid_0_next;
         initlDqs_2_mid_1 <= visual_initlDqs_2_mid_1_next;
         mid_2_initlDqs_0 <= visual_mid_2_initlDqs_0_next;
         mid_2_initlDqs_1 <= visual_mid_2_initlDqs_1_next;
         reset_data_gone_bad <= visual_reset_data_gone_bad_next;
         record_delta_delays <= visual_record_delta_delays_next;
         dq_alignment_done <= visual_dq_alignment_done_next;
         init_delay <= visual_init_delay_next;
         start_dqs_in_bad_data <= visual_start_dqs_in_bad_data_next;
         bit_width <= visual_bit_width_next;
         record_extra_dq_delays <= visual_record_extra_dq_delays_next;
         dqs_set_error <= visual_dqs_set_error_next;
         dq_set_error <= visual_dq_set_error_next;
         ils_0 <= visual_ils_0_next;
         ils_1 <= visual_ils_1_next;
         irs_0 <= visual_irs_0_next;
         irs_1 <= visual_irs_1_next;
         wait_rxvalid101 <= visual_wait_rxvalid101_next;
         pre_rd_dq_load <= visual_pre_rd_dq_load_next;
         pre_rd_dq_move <= visual_pre_rd_dq_move_next;
         rank0_sel <= visual_rank0_sel_next;
         delay_cnt_minus1 <= visual_delay_cnt_minus1_next;
         visual_dq_dqs_optimisation_current <= visual_dq_dqs_optimisation_next;
      end
   end
 
 
 
   // Combinational process
   // always  @(reset_n or pause_delay_cnt or wait_rxvalid101 or dfi_rddata_valid or visual_rx_valid_current)
   always  @(pause_delay_cnt or wait_rxvalid101 or dfi_rddata_valid or visual_rx_valid_current)
   begin : rx_valid_comb
      visual_dqs_pause_next <= 1'b0;
      rxvalid_wait_done <= 1'b0;
      visual_pause_delay_cnt_next <= pause_delay_cnt;
 
 
//      if (reset_n == 1'b0)
//      begin
//         rxvalid_wait_done <= 1'b0;
//         visual_rx_valid_next <= WAIT_FOR_RX_VALID101;
//      end
//      else
//      begin
 
         case (visual_rx_valid_current)
            WAIT_CLK_DELAY:
               begin
                  if (pause_delay_cnt == PAUSE_DELAY)
                  begin
                     visual_dqs_pause_next <= 1;
                     visual_rx_valid_next <= WAIT_RDDATA_VAL;
                  end
                  else
                  begin
                     visual_pause_delay_cnt_next <= pause_delay_cnt + 1;
                     visual_rx_valid_next <= WAIT_CLK_DELAY;
                  end
               end
 
            WAIT_FOR_RX_VALID101:
               begin
                  if (wait_rxvalid101)
                  begin
                     visual_pause_delay_cnt_next <= 0;
                     visual_rx_valid_next <= WAIT_CLK_DELAY;
                  end
                  else
                  begin
                     visual_rx_valid_next <= WAIT_FOR_RX_VALID101;
                  end
               end
 
            WAIT_RDDATA_VAL:
               begin
                  if (dfi_rddata_valid == 1)
                  begin
                     visual_rx_valid_next <= WAIT_RDDATA_VAL_0;
                  end
                  else
                  begin
                     visual_rx_valid_next <= WAIT_RDDATA_VAL;
                  end
               end
 
            WAIT_RDDATA_VAL_0:
               begin
                  if (dfi_rddata_valid == 0)
                  begin
                     visual_rx_valid_next <= WAIT_RDDATA_VAL_1;
                  end
                  else
                  begin
                     visual_rx_valid_next <= WAIT_RDDATA_VAL_0;
                  end
               end
 
            WAIT_RDDATA_VAL_1:
               begin
                  if (dfi_rddata_valid == 1)
                  begin
                     rxvalid_wait_done <= 1'b1;
                     visual_rx_valid_next <= WAIT_FOR_RX_VALID101;
                  end
                  else
                  begin
                     visual_rx_valid_next <= WAIT_RDDATA_VAL_1;
                  end
               end
 
            default:
               begin
                  visual_rx_valid_next <= WAIT_FOR_RX_VALID101;
               end
         endcase
//      end
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : rx_valid
 
      if (reset_n == 1'b0)
      begin
         dqs_pause <= 1'b0;
         pause_delay_cnt <= 0;
         visual_rx_valid_current <= WAIT_FOR_RX_VALID101;
      end
      else
      begin
         dqs_pause <= visual_dqs_pause_next;
         pause_delay_cnt <= visual_pause_delay_cnt_next;
         visual_rx_valid_current <= visual_rx_valid_next;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :reg_rxvalid_wait_done
 
      if (reset_n == 1'b0)
      begin
         rxvalid_wait_done_reg <= 1'b0;
      end
      else
      begin
         rxvalid_wait_done_reg <= rxvalid_wait_done;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_data_bad
 
      if (reset_n == 1'b0)
      begin
         data_gone_bad <= 'h0;
      end
      else
      begin
         if (reset_data_gone_bad == 1'b1)
         begin
            data_gone_bad <= 'h0;
         end
         else
         begin
            if (start_bad_data_check == 1'b1)
            begin
               if (dfi_rddata_valid_reg == 1'b1)
               begin
                  data_gone_bad <= (data_gone_bad | db7_to_0);
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_dqs_delays
 
      if (reset_n == 1'b0)
      begin
         dqs_delays_0 <= 8'h0;
         dqs_delays_1 <= 8'h0;
      end
      else
      begin
         if (rank0_sel == 1'b1)
         begin
            if (rd_dqs_load == 1'b1)
            begin
               dqs_delays_0 <= 8'h0;
            end
            else
            begin
               if (rd_dqs_move == 1'b1)
               begin
                  dqs_delays_0 <= dqs_delays_0 + 1;
               end
            end
         end
         else
         begin
            if (rd_dqs_load == 1'b1)
            begin
               dqs_delays_1 <= 8'h0;
            end
            else
            begin
               if (rd_dqs_move == 1'b1)
               begin
                  dqs_delays_1 <= dqs_delays_1 + 1;
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :dfi_rddata_val_reg
 
      if (reset_n == 1'b0)
      begin
         dfi_rddata_valid_reg <= 1'b0;
      end
      else
      begin
         dfi_rddata_valid_reg <= dfi_rddata_valid;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_0
 
      if (reset_n == 1'b0)
      begin
         delta_delay_0 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_0 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_0 <= delta_delay_0 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[0] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_0 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_1
 
      if (reset_n == 1'b0)
      begin
         delta_delay_1 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_1 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_1 <= delta_delay_1 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[1] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_1 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_2
 
      if (reset_n == 1'b0)
      begin
         delta_delay_2 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_2 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_2 <= delta_delay_2 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[2] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_2 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_3
 
      if (reset_n == 1'b0)
      begin
         delta_delay_3 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_3 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_3 <= delta_delay_3 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[3] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_3 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_4
 
      if (reset_n == 1'b0)
      begin
         delta_delay_4 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_4 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_4 <= delta_delay_4 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[4] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_4 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_5
 
      if (reset_n == 1'b0)
      begin
         delta_delay_5 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_5 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_5 <= delta_delay_5 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[5] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_5 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_6
 
      if (reset_n == 1'b0)
      begin
         delta_delay_6 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_6 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_6 <= delta_delay_6 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[6] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_6 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Record_Delta_delay_7
 
      if (reset_n == 1'b0)
      begin
         delta_delay_7 <= 8'h0;
      end
      else
      begin
         if (reset_delta == 1'b1)
         begin
            delta_delay_7 <= 8'h0;
         end
         else
         begin
            if (record_extra_dq_delays == 1'b1)
            begin
               delta_delay_7 <= delta_delay_7 + delay_cnt;
            end
            else
            begin
               if (record_delta_delays == 1'b1)
               begin
                  if (data_gone_bad[7] == 1'b1)
                  begin
                  end
                  else
                  begin
                     delta_delay_7 <= delay_cnt;
                  end
               end
            end
         end
      end
   end
 
 
// AS: Added async process for timing reasons (apb_data_out should be on PCLK, gets synced in another block)
always @(*)
begin
  case (apb_addr[4:0])
    5'b00000 :
    begin
      apb_data_out <= dq_dqs_error_done;
    end

    5'b00001 :
    begin
      apb_data_out <= ils_0;
    end

    5'b00010 :
    begin
      apb_data_out <= ils_1;
    end

    5'b00011 :
    begin
      apb_data_out <= irs_0;
    end

    5'b00100 :
    begin
      apb_data_out <= irs_1;
    end

    5'b00101 :
    begin
      apb_data_out <= dq_dqs_state;
    end

    5'b00110 :
    begin
      apb_data_out <= delta_delay_0;
    end

    5'b00111 :
    begin
      apb_data_out <= delta_delay_1;
    end

    5'b01000 :
    begin
      apb_data_out <= delta_delay_2;
    end

    5'b01001 :
    begin
      apb_data_out <= delta_delay_3;
    end

    5'b01010 :
    begin
      apb_data_out <= delta_delay_4;
    end

    5'b01011 :
    begin
      apb_data_out <= delta_delay_5;
    end

    5'b01100 :
    begin
      apb_data_out <= delta_delay_6;
    end

    5'b01101 :
    begin
      apb_data_out <= delta_delay_7;
    end

    5'b01110 :
    begin
      apb_data_out <= init_delay;
    end

    5'b01111 :
    begin
      apb_data_out <= dqs_delays_0;
    end

    5'b10000 :
    begin
      apb_data_out <= dqs_delays_1;
    end

    5'b10001 :
    begin
      apb_data_out <= bit_width;
    end

    5'b10010 :
    begin
      apb_data_out <= initlDqs_2_mid_0;
    end

    5'b10011 :
    begin
      apb_data_out <= initlDqs_2_mid_1;
    end

    5'b10100 :
    begin
      apb_data_out <= mid_2_initlDqs_0;
    end

    5'b10101 :
    begin
      apb_data_out <= mid_2_initlDqs_1;
    end

    5'b10110 :
    begin
      apb_data_out <= stw_2_initlDqs_0;
    end

    5'b10111 :
    begin
      apb_data_out <= stw_2_initlDqs_1;
    end

    5'b11000 :
    begin
      apb_data_out <= initlDqs_2_stw_0;
    end

    5'b11001 :
    begin
      apb_data_out <= initlDqs_2_stw_1;
    end
  endcase

end
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :apb_read
 
      if (reset_n == 1'b0)
      begin
         apb_clear_error <= 0;
      end
      else
      begin
        // AS: keep the clear error
        if (read_access == 1 && apb_addr[4:0] == 5'b00000)
        begin
           apb_clear_error <= 1;
        end
        else
        begin
          apb_clear_error <= 0;
        end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :apb_dqs_error_read
 
      if (reset_n == 1'b0)
      begin
         dqs_out_of_range_error_0 <= 0;
         dqs_out_of_range_error_1 <= 0;
      end
      else
      begin
         if (dqs_set_error == 1'b1)
         begin
            if (rank0_sel == 1)
            begin
               dqs_out_of_range_error_0 <= 1;
            end
            else
            begin
               dqs_out_of_range_error_1 <= 1;
            end
         end
         else
         begin
            if (apb_clear_error == 1'b1)
            begin
               dqs_out_of_range_error_0 <= 0;
               dqs_out_of_range_error_1 <= 0;
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :dq_apb_error_read
 
      if (reset_n == 1'b0)
      begin
         dq_out_of_range_error <= 0;
      end
      else
      begin
         if (dq_set_error == 1'b1)
         begin
            dq_out_of_range_error <= 1;
         end
         else
         begin
            if (apb_clear_error == 1'b1)
            begin
               dq_out_of_range_error <= 0;
            end
         end
      end
   end
 
 
 
   // Combinational process
   //always  @(reset_n or hold_fifo_block_cnt or rd_dqs_load or rd_dqs_move or dqs_pause or visual_Lane_Fifo_Protect_current)
   always  @(hold_fifo_block_cnt or rd_dqs_load or rd_dqs_move or dqs_pause or visual_Lane_Fifo_Protect_current)
   begin : Lane_Fifo_Protect_comb
      dq_dqs_block_fifo <= 1'b0;
      visual_hold_fifo_block_cnt_next <= hold_fifo_block_cnt;
 
 
//      if (reset_n == 1'b0)
//      begin
//         dq_dqs_block_fifo <= 1'b0;
//         visual_Lane_Fifo_Protect_next <= INITIAL_LFP;
//      end
//      else
//      begin
 
         case (visual_Lane_Fifo_Protect_current)
            INITIAL_LFP:
               begin
                  dq_dqs_block_fifo <= 1'b0;
                  visual_hold_fifo_block_cnt_next <= 3'h0;
                  if (rd_dqs_load || rd_dqs_move)
                  begin
                     dq_dqs_block_fifo <= 1'b1;
                     visual_Lane_Fifo_Protect_next <= WAIT_PAUSE;
                  end
                  else
                  begin
                     visual_Lane_Fifo_Protect_next <= INITIAL_LFP;
                  end
               end
 
            WAIT_HOLD_CNT:
               begin
                  dq_dqs_block_fifo <= 1'b1;
                  if (hold_fifo_block_cnt == HOLD_FB_CNT)
                  begin
                     visual_Lane_Fifo_Protect_next <= INITIAL_LFP;
                  end
                  else
                  begin
                     visual_hold_fifo_block_cnt_next <= hold_fifo_block_cnt + 1;
                     visual_Lane_Fifo_Protect_next <= WAIT_HOLD_CNT;
                  end
               end
 
            WAIT_PAUSE:
               begin
                  dq_dqs_block_fifo <= 1'b1;
                  if (dqs_pause)
                  begin
                     visual_Lane_Fifo_Protect_next <= WAIT_HOLD_CNT;
                  end
                  else
                  begin
                     visual_Lane_Fifo_Protect_next <= WAIT_PAUSE;
                  end
               end
 
            default:
               begin
                  visual_Lane_Fifo_Protect_next <= INITIAL_LFP;
               end
         endcase
//      end
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : Lane_Fifo_Protect
 
      if (reset_n == 1'b0)
      begin
         hold_fifo_block_cnt <= 3'h0;
         visual_Lane_Fifo_Protect_current <= INITIAL_LFP;
      end
      else
      begin
         hold_fifo_block_cnt <= visual_hold_fifo_block_cnt_next;
         visual_Lane_Fifo_Protect_current <= visual_Lane_Fifo_Protect_next;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :Reg_db0_db7
 
      if (reset_n == 1'b0)
      begin
         db0_reg <= 1'b0;
         db1_reg <= 1'b0;
         db2_reg <= 1'b0;
         db3_reg <= 1'b0;
         db4_reg <= 1'b0;
         db5_reg <= 1'b0;
         db6_reg <= 1'b0;
         db7_reg <= 1'b0;
      end
      else
      begin
         db0_reg <= db0;
         db1_reg <= db1;
         db2_reg <= db2;
         db3_reg <= db3;
         db4_reg <= db4;
         db5_reg <= db5;
         db6_reg <= db6;
         db7_reg <= db7;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :reg_mid_2_initDqs
 
      if (reset_n == 1'b0)
      begin
         mid_2_initlDqs_reg <= 'h0;
      end
      else
      begin
         mid_2_initlDqs_reg <= mid_2_initlDqs;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :reg_mov7_to_0
 
      if (reset_n == 1'b0)
      begin
         mov7_to_0_reg <= 'h0;
      end
      else
      begin
         mov7_to_0_reg <= mov7_to_0;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :reg_irs_ils
 
      if (reset_n == 1'b0)
      begin
         irs_reg <= 'h0;
         ils_reg <= 'h0;
      end
      else
      begin
         irs_reg <= irs;
         ils_reg <= ils;
      end
   end
 
   //assign  data_dq0 = dfi_rddata[7:0];
   //assign  data_dq1 = dfi_rddata[15:8];
   //assign  data_dq2 = dfi_rddata[23:16];
   //assign  data_dq3 = dfi_rddata[31:24];
   //assign  data_dq4 = dfi_rddata[39:32];
   //assign  data_dq5 = dfi_rddata[47:40];
   //assign  data_dq6 = dfi_rddata[55:48];
   //assign  data_dq7 = dfi_rddata[63:56];
 
   assign data_dq0={dfi_rddata[56],dfi_rddata[48],dfi_rddata[40],dfi_rddata[32],dfi_rddata[24],dfi_rddata[16],dfi_rddata[8],dfi_rddata[0]};
   assign data_dq1={dfi_rddata[57],dfi_rddata[49],dfi_rddata[41],dfi_rddata[33],dfi_rddata[25],dfi_rddata[17],dfi_rddata[9],dfi_rddata[1]};
   assign data_dq2={dfi_rddata[58],dfi_rddata[50],dfi_rddata[42],dfi_rddata[34],dfi_rddata[26],dfi_rddata[18],dfi_rddata[10],dfi_rddata[2]};
   assign data_dq3={dfi_rddata[59],dfi_rddata[51],dfi_rddata[43],dfi_rddata[35],dfi_rddata[27],dfi_rddata[19],dfi_rddata[11],dfi_rddata[3]};
   assign data_dq4={dfi_rddata[60],dfi_rddata[52],dfi_rddata[44],dfi_rddata[36],dfi_rddata[28],dfi_rddata[20],dfi_rddata[12],dfi_rddata[4]};
   assign data_dq5={dfi_rddata[61],dfi_rddata[53],dfi_rddata[45],dfi_rddata[37],dfi_rddata[29],dfi_rddata[21],dfi_rddata[13],dfi_rddata[5]};
   assign data_dq6={dfi_rddata[62],dfi_rddata[54],dfi_rddata[46],dfi_rddata[38],dfi_rddata[30],dfi_rddata[22],dfi_rddata[14],dfi_rddata[6]};
   assign data_dq7={dfi_rddata[63],dfi_rddata[55],dfi_rddata[47],dfi_rddata[39],dfi_rddata[31],dfi_rddata[23],dfi_rddata[15],dfi_rddata[7]};
 
   assign  db0 = |(training_pattern ^ data_dq0); // data is bad if any bit mismatches
   assign  db1 = |(training_pattern ^ data_dq1);
   assign  db2 = |(training_pattern ^ data_dq2);
   assign  db3 = |(training_pattern ^ data_dq3);
   assign  db4 = |(training_pattern ^ data_dq4);
   assign  db5 = |(training_pattern ^ data_dq5);
   assign  db6 = |(training_pattern ^ data_dq6);
   assign  db7 = |(training_pattern ^ data_dq7);
   assign db7_to_0 = (pinselect_8 == 1) ? {db7_reg, db6_reg, db5_reg, db4_reg, db3_reg, db2_reg, db1_reg, db0_reg} : {4'h0, db3_reg, db2_reg, db1_reg, db0_reg};
 
   assign  mov0 = (delay_cnt >= delta_delay_0)  ? 0 : 1;
   assign  mov1 = (delay_cnt >= delta_delay_1)  ? 0 : 1;
   assign  mov2 = (delay_cnt >= delta_delay_2)  ? 0 : 1;
   assign  mov3 = (delay_cnt >= delta_delay_3)  ? 0 : 1;
   assign  mov4 = (delay_cnt >= delta_delay_4)  ? 0 : 1;
   assign  mov5 = (delay_cnt >= delta_delay_5)  ? 0 : 1;
   assign  mov6 = (delay_cnt >= delta_delay_6)  ? 0 : 1;
   assign  mov7 = (delay_cnt >= delta_delay_7)  ? 0 : 1;
   assign  mov7_to_0 = (pinselect_8 == 1) ? {mov7, mov6, mov5, mov4, mov3, mov2, mov1, mov0} : {4'b0000, mov3, mov2, mov1, mov0};
 
   assign dq_dqs_error_done = {4'b0000, dq_alignment_done, dq_out_of_range_error, dqs_out_of_range_error_1, dqs_out_of_range_error_0};
 
   assign dq_dqs_state = visual_dq_dqs_optimisation_next;
 
   assign irs = initlDqsOrStw_2_endw +1; // Initial Right-hand side; This is the initial window size to the right of DQS, i.e. either that from the initial DQS position to the end of window, or start to end window if starting in bad data
   assign ils = bit_width - irs; // Initial Left-hand side. This is the initial window size to the left of the DQS
   assign bit_width_div2 = (bit_width >> 1);
 
   assign initlDqsOrStw_2_thresh = VALID_DATA_THRESHOLD -1;
 
   assign initlDqs_2_mid = initlDqs_2_stw + initlDqsOrStw_2_endw - bit_width_div2; // Initial dqs postion to the calculated mid point of the data window
   assign mid_2_initlDqs = (bit_width_div2 + bit_width[0]) - irs_reg; // Midpoint to initial dqs position in the case where the dqs starts on the RHS
   assign mid_2_initlDqs_div2 = mid_2_initlDqs_reg >> 1;
   assign irs_gt_ils = (irs_reg > ils_reg);
   assign dq_moves_rqd = rank0_sel ? mid_2_initlDqs_reg : mid_2_initlDqs_div2; // Number of dq moves to center the dqs. Used when the initial dqs postion is to the RHS of the data window
   assign dqs_moves_rqd = initlDqs_2_mid; // Number of dqs moves required to center the dqs. Unsed when the dqs starts on the LHS of the data window or in bad data
   assign center_with_dqs = irs_gt_ils; // Flag used to indicate if the dq or dqs must move to center the dqs
 
   assign delay_exceed_max_dqs = delay_cnt >= MAX_DQS_MOVE_CNT;
   assign sm_dqs_oor = dqs_out_of_range | delay_exceed_max_dqs; // Asserted when the number of moves on the dqs results in a dqs oor error or it exceeds 255
   assign delay_exceed_max_dq = (delay_cnt >= MAX_DQ_MOVE_CNT);
   assign sm_dq_oor = (|dq_out_of_range[7:0]) | delay_exceed_max_dq;  // Asserted when the number of moves on the dqs results in a dq oor error or it exceeds 255
 
   assign stw_2_initlDqs = start_dqs_in_bad_data ? 0 : init_delay - VALID_DATA_THRESHOLD ;
 
   assign rd_dq_direction = 'h0;
   assign rd_dqs_direction = 1'b0;
   assign rd_dq_load = (pinselect_8 == 1) ? pre_rd_dq_load[7:0] : {4'b0000, pre_rd_dq_load[3:0]};
   assign rd_dq_move = (pinselect_8 == 1) ? pre_rd_dq_move[7:0] : {4'b0000, pre_rd_dq_move[3:0]};
   assign no_of_pins = (pinselect_8 == 1) ? 8 : 4;
 
   assign pin_mask = (no_of_pins == 'h8) ? 8'hff : 8'h0f;
 
 
endmodule

