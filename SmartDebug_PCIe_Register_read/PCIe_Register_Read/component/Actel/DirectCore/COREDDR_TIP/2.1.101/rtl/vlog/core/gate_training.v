//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                       
//--    Crevinn Teoranta                                                                                                                                                                                                
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                       
//-- Author      : $Author:      gianl                                                                                                                                                              
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                                                                       
//-- Revision    : $Revision: 1.11 $                                                                                                                                                                                                       
//-- Location    : $URL: $                                                                                                                                                                                                       
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                       
//--------------------------------------------------
 
 
module gate_training (
                            //  input ports
                            apb_addr,   //  APB address to read the registers.
                            burst_detect_in,   //  Burst detect signal coming from the burst detect circuit.
                            dfi_rddata_cs_0_n,   //  Chip select from NWL. Active low. Used during normal ops.
                            //  Chip select from NWL. Active low.
                            dfi_rddata_cs_1_n,   //  Chip select from NWL. Active low. Used during normal ops.
                            dfi_rddata_en_p0,   //  Rddata_en wires coming from the NWL, phased.
                            dfi_rddata_en_p1,   //  Rddata_en wires coming from the NWL, phased.
                            dfi_rddata_en_p2,   //  Rddata_en wires coming from the NWL, phased.
                            dfi_rddata_en_p3,   //  Rddata_en wires coming from the NWL, phased.
                            dfi_rdlvl_cs_0_n,   //  Wire coming from the NWL to signify which chip(rank) to train. Active low.
                            dfi_rdlvl_cs_1_n,   //  Wire coming from the NWL to signify which chip(rank) to train. Active low.
                            dfi_rdlvl_gate_en,   //  Wire coming from the NWL interface. Signals the training IP to start gate training.
                            read_access,   //  Signifies if the read is directed to the state machine.
                            reset_n,   //  Asynchronous reset. Active low.
                            sclk,   //  System clock, 200MHz.
                            txdly_out_of_range,   //  Out of range signal from the txdly delay line of the IOG.
 
                            //  output ports
                            apb_data_out,   //  Read data to APB.
                            clk_sel_out,   //  The clk_sel setting output.
                            dfi_rdlvl_resp,   //  Wire going to the NWL model to signify completion of gate training.
                            gt_pause,   //  Pause signal going out to pause the FIFO when changing clk_sel settings.
                            iog_rddata_en_p0_n,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p0_p,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p1_n,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p1_p,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p2_n,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p2_p,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p3_n,   //  Phased rddata_en outputs. This is used to move the read signal.
                            iog_rddata_en_p3_p,   //  Phased rddata_en outputs. This is used to move the read signal.
                            select_rank_1_gt,   //  Signifies which rank is currently selected by gate training.
                            txdly_direction,   //  Direction signal going to the txdly delay line. Tied to 1(forward).
                            txdly_load,   //  Load signal going to the txdly delay line.
                            txdly_move,   //  Move signal going to the txdly delay line.
                            gt_error,  //  Output signal that signifies an error, asserted with the response.
                            MIN_READS_THRESHOLD
                            );

// AS: changed MIN_READS_THRESHOLD to input instead of parameter                            
//   parameter        MIN_READS_THRESHOLD              = 10'h0FF;           //  The amount of rddata_en cycles the state machine waits before it polls for the burst detect
   parameter        MOVE_WAIT_DURATION               = 14;           //  The amount of sclks to wait after a rddata_en_p3 before asserting move/load txdly or increment steps_180 and changing clk_sel
   parameter        MAX_STEPS_180                    = 15;          //  Maxmum number of allowable 180 degree moves the gate training performs when checking for burst_detect.
   parameter        MAX_TXDLY_MOVE                   = 255;         //  Maximum number of txdly move(in taps) that the gate training will go through.
   parameter        PAUSE_WAIT_DURATION              = 14;           //  Number of sclk cycles wait after a move/load of the txdlys before pausing
   parameter        TXDLY_THRESHOLD                  = 1;   //Minimum value for TXDLY to be accepted as valid
   parameter        TXDLY_MAX                        = 50;
   parameter        READ_COUNT_THRESHOLD             = 10'h0FF;   //Number of reads to check after setting output answer
//  input ports
   input     [15:0] apb_addr;
   wire      [15:0] apb_addr;
   input            burst_detect_in;
   wire             burst_detect_in;
   input            dfi_rddata_cs_0_n;
   wire             dfi_rddata_cs_0_n;
   input            dfi_rddata_cs_1_n;
   wire             dfi_rddata_cs_1_n;
   input            dfi_rddata_en_p0;
   wire             dfi_rddata_en_p0;
   input            dfi_rddata_en_p1;
   wire             dfi_rddata_en_p1;
   input            dfi_rddata_en_p2;
   wire             dfi_rddata_en_p2;
   input            dfi_rddata_en_p3;
   wire             dfi_rddata_en_p3;
   input            dfi_rdlvl_cs_0_n;
   wire             dfi_rdlvl_cs_0_n;
   input            dfi_rdlvl_cs_1_n;
   wire             dfi_rdlvl_cs_1_n;
   input            dfi_rdlvl_gate_en;
   wire             dfi_rdlvl_gate_en;
   input            read_access;
   wire             read_access;
   input            reset_n;
   wire             reset_n;
   input            sclk;
   wire             sclk;
   input            txdly_out_of_range;
   wire             txdly_out_of_range;
//  output ports
   output    [7:0]  apb_data_out;
   reg       [7:0]  apb_data_out;
   output    [2:0]  clk_sel_out;
   reg       [2:0]  clk_sel_out;
   output           dfi_rdlvl_resp;
   reg              dfi_rdlvl_resp;
   output           gt_pause;
   reg              gt_pause;
   output           iog_rddata_en_p0_n;
   reg              iog_rddata_en_p0_n;
   output           iog_rddata_en_p0_p;
   reg              iog_rddata_en_p0_p;
   output           iog_rddata_en_p1_n;
   reg              iog_rddata_en_p1_n;
   output           iog_rddata_en_p1_p;
   reg              iog_rddata_en_p1_p;
   output           iog_rddata_en_p2_n;
   reg              iog_rddata_en_p2_n;
   output           iog_rddata_en_p2_p;
   reg              iog_rddata_en_p2_p;
   output           iog_rddata_en_p3_n;
   reg              iog_rddata_en_p3_n;
   output           iog_rddata_en_p3_p;
   reg              iog_rddata_en_p3_p;
   output           select_rank_1_gt;
   reg              select_rank_1_gt;
   output           txdly_direction;
   wire             txdly_direction;
   output           txdly_load;
   reg              txdly_load;
   output           txdly_move;
   reg              txdly_move;
   output           gt_error;
   reg              gt_error;
   input [9:0]      MIN_READS_THRESHOLD;
