//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                                                        
//--    Crevinn Teoranta                                                                                                                                                                                 
//-- -----------------------------------------------------------------------------                                                                                                                                                                                        
//-- Author      : $Author stephenm                                    
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                                                        
//-- Revision    : $Revision: 1.11 $                                                                                                                                                                                        
//-- Location    : $URL: $                                                                                                                                                                                        
//-- -----------------------------------------------------------------------------                                                                                                                                                                                        
//=======                                                  
//-- -----------------------------------------------------------------------------                                                                                                                                                                                         
//--    Crevinn Teoranta                                                                                                                                                                                  
//-- -----------------------------------------------------------------------------                                                                                                                                                                                         
//-- Author      : $Author:stephenm                                                              
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                                                         
//-- Revision    : $Revision: 1.11 $                                                                                                                                                                                         
//-- Location    : $URL: $                                                                                                                                                                                         
//-- -----------------------------------------------------------------------------                                                                                                                                                                                         
//--------------------------------------------------


// AS: 5/10/17
//     TO-DO:
//     - Used line_select_reg between DQSW and DQSW270
//       => line_select_reg[6] : apb_ctrl_dqsw_sel (new signal)

 
module APB_IOG_CTRL_SM (
                        //  input ports
                        SCLK,
                        reset_n,
                        out_of_range,
                        apb_addr,
                        apb_we,
                        apb_data_in,
                        dfi_training_complete,
 
                        //  output ports
                        move_out,
                        direction_out,
                        load_out,
                        apb_data_out,
                        iog_lane_sel,
                        apb_iog_on,
                        apb_ctrl_delay_line_sel,
                        apb_ctrl_chip_sel,
                        apb_block_fifo,
                        apb_pause,
                        apb_ctrl_dqsw_sel
                        );
 
//  input ports
   input         SCLK;
   wire          SCLK;
   input         reset_n;
   wire          reset_n;
   input  [8:0]  out_of_range;
   wire   [8:0]  out_of_range;
   input  [15:0] apb_addr;
   wire   [15:0] apb_addr;
   input         apb_we;
   wire          apb_we;
   input  [7:0]  apb_data_in;
   wire   [7:0]  apb_data_in;
   input         dfi_training_complete;
   wire          dfi_training_complete;
//  output ports
   output [8:0]  move_out;
   reg    [8:0]  move_out;
   output [8:0]  direction_out;
   wire   [8:0]  direction_out;
   output [8:0]  load_out;
   reg    [8:0]  load_out;
   output [7:0]  apb_data_out;
   reg    [7:0]  apb_data_out;
   output [3:0]  iog_lane_sel;
   reg    [3:0]  iog_lane_sel;
   output        apb_iog_on;
   reg           apb_iog_on;
   output        apb_ctrl_delay_line_sel;
   wire          apb_ctrl_delay_line_sel;
   output        apb_ctrl_chip_sel;
   wire          apb_ctrl_chip_sel;
   output        apb_block_fifo;
   wire          apb_block_fifo;
   output        apb_pause;
   wire          apb_pause;
   output        apb_ctrl_dqsw_sel;
   wire          apb_ctrl_dqsw_sel;
