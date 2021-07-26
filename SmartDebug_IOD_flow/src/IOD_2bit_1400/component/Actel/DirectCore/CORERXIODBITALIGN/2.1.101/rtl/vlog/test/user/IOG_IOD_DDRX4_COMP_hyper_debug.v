// available hyper connections - for debug and ip models
// timestamp: 1564387445


`ifndef SYN_HYPER_CONNECT
`define SYN_HYPER_CONNECT 1
module syn_hyper_connect(out) /* synthesis syn_black_box=1 syn_noprune=1 */;
parameter w = 1;
parameter tag = "xxx";
parameter dflt = 0;
parameter mustconnect = 1'b1;
output [w-1:0] out;
endmodule
`endif

module IOG_IOD_DDRX4_COMP_hyper_debug(dummy);
input dummy; /* avoid compiler error for no ports */

wire BIT_ALGN_DONE_0_0;
syn_hyper_connect BIT_ALGN_DONE_0_connect_0(BIT_ALGN_DONE_0_0);
defparam BIT_ALGN_DONE_0_connect_0.tag = "BIT_ALGN_DONE_0";


wire BIT_ALGN_ERR_0;
syn_hyper_connect BIT_ALGN_ERR_connect_0(BIT_ALGN_ERR_0);
defparam BIT_ALGN_ERR_connect_0.tag = "BIT_ALGN_ERR";

wire BIT_ALGN_ERR_1;
syn_hyper_connect BIT_ALGN_ERR_connect_1(BIT_ALGN_ERR_1);
defparam BIT_ALGN_ERR_connect_1.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_ERR";


wire BIT_ALGN_OOR_0_0;
syn_hyper_connect BIT_ALGN_OOR_0_connect_0(BIT_ALGN_OOR_0_0);
defparam BIT_ALGN_OOR_0_connect_0.tag = "BIT_ALGN_OOR_0";


wire BIT_ALGN_START_0_0;
syn_hyper_connect BIT_ALGN_START_0_connect_0(BIT_ALGN_START_0_0);
defparam BIT_ALGN_START_0_connect_0.tag = "BIT_ALGN_START_0";


wire [7:0] PRBSGEN_DATA_0;
syn_hyper_connect PRBSGEN_DATA_connect_0(PRBSGEN_DATA_0);
defparam PRBSGEN_DATA_connect_0.w = 8;
defparam PRBSGEN_DATA_connect_0.tag = "PRBSGEN_DATA";


wire PRBS_ERR_0;
syn_hyper_connect PRBS_ERR_connect_0(PRBS_ERR_0);
defparam PRBS_ERR_connect_0.tag = "PRBS_ERR";


wire OUT2_FABCLK_0_0;
syn_hyper_connect OUT2_FABCLK_0_connect_0(OUT2_FABCLK_0_0);
defparam OUT2_FABCLK_0_connect_0.tag = "IOG_IOD_CLOCK_0.OUT2_FABCLK_0";


wire [7:0] L0_RXD_DATA_0;
syn_hyper_connect L0_RXD_DATA_connect_0(L0_RXD_DATA_0);
defparam L0_RXD_DATA_connect_0.w = 8;
defparam L0_RXD_DATA_connect_0.tag = "IOG_IOD_DDRX4_PF_0.L0_RXD_DATA";


wire [7:0] prbs_out_o_0;
syn_hyper_connect prbs_out_o_connect_0(prbs_out_o_0);
defparam prbs_out_o_connect_0.w = 8;
defparam prbs_out_o_connect_0.tag = "prbsgen_parallel_fab_0.prbs_out_o";


wire [7:0] prbs_out_msb_o_0;
syn_hyper_connect prbs_out_msb_o_connect_0(prbs_out_msb_o_0);
defparam prbs_out_msb_o_connect_0.w = 8;
defparam prbs_out_msb_o_connect_0.tag = "prbsgen_parallel_fab_0.prbs_out_msb_o";


wire [14:0] s_prbsin_0;
syn_hyper_connect s_prbsin_connect_0(s_prbsin_0);
defparam s_prbsin_connect_0.w = 15;
defparam s_prbsin_connect_0.tag = "prbsgen_parallel_fab_0.s_prbsin";


wire CLK_0;
syn_hyper_connect CLK_connect_0(CLK_0);
defparam CLK_connect_0.tag = "debouncer_0.CLK";


wire RESET_N_0;
syn_hyper_connect RESET_N_connect_0(RESET_N_0);
defparam RESET_N_connect_0.tag = "debouncer_0.RESET_N";


wire SWITCH_0;
syn_hyper_connect SWITCH_connect_0(SWITCH_0);
defparam SWITCH_connect_0.tag = "debouncer_0.SWITCH";


wire [3:0] q_reg_0;
syn_hyper_connect q_reg_connect_0(q_reg_0);
defparam q_reg_connect_0.w = 4;
defparam q_reg_connect_0.tag = "debouncer_0.q_reg";


wire [3:0] q_next_0;
syn_hyper_connect q_next_connect_0(q_next_0);
defparam q_next_connect_0.w = 4;
defparam q_next_connect_0.tag = "debouncer_0.q_next";


wire DFF1_0;
syn_hyper_connect DFF1_connect_0(DFF1_0);
defparam DFF1_connect_0.tag = "debouncer_0.DFF1";


wire DFF2_0;
syn_hyper_connect DFF2_connect_0(DFF2_0);
defparam DFF2_connect_0.tag = "debouncer_0.DFF2";


wire q_add_0;
syn_hyper_connect q_add_connect_0(q_add_0);
defparam q_add_connect_0.tag = "debouncer_0.q_add";


wire q_reset_0;
syn_hyper_connect q_reset_connect_0(q_reset_0);
defparam q_reset_connect_0.tag = "debouncer_0.q_reset";


wire IOD_EARLY_0;
syn_hyper_connect IOD_EARLY_connect_0(IOD_EARLY_0);
defparam IOD_EARLY_connect_0.tag = "CoreRxIODBitAlign_top_0.IOD_EARLY";


wire IOD_LATE_0;
syn_hyper_connect IOD_LATE_connect_0(IOD_LATE_0);
defparam IOD_LATE_connect_0.tag = "CoreRxIODBitAlign_top_0.IOD_LATE";


wire IOD_OOR_0;
syn_hyper_connect IOD_OOR_connect_0(IOD_OOR_0);
defparam IOD_OOR_connect_0.tag = "CoreRxIODBitAlign_top_0.IOD_OOR";


wire BIT_ALGN_START_0;
syn_hyper_connect BIT_ALGN_START_connect_0(BIT_ALGN_START_0);
defparam BIT_ALGN_START_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_START";


wire BIT_ALGN_DONE_0;
syn_hyper_connect BIT_ALGN_DONE_connect_0(BIT_ALGN_DONE_0);
defparam BIT_ALGN_DONE_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_DONE";


wire BIT_ALGN_OOR_0;
syn_hyper_connect BIT_ALGN_OOR_connect_0(BIT_ALGN_OOR_0);
defparam BIT_ALGN_OOR_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_OOR";


wire BIT_ALGN_RSTRT_0;
syn_hyper_connect BIT_ALGN_RSTRT_connect_0(BIT_ALGN_RSTRT_0);
defparam BIT_ALGN_RSTRT_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_RSTRT";


wire BIT_ALGN_HOLD_0;
syn_hyper_connect BIT_ALGN_HOLD_connect_0(BIT_ALGN_HOLD_0);
defparam BIT_ALGN_HOLD_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_HOLD";


wire [2:0] BIT_ALGN_EYE_IN_0;
syn_hyper_connect BIT_ALGN_EYE_IN_connect_0(BIT_ALGN_EYE_IN_0);
defparam BIT_ALGN_EYE_IN_connect_0.w = 3;
defparam BIT_ALGN_EYE_IN_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_EYE_IN";


wire BIT_ALGN_CLR_FLGS_0;
syn_hyper_connect BIT_ALGN_CLR_FLGS_connect_0(BIT_ALGN_CLR_FLGS_0);
defparam BIT_ALGN_CLR_FLGS_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_CLR_FLGS";


wire BIT_ALGN_LOAD_0;
syn_hyper_connect BIT_ALGN_LOAD_connect_0(BIT_ALGN_LOAD_0);
defparam BIT_ALGN_LOAD_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_LOAD";


wire BIT_ALGN_DIR_0;
syn_hyper_connect BIT_ALGN_DIR_connect_0(BIT_ALGN_DIR_0);
defparam BIT_ALGN_DIR_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_DIR";


wire BIT_ALGN_MOVE_0;
syn_hyper_connect BIT_ALGN_MOVE_connect_0(BIT_ALGN_MOVE_0);
defparam BIT_ALGN_MOVE_connect_0.tag = "CoreRxIODBitAlign_top_0.BIT_ALGN_MOVE";


wire PLL_LOCK_0;
syn_hyper_connect PLL_LOCK_connect_0(PLL_LOCK_0);
defparam PLL_LOCK_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.PLL_LOCK";


wire rx_BIT_ALGN_START_0;
syn_hyper_connect rx_BIT_ALGN_START_connect_0(rx_BIT_ALGN_START_0);
defparam rx_BIT_ALGN_START_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_START";


wire rx_BIT_ALGN_DONE_0;
syn_hyper_connect rx_BIT_ALGN_DONE_connect_0(rx_BIT_ALGN_DONE_0);
defparam rx_BIT_ALGN_DONE_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_DONE";


wire rx_BIT_ALGN_ERR_0;
syn_hyper_connect rx_BIT_ALGN_ERR_connect_0(rx_BIT_ALGN_ERR_0);
defparam rx_BIT_ALGN_ERR_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_ERR";


wire rx_BIT_ALGN_OOR_0;
syn_hyper_connect rx_BIT_ALGN_OOR_connect_0(rx_BIT_ALGN_OOR_0);
defparam rx_BIT_ALGN_OOR_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_OOR";


wire rx_BIT_ALGN_CLR_FLGS_0;
syn_hyper_connect rx_BIT_ALGN_CLR_FLGS_connect_0(rx_BIT_ALGN_CLR_FLGS_0);
defparam rx_BIT_ALGN_CLR_FLGS_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_CLR_FLGS";


wire rx_BIT_ALGN_LOAD_0;
syn_hyper_connect rx_BIT_ALGN_LOAD_connect_0(rx_BIT_ALGN_LOAD_0);
defparam rx_BIT_ALGN_LOAD_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_LOAD";


wire rx_BIT_ALGN_DIR_0;
syn_hyper_connect rx_BIT_ALGN_DIR_connect_0(rx_BIT_ALGN_DIR_0);
defparam rx_BIT_ALGN_DIR_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_DIR";


wire rx_BIT_ALGN_MOVE_0;
syn_hyper_connect rx_BIT_ALGN_MOVE_connect_0(rx_BIT_ALGN_MOVE_0);
defparam rx_BIT_ALGN_MOVE_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_MOVE";


wire [2:0] rx_BIT_ALGN_EYE_OUT_0;
syn_hyper_connect rx_BIT_ALGN_EYE_OUT_connect_0(rx_BIT_ALGN_EYE_OUT_0);
defparam rx_BIT_ALGN_EYE_OUT_connect_0.w = 3;
defparam rx_BIT_ALGN_EYE_OUT_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_EYE_OUT";


wire rx_err_0;
syn_hyper_connect rx_err_connect_0(rx_err_0);
defparam rx_err_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_err";


wire rx_trng_done_0;
syn_hyper_connect rx_trng_done_connect_0(rx_trng_done_0);
defparam rx_trng_done_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_trng_done";


wire calc_done_0;
syn_hyper_connect calc_done_connect_0(calc_done_0);
defparam calc_done_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.calc_done";


wire early_last_set_0;
syn_hyper_connect early_last_set_connect_0(early_last_set_0);
defparam early_last_set_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_last_set";


wire early_cur_set_0;
syn_hyper_connect early_cur_set_connect_0(early_cur_set_0);
defparam early_cur_set_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_cur_set";


wire late_cur_set_0;
syn_hyper_connect late_cur_set_connect_0(late_cur_set_0);
defparam late_cur_set_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.late_cur_set";


wire late_last_set_0;
syn_hyper_connect late_last_set_connect_0(late_last_set_0);
defparam late_last_set_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.late_last_set";


wire bit_align_dly_done_0;
syn_hyper_connect bit_align_dly_done_connect_0(bit_align_dly_done_0);
defparam bit_align_dly_done_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.bit_align_dly_done";


wire bit_align_done_0;
syn_hyper_connect bit_align_done_connect_0(bit_align_done_0);
defparam bit_align_done_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.bit_align_done";


wire bit_align_start_0;
syn_hyper_connect bit_align_start_connect_0(bit_align_start_0);
defparam bit_align_start_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.bit_align_start";


wire mv_dn_fg_0;
syn_hyper_connect mv_dn_fg_connect_0(mv_dn_fg_0);
defparam mv_dn_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.mv_dn_fg";


wire mv_up_fg_0;
syn_hyper_connect mv_up_fg_connect_0(mv_up_fg_0);
defparam mv_up_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.mv_up_fg";


wire [127:0] early_flags_0;
syn_hyper_connect early_flags_connect_0(early_flags_0);
defparam early_flags_connect_0.w = 128;
defparam early_flags_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_flags";


wire [127:0] late_flags_0;
syn_hyper_connect late_flags_connect_0(late_flags_0);
defparam late_flags_connect_0.w = 128;
defparam late_flags_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.late_flags";


wire rx_BIT_ALGN_HOLD_flag_0;
syn_hyper_connect rx_BIT_ALGN_HOLD_flag_connect_0(rx_BIT_ALGN_HOLD_flag_0);
defparam rx_BIT_ALGN_HOLD_flag_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rx_BIT_ALGN_HOLD_flag";


wire [6:0] early_val_0;
syn_hyper_connect early_val_connect_0(early_val_0);
defparam early_val_connect_0.w = 7;
defparam early_val_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_val";


wire [6:0] late_val_0;
syn_hyper_connect late_val_connect_0(late_val_0);
defparam late_val_connect_0.w = 7;
defparam late_val_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.late_val";


wire [6:0] no_early_no_late_val_st1_0;
syn_hyper_connect no_early_no_late_val_st1_connect_0(no_early_no_late_val_st1_0);
defparam no_early_no_late_val_st1_connect_0.w = 7;
defparam no_early_no_late_val_st1_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.no_early_no_late_val_st1";


wire [6:0] no_early_no_late_val_end1_0;
syn_hyper_connect no_early_no_late_val_end1_connect_0(no_early_no_late_val_end1_0);
defparam no_early_no_late_val_end1_connect_0.w = 7;
defparam no_early_no_late_val_end1_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.no_early_no_late_val_end1";


wire [6:0] no_early_no_late_val_st2_0;
syn_hyper_connect no_early_no_late_val_st2_connect_0(no_early_no_late_val_st2_0);
defparam no_early_no_late_val_st2_connect_0.w = 7;
defparam no_early_no_late_val_st2_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.no_early_no_late_val_st2";


wire [6:0] no_early_no_late_val_end2_0;
syn_hyper_connect no_early_no_late_val_end2_connect_0(no_early_no_late_val_end2_0);
defparam no_early_no_late_val_end2_connect_0.w = 7;
defparam no_early_no_late_val_end2_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.no_early_no_late_val_end2";


wire [7:0] tapcnt_final_0;
syn_hyper_connect tapcnt_final_connect_0(tapcnt_final_0);
defparam tapcnt_final_connect_0.w = 8;
defparam tapcnt_final_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.tapcnt_final";


wire [7:0] tapcnt_final_upd_0;
syn_hyper_connect tapcnt_final_upd_connect_0(tapcnt_final_upd_0);
defparam tapcnt_final_upd_connect_0.w = 8;
defparam tapcnt_final_upd_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.tapcnt_final_upd";


wire [2:0] wait_cnt_0;
syn_hyper_connect wait_cnt_connect_0(wait_cnt_0);
defparam wait_cnt_connect_0.w = 3;
defparam wait_cnt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.wait_cnt";


wire [6:0] tap_cnt_0;
syn_hyper_connect tap_cnt_connect_0(tap_cnt_0);
defparam tap_cnt_connect_0.w = 7;
defparam tap_cnt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.tap_cnt";


wire [4:0] bitalign_curr_state_0;
syn_hyper_connect bitalign_curr_state_connect_0(bitalign_curr_state_0);
defparam bitalign_curr_state_connect_0.w = 5;
defparam bitalign_curr_state_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.bitalign_curr_state";


wire [4:0] bitalign_hold_state_0;
syn_hyper_connect bitalign_hold_state_connect_0(bitalign_hold_state_0);
defparam bitalign_hold_state_connect_0.w = 5;
defparam bitalign_hold_state_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.bitalign_hold_state";


wire [6:0] emflag_cnt_0;
syn_hyper_connect emflag_cnt_connect_0(emflag_cnt_0);
defparam emflag_cnt_connect_0.w = 7;
defparam emflag_cnt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.emflag_cnt";


wire [7:0] sig_tapcnt_final_upd_0;
syn_hyper_connect sig_tapcnt_final_upd_connect_0(sig_tapcnt_final_upd_0);
defparam sig_tapcnt_final_upd_connect_0.w = 8;
defparam sig_tapcnt_final_upd_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.sig_tapcnt_final_upd";


wire [7:0] early_late_diff_0;
syn_hyper_connect early_late_diff_connect_0(early_late_diff_0);
defparam early_late_diff_connect_0.w = 8;
defparam early_late_diff_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_late_diff";


wire [7:0] noearly_nolate_diff_start_0;
syn_hyper_connect noearly_nolate_diff_start_connect_0(noearly_nolate_diff_start_0);
defparam noearly_nolate_diff_start_connect_0.w = 8;
defparam noearly_nolate_diff_start_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.noearly_nolate_diff_start";


wire [7:0] noearly_nolate_diff_nxt_0;
syn_hyper_connect noearly_nolate_diff_nxt_connect_0(noearly_nolate_diff_nxt_0);
defparam noearly_nolate_diff_nxt_connect_0.w = 8;
defparam noearly_nolate_diff_nxt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.noearly_nolate_diff_nxt";


wire early_late_diff_valid_0;
syn_hyper_connect early_late_diff_valid_connect_0(early_late_diff_valid_0);
defparam early_late_diff_valid_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.early_late_diff_valid";


wire noearly_nolate_diff_start_valid_0;
syn_hyper_connect noearly_nolate_diff_start_valid_connect_0(noearly_nolate_diff_start_valid_0);
defparam noearly_nolate_diff_start_valid_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.noearly_nolate_diff_start_valid";


wire noearly_nolate_diff_nxt_valid_0;
syn_hyper_connect noearly_nolate_diff_nxt_valid_connect_0(noearly_nolate_diff_nxt_valid_0);
defparam noearly_nolate_diff_nxt_valid_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.noearly_nolate_diff_nxt_valid";


wire [2:0] skip_trng_reg_0;
syn_hyper_connect skip_trng_reg_connect_0(skip_trng_reg_0);
defparam skip_trng_reg_connect_0.w = 3;
defparam skip_trng_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.skip_trng_reg";


wire reset_dly_fg_0;
syn_hyper_connect reset_dly_fg_connect_0(reset_dly_fg_0);
defparam reset_dly_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.reset_dly_fg";


wire [9:0] rst_cnt_0;
syn_hyper_connect rst_cnt_connect_0(rst_cnt_0);
defparam rst_cnt_connect_0.w = 10;
defparam rst_cnt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.rst_cnt";


wire [3:0] LP_IN_reg_0;
syn_hyper_connect LP_IN_reg_connect_0(LP_IN_reg_0);
defparam LP_IN_reg_connect_0.w = 4;
defparam LP_IN_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.LP_IN_reg";


wire [3:0] LP_edge_reg_0;
syn_hyper_connect LP_edge_reg_connect_0(LP_edge_reg_0);
defparam LP_edge_reg_connect_0.w = 4;
defparam LP_edge_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.LP_edge_reg";


wire [2:0] restart_reg_0;
syn_hyper_connect restart_reg_connect_0(restart_reg_0);
defparam restart_reg_connect_0.w = 3;
defparam restart_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.restart_reg";


wire [3:0] restart_edge_reg_0;
syn_hyper_connect restart_edge_reg_connect_0(restart_edge_reg_0);
defparam restart_edge_reg_connect_0.w = 4;
defparam restart_edge_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.restart_edge_reg";


wire [2:0] retrain_reg_0;
syn_hyper_connect retrain_reg_connect_0(retrain_reg_0);
defparam retrain_reg_connect_0.w = 3;
defparam retrain_reg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.retrain_reg";


wire [7:0] timeout_cnt_0;
syn_hyper_connect timeout_cnt_connect_0(timeout_cnt_0);
defparam timeout_cnt_connect_0.w = 8;
defparam timeout_cnt_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.timeout_cnt";


wire restart_trng_fg_0;
syn_hyper_connect restart_trng_fg_connect_0(restart_trng_fg_0);
defparam restart_trng_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.restart_trng_fg";


wire Restart_trng_edge_det_0;
syn_hyper_connect Restart_trng_edge_det_connect_0(Restart_trng_edge_det_0);
defparam Restart_trng_edge_det_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.Restart_trng_edge_det";


wire re_train_0;
syn_hyper_connect re_train_connect_0(re_train_0);
defparam re_train_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.re_train";


wire timeout_fg_0;
syn_hyper_connect timeout_fg_connect_0(timeout_fg_0);
defparam timeout_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.timeout_fg";


wire start_trng_fg_0;
syn_hyper_connect start_trng_fg_connect_0(start_trng_fg_0);
defparam start_trng_fg_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.start_trng_fg";


wire LP_edge_det_0;
syn_hyper_connect LP_edge_det_connect_0(LP_edge_det_0);
defparam LP_edge_det_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.LP_edge_det";


wire LP_start_0;
syn_hyper_connect LP_start_connect_0(LP_start_0);
defparam LP_start_connect_0.tag = "CoreRxIODBitAlign_top_0.u_CoreRxIODBitAlign.LP_start";


wire Identify_IICE_trigger_ext_0;
syn_hyper_connect Identify_IICE_trigger_ext_connect_0(Identify_IICE_trigger_ext_0);
defparam Identify_IICE_trigger_ext_connect_0.tag = "ident_coreinst.IICE_INST.Identify_IICE_trigger_ext";


wire identify_sampler_ready_0;
syn_hyper_connect identify_sampler_ready_connect_0(identify_sampler_ready_0);
defparam identify_sampler_ready_connect_0.tag = "ident_coreinst.IICE_INST.b3_SoW.identify_sampler_ready";


wire [7:0] ujtag_wrapper_uireg_0;
syn_hyper_connect ujtag_wrapper_uireg_connect_0(ujtag_wrapper_uireg_0);
defparam ujtag_wrapper_uireg_connect_0.w = 8;
defparam ujtag_wrapper_uireg_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_uireg";


wire ujtag_wrapper_urstb_0;
syn_hyper_connect ujtag_wrapper_urstb_connect_0(ujtag_wrapper_urstb_0);
defparam ujtag_wrapper_urstb_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_urstb";


wire ujtag_wrapper_udrupd_0;
syn_hyper_connect ujtag_wrapper_udrupd_connect_0(ujtag_wrapper_udrupd_0);
defparam ujtag_wrapper_udrupd_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrupd";


wire ujtag_wrapper_udrck_0;
syn_hyper_connect ujtag_wrapper_udrck_connect_0(ujtag_wrapper_udrck_0);
defparam ujtag_wrapper_udrck_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrck";


wire ujtag_wrapper_udrcap_0;
syn_hyper_connect ujtag_wrapper_udrcap_connect_0(ujtag_wrapper_udrcap_0);
defparam ujtag_wrapper_udrcap_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrcap";


wire ujtag_wrapper_udrsh_0;
syn_hyper_connect ujtag_wrapper_udrsh_connect_0(ujtag_wrapper_udrsh_0);
defparam ujtag_wrapper_udrsh_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_udrsh";


wire ujtag_wrapper_utdi_0;
syn_hyper_connect ujtag_wrapper_utdi_connect_0(ujtag_wrapper_utdi_0);
defparam ujtag_wrapper_utdi_connect_0.tag = "ident_coreinst.comm_block_INST.jtagi.ujtag_wrapper_utdi";

endmodule