//  local signals
   reg              apb_clear_error;                                //  A flag used to to clear the error register after a read.
   wire             burst_detect;                                   //  Burst detect signal used by the training algorithm.
   reg              burst_detect_s;                                 //  Delayed burst detect signal used by the training algorithm.
   reg              burst_detect_ss;                                //  Delayed burst detect signal used by the training algorithm.
   reg       [3:0]  clk_pause_cnt;                                  //  Counter used with PAUSE_WAIT_DURATION
   reg       [1:0]  clk_sel;                                        //  The clk_sel setting passed during training.
   reg       [1:0]  clk_sel_answer;                                 //  Stores the answer for the clk_sel selection.
   reg       [1:0]  clk_sel_r0;                                     //  The correct clk_sel setting stored for rank 0.
   reg       [1:0]  clk_sel_r1;                                     //  The correct clk_sel setting stored for rank 1.
   reg       [9:0]  en_wait_cnt;                                    //  A counter used to follow the amount of rddata_en cycles and determine if there was a burst_detect or not.
   wire      [5:0]  error_comb;                                     //  A signal containing the concatenated values of the errors.
   wire      [4:0]  gt_state;                                       //  The current state of the state machine.
   reg              ignore0;                                        //  A flag used when determining the lowest, second lowest, and third lowest total delays.
   reg              ignore1;                                        //  A flag used when determining the lowest, second lowest, and third lowest total delays.
   reg              ignore2;                                        //  A flag used when determining the lowest, second lowest, and third lowest total delays.
   reg              ignore3;                                        //  A flag used when determining the lowest, second lowest, and third lowest total delays.
   reg       [1:0]  initial_burst_error;                            //  Error register which signifies if there was an initial burst error. Bit 0 is for rank 0 and bit 1 is for rank 1.
   reg       [1:0]       loop_cnt;                                       //  Maximum count is now 1: initially this was 2 but keeping the loop_cnt name for potential future changes. There are only 2 stages now.
   reg       [3:0]  lowest_180_delay;                               //  A variable used to store the current 180 move count of the current lowest clk_sel setting.
   reg       [1:0]  lowest_clk_sel;                                 //  A variable which stores the current clk_sel with the lowest total delay.
   reg       [7:0]  lowest_txdly_cnt;                               //  A variable used to store the current txdly move count of the current lowest clk_sel setting.
   reg       [3:0]  move_safe_counter;                              //  A counter variable used to determine when it is safe to change clk_sel, steps_180, or move/load txdly. Also used in pausing
   reg              move_safe_done;                                 //  A flag variable used to determine when it is safe to change clk_sel, steps_180, or move/load txdly. Also used in pausing
   reg       [1:0]  no_burst_detect_error;                          //  Training error bit. bit 0 is for rank 0 and bit 1 is for rank 1.
   reg       [1:0]  oor_error;                                      //  Training error bit. bit 0 is for rank 0 and bit 1 is for rank 1.
   wire      [3:0]  phase_move_current;                             //  The amount of 180 steps that the read signal will be moved by. Used during training and normal ops.
   reg       [23:0] pre_iog_en_output;                              //  The answer calculated when calculating for the values of the phased rddata_en outputs. This is correct when dfi_rddata_en_3 = 1.
   reg       [23:0] pre_iog_en_output_registered_0;                 //  The answer calculated when calculating for the values of the phased rddata_en outputs. This is registered when dfi_rddata_en_3 = 1.
   reg       [23:0] pre_iog_en_output_registered_1;                 //  The answer calculated when calculating for the values of the phased rddata_en outputs. This is registered when dfi_rddata_en_3 = 1.
   reg       [23:0] pre_iog_en_output_registered_2;                 //  The answer calculated when calculating for the values of the phased rddata_en outputs. This is registered when dfi_rddata_en_3 = 1.
   reg              pre_iog_rddata_en_p0_n_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p0_p_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_n_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_p_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_n_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_p_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_n_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_p_0;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p0_n_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p0_p_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_n_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_p_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_n_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_p_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_n_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_p_1;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p0_n_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p0_p_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_n_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p1_p_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_n_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p2_p_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_n_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg              pre_iog_rddata_en_p3_p_2;                       //  The unregistered version of the iog_rddata_en_X_n and p outputs.
   reg       [1:0]  pre_iog_counter;                                //  Counter used for pre_iog_rddata_en generation.
   reg       [3:0]  sec_lowest_180_delay;                           //  A variable used to store the current 180 move count of the second lowest clk_sel setting.
   reg       [1:0]  sec_lowest_clk_sel;                             //  A variable which stores the current clk_sel with the second lowest total delay.
   reg       [7:0]  sec_lowest_txdly_cnt;                           //  A variable used to store the current txdly move count of the second lowest clk_sel setting.
   reg       [3:0]  set_error;                                      //  A flag used to set the error bits on the error registers.
   reg       [3:0]  steps_180;                                      //  The current amount of 180 steps that the read signal has been moved.
   reg       [3:0]  steps_180_0;                                    //  Stored values of the steps_180 that produced a burst detect for clk_sel = 0.
   reg       [3:0]  steps_180_1;                                    //  Stored values of the steps_180 that produced a burst detect for clk_sel = 1.
   reg       [3:0]  steps_180_2;                                    //  Stored values of the steps_180 that produced a burst detect for clk_sel = 2.
   reg       [3:0]  steps_180_3;                                    //  Stored values of the steps_180 that produced a burst detect for clk_sel = 3.
   reg       [3:0]  steps_180_answer;                               //  The steps_180 value for the correct selection of clk_sel.
   reg       [3:0]  steps_180_r0;                                   //  The stored value of the correct answer of steps_180 for rank 0.
   reg       [3:0]  steps_180_r1;                                   //  The stored value of the correct answer of steps_180 for rank 1.
   reg       [7:0]  txdly_0;                                        //  Stored values of the txdly moves that produced a burst detect for clk_sel = 0.
   reg       [7:0]  txdly_1;                                        //  Stored values of the txdly moves that produced a burst detect for clk_sel = 1.
   reg       [7:0]  txdly_2;                                        //  Stored values of the txdly moves that produced a burst detect for clk_sel = 2.
   reg       [7:0]  txdly_3;                                        //  Stored values of the txdly moves that produced a burst detect for clk_sel = 3.
   reg       [7:0]  txdly_cnt;                                      //  The current amount of txdly moves that were performed.
   wire             txdly_oor;                                      //  Internal out of range signal that ORs both the oor input and an comparator to the maximum amount of moves permissible.
   reg              lowest_filled;                                  //  A flag used on determining the order of the total delays of the clk_sel settings
   reg       [2:0]  no_burst_clk_sel;                               //  The last clk_sel setting that didn't produce a burst detect.
   reg       [2:0]  no_burst_cnt_r0;                                //  The stored number of clk_sel settings that didn't produce a burst detect for rank 0.
   reg       [2:0]  no_burst_cnt_r1;                                //  The stored number of clk_sel settings that didn't produce a burst detect for rank 1.
   reg       [3:0]  read_en5;                                       //  Clock selects which produced burst detects on successive steps 180s.
   reg       [7:0]  threshold;                                      //  The average of the highest and lowest recorded txdelays.
   wire      [3:0]  txdly_high;                                     //  Flags that say if the recorded txdly value for the clk_sel setting is higher than the threshold.
   reg       [7:0]  low_thresh;                                     //  The higest txdly value recorded.
   reg       [7:0]  high_thresh;                                    //  The lowest txdly value recorded.
   wire             pre_iog_rddata_en_p0_p;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p0_n;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p1_p;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p1_n;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p2_p;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p2_n;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p3_p;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   wire             pre_iog_rddata_en_p3_n;                         //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   reg              pre_iog_rddata_en_p3_n_reg;                     //  The ORed value of the unregistered versions of the iog_rddata_en_X_n and p outputs. Clocked out for the output.
   reg              steps180_1_lt_low180;                           //  Compares steps_180_1 to current lowest steps_180.
   reg              steps180_1_eq_low180;                           //  Compares steps_180_1 to current lowest steps_180.
   reg              txdly_1_lt_low_txdly_cnt;                       //  Compares txdly_1 to current lowest tdly.
   reg              steps180_2_lt_low180;                           //  Compares steps_180_2 to current lowest steps_180.
   reg              steps180_2_eq_low180;                           //  Compares steps_180_2 to current lowest steps_180.
   reg              txdly_2_lt_low_txdly_cnt;                       //  Compares txdly_2 to current lowest tdly.
   reg              steps180_3_lt_low180;                           //  Compares steps_180_3 to current lowest steps_180.
   reg              steps180_3_eq_low180;                           //  Compares steps_180_3 to current lowest steps_180.
   reg              txdly_3_lt_low_txdly_cnt;                       //  Compares txdly_3 to current lowest tdly.
   reg       [3:0]  phase_move_reg;
   reg       [4:0]  phase_move_reg_plus1;
   wire      [3:0]  phase_move_p;
   wire      [2:0]  phase_move_n;
   

 
   parameter BURST_DETECTED_180   = 5'b00000,
             CHOOSE_ANSWER        = 5'b00001,
             DEC_180              = 5'b00010,
             DET_ORDER_0          = 5'b00011,
             DET_ORDER_1          = 5'b00100,
             DET_ORDER_1_EXTEND   = 5'b00101,
             DET_ORDER_2          = 5'b00110,
             DET_ORDER_2_EXTEND   = 5'b00111,
             DET_ORDER_3          = 5'b01000,
             DET_ORDER_3_EXTEND   = 5'b01001,
             INC_180              = 5'b01010,
             INITIAL              = 5'b01011,
             INITIAL_BURST_ERROR  = 5'b01100,
             LOAD_INIT_TXDLY      = 5'b01101,
             LOAD_TXDLY_STEPS_180 = 5'b01110,
             NO_BURST_DETECTED    = 5'b01111,
             NO_BURST_ERROR       = 5'b10000,
             OOR_ERROR            = 5'b10001,
             PRE_INC_CLK_SEL      = 5'b10010,
             RESPONSE_HIGH        = 5'b10011,
             SET_OUTPUT_ANSWER    = 5'b10100,
             STORE_VALS           = 5'b10101,
             TXDLY_INC            = 5'b10110,
             TXDLY_NO_BD          = 5'b10111,
             WAIT_PRE_PAUSE_1     = 5'b11000,
             WAIT_PRE_PAUSE_2     = 5'b11001,
             WAIT_PRE_PAUSE_3     = 5'b11010,
             WAIT_READ_1          = 5'b11011,
             WAIT_READ_2          = 5'b11100;
 
 
   reg [4:0] visual_gate_training_current, visual_gate_training_next;
 
 
   parameter SCLK_1_0 = 2'b00,
             SCLK_2_0 = 2'b01,
             SCLK_3_0 = 2'b10;
 
 
   reg [1:0] visual_shim_logic_0_current, visual_shim_logic_0_next;
 
 
   parameter SCLK_1_1 = 2'b00,
             SCLK_2_1 = 2'b01,
             SCLK_3_1 = 2'b10;
 
 
   reg [1:0] visual_shim_logic_1_current, visual_shim_logic_1_next;
 
 
   parameter SCLK_1_2 = 2'b00,
             SCLK_2_2 = 2'b01,
             SCLK_3_2 = 2'b10;
 
 
   reg [1:0] visual_shim_logic_2_current, visual_shim_logic_2_next;
 
 
   parameter WAIT_FOR_RDDATA_EN_P3_1 = 1'b0,
             WAIT_SAFE_SCLKS         = 1'b1;
 
 
   reg [0:0] visual_wait_safe_move_current, visual_wait_safe_move_next;
 
   reg              visual_dfi_rdlvl_resp_next;
   reg              visual_gt_pause_next;
   reg              visual_txdly_load_next;
   reg              visual_txdly_move_next;
   reg              visual_gt_error_next;
   reg       [3:0]  visual_clk_pause_cnt_next;
   reg       [1:0]  visual_clk_sel_next;
   reg       [1:0]  visual_clk_sel_answer_next;
   reg       [1:0]  visual_clk_sel_r0_next;
   reg       [1:0]  visual_clk_sel_r1_next;
   reg       [9:0]  visual_en_wait_cnt_next;
   reg              visual_ignore0_next;
   reg              visual_ignore1_next;
   reg              visual_ignore2_next;
   reg              visual_ignore3_next;
   reg       [1:0]       visual_loop_cnt_next;
   reg       [3:0]  visual_lowest_180_delay_next;
   reg       [1:0]  visual_lowest_clk_sel_next;
   reg       [7:0]  visual_lowest_txdly_cnt_next;
   reg       [3:0]  visual_move_safe_counter_next;
   reg              visual_move_safe_done_next;
   reg       [23:0] visual_pre_iog_en_output_registered_0_next;
   reg       [23:0] visual_pre_iog_en_output_registered_1_next;
   reg       [23:0] visual_pre_iog_en_output_registered_2_next;
   reg       [3:0]  visual_sec_lowest_180_delay_next;
   reg       [1:0]  visual_sec_lowest_clk_sel_next;
   reg       [7:0]  visual_sec_lowest_txdly_cnt_next;
   reg       [3:0]  visual_set_error_next;
   reg       [3:0]  visual_steps_180_next;
   reg       [3:0]  visual_steps_180_0_next;
   reg       [3:0]  visual_steps_180_1_next;
   reg       [3:0]  visual_steps_180_2_next;
   reg       [3:0]  visual_steps_180_3_next;
   reg       [3:0]  visual_steps_180_answer_next;
   reg       [3:0]  visual_steps_180_r0_next;
   reg       [3:0]  visual_steps_180_r1_next;
   reg       [7:0]  visual_txdly_0_next;
   reg       [7:0]  visual_txdly_1_next;
   reg       [7:0]  visual_txdly_2_next;
   reg       [7:0]  visual_txdly_3_next;
   reg       [7:0]  visual_txdly_cnt_next;
   reg              visual_lowest_filled_next;
   reg       [2:0]  visual_no_burst_clk_sel_next;
   reg       [2:0]  visual_no_burst_cnt_r0_next;
   reg       [2:0]  visual_no_burst_cnt_r1_next;
   reg       [3:0]  visual_read_en5_next;
   reg       [7:0]  visual_low_thresh_next;
   reg       [7:0]  visual_high_thresh_next;
   reg              visual_steps180_1_lt_low180_next;
   reg              visual_steps180_1_eq_low180_next;
   reg              visual_txdly_1_lt_low_txdly_cnt_next;
   reg              visual_steps180_2_lt_low180_next;
   reg              visual_steps180_2_eq_low180_next;
   reg              visual_txdly_2_lt_low_txdly_cnt_next;
   reg              visual_steps180_3_lt_low180_next;
   reg              visual_steps180_3_eq_low180_next;
   reg              visual_txdly_3_lt_low_txdly_cnt_next;

    reg fuzzy;
    reg incr_fuzzy;
    reg incr_fuzzy_next;

    reg [11:0] read_count;
    reg [11:0] read_count_next;
    reg burst_detected;
    reg burst_detected_next;
    reg pause_sent;
    reg pause_sent_next;
	wire [7:0] dqsw_diff=(txdly_0>txdly_2) ? (txdly_0-txdly_2):(txdly_2-txdly_0);
	wire [7:0] dqsw270_diff=(txdly_1>txdly_3) ? (txdly_1-txdly_3):(txdly_3-txdly_1);
	

 
 
   // Combinational process
   always  @(gt_error or clk_sel or clk_sel_answer or clk_sel_r0 or clk_sel_r1 or en_wait_cnt or ignore0 or ignore1 or ignore2 or ignore3 or loop_cnt or lowest_180_delay or lowest_clk_sel or
             lowest_txdly_cnt or sec_lowest_180_delay or sec_lowest_clk_sel or sec_lowest_txdly_cnt or steps_180 or steps_180_0 or steps_180_1 or steps_180_2 or steps_180_3 or steps_180_answer or
             steps_180_r0 or steps_180_r1 or txdly_0 or txdly_1 or txdly_2 or txdly_3 or txdly_cnt or lowest_filled or no_burst_clk_sel or no_burst_cnt_r0 or no_burst_cnt_r1 or read_en5 or low_thresh or
             high_thresh or steps180_1_lt_low180 or steps180_1_eq_low180 or txdly_1_lt_low_txdly_cnt or steps180_2_lt_low180 or steps180_2_eq_low180 or txdly_2_lt_low_txdly_cnt or steps180_3_lt_low180 or
             steps180_3_eq_low180 or txdly_3_lt_low_txdly_cnt or txdly_high or move_safe_done or dfi_rdlvl_gate_en or dfi_rdlvl_cs_0_n or dfi_rdlvl_cs_1_n or txdly_oor or clk_pause_cnt or
             dfi_rddata_en_p3 or burst_detect or visual_gate_training_current or read_count or burst_detected or pause_sent or fuzzy)
   begin : gate_training_comb
      visual_dfi_rdlvl_resp_next <= 0;
      visual_gt_pause_next <= 0;
      visual_txdly_load_next <= 0;
      visual_txdly_move_next <= 0;
      visual_gt_error_next <= gt_error;
      visual_clk_pause_cnt_next <= 1;
      visual_set_error_next <= 0;
      visual_clk_sel_next <= clk_sel;
      visual_clk_sel_answer_next <= clk_sel_answer;
      visual_clk_sel_r0_next <= clk_sel_r0;
      visual_clk_sel_r1_next <= clk_sel_r1;
      visual_en_wait_cnt_next <= en_wait_cnt;
      visual_ignore0_next <= ignore0;
      visual_ignore1_next <= ignore1;
      visual_ignore2_next <= ignore2;
      visual_ignore3_next <= ignore3;
      visual_loop_cnt_next <= loop_cnt;
      visual_lowest_180_delay_next <= lowest_180_delay;
      visual_lowest_clk_sel_next <= lowest_clk_sel;
      visual_lowest_txdly_cnt_next <= lowest_txdly_cnt;
      visual_sec_lowest_180_delay_next <= sec_lowest_180_delay;
      visual_sec_lowest_clk_sel_next <= sec_lowest_clk_sel;
      visual_sec_lowest_txdly_cnt_next <= sec_lowest_txdly_cnt;
      visual_steps_180_next <= steps_180;
      visual_steps_180_0_next <= steps_180_0;
      visual_steps_180_1_next <= steps_180_1;
      visual_steps_180_2_next <= steps_180_2;
      visual_steps_180_3_next <= steps_180_3;
      visual_steps_180_answer_next <= steps_180_answer;
      visual_steps_180_r0_next <= steps_180_r0;
      visual_steps_180_r1_next <= steps_180_r1;
      visual_txdly_0_next <= txdly_0;
      visual_txdly_1_next <= txdly_1;
      visual_txdly_2_next <= txdly_2;
      visual_txdly_3_next <= txdly_3;
      visual_txdly_cnt_next <= txdly_cnt;
      visual_lowest_filled_next <= lowest_filled;
      visual_no_burst_clk_sel_next <= no_burst_clk_sel;
      visual_no_burst_cnt_r0_next <= no_burst_cnt_r0;
      visual_no_burst_cnt_r1_next <= no_burst_cnt_r1;
      visual_read_en5_next <= read_en5;
      visual_low_thresh_next <= low_thresh;
      visual_high_thresh_next <= high_thresh;
      visual_steps180_1_lt_low180_next <= steps180_1_lt_low180;
      visual_steps180_1_eq_low180_next <= steps180_1_eq_low180;
      visual_txdly_1_lt_low_txdly_cnt_next <= txdly_1_lt_low_txdly_cnt;
      visual_steps180_2_lt_low180_next <= steps180_2_lt_low180;
      visual_steps180_2_eq_low180_next <= steps180_2_eq_low180;
      visual_txdly_2_lt_low_txdly_cnt_next <= txdly_2_lt_low_txdly_cnt;
      visual_steps180_3_lt_low180_next <= steps180_3_lt_low180;
      visual_steps180_3_eq_low180_next <= steps180_3_eq_low180;
      visual_txdly_3_lt_low_txdly_cnt_next <= txdly_3_lt_low_txdly_cnt;
 
      burst_detected_next<=burst_detected; //ALISTER
      read_count_next<=read_count; //ALISTER
      pause_sent_next<=pause_sent; //ALISTER
      incr_fuzzy_next <=0;
 
      case (visual_gate_training_current)
         BURST_DETECTED_180:
            begin
 
               //  When a burst_detect is seen and the steps_180 setting is 0 i.e. initial then exit with an error
               //  If not, then go reduce the steps_180 by one(and the phase_move) and proceed to the next step
               if (steps_180 == 0)
               begin
                  visual_gate_training_next <= INITIAL_BURST_ERROR;
               end
               else
               begin
                  visual_gate_training_next <= DEC_180;
               end
            end
 
         CHOOSE_ANSWER:
            begin
 
               //  Choose the correct setting
               //  The correct answer will depend on which of the two options have the lowest txdly setting
               //  The second lowest and third lowest settings are compared and whichever one has
               //  the lower txdly setting is chosen.
               if (loop_cnt==fuzzy+1)
               begin
                  if (txdly_high[lowest_clk_sel])
                  begin
                     visual_clk_sel_answer_next <= lowest_clk_sel;
                     visual_steps_180_answer_next <= lowest_180_delay;//AL
                     visual_gate_training_next <= SET_OUTPUT_ANSWER;
                  end
                  else
                  begin
                     visual_clk_sel_answer_next <= lowest_clk_sel;
                     visual_steps_180_answer_next <= lowest_180_delay;
                     visual_gate_training_next <= SET_OUTPUT_ANSWER;
                  end
               end
               else
               begin
                  visual_ignore0_next <= ignore0|(lowest_clk_sel == 0);
                  visual_ignore1_next <= ignore1|(lowest_clk_sel == 1);
                  visual_ignore2_next <= ignore2|(lowest_clk_sel == 2);
                  visual_ignore3_next <= ignore3|(lowest_clk_sel == 3);
                  visual_loop_cnt_next <= loop_cnt+1;
                  visual_gate_training_next <= DET_ORDER_0;
               end
            end
 
         DEC_180:
            begin
 
               //  Burst detect was seen, reduce steps_180/phase move by 1
               if (move_safe_done)
               begin
                  visual_steps_180_next <= steps_180 - 1;
                  visual_gt_pause_next <= 1;
                  visual_gate_training_next <= WAIT_READ_2;
               end
               else
               begin
                  visual_gate_training_next <= DEC_180;
               end
            end
 
         DET_ORDER_0:
            begin
 
               //  Determine order Phase 0
               //  Check if the stored values for clk_sel setting 0 are to be ignored. It is ignored if it was
               //  evaluated already, if it wasn't - then store this as the current lowest setting.
               //  If it has already been evaluated i.e. ignore0 = 1, then skip this state and move on to the next one.
               if (ignore0 || (no_burst_clk_sel == 0))
               begin
                  visual_gate_training_next <= DET_ORDER_1;
               end
               else
               begin
                  /* if (txdly_0 < TXDLY_THRESHOLD | txdly_0 > TXDLY_MAX | dqsw_diff > 15) begin
                  visual_lowest_clk_sel_next <= 0;
                  visual_lowest_txdly_cnt_next <= txdly_0;
                  visual_lowest_180_delay_next <= 15;
                  visual_lowest_filled_next <= 1;
                  visual_gate_training_next <= DET_ORDER_1;
                  end
                  else begin */
                  visual_lowest_clk_sel_next <= 0;
                  visual_lowest_txdly_cnt_next <= txdly_0;
                  visual_lowest_180_delay_next <= steps_180_0;
                  visual_lowest_filled_next <= 1;
                  visual_gate_training_next <= DET_ORDER_1;
                  /* end */
               end
            end
 
         DET_ORDER_1:
            begin
 
               //  Determine order Phase 1
               //  Check if the stored values for clk_sel setting 1 we already evaluated i.e. ingore1 != 0
               //  If it hasn't been evaluated yet, then check if there is already something stored on the lowest_clk_sel
               //  If there's already an entry, compare it to this and determine which is lower
               //  Update the values depending on which has the lower total delay
               visual_steps180_1_lt_low180_next <= (steps_180_1 < lowest_180_delay);
               visual_steps180_1_eq_low180_next <= (steps_180_1 == lowest_180_delay);
               visual_txdly_1_lt_low_txdly_cnt_next <= (txdly_1 < lowest_txdly_cnt);
               if (ignore1 || (no_burst_clk_sel == 1))
               begin
                  visual_gate_training_next <= DET_ORDER_2;
               end
               else
               begin
                  //if (txdly_1 < TXDLY_THRESHOLD | txdly_1 | dqsw270_diff > 15)    visual_gate_training_next <= DET_ORDER_2;
                  //else                              visual_gate_training_next <= DET_ORDER_1_EXTEND;
				  visual_gate_training_next <= DET_ORDER_1_EXTEND;
               end
            end
 
         DET_ORDER_1_EXTEND:
            begin
               if (lowest_filled)
               begin
                  if (steps180_1_lt_low180)
                  begin
                     visual_lowest_clk_sel_next <= 1;
                     visual_lowest_txdly_cnt_next <= txdly_1;
                     visual_lowest_180_delay_next <= steps_180_1;
                     visual_lowest_filled_next <= 1;
                     visual_gate_training_next <= DET_ORDER_2;
                  end
                  else if (steps180_1_eq_low180 && txdly_1_lt_low_txdly_cnt)
                  begin
                     visual_lowest_clk_sel_next <= 1;
                     visual_lowest_txdly_cnt_next <= txdly_1;
                     visual_lowest_180_delay_next <= steps_180_1;
                     visual_lowest_filled_next <= 1;
                     visual_gate_training_next <= DET_ORDER_2;
                  end
                  else
                  begin
                     visual_gate_training_next <= DET_ORDER_2;
                  end
               end
               else
               begin
                  visual_lowest_clk_sel_next <= 1;
                  visual_lowest_txdly_cnt_next <= txdly_1;
                  visual_lowest_180_delay_next <= steps_180_1;
                  visual_lowest_filled_next <= 1;
                  visual_gate_training_next <= DET_ORDER_2;
               end
            end
 
         DET_ORDER_2:
            begin
 
               //  Determine order Phase 2
               //  Check if the stored values for clk_sel setting 2 we already evaluated i.e. ingore2 != 0
               //  If it hasn't been evaluated yet, then check if there is already something stored on the lowest_clk_sel
               //  If there's already an entry, compare it to this and determine which is lower
               //  Update the values depending on which has the lower total delay
               visual_steps180_2_lt_low180_next <= (steps_180_2 < lowest_180_delay);
               visual_steps180_2_eq_low180_next <= (steps_180_2 == lowest_180_delay);
               visual_txdly_2_lt_low_txdly_cnt_next <= (txdly_2 < lowest_txdly_cnt);
               if (ignore2 || (no_burst_clk_sel == 2))
               begin
                  visual_gate_training_next <= DET_ORDER_3;
               end
               else
               begin
                  //if (txdly_2 < TXDLY_THRESHOLD | txdly_2 > TXDLY_MAX | dqsw_diff > 15)    visual_gate_training_next <= DET_ORDER_3;
                  //else                              visual_gate_training_next <= DET_ORDER_2_EXTEND;
				  visual_gate_training_next <= DET_ORDER_2_EXTEND;
               end
            end
 
         DET_ORDER_2_EXTEND:
            begin
               if (lowest_filled)
               begin
                  if (steps180_2_lt_low180)
                  begin
                     visual_lowest_clk_sel_next <= 2;
                     visual_lowest_txdly_cnt_next <= txdly_2;
                     visual_lowest_180_delay_next <= steps_180_2;
                     visual_lowest_filled_next <= 1;
                     visual_gate_training_next <= DET_ORDER_3;
                  end
                  else if (steps180_2_eq_low180 && txdly_2_lt_low_txdly_cnt)
                  begin
                     visual_lowest_clk_sel_next <= 2;
                     visual_lowest_txdly_cnt_next <= txdly_2;
                     visual_lowest_180_delay_next <= steps_180_2;
                     visual_lowest_filled_next <= 1;
                     visual_gate_training_next <= DET_ORDER_3;
                  end
                  else
                  begin
                     visual_gate_training_next <= DET_ORDER_3;
                  end
               end
               else
               begin
                  visual_lowest_clk_sel_next <= 2;
                  visual_lowest_txdly_cnt_next <= txdly_2;
                  visual_lowest_180_delay_next <= steps_180_2;
                  visual_lowest_filled_next <= 1;
                  visual_gate_training_next <= DET_ORDER_3;
               end
            end
 
         DET_ORDER_3:
            begin
 
               //  Determine order Phase 3
               //  Check if the stored values for clk_sel setting 3 we already evaluated i.e. ingore3 != 0
               //  If it hasn't been evaluated yet, then check if there is already something stored on the lowest_clk_sel
               //  If there's already an entry, compare it to this and determine which is lower
               //  Update the values depending on which has the lower total delay
               visual_steps180_3_lt_low180_next <= (steps_180_3 < lowest_180_delay);
               visual_steps180_3_eq_low180_next <= (steps_180_3 == lowest_180_delay);
               visual_txdly_3_lt_low_txdly_cnt_next <= (txdly_3 < lowest_txdly_cnt);
               if (ignore3 || (no_burst_clk_sel == 3))
               begin
                  visual_lowest_filled_next <= 0;
                  visual_gate_training_next <= CHOOSE_ANSWER;
               end
               else
               begin
                  //if (txdly_3 < TXDLY_THRESHOLD | txdly_3 > TXDLY_MAX | dqsw270_diff > 15)    begin
                  //   visual_lowest_filled_next <= 0;
                  //   visual_gate_training_next <= CHOOSE_ANSWER;
                  //end
                  //else visual_gate_training_next <= DET_ORDER_3_EXTEND;
				  visual_gate_training_next <= DET_ORDER_3_EXTEND;
               end
            end
 
         DET_ORDER_3_EXTEND:
            begin
               if (steps180_3_lt_low180)
               begin
                  visual_lowest_clk_sel_next <= 3;
                  visual_lowest_txdly_cnt_next <= txdly_3;
                  visual_lowest_180_delay_next <= steps_180_3;
                  visual_lowest_filled_next <= 0;
                  visual_gate_training_next <= CHOOSE_ANSWER;
               end
               else if (steps180_3_eq_low180 && txdly_3_lt_low_txdly_cnt)
               begin
                  visual_lowest_clk_sel_next <= 3;
                  visual_lowest_txdly_cnt_next <= txdly_3;
                  visual_lowest_180_delay_next <= steps_180_3;
                  visual_lowest_filled_next <= 0;
                  visual_gate_training_next <= CHOOSE_ANSWER;
               end
               else
               begin
                  visual_lowest_filled_next <= 0;
                  visual_gate_training_next <= CHOOSE_ANSWER;
               end
            end
 
         INC_180:
            begin
 
               //  Wait a safe time before incrementing steps_180
               if (move_safe_done)
               begin
                  visual_steps_180_next <= steps_180 + 1;
                  visual_gt_pause_next <= 1;
                  visual_gate_training_next <= WAIT_READ_1;
               end
               else
               begin
                  visual_gate_training_next <= INC_180;
               end
            end
 
         INITIAL:
            begin
               //  Initial state
               //  Initialize variables and wait for dfi_rdlvl_gate_en to kickoff training
               visual_clk_sel_answer_next <= 0;
               visual_steps_180_answer_next <= 0;
               visual_steps_180_next <= 0;
               visual_txdly_cnt_next <= 0;
               visual_en_wait_cnt_next <= 0;
               visual_loop_cnt_next <= 0;
               visual_lowest_filled_next <= 0;
               visual_lowest_180_delay_next <= 0;
               visual_lowest_txdly_cnt_next <= 0;
               visual_lowest_clk_sel_next <= 0;
               visual_sec_lowest_180_delay_next <= 0;
               visual_sec_lowest_txdly_cnt_next <= 0;
               visual_sec_lowest_clk_sel_next <= 0;
               visual_ignore0_next <= 0;
               visual_ignore1_next <= 0;
               visual_ignore2_next <= 0;
               visual_ignore3_next <= 0;
               visual_no_burst_clk_sel_next <= 4;
               visual_read_en5_next <= 0;
               visual_low_thresh_next <= 255;
               visual_high_thresh_next <= 0;
               visual_clk_sel_next <= 0;
               visual_steps180_1_lt_low180_next <= 0;
               visual_steps180_1_eq_low180_next <= 0;
               visual_txdly_1_lt_low_txdly_cnt_next <= 0;
               visual_steps180_2_lt_low180_next <= 0;
               visual_steps180_2_eq_low180_next <= 0;
               visual_txdly_2_lt_low_txdly_cnt_next <= 0;
               visual_steps180_3_lt_low180_next <= 0;
               visual_steps180_3_eq_low180_next <= 0;
               visual_txdly_3_lt_low_txdly_cnt_next <= 0;
               burst_detected_next<=0;//Alister
               read_count_next<=0;//Alister
               pause_sent_next<=0;//ALISTER
               if (dfi_rdlvl_gate_en)
               begin
                  visual_steps_180_0_next <= 0;
                  visual_steps_180_1_next <= 0;
                  visual_steps_180_2_next <= 0;
                  visual_steps_180_3_next <= 0;
                  visual_txdly_0_next <= 0;
                  visual_txdly_1_next <= 0;
                  visual_txdly_2_next <= 0;
                  visual_txdly_3_next <= 0;
                  visual_gt_error_next <= 0;
                  if (~(dfi_rdlvl_cs_0_n))
                  begin
                     visual_clk_sel_r0_next <= 0;
                     visual_steps_180_r0_next <= 0;
                     visual_no_burst_cnt_r0_next <= 0;
                     visual_gate_training_next <= LOAD_INIT_TXDLY;
                  end
                  else
                  begin
                     visual_clk_sel_r1_next <= 0;
                     visual_steps_180_r1_next <= 0;
                     visual_no_burst_cnt_r1_next <= 0;
                     visual_gate_training_next <= LOAD_INIT_TXDLY;
                  end
               end
               else
               begin
                  visual_gate_training_next <= INITIAL;
               end
            end
 
         INITIAL_BURST_ERROR:
            begin
 
               //  Initial burst error flag was set
               //  Set the initial_burst_error apb
               //  register depending on the
               //  rank that's being trained.
               if (~(dfi_rdlvl_cs_1_n))
               begin
                  visual_set_error_next <= 6;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
               else
               begin
                  visual_set_error_next <= 5;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
            end
 
         LOAD_INIT_TXDLY:
            begin
 
               //  Start training once dfi_rdlvl_gate_en is asserted
               //  This state starts by selecting clk_sel = 0
               //  Load txdly delay line
               //  Assert pause for the clk_sel setting and loading of the txdly
               if (move_safe_done)
               begin
                  visual_txdly_load_next <= 1;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_1;
               end
               else
               begin
                  visual_gate_training_next <= LOAD_INIT_TXDLY;
               end
            end
 
         LOAD_TXDLY_STEPS_180:
            begin
 
               //  clk_sel setting is about to be incremented
               //  Reset the txdly values and load the txdly
               //  Reset the steps_180 counter and phase move
               if (move_safe_done)
               begin
                  visual_clk_sel_next <= clk_sel + 1;
                  visual_txdly_load_next <= 1;
                  visual_txdly_cnt_next <= 0;
                  visual_steps_180_next <= 0;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_1;
               end
               else
               begin
                  visual_gate_training_next <= LOAD_TXDLY_STEPS_180;
               end
            end
 
         NO_BURST_DETECTED:
            begin
 
               //  No burst_detected for the current setting
               //  Increment steps_180 and check for burst_detect
               //  again until all steps_180
               //  options have been exhausted.
               //
               //  If all the steps_180 have been checked, then
               //  set the no_burst_detect_flag,
               //   record the current clk_sel as the no_burst_clk_sel
               //  to be used later and increment the clk_sel.
               //
               //  If all the steps_180 have been checked and the
               //  here was no burst detected on any of the settings
               //  then exit with an error.
               if (steps_180 == MAX_STEPS_180)
               begin
                  visual_no_burst_clk_sel_next <= clk_sel;
                  if (~(dfi_rdlvl_cs_0_n))
                  begin
                     visual_no_burst_cnt_r0_next <= no_burst_cnt_r0 + 1;
                     visual_gate_training_next <= PRE_INC_CLK_SEL;
                  end
                  else
                  begin
                     visual_no_burst_cnt_r1_next <= no_burst_cnt_r1 + 1;
                     visual_gate_training_next <= PRE_INC_CLK_SEL;
                  end
               end
               else
               begin
                  visual_gate_training_next <= INC_180;
               end
            end
 
         NO_BURST_ERROR:
            begin
 
               //  No burst error flag was set
               //  Set the no_burst_error apb
               //  register depending on the
               //  rank that's being trained.
               if (~(dfi_rdlvl_cs_1_n))
               begin
                  visual_set_error_next <= 2;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
               else
               begin
                  visual_set_error_next <= 1;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
            end
 
         OOR_ERROR:
            begin
 
               //  Out of range error flag was set
               //  Set the oor_error apb
               //  register depending on the
               //  rank that's being trained.
               if (~(dfi_rdlvl_cs_1_n))
               begin
                  visual_set_error_next <= 4;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
               else
               begin
                  visual_set_error_next <= 3;
                  visual_gt_error_next <= 1;
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
            end
 
         PRE_INC_CLK_SEL:
            begin
 
               //  Increment clk_sel setting
               //  If done with the final clk_sel setting i.e. clk_sel = 3 :
               //  then move on to calculating the answer
               if (clk_sel == 3)
               begin
                  if (~(dfi_rdlvl_cs_0_n))
                  begin
                     if (no_burst_cnt_r0 > 1)
                     begin
                        visual_gate_training_next <= NO_BURST_ERROR;
                     end
                     else
                     begin
                        visual_gate_training_next <= DET_ORDER_0;
                     end
                  end
                  else if (no_burst_cnt_r1 > 1)
                  begin
                     visual_gate_training_next <= NO_BURST_ERROR;
                  end
                  else
                  begin
                     visual_gate_training_next <= DET_ORDER_0;
                  end
               end
               else
               begin
                  visual_gate_training_next <= LOAD_TXDLY_STEPS_180;
               end
            end
 
         RESPONSE_HIGH:
            begin
 
               //  Assert dfi_rdlvl_resp
               //  Wait for dfi_rdlvl_gate_en to be deasserted before exiting.
               if (~(dfi_rdlvl_gate_en))
               begin
                  visual_gt_error_next <= 0;
                  visual_gate_training_next <= INITIAL;
               end
               else
               begin
                  visual_dfi_rdlvl_resp_next <= 1'b1;
                  visual_gate_training_next <= RESPONSE_HIGH;
               end
            end
 
         SET_OUTPUT_ANSWER:
            begin
 
               //  Load the txdly and set the steps_180 as the answer
               if (move_safe_done)
               begin
                  visual_txdly_load_next <= 1;
                  visual_clk_sel_next <= clk_sel_answer;
                  visual_txdly_cnt_next <= 0;
                  visual_steps_180_next <= steps_180_answer;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_3;
               end
               else
               begin
                  visual_gate_training_next <= SET_OUTPUT_ANSWER;
               end
            end
 
         STORE_VALS:
            begin
 
               //  Once a burst_detect is seen :
               //  Store the values on their respective variables
               //  steps_180 and txdly_cnt for each of the clk_sel setting
               if (txdly_cnt < low_thresh)
               begin
                  visual_low_thresh_next <= txdly_cnt;
                  if (txdly_cnt > high_thresh)
                  begin
                     visual_high_thresh_next <= txdly_cnt;
                     case (clk_sel[1:0])
 
                        2'b00 :
                        begin
                           visual_steps_180_0_next <= steps_180 + 2;
                           visual_txdly_0_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b01 :
                        begin
                           visual_steps_180_1_next <= steps_180 + 2;
                           visual_txdly_1_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b10 :
                        begin
                           visual_steps_180_2_next <= steps_180 + 2;
                           visual_txdly_2_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b11 :
                        begin
                           visual_steps_180_3_next <= steps_180 + 2;
                           visual_txdly_3_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
                     endcase
                  end
                  else
                     case (clk_sel[1:0])
 
                        2'b00 :
                        begin
                           visual_steps_180_0_next <= steps_180 + 2;
                           visual_txdly_0_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b01 :
                        begin
                           visual_steps_180_1_next <= steps_180 + 2;
                           visual_txdly_1_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b10 :
                        begin
                           visual_steps_180_2_next <= steps_180 + 2;
                           visual_txdly_2_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
 
                        2'b11 :
                        begin
                           visual_steps_180_3_next <= steps_180 + 2;
                           visual_txdly_3_next <= txdly_cnt;
                           visual_gate_training_next <= PRE_INC_CLK_SEL;
                        end
                     endcase
               end
               else if (txdly_cnt > high_thresh)
               begin
                  visual_high_thresh_next <= txdly_cnt;
                  case (clk_sel[1:0])
 
                     2'b00 :
                     begin
                        visual_steps_180_0_next <= steps_180 + 2;
                        visual_txdly_0_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b01 :
                     begin
                        visual_steps_180_1_next <= steps_180 + 2;
                        visual_txdly_1_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b10 :
                     begin
                        visual_steps_180_2_next <= steps_180 + 2;
                        visual_txdly_2_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b11 :
                     begin
                        visual_steps_180_3_next <= steps_180 + 2;
                        visual_txdly_3_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
                  endcase
               end
               else
                  case (clk_sel[1:0])
 
                     2'b00 :
                     begin
                        visual_steps_180_0_next <= steps_180 + 2;
                        visual_txdly_0_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b01 :
                     begin
                        visual_steps_180_1_next <= steps_180 + 2;
                        visual_txdly_1_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b10 :
                     begin
                        visual_steps_180_2_next <= steps_180 + 2;
                        visual_txdly_2_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
 
                     2'b11 :
                     begin
                        visual_steps_180_3_next <= steps_180 + 2;
                        visual_txdly_3_next <= txdly_cnt;
                        visual_gate_training_next <= PRE_INC_CLK_SEL;
                     end
                  endcase
            end
 
         TXDLY_INC:
            begin
 
               //  Pulse the txdly move
               //  and increment the
               //  txdly counter
               //  Assert the pause
               if (move_safe_done)
               begin
                  visual_txdly_move_next <= 1;
                  visual_txdly_cnt_next <= txdly_cnt + 1;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_2;
               end
               else
               begin
                  visual_gate_training_next <= TXDLY_INC;
               end
            end
 
         TXDLY_NO_BD:
            begin
 
               //  No burst_detect for txdly move
               //  If out of range then exit with an error
               if (txdly_oor)
               begin
                  visual_gate_training_next <= OOR_ERROR;
               end
               else
               begin
                  visual_gate_training_next <= TXDLY_INC;
               end
            end
 
         WAIT_PRE_PAUSE_1:
            begin
 
               //  Wait PAUSE_WAIT_DURATION sclk cycles
               //  before pulsing pause
               if (clk_pause_cnt == PAUSE_WAIT_DURATION)
               begin
                  visual_gt_pause_next <= 1;
                  visual_gate_training_next <= WAIT_READ_1;
               end
               else
               begin
                  visual_clk_pause_cnt_next <= clk_pause_cnt + 1;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_1;
               end
            end
 
         WAIT_PRE_PAUSE_2:
            begin
 
               //  Wait PAUSE_WAIT_DURATION
               //  sclk cycles
               //  before pulsing pause
               if (clk_pause_cnt == PAUSE_WAIT_DURATION)
               begin
                  visual_gt_pause_next <= 1;
                  visual_gate_training_next <= WAIT_READ_2;
               end
               else
               begin
                  visual_clk_pause_cnt_next <= clk_pause_cnt + 1;
                  visual_gate_training_next <= WAIT_PRE_PAUSE_2;
               end
            end
 
         WAIT_PRE_PAUSE_3:
            begin
               visual_txdly_load_next <= 1;
               //  Wait PAUSE_WAIT_DURATION sclk cycles
               //  before pulsing pause
               if (!pause_sent) begin
                  if (move_safe_done) begin
                     //visual_gt_pause_next <= 1;
                     pause_sent_next <= 1;
                     burst_detected_next <= 1; //ignore the first cycle as the pause is being issued.
                  end
                  visual_gate_training_next <= WAIT_PRE_PAUSE_3;
               end else begin
               //visual_gt_pause_next <= 0;
               if (dfi_rddata_en_p3) begin
                  read_count_next<=read_count+1;
                  burst_detected_next <= 0;
                  if (read_count==READ_COUNT_THRESHOLD)
                  begin

                     if (burst_detected) begin

                        if (~(dfi_rdlvl_cs_0_n))
                        begin
                            visual_clk_sel_r0_next <= clk_sel_answer;
                            visual_steps_180_r0_next <= steps_180_answer;
                            visual_dfi_rdlvl_resp_next <= 1'b1;
                            visual_gate_training_next <= RESPONSE_HIGH;
                        end

                        else
                        begin
                            visual_clk_sel_r1_next <= clk_sel_answer;
                            visual_steps_180_r1_next <= steps_180_answer;
                            visual_dfi_rdlvl_resp_next <= 1'b1;
                            visual_gate_training_next <= RESPONSE_HIGH;
                        end
                     end

                     else begin
                        visual_gate_training_next <= INITIAL;
                        incr_fuzzy_next<=1;
                     end

                  end
                  else begin 
 
                    if (burst_detected) visual_gate_training_next <= WAIT_PRE_PAUSE_3;

                    else begin
                       visual_gate_training_next <= INITIAL;
                       incr_fuzzy_next<=1;
                    end

                  end
               end
               
               else begin
                  visual_gate_training_next <= WAIT_PRE_PAUSE_3;
                  if (burst_detect) burst_detected_next <= 1;
               end
               end
            end
 
         WAIT_READ_1:
            begin
 
               //  Check for burst_detect on the current settings
               //  Wait a MIN_READS_THRESHOLD number of sclk
               //  cycles before checking for burst_detect
               //if (dfi_rddata_en_p3)
               //begin
                  //if (en_wait_cnt == MIN_READS_THRESHOLD)
                  //begin
                     //visual_en_wait_cnt_next <= 0;
                     //visual_gate_training_next <= NO_BURST_DETECTED;
                  //end
                  //else
                  //begin
                     //visual_en_wait_cnt_next <= en_wait_cnt + 1;
                     //visual_gate_training_next <= WAIT_READ_1;
                  //end
               //end
               //else if (en_wait_cnt == MIN_READS_THRESHOLD)
               //begin
                  //if (burst_detect)
                  //begin
                     //visual_en_wait_cnt_next <= 0;
                     //visual_gate_training_next <= BURST_DETECTED_180;
                  //end
                  //else
                  //begin
                     //visual_gate_training_next <= WAIT_READ_1;
                  //end
               //end
               //else
               //begin
                  //visual_gate_training_next <= WAIT_READ_1;
               //end

               if (dfi_rddata_en_p3) begin
                  burst_detected_next<=0;
                  if (burst_detected) begin
                    
                     if (en_wait_cnt ==MIN_READS_THRESHOLD) begin
                        visual_gate_training_next <= BURST_DETECTED_180;
                        visual_en_wait_cnt_next <=0;
                     end
                     else begin
                        visual_en_wait_cnt_next <= en_wait_cnt + 1;
                        visual_gate_training_next <= WAIT_READ_1;
                     end
                  end
                  else begin
                     visual_en_wait_cnt_next <= 0;
                     visual_gate_training_next <= NO_BURST_DETECTED;
                  end
               end
               else begin
                  visual_gate_training_next <= WAIT_READ_1;
                  if (burst_detect | en_wait_cnt <= 2) burst_detected_next <=1;
                  else burst_detected_next <=burst_detected;
               end
            end
 
         WAIT_READ_2:
            begin
 
               //  Increment txdly until a burst detect is seen again
               //if (dfi_rddata_en_p3)
               //begin
                  //if (en_wait_cnt == MIN_READS_THRESHOLD)
                  //begin
                     //visual_en_wait_cnt_next <= 0;
                     //visual_gate_training_next <= TXDLY_NO_BD;
                  //end
                  //else
                  //begin
                     //visual_en_wait_cnt_next <= en_wait_cnt + 1;
                     //visual_gate_training_next <= WAIT_READ_2;
                  //end
               //end
               //else if (en_wait_cnt == MIN_READS_THRESHOLD)
               //begin
                  //if (burst_detect)
                  //begin
                     //visual_en_wait_cnt_next <= 0;
                     //visual_gate_training_next <= STORE_VALS;
                  //end
                  //else
                  //begin
                     //visual_gate_training_next <= WAIT_READ_2;
                  //end
               //end
               //else
               //begin
                  //visual_gate_training_next <= WAIT_READ_2;
               //end
               if (dfi_rddata_en_p3) begin
                  burst_detected_next<=0;
                  if (burst_detected) begin
                    
                     if (en_wait_cnt ==MIN_READS_THRESHOLD) begin
                        visual_gate_training_next <= STORE_VALS;
                        visual_en_wait_cnt_next <=0;
                     end
                     else begin
                        visual_en_wait_cnt_next <= en_wait_cnt + 1;
                        visual_gate_training_next <= WAIT_READ_2;
                     end
                  end
                  else begin
                     visual_en_wait_cnt_next <= 0;
                     visual_gate_training_next <= TXDLY_NO_BD;
                  end
               end
               else begin
                  visual_gate_training_next <= WAIT_READ_2;
                  if (burst_detect | en_wait_cnt <= 2) burst_detected_next <=1;
                  else burst_detected_next <=burst_detected;
               end
            end
 
         default:
            begin
               visual_gate_training_next <= INITIAL;
            end
      endcase
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : gate_training
 
      if (~(reset_n))
      begin
         dfi_rdlvl_resp <= 0;
         gt_pause <= 0;
         txdly_load <= 0;
         txdly_move <= 0;
         clk_pause_cnt <= 1;
         set_error <= 0;
         clk_sel <= 0;
         clk_sel_r0 <= 0;
         clk_sel_r1 <= 0;
         steps_180_r0 <= 0;
         steps_180_r1 <= 0;
         clk_sel_answer <= 0;
         steps_180_answer <= 0;
         steps_180 <= 0;
         txdly_cnt <= 0;
         steps_180_0 <= 0;
         steps_180_1 <= 0;
         steps_180_2 <= 0;
         steps_180_3 <= 0;
         txdly_0 <= 0;
         txdly_1 <= 0;
         txdly_2 <= 0;
         txdly_3 <= 0;
         en_wait_cnt <= 0;
         loop_cnt <= 0;
         lowest_filled <= 0;
         lowest_180_delay <= 0;
         lowest_txdly_cnt <= 0;
         lowest_clk_sel <= 0;
         sec_lowest_180_delay <= 0;
         sec_lowest_txdly_cnt <= 0;
         sec_lowest_clk_sel <= 0;
         ignore0 <= 0;
         ignore1 <= 0;
         ignore2 <= 0;
         ignore3 <= 0;
         gt_error <= 0;
         no_burst_clk_sel <= 4;
         no_burst_cnt_r0 <= 0;
         no_burst_cnt_r1 <= 0;
         read_en5 <= 0;
         low_thresh <= 255;
         high_thresh <= 0;
         steps180_1_lt_low180 <= 0;
         steps180_1_eq_low180 <= 0;
         txdly_1_lt_low_txdly_cnt <= 0;
         steps180_2_lt_low180 <= 0;
         steps180_2_eq_low180 <= 0;
         txdly_2_lt_low_txdly_cnt <= 0;
         steps180_3_lt_low180 <= 0;
         steps180_3_eq_low180 <= 0;
         txdly_3_lt_low_txdly_cnt <= 0;
         visual_gate_training_current <= INITIAL;

         read_count <= 0;//ALISTER
         burst_detected <= 0; //ALISTER
         pause_sent <= 0;//alister
      end
      else
      begin
         dfi_rdlvl_resp <= visual_dfi_rdlvl_resp_next;
         gt_pause <= visual_gt_pause_next;
         txdly_load <= visual_txdly_load_next;
         txdly_move <= visual_txdly_move_next;
         gt_error <= visual_gt_error_next;
         clk_pause_cnt <= visual_clk_pause_cnt_next;
         clk_sel <= visual_clk_sel_next;
         clk_sel_answer <= visual_clk_sel_answer_next;
         clk_sel_r0 <= visual_clk_sel_r0_next;
         clk_sel_r1 <= visual_clk_sel_r1_next;
         en_wait_cnt <= visual_en_wait_cnt_next;
         ignore0 <= visual_ignore0_next;
         ignore1 <= visual_ignore1_next;
         ignore2 <= visual_ignore2_next;
         ignore3 <= visual_ignore3_next;
         loop_cnt <= visual_loop_cnt_next;
         lowest_180_delay <= visual_lowest_180_delay_next;
         lowest_clk_sel <= visual_lowest_clk_sel_next;
         lowest_txdly_cnt <= visual_lowest_txdly_cnt_next;
         sec_lowest_180_delay <= visual_sec_lowest_180_delay_next;
         sec_lowest_clk_sel <= visual_sec_lowest_clk_sel_next;
         sec_lowest_txdly_cnt <= visual_sec_lowest_txdly_cnt_next;
         set_error <= visual_set_error_next;
         steps_180 <= visual_steps_180_next;
         steps_180_0 <= visual_steps_180_0_next;
         steps_180_1 <= visual_steps_180_1_next;
         steps_180_2 <= visual_steps_180_2_next;
         steps_180_3 <= visual_steps_180_3_next;
         steps_180_answer <= visual_steps_180_answer_next;
         steps_180_r0 <= visual_steps_180_r0_next;
         steps_180_r1 <= visual_steps_180_r1_next;
         txdly_0 <= visual_txdly_0_next;
         txdly_1 <= visual_txdly_1_next;
         txdly_2 <= visual_txdly_2_next;
         txdly_3 <= visual_txdly_3_next;
         txdly_cnt <= visual_txdly_cnt_next;
         lowest_filled <= visual_lowest_filled_next;
         no_burst_clk_sel <= visual_no_burst_clk_sel_next;
         no_burst_cnt_r0 <= visual_no_burst_cnt_r0_next;
         no_burst_cnt_r1 <= visual_no_burst_cnt_r1_next;
         read_en5 <= visual_read_en5_next;
         low_thresh <= visual_low_thresh_next;
         high_thresh <= visual_high_thresh_next;
         steps180_1_lt_low180 <= visual_steps180_1_lt_low180_next;
         steps180_1_eq_low180 <= visual_steps180_1_eq_low180_next;
         txdly_1_lt_low_txdly_cnt <= visual_txdly_1_lt_low_txdly_cnt_next;
         steps180_2_lt_low180 <= visual_steps180_2_lt_low180_next;
         steps180_2_eq_low180 <= visual_steps180_2_eq_low180_next;
         txdly_2_lt_low_txdly_cnt <= visual_txdly_2_lt_low_txdly_cnt_next;
         steps180_3_lt_low180 <= visual_steps180_3_lt_low180_next;
         steps180_3_eq_low180 <= visual_steps180_3_eq_low180_next;
         txdly_3_lt_low_txdly_cnt <= visual_txdly_3_lt_low_txdly_cnt_next;
         visual_gate_training_current <= visual_gate_training_next;

         burst_detected<=burst_detected_next;//ALISTER
         read_count<=read_count_next;//ALISTER
         pause_sent <= pause_sent_next;//ALISTER
         incr_fuzzy<=incr_fuzzy_next;

      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :apb_access
 
      if (~(reset_n))
      begin
         apb_data_out <= 0;
         apb_clear_error <= 0;
      end
      else
      begin
         apb_clear_error <= 0;
         case (apb_addr[4:0])
 
            5'b00000 :
               begin
                  apb_data_out <= error_comb;
                  if (read_access == 1)
                  begin
                     apb_clear_error <= 1;
                  end
               end
 
            5'b00001 :
               begin
                  apb_data_out <= clk_sel_r0;
               end
 
            5'b00010 :
               begin
                  apb_data_out <= clk_sel_r1;
               end
 
            5'b00011 :
               begin
                  apb_data_out <= steps_180_r0;
               end
 
            5'b00100 :
               begin
                  apb_data_out <= steps_180_r1;
               end
 
            5'b00101 :
               begin
                  apb_data_out <= txdly_0;
               end
 
            5'b00110 :
               begin
                  apb_data_out <= txdly_1;
               end
 
            5'b00111 :
               begin
                  apb_data_out <= txdly_2;
               end
 
            5'b01000 :
               begin
                  apb_data_out <= txdly_3;
               end
 
            5'b01001 :
               begin
                  apb_data_out <= gt_state;
               end
 
            5'b01010 :
               begin
                  apb_data_out <= no_burst_cnt_r0;
               end
 
            5'b01011 :
               begin
                  apb_data_out <= no_burst_cnt_r1;
               end
 
            default  :
               begin
                  apb_data_out <= 0;
               end
         endcase
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :error_register_management
 
      if (~(reset_n))
      begin
         no_burst_detect_error <= 0;
         oor_error <= 0;
         initial_burst_error <= 0;
      end
      else
      begin
         if (set_error != 0)
         begin
            case (set_error[3:0])
 
               4'b0001 :
                  begin
                     no_burst_detect_error[0] <= 1;
                  end
 
               4'b0010 :
                  begin
                     no_burst_detect_error[1] <= 1;
                  end
 
               4'b0011 :
                  begin
                     oor_error[0] <= 1;
                  end
 
               4'b0100 :
                  begin
                     oor_error[1] <= 1;
                  end
 
               4'b0101 :
                  begin
                     initial_burst_error[0] <= 1;
                  end
 
               4'b0110 :
                  begin
                     initial_burst_error[1] <= 1;
                  end
 
               default  :
                  ;
            endcase
         end
         else
         begin
            if (apb_clear_error)
            begin
               no_burst_detect_error <= 0;
               oor_error <= 0;
               initial_burst_error <= 0;
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :clk_sel_out_selection
 
      if (~(reset_n))
      begin
         clk_sel_out <= 0;
         select_rank_1_gt <= 0;
      end
      else
      begin
         if (dfi_rdlvl_gate_en)
         begin
            clk_sel_out <= {1'b1,clk_sel[1:0]};
         end
         else
         begin
            if (~(dfi_rddata_cs_0_n))
            begin
               clk_sel_out <= {1'b1,clk_sel_r0};
               select_rank_1_gt <= 0;
            end
            else
            begin
               if (~(dfi_rddata_cs_1_n))
               begin
                  clk_sel_out <= {1'b1,clk_sel_r1};
                  select_rank_1_gt <= 1;
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :burst_detect_edge_detect
 
      if (~(reset_n))
      begin
         burst_detect_s <= 0;
         burst_detect_ss <= 0;
      end
      else
      begin
         burst_detect_s <= burst_detect_in;
         burst_detect_ss <= burst_detect_s;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :rddata_en_registering
 
      if (~(reset_n))
      begin
         iog_rddata_en_p0_p <= 0;
         iog_rddata_en_p0_n <= 0;
         iog_rddata_en_p1_p <= 0;
         iog_rddata_en_p1_n <= 0;
         iog_rddata_en_p2_p <= 0;
         iog_rddata_en_p2_n <= 0;
         iog_rddata_en_p3_p <= 0;
         iog_rddata_en_p3_n <= 0;
         pre_iog_rddata_en_p3_n_reg <= 0;
      end
      else
      begin
         iog_rddata_en_p0_p <= pre_iog_rddata_en_p0_p | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p3_n_reg);
         iog_rddata_en_p0_n <= pre_iog_rddata_en_p0_n | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p0_p);
         iog_rddata_en_p1_p <= pre_iog_rddata_en_p1_p | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p0_n);
         iog_rddata_en_p1_n <= pre_iog_rddata_en_p1_n | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p1_p);
         iog_rddata_en_p2_p <= pre_iog_rddata_en_p2_p | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p1_n);
         iog_rddata_en_p2_n <= pre_iog_rddata_en_p2_n | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p2_p);
         iog_rddata_en_p3_p <= pre_iog_rddata_en_p3_p | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p2_n);
         iog_rddata_en_p3_n <= pre_iog_rddata_en_p3_n | (dfi_rdlvl_gate_en && pre_iog_rddata_en_p3_p);
         pre_iog_rddata_en_p3_n_reg <= pre_iog_rddata_en_p3_n;
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :pre_iog_cnt
 
      if (~(reset_n))
      begin
         pre_iog_counter <= 0;
      end
      else
      begin
         if (pre_iog_counter < 2)
         begin
            pre_iog_counter <= pre_iog_counter + 1;
         end
         else
         begin
            pre_iog_counter <= 0;
         end
      end
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :register_phase_move_current
 
      if (~(reset_n))
      begin
         phase_move_reg <= 0;
         phase_move_reg_plus1 <= 0;
      end
      else
      begin
         phase_move_reg <= phase_move_current;
         phase_move_reg_plus1 <= phase_move_current + 1;
      end
   end
 
 
 
   always  @(phase_move_p or dfi_rddata_en_p0 or dfi_rddata_en_p1 or dfi_rddata_en_p2 or dfi_rddata_en_p3 or phase_move_n)
   begin   :pre_iog_en_output_mux
 
      pre_iog_en_output <= 0;
      case (phase_move_p[3:0])
 
         4'd0 :
            begin
               pre_iog_en_output[23] <= dfi_rddata_en_p0;
               pre_iog_en_output[21] <= dfi_rddata_en_p1;
               pre_iog_en_output[19] <= dfi_rddata_en_p2;
               pre_iog_en_output[17] <= dfi_rddata_en_p3;
            end
 
         4'd1 :
            begin
               pre_iog_en_output[21] <= dfi_rddata_en_p0;
               pre_iog_en_output[19] <= dfi_rddata_en_p1;
               pre_iog_en_output[17] <= dfi_rddata_en_p2;
               pre_iog_en_output[15] <= dfi_rddata_en_p3;
            end
 
         4'd2 :
            begin
               pre_iog_en_output[19] <= dfi_rddata_en_p0;
               pre_iog_en_output[17] <= dfi_rddata_en_p1;
               pre_iog_en_output[15] <= dfi_rddata_en_p2;
               pre_iog_en_output[13] <= dfi_rddata_en_p3;
            end
 
         4'd3 :
            begin
               pre_iog_en_output[17] <= dfi_rddata_en_p0;
               pre_iog_en_output[15] <= dfi_rddata_en_p1;
               pre_iog_en_output[13] <= dfi_rddata_en_p2;
               pre_iog_en_output[11] <= dfi_rddata_en_p3;
            end
 
         4'd4 :
            begin
               pre_iog_en_output[15] <= dfi_rddata_en_p0;
               pre_iog_en_output[13] <= dfi_rddata_en_p1;
               pre_iog_en_output[11] <= dfi_rddata_en_p2;
               pre_iog_en_output[9] <= dfi_rddata_en_p3;
            end
 
         4'd5 :
            begin
               pre_iog_en_output[13] <= dfi_rddata_en_p0;
               pre_iog_en_output[11] <= dfi_rddata_en_p1;
               pre_iog_en_output[9] <= dfi_rddata_en_p2;
               pre_iog_en_output[7] <= dfi_rddata_en_p3;
            end
 
         4'd6 :
            begin
               pre_iog_en_output[11] <= dfi_rddata_en_p0;
               pre_iog_en_output[9] <= dfi_rddata_en_p1;
               pre_iog_en_output[7] <= dfi_rddata_en_p2;
               pre_iog_en_output[5] <= dfi_rddata_en_p3;
            end
 
         4'd7 :
            begin
               pre_iog_en_output[9] <= dfi_rddata_en_p0;
               pre_iog_en_output[7] <= dfi_rddata_en_p1;
               pre_iog_en_output[5] <= dfi_rddata_en_p2;
               pre_iog_en_output[3] <= dfi_rddata_en_p3;
            end
 
         4'd8 :
            begin
               pre_iog_en_output[7] <= dfi_rddata_en_p0;
               pre_iog_en_output[5] <= dfi_rddata_en_p1;
               pre_iog_en_output[3] <= dfi_rddata_en_p2;
               pre_iog_en_output[1] <= dfi_rddata_en_p3;
            end
 
         default  :
            begin
               pre_iog_en_output[7] <= dfi_rddata_en_p0;
               pre_iog_en_output[5] <= dfi_rddata_en_p1;
               pre_iog_en_output[3] <= dfi_rddata_en_p2;
               pre_iog_en_output[1] <= dfi_rddata_en_p3;
            end
      endcase
      case (phase_move_n[2:0])
 
         3'd0 :
            begin
               pre_iog_en_output[22] <= dfi_rddata_en_p0;
               pre_iog_en_output[20] <= dfi_rddata_en_p1;
               pre_iog_en_output[18] <= dfi_rddata_en_p2;
               pre_iog_en_output[16] <= dfi_rddata_en_p3;
            end
 
         3'd1 :
            begin
               pre_iog_en_output[20] <= dfi_rddata_en_p0;
               pre_iog_en_output[18] <= dfi_rddata_en_p1;
               pre_iog_en_output[16] <= dfi_rddata_en_p2;
               pre_iog_en_output[14] <= dfi_rddata_en_p3;
            end
 
         3'd2 :
            begin
               pre_iog_en_output[18] <= dfi_rddata_en_p0;
               pre_iog_en_output[16] <= dfi_rddata_en_p1;
               pre_iog_en_output[14] <= dfi_rddata_en_p2;
               pre_iog_en_output[12] <= dfi_rddata_en_p3;
            end
 
         3'd3 :
            begin
               pre_iog_en_output[16] <= dfi_rddata_en_p0;
               pre_iog_en_output[14] <= dfi_rddata_en_p1;
               pre_iog_en_output[12] <= dfi_rddata_en_p2;
               pre_iog_en_output[10] <= dfi_rddata_en_p3;
            end
 
         3'd4 :
            begin
               pre_iog_en_output[14] <= dfi_rddata_en_p0;
               pre_iog_en_output[12] <= dfi_rddata_en_p1;
               pre_iog_en_output[10] <= dfi_rddata_en_p2;
               pre_iog_en_output[8] <= dfi_rddata_en_p3;
            end
 
         3'd5 :
            begin
               pre_iog_en_output[12] <= dfi_rddata_en_p0;
               pre_iog_en_output[10] <= dfi_rddata_en_p1;
               pre_iog_en_output[8] <= dfi_rddata_en_p2;
               pre_iog_en_output[6] <= dfi_rddata_en_p3;
            end
 
         3'd6 :
            begin
               pre_iog_en_output[10] <= dfi_rddata_en_p0;
               pre_iog_en_output[8] <= dfi_rddata_en_p1;
               pre_iog_en_output[6] <= dfi_rddata_en_p2;
               pre_iog_en_output[4] <= dfi_rddata_en_p3;
            end
 
         3'd7 :
            begin
               pre_iog_en_output[8] <= dfi_rddata_en_p0;
               pre_iog_en_output[6] <= dfi_rddata_en_p1;
               pre_iog_en_output[4] <= dfi_rddata_en_p2;
               pre_iog_en_output[2] <= dfi_rddata_en_p3;
            end
 
         default  :
            begin
               pre_iog_en_output[8] <= dfi_rddata_en_p0;
               pre_iog_en_output[6] <= dfi_rddata_en_p1;
               pre_iog_en_output[4] <= dfi_rddata_en_p2;
               pre_iog_en_output[2] <= dfi_rddata_en_p3;
            end
      endcase
   end
 
 
 
   always
      @( posedge sclk or negedge reset_n )
   begin   :calculate_threshold
 
      if (~(reset_n))
      begin
         threshold <= 0;
      end
      else
      begin
         if (high_thresh == low_thresh)
         begin
            threshold <=( low_thresh >> 1);
         end
         else
         begin
            threshold <= (low_thresh + high_thresh) >> 1;
         end
      end
   end
 
 
 
   // Combinational process
   // always  @(reset_n or pre_iog_en_output_registered_0 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_0_current)
   always  @(pre_iog_en_output_registered_0 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_0_current)
   begin : shim_logic_0_comb
      pre_iog_rddata_en_p0_n_0 <= 0;
      pre_iog_rddata_en_p0_p_0 <= 0;
      pre_iog_rddata_en_p1_n_0 <= 0;
      pre_iog_rddata_en_p1_p_0 <= 0;
      pre_iog_rddata_en_p2_n_0 <= 0;
      pre_iog_rddata_en_p2_p_0 <= 0;
      pre_iog_rddata_en_p3_n_0 <= 0;
      pre_iog_rddata_en_p3_p_0 <= 0;
      visual_pre_iog_en_output_registered_0_next <= pre_iog_en_output_registered_0;
 
 
