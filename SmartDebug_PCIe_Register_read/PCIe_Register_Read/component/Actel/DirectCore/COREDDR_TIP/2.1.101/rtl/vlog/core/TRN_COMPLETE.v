//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                                               
//--    Crevinn Teoranta                                                                                                                                                                                                                        
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                                               
//-- Author      : $Author:$      jackh                                                                                                                                                                                      
//-- Date        : $Date:$                                                                                                                                                                                                                               
//-- Revision    : $Revision$                                                                                                                                                                                                                               
//-- Location    : $URL: $                                                                                                                                                                                                                               
//-- -----------------------------------------------------------------------------                                                                                                                                                                                                                               
//--------------------------------------------------
 
 
module TRN_COMPLETE (
                     //  input ports
                     dfi_rdlvl_cs_0_n,
                     dfi_rdlvl_cs_1_n,
                     dfi_wrlvl_en,
                     dfi_rdlvl_en,
                     dfi_rdlvl_gate_en,
                     two_ranks,
                     SCLK,
                     reset_n,
                     vref_training_complete,
                     dfi_rdlvl_resp_internal,
 
                     //  output ports
                     dfi_training_complete,
                     do_train_vref,
                     dfi_rdlvl_resp
                     );
 
   parameter        IOG_DQS_LANES             = 9;
//  input ports
   input            dfi_rdlvl_cs_0_n;
   wire             dfi_rdlvl_cs_0_n;
   input            dfi_rdlvl_cs_1_n;
   wire             dfi_rdlvl_cs_1_n;
   input            dfi_wrlvl_en;
   wire             dfi_wrlvl_en;
   input            dfi_rdlvl_en;
   wire             dfi_rdlvl_en;
   input            dfi_rdlvl_gate_en;
   wire             dfi_rdlvl_gate_en;
   input            two_ranks;
   wire             two_ranks;
   input            SCLK;
   wire             SCLK;
   input            reset_n;
   wire             reset_n;
   input            vref_training_complete;
   wire             vref_training_complete;
   input     [IOG_DQS_LANES - 1:0] dfi_rdlvl_resp_internal;
   wire      [IOG_DQS_LANES - 1:0] dfi_rdlvl_resp_internal;
//  output ports
   output           dfi_training_complete;
   reg              dfi_training_complete;
   output           do_train_vref;
   reg              do_train_vref;
   output    [IOG_DQS_LANES - 1:0] dfi_rdlvl_resp;
   wire      [IOG_DQS_LANES - 1:0] dfi_rdlvl_resp;