//  local signals
   reg    [7:0]  delay_cnt;
   reg    [7:0]  delay_reg;
   reg    [7:0]  csr_reg;
   reg           oor_detected;
   reg           reset_wr_regs;
   wire          direction_r;
   wire          start_load;
   wire          start_delaying;
   wire   [3:0]  iog_lane_sel_r;
   reg    [7:0]  delay_at_oor_reg;
   reg    [7:0]  line_select_reg;
   reg           move;
   reg           load;
   reg           direction;
   wire   [3:0]  iog_dq_dqs_sel;
   reg    [2:0]  move_delay;
   reg    [7:0]  special_reg;
 
   parameter FINISH  = 3'b000,
             INITIAL = 3'b001,
             LOAD    = 3'b010,
             MOVE_HI = 3'b011,
             MOVE_LO = 3'b100;
 
 
   reg [2:0] visual_APB_IOG_CONTROLLER_current, visual_APB_IOG_CONTROLLER_next;
 
   reg    [3:0]  visual_iog_lane_sel_next;
   reg           visual_apb_iog_on_next;
   reg    [7:0]  visual_delay_cnt_next;
   reg           visual_oor_detected_next;
   reg           visual_reset_wr_regs_next;
   reg    [7:0]  visual_delay_at_oor_reg_next;
   reg           visual_move_next;
   reg           visual_load_next;
   reg           visual_direction_next;
   reg    [2:0]  visual_move_delay_next;
 
 
   // Combinational process
   always  @(delay_cnt or oor_detected or delay_at_oor_reg or direction or iog_lane_sel or apb_iog_on or direction_r or iog_lane_sel_r or dfi_training_complete or start_load or start_delaying or
             move_delay or out_of_range or iog_dq_dqs_sel or delay_reg or visual_APB_IOG_CONTROLLER_current)
   begin : APB_IOG_CONTROLLER_comb
      visual_reset_wr_regs_next <= 0;
      visual_move_next <= 0;
      visual_load_next <= 0;
      visual_move_delay_next <= 0;
      visual_delay_cnt_next <= delay_cnt;
      visual_oor_detected_next <= oor_detected;
      visual_delay_at_oor_reg_next <= delay_at_oor_reg;
      visual_direction_next <= direction;
      visual_iog_lane_sel_next <= iog_lane_sel;
      visual_apb_iog_on_next <= apb_iog_on;
 
 
 
      case (visual_APB_IOG_CONTROLLER_current)
         FINISH:
            begin
               visual_APB_IOG_CONTROLLER_next <= INITIAL;
            end
 
         INITIAL:
            begin
               visual_delay_cnt_next <= 0;
               visual_direction_next <= direction_r;
               visual_iog_lane_sel_next <= iog_lane_sel_r;
               visual_apb_iog_on_next <= 1'b0;
               if (dfi_training_complete == 1'b1)
               begin
                  if (start_load == 1'b1)
                  begin
                     visual_delay_at_oor_reg_next <= 0;
                     visual_apb_iog_on_next <= 1'b1;
                     visual_APB_IOG_CONTROLLER_next <= LOAD;
                  end
                  else if (start_delaying == 1'b1)
                  begin
                     visual_delay_at_oor_reg_next <= 0;
                     visual_apb_iog_on_next <= 1'b1;
                     visual_oor_detected_next <= 1'b0;
                     visual_APB_IOG_CONTROLLER_next <= MOVE_HI;
                  end
                  else
                  begin
                     visual_APB_IOG_CONTROLLER_next <= INITIAL;
                  end
               end
               else
               begin
                  visual_APB_IOG_CONTROLLER_next <= INITIAL;
               end
            end
 
         LOAD:
            begin
               visual_load_next <= 1'b1;
               visual_reset_wr_regs_next <= 1'b1;
               visual_APB_IOG_CONTROLLER_next <= FINISH;
            end
 
         MOVE_HI:
            begin
               visual_move_delay_next <= move_delay + 1;
               if (move_delay == 3'h4)
               begin
                  if (out_of_range[iog_dq_dqs_sel] == 1'b1)
                  begin
                     visual_oor_detected_next <= 1'b1;
                     visual_reset_wr_regs_next <= 1'b1;
                     visual_delay_at_oor_reg_next <= delay_cnt;
                     visual_APB_IOG_CONTROLLER_next <= FINISH;
                  end
                  else if (delay_cnt == delay_reg)
                  begin
                     visual_reset_wr_regs_next <= 1'b1;
                     visual_APB_IOG_CONTROLLER_next <= FINISH;
                  end
                  else
                  begin
                     visual_move_next <= 1'b1;
                     visual_APB_IOG_CONTROLLER_next <= MOVE_LO;
                  end
               end
               else
               begin
                  visual_APB_IOG_CONTROLLER_next <= MOVE_HI;
               end
            end
 
         MOVE_LO:
            begin
               visual_delay_cnt_next <= delay_cnt + 1'b1;
               visual_APB_IOG_CONTROLLER_next <= MOVE_HI;
            end
 
         default:
            begin
               visual_APB_IOG_CONTROLLER_next <= INITIAL;
            end
      endcase
   end
 
   always  @(posedge SCLK or negedge reset_n)
   begin : APB_IOG_CONTROLLER
 
      if (reset_n == 1'b0)
      begin
         reset_wr_regs <= 0;
         load <= 0;
         move_delay <= 0;
         delay_cnt <= 0;
         move <= 0;
         direction <= 0;
         delay_at_oor_reg <= 0;
         oor_detected <= 1'b0;
         apb_iog_on <= 0;  // signal to say state machine is active
         // ie so that IOG_IG knows to MUX our sm signals in
         visual_APB_IOG_CONTROLLER_current <= INITIAL;
         iog_lane_sel <= 0;
      end
      else
      begin
         iog_lane_sel <= visual_iog_lane_sel_next;
         apb_iog_on <= visual_apb_iog_on_next;
         delay_cnt <= visual_delay_cnt_next;
         oor_detected <= visual_oor_detected_next;
         reset_wr_regs <= visual_reset_wr_regs_next;
         delay_at_oor_reg <= visual_delay_at_oor_reg_next;
         move <= visual_move_next;
         load <= visual_load_next;
         direction <= visual_direction_next;
         move_delay <= visual_move_delay_next;
         visual_APB_IOG_CONTROLLER_current <= visual_APB_IOG_CONTROLLER_next;
      end
   end
 
 
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :APB_Write
 
      if (reset_n == 1'b0)
      begin
         delay_reg <= 8'h0;
         csr_reg <= 8'h0;
         line_select_reg <= 8'h0;
         special_reg <= 8'h0;
      end
      else
      begin
         if (reset_wr_regs == 1'b1)
         begin
            delay_reg <= delay_reg;
            csr_reg[7:2] <= csr_reg[7:2];
            csr_reg[1:0] <= 2'b00;
            line_select_reg <= line_select_reg;
         end
         else
         begin
            if (apb_we == 1'b1)
            begin
               case (apb_addr[2:0])
 
                  3'b000 :
                     begin
                        delay_reg <= apb_data_in;
                        csr_reg <= csr_reg;
                        line_select_reg <= line_select_reg;
                     end
 
                  3'b001 :
                     begin
                        delay_reg <= delay_reg;
                        csr_reg <= apb_data_in;
                        line_select_reg <= line_select_reg;
                     end
 
                  3'b010 :
                     begin
                        delay_reg <= delay_reg;
                        csr_reg <= csr_reg;
                        line_select_reg <= apb_data_in;
                     end
 
                  3'b100 :
                     begin
                        special_reg <= apb_data_in;
                     end
 
                  default  :
                     begin
                        delay_reg <= delay_reg;
                        csr_reg <= csr_reg;
                        line_select_reg <= line_select_reg;
                     end
               endcase
            end
            else
            begin
               delay_reg <= delay_reg;
               csr_reg[6:0] <= csr_reg[6:0];
               csr_reg[7] <= oor_detected;
               line_select_reg <= line_select_reg;
            end
         end
      end
   end
 
 
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :APB_Read
 
      if (reset_n == 1'b0)
      begin
         apb_data_out <= 8'h0;
      end
      else
      begin
         case (apb_addr[2:0])
 
            3'b000 :
               begin
                  apb_data_out <= delay_reg;
               end
 
            3'b001 :
               begin
                  apb_data_out <= csr_reg;
               end
 
            3'b010 :
               begin
                  apb_data_out <= line_select_reg;
               end
 
            3'b011 :
               begin
                  apb_data_out <= delay_at_oor_reg;
               end
 
            3'b100 :
               begin
                  apb_data_out <= special_reg;
               end
 
            default  :
               begin
                  apb_data_out <= delay_at_oor_reg;
               end
         endcase
      end
   end
 
 
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :Move_Load
 
      if (reset_n == 1'b0)
      begin
         move_out <= 9'h0;
         load_out <= 9'h0;
      end
      else
      begin
         move_out <= 9'h0;
         load_out <= 9'h0;
         move_out[iog_dq_dqs_sel] <= move;
         load_out[iog_dq_dqs_sel] <= load;
      end
   end
 
   assign start_delaying = csr_reg[0];
   assign start_load = csr_reg[1];
   assign direction_r = csr_reg[2];
   assign iog_lane_sel_r = (csr_reg[6:3] > 4'h8) ? 4'h8 : csr_reg[6:3];
   assign iog_dq_dqs_sel = line_select_reg[3:0];
   assign apb_ctrl_delay_line_sel = line_select_reg[4];
   assign apb_ctrl_chip_sel = line_select_reg[5];
   assign apb_ctrl_dqsw_sel = line_select_reg[6];
   assign direction_out = direction ? 9'h1FF : 9'h0;
 
   //special_reg signals
   assign apb_pause = special_reg[0];
   assign apb_block_fifo = special_reg[1];
 
 
endmodule