//      if (~(reset_n))
//      begin
//         pre_iog_rddata_en_p0_p_0 <= 0;
//         pre_iog_rddata_en_p0_n_0 <= 0;
//         pre_iog_rddata_en_p1_p_0 <= 0;
//         pre_iog_rddata_en_p1_n_0 <= 0;
//         pre_iog_rddata_en_p2_p_0 <= 0;
//         pre_iog_rddata_en_p2_n_0 <= 0;
//         pre_iog_rddata_en_p3_p_0 <= 0;
//         pre_iog_rddata_en_p3_n_0 <= 0;
//         visual_shim_logic_0_next <= SCLK_1_0;
//      end
//      else
//      begin
 
         case (visual_shim_logic_0_current)
            SCLK_1_0:
               begin
 
                  //  Phase 0 / Initial phase of shim logic
                  //  pre_iog_rddata_en_pN_X values are set to zero if dfi_rddata_en_p3 is 0
                  //  Once dfi_rddata_en_p3 is asserted, there are combo logics that calculate the
                  //  Correct sequence of the phased outputs of the rddata_en, This sequence is stored
                  //  In a registered variable as it will only be correct on rddata_en_3 == 1.
                  //  For this phase, if rddata_en_p3 is asserted, the correct sequence is calculated
                  //  and the unregistered answer is used to set the output phased rddata_en for the next
                  //  sclk_cycle. The sequence is stored to a registered variable.
                  pre_iog_rddata_en_p0_p_0 <= 0;
                  pre_iog_rddata_en_p0_n_0 <= 0;
                  pre_iog_rddata_en_p1_p_0 <= 0;
                  pre_iog_rddata_en_p1_n_0 <= 0;
                  pre_iog_rddata_en_p2_p_0 <= 0;
                  pre_iog_rddata_en_p2_n_0 <= 0;
                  pre_iog_rddata_en_p3_p_0 <= 0;
                  pre_iog_rddata_en_p3_n_0 <= 0;
                  visual_pre_iog_en_output_registered_0_next <= 0;
                  if (pre_iog_counter == 0)
                  begin
                     visual_pre_iog_en_output_registered_0_next <= pre_iog_en_output;
                     pre_iog_rddata_en_p0_p_0 <= pre_iog_en_output[23];
                     pre_iog_rddata_en_p0_n_0 <= pre_iog_en_output[22];
                     pre_iog_rddata_en_p1_p_0 <= pre_iog_en_output[21];
                     pre_iog_rddata_en_p1_n_0 <= pre_iog_en_output[20];
                     pre_iog_rddata_en_p2_p_0 <= pre_iog_en_output[19];
                     pre_iog_rddata_en_p2_n_0 <= pre_iog_en_output[18];
                     pre_iog_rddata_en_p3_p_0 <= pre_iog_en_output[17];
                     pre_iog_rddata_en_p3_n_0 <= pre_iog_en_output[16];
                     visual_shim_logic_0_next <= SCLK_2_0;
                  end
                  else
                  begin
                     visual_shim_logic_0_next <= SCLK_1_0;
                  end
               end
 
            SCLK_2_0:
               begin
 
                  //  Phase 1
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the second sclk cycle
                  pre_iog_rddata_en_p0_p_0 <= pre_iog_en_output_registered_0[15];
                  pre_iog_rddata_en_p0_n_0 <= pre_iog_en_output_registered_0[14];
                  pre_iog_rddata_en_p1_p_0 <= pre_iog_en_output_registered_0[13];
                  pre_iog_rddata_en_p1_n_0 <= pre_iog_en_output_registered_0[12];
                  pre_iog_rddata_en_p2_p_0 <= pre_iog_en_output_registered_0[11];
                  pre_iog_rddata_en_p2_n_0 <= pre_iog_en_output_registered_0[10];
                  pre_iog_rddata_en_p3_p_0 <= pre_iog_en_output_registered_0[9];
                  pre_iog_rddata_en_p3_n_0 <= pre_iog_en_output_registered_0[8];
                  visual_shim_logic_0_next <= SCLK_3_0;
               end
 
            SCLK_3_0:
               begin
 
                  //  Phase 2
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the third and final sclk cycle
                  //
                  //  Restart to initial until another dfi_rddata_en_p3 is asserted
                  pre_iog_rddata_en_p0_p_0 <= pre_iog_en_output_registered_0[7];
                  pre_iog_rddata_en_p0_n_0 <= pre_iog_en_output_registered_0[6];
                  pre_iog_rddata_en_p1_p_0 <= pre_iog_en_output_registered_0[5];
                  pre_iog_rddata_en_p1_n_0 <= pre_iog_en_output_registered_0[4];
                  pre_iog_rddata_en_p2_p_0 <= pre_iog_en_output_registered_0[3];
                  pre_iog_rddata_en_p2_n_0 <= pre_iog_en_output_registered_0[2];
                  pre_iog_rddata_en_p3_p_0 <= pre_iog_en_output_registered_0[1];
                  pre_iog_rddata_en_p3_n_0 <= pre_iog_en_output_registered_0[0];
                  visual_shim_logic_0_next <= SCLK_1_0;
               end
 
            default:
               begin
                  visual_shim_logic_0_next <= SCLK_1_0;
               end
         endcase