//  local signals
   reg       [IOG_DQS_LANES - 1:0] dfi_rdlvl_resp_extrnl;
 
   parameter ASSERT_RDLVL_RESP        = 4'b0000,
             ASSERT_RDLVL_RESP_2      = 4'b0001,
             DO_VREF                  = 4'b0010,
             FINISH                   = 4'b0011,
             RESPOND_TO_GATE_TRAINING = 4'b0100,
             TRN_INITIAL              = 4'b0101,
             WAIT_RDLVL               = 4'b0110,
             WAIT_RDLVL_REQ_RANK_1    = 4'b0111,
             WAIT_RDLVL_RESP_RANK_1   = 4'b1000,
             WAIT_RD_LVL_RESP_RANK_0  = 4'b1001;
 
 
   reg [3:0] visual_trn_compl_current, visual_trn_compl_next;
 
   reg              visual_dfi_training_complete_next;
   reg              visual_do_train_vref_next;
   reg       [IOG_DQS_LANES - 1:0] visual_dfi_rdlvl_resp_extrnl_next;
 
 
   // Combinational process
   always  @(dfi_training_complete or dfi_rdlvl_en or vref_training_complete or dfi_rdlvl_gate_en or dfi_wrlvl_en or dfi_rdlvl_cs_0_n or dfi_rdlvl_resp_internal or dfi_rdlvl_cs_1_n or two_ranks or
             visual_trn_compl_current)
   begin : trn_compl_comb
      visual_do_train_vref_next <= 0;
      visual_dfi_training_complete_next <= dfi_training_complete;
      visual_dfi_rdlvl_resp_extrnl_next <= 0;
 
 
 
      case (visual_trn_compl_current)
         ASSERT_RDLVL_RESP:
            begin
               visual_dfi_rdlvl_resp_extrnl_next <= ((2 ** IOG_DQS_LANES) - 1);
               if (dfi_rdlvl_en == 1'b0)
               begin
                  visual_dfi_rdlvl_resp_extrnl_next <= 0;
                  visual_trn_compl_next <= WAIT_RDLVL_REQ_RANK_1;
               end
               else
               begin
                  visual_trn_compl_next <= ASSERT_RDLVL_RESP;
               end
            end
 
         ASSERT_RDLVL_RESP_2:
            begin
               visual_dfi_rdlvl_resp_extrnl_next <= ((2 ** IOG_DQS_LANES) - 1);
               if (dfi_rdlvl_en == 1'b0)
               begin
                  visual_dfi_rdlvl_resp_extrnl_next <= 0;
                  visual_trn_compl_next <= FINISH;
               end
               else
               begin
                  visual_trn_compl_next <= ASSERT_RDLVL_RESP_2;
               end
            end
 
         DO_VREF:
            begin
               if (vref_training_complete == 1'b1)
               begin
                  visual_trn_compl_next <= ASSERT_RDLVL_RESP_2;
               end
               else
               begin
                  visual_do_train_vref_next <= 1'b1;
                  visual_trn_compl_next <= DO_VREF;
               end
            end
 
         FINISH:
            begin
               visual_dfi_training_complete_next <= 1'b1;
               visual_trn_compl_next <= TRN_INITIAL;
            end
 
         RESPOND_TO_GATE_TRAINING:
            begin
               visual_dfi_rdlvl_resp_extrnl_next <= ((2 ** IOG_DQS_LANES) - 1);
               if (dfi_rdlvl_gate_en == 1'b0)
               begin
                  visual_dfi_rdlvl_resp_extrnl_next <= 0;
                  visual_trn_compl_next <= WAIT_RDLVL;
               end
               else
               begin
                  visual_trn_compl_next <= RESPOND_TO_GATE_TRAINING;
               end
            end
 
         TRN_INITIAL:
            begin
               if ((dfi_rdlvl_en == 1'b1) || (dfi_rdlvl_gate_en == 1'b1) || (dfi_wrlvl_en == 1'b1))
               begin
                  visual_dfi_training_complete_next <= 1'b0;
                  visual_trn_compl_next <= WAIT_RDLVL;
               end
               else
               begin
                  visual_trn_compl_next <= TRN_INITIAL;
               end
            end
 
         WAIT_RDLVL:
            begin
               if (dfi_rdlvl_en && (!(dfi_rdlvl_cs_0_n)))
               begin
                  visual_trn_compl_next <= WAIT_RD_LVL_RESP_RANK_0;
               end
               else if (dfi_rdlvl_gate_en && (dfi_rdlvl_resp_internal == ((2 ** IOG_DQS_LANES) - 1)))
               begin
                  visual_trn_compl_next <= RESPOND_TO_GATE_TRAINING;
               end
               else
               begin
                  visual_trn_compl_next <= WAIT_RDLVL;
               end
            end
 
         WAIT_RDLVL_REQ_RANK_1:
            begin
               if (dfi_rdlvl_en && (!(dfi_rdlvl_cs_1_n)))
               begin
                  visual_trn_compl_next <= WAIT_RDLVL_RESP_RANK_1;
               end
               else
               begin
                  visual_trn_compl_next <= WAIT_RDLVL_REQ_RANK_1;
               end
            end
 
         WAIT_RDLVL_RESP_RANK_1:
            begin
               if (dfi_rdlvl_resp_internal == ((2 ** IOG_DQS_LANES) - 1))
               begin
                  visual_do_train_vref_next <= 1'b1;
                  visual_trn_compl_next <= DO_VREF;
               end
               else
               begin
                  visual_trn_compl_next <= WAIT_RDLVL_RESP_RANK_1;
               end
            end
 
         WAIT_RD_LVL_RESP_RANK_0:
            begin
               if (dfi_rdlvl_resp_internal == ((2 ** IOG_DQS_LANES) - 1))
               begin
                  if (two_ranks == 1'b1)
                  begin
                     visual_trn_compl_next <= ASSERT_RDLVL_RESP;
                  end
                  else
                  begin
                     visual_do_train_vref_next <= 1'b1;
                     visual_trn_compl_next <= DO_VREF;
                  end
               end
               else
               begin
                  visual_trn_compl_next <= WAIT_RD_LVL_RESP_RANK_0;
               end
            end
 
         default:
            begin
               visual_trn_compl_next <= TRN_INITIAL;
            end
      endcase
   end
 
   always  @(posedge SCLK or negedge reset_n)
   begin : trn_compl
 
      if (reset_n == 1'b0)
      begin
         do_train_vref <= 0;
         dfi_rdlvl_resp_extrnl <= 0;
         dfi_training_complete <= 1'b0;
         visual_trn_compl_current <= TRN_INITIAL;
      end
      else
      begin
         dfi_training_complete <= visual_dfi_training_complete_next;
         do_train_vref <= visual_do_train_vref_next;
         dfi_rdlvl_resp_extrnl <= visual_dfi_rdlvl_resp_extrnl_next;
         visual_trn_compl_current <= visual_trn_compl_next;
      end
   end
 
   assign dfi_rdlvl_resp = dfi_rdlvl_resp_extrnl;
 
 
endmodule