//      end
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : shim_logic_0
 
      if (~(reset_n))
      begin
         pre_iog_en_output_registered_0 <= 0;
         visual_shim_logic_0_current <= SCLK_1_0;
      end
      else
      begin
         pre_iog_en_output_registered_0 <= visual_pre_iog_en_output_registered_0_next;
         visual_shim_logic_0_current <= visual_shim_logic_0_next;
      end
   end
 
 
 
   // Combinational process
   // always  @(reset_n or pre_iog_en_output_registered_1 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_1_current)
   always  @(pre_iog_en_output_registered_1 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_1_current)
   begin : shim_logic_1_comb
      pre_iog_rddata_en_p0_n_1 <= 0;
      pre_iog_rddata_en_p0_p_1 <= 0;
      pre_iog_rddata_en_p1_n_1 <= 0;
      pre_iog_rddata_en_p1_p_1 <= 0;
      pre_iog_rddata_en_p2_n_1 <= 0;
      pre_iog_rddata_en_p2_p_1 <= 0;
      pre_iog_rddata_en_p3_n_1 <= 0;
      pre_iog_rddata_en_p3_p_1 <= 0;
      visual_pre_iog_en_output_registered_1_next <= pre_iog_en_output_registered_1;
 
 
//      if (~(reset_n))
//      begin
//         pre_iog_rddata_en_p0_p_1 <= 0;
//         pre_iog_rddata_en_p0_n_1 <= 0;
//         pre_iog_rddata_en_p1_p_1 <= 0;
//         pre_iog_rddata_en_p1_n_1 <= 0;
//         pre_iog_rddata_en_p2_p_1 <= 0;
//         pre_iog_rddata_en_p2_n_1 <= 0;
//         pre_iog_rddata_en_p3_p_1 <= 0;
//         pre_iog_rddata_en_p3_n_1 <= 0;
//         visual_shim_logic_1_next <= SCLK_1_1;
//      end
//      else
//      begin
 
         case (visual_shim_logic_1_current)
            SCLK_1_1:
               begin
 
                  //  Phase 0 / Initial phase of shim logic
                  //  pre_iog_rddata_en_pN_X values are set to zero if dfi_rddata_en_p3 is 0
                  //  Once dfi_rddata_en_p3 is asserted, there are combo logics that calculate the
                  //  Correct sequence of the phased outputs of the rddata_en, This sequence is stored
                  //  In a registered variable as it will only be correct on rddata_en_3 == 1.
                  //  For this phase, if rddata_en_p3 is asserted, the correct sequence is calculated
                  //  and the unregistered answer is used to set the output phased rddata_en for the next
                  //  sclk_cycle. The sequence is stored to a registered variable.
                  pre_iog_rddata_en_p0_p_1 <= 0;
                  pre_iog_rddata_en_p0_n_1 <= 0;
                  pre_iog_rddata_en_p1_p_1 <= 0;
                  pre_iog_rddata_en_p1_n_1 <= 0;
                  pre_iog_rddata_en_p2_p_1 <= 0;
                  pre_iog_rddata_en_p2_n_1 <= 0;
                  pre_iog_rddata_en_p3_p_1 <= 0;
                  pre_iog_rddata_en_p3_n_1 <= 0;
                  visual_pre_iog_en_output_registered_1_next <= 0;
                  if (pre_iog_counter == 1)
                  begin
                     visual_pre_iog_en_output_registered_1_next <= pre_iog_en_output;
                     pre_iog_rddata_en_p0_p_1 <= pre_iog_en_output[23];
                     pre_iog_rddata_en_p0_n_1 <= pre_iog_en_output[22];
                     pre_iog_rddata_en_p1_p_1 <= pre_iog_en_output[21];
                     pre_iog_rddata_en_p1_n_1 <= pre_iog_en_output[20];
                     pre_iog_rddata_en_p2_p_1 <= pre_iog_en_output[19];
                     pre_iog_rddata_en_p2_n_1 <= pre_iog_en_output[18];
                     pre_iog_rddata_en_p3_p_1 <= pre_iog_en_output[17];
                     pre_iog_rddata_en_p3_n_1 <= pre_iog_en_output[16];
                     visual_shim_logic_1_next <= SCLK_2_1;
                  end
                  else
                  begin
                     visual_shim_logic_1_next <= SCLK_1_1;
                  end
               end
 
            SCLK_2_1:
               begin
 
                  //  Phase 1
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the second sclk cycle
                  pre_iog_rddata_en_p0_p_1 <= pre_iog_en_output_registered_1[15];
                  pre_iog_rddata_en_p0_n_1 <= pre_iog_en_output_registered_1[14];
                  pre_iog_rddata_en_p1_p_1 <= pre_iog_en_output_registered_1[13];
                  pre_iog_rddata_en_p1_n_1 <= pre_iog_en_output_registered_1[12];
                  pre_iog_rddata_en_p2_p_1 <= pre_iog_en_output_registered_1[11];
                  pre_iog_rddata_en_p2_n_1 <= pre_iog_en_output_registered_1[10];
                  pre_iog_rddata_en_p3_p_1 <= pre_iog_en_output_registered_1[9];
                  pre_iog_rddata_en_p3_n_1 <= pre_iog_en_output_registered_1[8];
                  visual_shim_logic_1_next <= SCLK_3_1;
               end
 
            SCLK_3_1:
               begin
 
                  //  Phase 2
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the third and final sclk cycle
                  //
                  //  Restart to initial until another dfi_rddata_en_p3 is asserted
                  pre_iog_rddata_en_p0_p_1 <= pre_iog_en_output_registered_1[7];
                  pre_iog_rddata_en_p0_n_1 <= pre_iog_en_output_registered_1[6];
                  pre_iog_rddata_en_p1_p_1 <= pre_iog_en_output_registered_1[5];
                  pre_iog_rddata_en_p1_n_1 <= pre_iog_en_output_registered_1[4];
                  pre_iog_rddata_en_p2_p_1 <= pre_iog_en_output_registered_1[3];
                  pre_iog_rddata_en_p2_n_1 <= pre_iog_en_output_registered_1[2];
                  pre_iog_rddata_en_p3_p_1 <= pre_iog_en_output_registered_1[1];
                  pre_iog_rddata_en_p3_n_1 <= pre_iog_en_output_registered_1[0];
                  visual_shim_logic_1_next <= SCLK_1_1;
               end
 
            default:
               begin
                  visual_shim_logic_1_next <= SCLK_1_1;
               end
         endcase
//      end
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : shim_logic_1
 
      if (~(reset_n))
      begin
         pre_iog_en_output_registered_1 <= 0;
         visual_shim_logic_1_current <= SCLK_1_1;
      end
      else
      begin
         pre_iog_en_output_registered_1 <= visual_pre_iog_en_output_registered_1_next;
         visual_shim_logic_1_current <= visual_shim_logic_1_next;
      end
   end
 
 
 
   // Combinational process
//   always  @(reset_n or pre_iog_en_output_registered_2 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_2_current)
   always  @(pre_iog_en_output_registered_2 or pre_iog_counter or pre_iog_en_output or visual_shim_logic_2_current)
   begin : shim_logic_2_comb
      pre_iog_rddata_en_p0_n_2 <= 0;
      pre_iog_rddata_en_p0_p_2 <= 0;
      pre_iog_rddata_en_p1_n_2 <= 0;
      pre_iog_rddata_en_p1_p_2 <= 0;
      pre_iog_rddata_en_p2_n_2 <= 0;
      pre_iog_rddata_en_p2_p_2 <= 0;
      pre_iog_rddata_en_p3_n_2 <= 0;
      pre_iog_rddata_en_p3_p_2 <= 0;
      visual_pre_iog_en_output_registered_2_next <= pre_iog_en_output_registered_2;
 
 
//      if (~(reset_n))
//      begin
//         pre_iog_rddata_en_p0_p_2 <= 0;
//         pre_iog_rddata_en_p0_n_2 <= 0;
//         pre_iog_rddata_en_p1_p_2 <= 0;
//         pre_iog_rddata_en_p1_n_2 <= 0;
//         pre_iog_rddata_en_p2_p_2 <= 0;
//         pre_iog_rddata_en_p2_n_2 <= 0;
//         pre_iog_rddata_en_p3_p_2 <= 0;
//         pre_iog_rddata_en_p3_n_2 <= 0;
//         visual_shim_logic_2_next <= SCLK_1_2;
//      end
//      else
//      begin
 
         case (visual_shim_logic_2_current)
            SCLK_1_2:
               begin
 
                  //  Phase 0 / Initial phase of shim logic
                  //  pre_iog_rddata_en_pN_X values are set to zero if dfi_rddata_en_p3 is 0
                  //  Once dfi_rddata_en_p3 is asserted, there are combo logics that calculate the
                  //  Correct sequence of the phased outputs of the rddata_en, This sequence is stored
                  //  In a registered variable as it will only be correct on rddata_en_3 == 1.
                  //  For this phase, if rddata_en_p3 is asserted, the correct sequence is calculated
                  //  and the unregistered answer is used to set the output phased rddata_en for the next
                  //  sclk_cycle. The sequence is stored to a registered variable.
                  pre_iog_rddata_en_p0_p_2 <= 0;
                  pre_iog_rddata_en_p0_n_2 <= 0;
                  pre_iog_rddata_en_p1_p_2 <= 0;
                  pre_iog_rddata_en_p1_n_2 <= 0;
                  pre_iog_rddata_en_p2_p_2 <= 0;
                  pre_iog_rddata_en_p2_n_2 <= 0;
                  pre_iog_rddata_en_p3_p_2 <= 0;
                  pre_iog_rddata_en_p3_n_2 <= 0;
                  visual_pre_iog_en_output_registered_2_next <= 0;
                  if (pre_iog_counter == 2)
                  begin
                     visual_pre_iog_en_output_registered_2_next <= pre_iog_en_output;
                     pre_iog_rddata_en_p0_p_2 <= pre_iog_en_output[23];
                     pre_iog_rddata_en_p0_n_2 <= pre_iog_en_output[22];
                     pre_iog_rddata_en_p1_p_2 <= pre_iog_en_output[21];
                     pre_iog_rddata_en_p1_n_2 <= pre_iog_en_output[20];
                     pre_iog_rddata_en_p2_p_2 <= pre_iog_en_output[19];
                     pre_iog_rddata_en_p2_n_2 <= pre_iog_en_output[18];
                     pre_iog_rddata_en_p3_p_2 <= pre_iog_en_output[17];
                     pre_iog_rddata_en_p3_n_2 <= pre_iog_en_output[16];
                     visual_shim_logic_2_next <= SCLK_2_2;
                  end
                  else
                  begin
                     visual_shim_logic_2_next <= SCLK_1_2;
                  end
               end
 
            SCLK_2_2:
               begin
 
                  //  Phase 1
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the second sclk cycle
                  pre_iog_rddata_en_p0_p_2 <= pre_iog_en_output_registered_2[15];
                  pre_iog_rddata_en_p0_n_2 <= pre_iog_en_output_registered_2[14];
                  pre_iog_rddata_en_p1_p_2 <= pre_iog_en_output_registered_2[13];
                  pre_iog_rddata_en_p1_n_2 <= pre_iog_en_output_registered_2[12];
                  pre_iog_rddata_en_p2_p_2 <= pre_iog_en_output_registered_2[11];
                  pre_iog_rddata_en_p2_n_2 <= pre_iog_en_output_registered_2[10];
                  pre_iog_rddata_en_p3_p_2 <= pre_iog_en_output_registered_2[9];
                  pre_iog_rddata_en_p3_n_2 <= pre_iog_en_output_registered_2[8];
                  visual_shim_logic_2_next <= SCLK_3_2;
               end
 
            SCLK_3_2:
               begin
 
                  //  Phase 2
                  //  The registered value of the answer is used to set the values of the phased
                  //  rddata_en outputs for the third and final sclk cycle
                  //
                  //  Restart to initial until another dfi_rddata_en_p3 is asserted
                  pre_iog_rddata_en_p0_p_2 <= pre_iog_en_output_registered_2[7];
                  pre_iog_rddata_en_p0_n_2 <= pre_iog_en_output_registered_2[6];
                  pre_iog_rddata_en_p1_p_2 <= pre_iog_en_output_registered_2[5];
                  pre_iog_rddata_en_p1_n_2 <= pre_iog_en_output_registered_2[4];
                  pre_iog_rddata_en_p2_p_2 <= pre_iog_en_output_registered_2[3];
                  pre_iog_rddata_en_p2_n_2 <= pre_iog_en_output_registered_2[2];
                  pre_iog_rddata_en_p3_p_2 <= pre_iog_en_output_registered_2[1];
                  pre_iog_rddata_en_p3_n_2 <= pre_iog_en_output_registered_2[0];
                  visual_shim_logic_2_next <= SCLK_1_2;
               end
 
            default:
               begin
                  visual_shim_logic_2_next <= SCLK_1_2;
               end
         endcase
//      end
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : shim_logic_2
 
      if (~(reset_n))
      begin
         pre_iog_en_output_registered_2 <= 0;
         visual_shim_logic_2_current <= SCLK_1_2;
      end
      else
      begin
         pre_iog_en_output_registered_2 <= visual_pre_iog_en_output_registered_2_next;
         visual_shim_logic_2_current <= visual_shim_logic_2_next;
      end
   end
 
 
 
   // Combinational process
   always  @(move_safe_counter or dfi_rddata_en_p3 or visual_wait_safe_move_current)
   begin : wait_safe_move_comb
      visual_move_safe_done_next <= 0;
      visual_move_safe_counter_next <= move_safe_counter;
 
 
 
      case (visual_wait_safe_move_current)
         WAIT_FOR_RDDATA_EN_P3_1:
            begin
               //  Wait for dfi_rddata_en_p3
               visual_move_safe_counter_next <= 1;
               if (dfi_rddata_en_p3)
               begin
                  visual_wait_safe_move_next <= WAIT_SAFE_SCLKS;
               end
               else
               begin
                  visual_wait_safe_move_next <= WAIT_FOR_RDDATA_EN_P3_1;
               end
            end
 
         WAIT_SAFE_SCLKS:
            begin
 
               //  Move a parameterized number of sclk cycles before asserting
               //  the move_safe_done flag signalling a good time to move/load
               //  and increment the phase
               if (move_safe_counter == MOVE_WAIT_DURATION)
               begin
                  visual_move_safe_done_next <= 1;
                  visual_wait_safe_move_next <= WAIT_FOR_RDDATA_EN_P3_1;
               end
               else
               begin
                  visual_move_safe_counter_next <= move_safe_counter + 1;
                  visual_wait_safe_move_next <= WAIT_SAFE_SCLKS;
               end
            end
 
         default:
            begin
               visual_wait_safe_move_next <= WAIT_FOR_RDDATA_EN_P3_1;
            end
      endcase
   end
 
   always  @(posedge sclk or negedge reset_n)
   begin : wait_safe_move
 
      if (~(reset_n))
      begin
         move_safe_done <= 0;
         move_safe_counter <= 1;
         visual_wait_safe_move_current <= WAIT_FOR_RDDATA_EN_P3_1;
      end
      else
      begin
         move_safe_counter <= visual_move_safe_counter_next;
         move_safe_done <= visual_move_safe_done_next;
         visual_wait_safe_move_current <= visual_wait_safe_move_next;
      end
   end
 
    // Comparing stored txdly with threshold
    assign txdly_high[0] = (txdly_0 > threshold);
    assign txdly_high[1] = (txdly_1 > threshold);
    assign txdly_high[2] = (txdly_2 > threshold);
    assign txdly_high[3] = (txdly_3 > threshold);
 
    // Register the current state of the state machine. For debug.
   assign gt_state = visual_gate_training_next;
 
   // Valid burst_detect detection
   assign burst_detect = ~burst_detect_in && burst_detect_s && ~burst_detect_ss;
 
   // Tie txdly direction
   assign txdly_direction = 1;
 
   // txdly out of range
   assign txdly_oor = (txdly_out_of_range) | (txdly_cnt == MAX_TXDLY_MOVE);
 
    // Concat errors
    assign error_comb = {no_burst_detect_error,oor_error, initial_burst_error};
 
    // Phase move current assign
    assign phase_move_current = (dfi_rdlvl_gate_en)? steps_180:(~dfi_rddata_cs_0_n)? steps_180_r0:steps_180_r1;
 
    // pre_iog_rddata_en assigns
    assign pre_iog_rddata_en_p0_p = pre_iog_rddata_en_p0_p_0 | pre_iog_rddata_en_p0_p_1 | pre_iog_rddata_en_p0_p_2;
    assign pre_iog_rddata_en_p0_n = pre_iog_rddata_en_p0_n_0 | pre_iog_rddata_en_p0_n_1 | pre_iog_rddata_en_p0_n_2;
    assign pre_iog_rddata_en_p1_p = pre_iog_rddata_en_p1_p_0 | pre_iog_rddata_en_p1_p_1 | pre_iog_rddata_en_p1_p_2;
    assign pre_iog_rddata_en_p1_n = pre_iog_rddata_en_p1_n_0 | pre_iog_rddata_en_p1_n_1 | pre_iog_rddata_en_p1_n_2;
    assign pre_iog_rddata_en_p2_p = pre_iog_rddata_en_p2_p_0 | pre_iog_rddata_en_p2_p_1 | pre_iog_rddata_en_p2_p_2;
    assign pre_iog_rddata_en_p2_n = pre_iog_rddata_en_p2_n_0 | pre_iog_rddata_en_p2_n_1 | pre_iog_rddata_en_p2_n_2;
    assign pre_iog_rddata_en_p3_p = pre_iog_rddata_en_p3_p_0 | pre_iog_rddata_en_p3_p_1 | pre_iog_rddata_en_p3_p_2;
    assign pre_iog_rddata_en_p3_n = pre_iog_rddata_en_p3_n_0 | pre_iog_rddata_en_p3_n_1 | pre_iog_rddata_en_p3_n_2;
 
   // IOG_rddata_en output algorithm.
   // Assign phase_move_X with the registered phase moves cutting off the lsb
   assign phase_move_p = phase_move_reg_plus1[4:1];
   assign phase_move_n = phase_move_reg[3:1];
    always @ (posedge sclk or negedge reset_n) begin
        if (!reset_n) fuzzy <= 1;
        else if (incr_fuzzy) fuzzy <= !fuzzy;
        else fuzzy <= fuzzy;
    end
 
endmodule

