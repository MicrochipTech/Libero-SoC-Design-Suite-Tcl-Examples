onerror {resume}
quietly virtual function -install /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0 -env /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0 { &{/CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/clk_i, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/resetn_i, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/clear_i, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_en_i, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_out_o, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_out_msb_o, /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/s_prbsin }} PRBS_GEN
quietly virtual signal -install /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/rev_bits_0 { (context /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/rev_bits_0 )&{in_data ,out_data }} REV
quietly virtual signal -install /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0 {/CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/data_in_i  } DAT
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_CLR_FLGS_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DIR_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DONE_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_LOAD_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_MOVE_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_OOR_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_START_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT0_HS_IO_CLK_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT1_HS_IO_CLK_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT2_FABCLK_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PLL_LOCK_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PRBSGEN_DATA
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PRBS_ERR
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/RX_CLK_G_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/TX_PAT_CLK
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_CLR_FLGS_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DIR_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DONE_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_LOAD_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_MOVE_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_OOR_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_START_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_1_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_1_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_1_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0_TX_PAT_CLK_N
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT0_HS_IO_CLK_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT1_HS_IO_CLK_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT2_FABCLK_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PLL_LOCK_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PRBS_ERR_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/RX_CLK_G_0_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/TX_PAT_CLK_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DONE_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_OOR_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_START_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT0_HS_IO_CLK_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_1_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_1_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_EARLY_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_1_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/EYE_MONITOR_LATE_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/DELAY_LINE_OUT_OF_RANGE_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_DIR_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_CLR_FLGS_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_LOAD_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_MOVE_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/RX_CLK_G_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT2_FABCLK_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/OUT1_HS_IO_CLK_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PLL_LOCK_0_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/TX_PAT_CLK_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/PRBS_ERR_net_1
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/RXD_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/RXD_N_net_0
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/GND_net
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/VCC_net
add wave -noupdate -group TB /CoreRxIODBitAlign_tb/BIT_ALGN_EYE_IN_const_net_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_EYE_IN
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_HOLD
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RESTARTN
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RXD
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RXD_N
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RX_CLK_N
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RX_CLK_P
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_CLR_FLGS_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_DIR_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_DONE_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_LOAD_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_MOVE_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_OOR_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/BIT_ALGN_START_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/DELAY_LINE_OUT_OF_RANGE_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/DELAY_LINE_OUT_OF_RANGE_1
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/EYE_MONITOR_EARLY_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/EYE_MONITOR_EARLY_1
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/EYE_MONITOR_LATE_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/EYE_MONITOR_LATE_1
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/OUT0_HS_IO_CLK_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/OUT1_HS_IO_CLK_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/OUT2_FABCLK_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/PLL_LOCK_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/PRBSGEN_DATA
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/PRBS_ERR
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/RX_CLK_G_0
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/TXD_PAT
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/TXD_PAT_N
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/TX_PAT_CLK
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/TX_PAT_CLK_N
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/AND2_0_Y
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/AND2_1_Y
add wave -noupdate -group IOG_IOD_COMP /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/AND2_2_Y
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/SKIP_TRNG
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/HOLD_TRNG
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/FAMILY
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/SCLK
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/RESETN
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/PLL_LOCK
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_en_i
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_out_o
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/prbs_chk_error_o
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_START
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_DONE
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_OOR
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_RSTRT
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_HOLD
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/tap_cnt
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/IOD_EARLY
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/IOD_LATE
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/IOD_OOR
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_CLR_FLGS
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_LOAD
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_DIR
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_MOVE
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_EYE_IN
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_EYE_OUT
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/tap_move
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/tap_direction
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/tap_load
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_clr_flags
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_ld
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_dir
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_move
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_start
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_done
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/calc_done
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/early_last_set
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/early_cur_set
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/late_cur_set
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/late_last_set
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/incr_tapcnt
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/load_tapcnt
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/alt_incr_set
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bit_align_start
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bit_align_done
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bit_align_clr_flags
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/early_flags
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/late_flags
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/oor_flags
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_BIT_ALGN_HOLD_flag
add wave -noupdate -expand -group DUT /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/rx_err
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/wait_cnt
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bitalign_next_state
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bitalign_curr_state
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bitalign_hold_state
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/bitalign_tapcalc_state
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/emflag_cnt
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/tapcnt_final
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/early_late_diff
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/noearly_nolate_diff_start
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/noearly_nolate_diff_nxt
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/early_val
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/late_val
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/no_early_no_late_val_st1
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/no_early_no_late_val_end1
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/no_early_no_late_val_st2
add wave -noupdate -expand -group DUT -radix unsigned /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/CoreRxIODBitAlign_top_0/u_CoreRxIODBitAlign/no_early_no_late_val_end2
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/REF_CLK_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT0_HS_IO_CLK_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT1_HS_IO_CLK_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT2_FABCLK_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/PLL_LOCK_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT0_HS_IO_CLK_0_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT1_HS_IO_CLK_0_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT2_FABCLK_0_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/PLL_LOCK_0_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/PLL_LOCK_0_net_1
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT2_FABCLK_0_net_1
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT0_HS_IO_CLK_0_net_1
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/OUT1_HS_IO_CLK_0_net_1
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/GND_net
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DRI_CTRL_0_const_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DRI_WDATA_0_const_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DRI_CTRL_1_const_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DRI_WDATA_1_const_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DLL_DRI_CTRL_const_net_0
add wave -noupdate -group CLOCK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_CLOCK_0/DLL_DRI_WDATA_const_net_0
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/clk_i
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/resetn_i
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/prbs_en_i
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/DAT
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/data_in_i
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/prbs_chk_error_o
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/s_error1
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/s_error0
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/s_in_old
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/s_in1
add wave -noupdate -expand -group PRBS_CHK /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbscheck_parallel_fab_0/s_prbs_chk_error
add wave -noupdate -group REV /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/rev_bits_0/in_data
add wave -noupdate -group REV /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/rev_bits_0/out_data
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/clk_i
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/resetn_i
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/clear_i
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_en_i
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_en_i
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_out_o
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/prbs_out_msb_o
add wave -noupdate -expand -group PRBS_GEN /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/prbsgen_parallel_fab_0/s_prbsin
add wave -noupdate -group RESET_DLY /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/reset_delay_0/RX_CLK_G_0
add wave -noupdate -group RESET_DLY /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/reset_delay_0/ARST_N
add wave -noupdate -group RESET_DLY /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/reset_delay_0/reset_done
add wave -noupdate -group RESET_DLY /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/reset_delay_0/rst_cnt
add wave -noupdate -group RESET_DLY /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/reset_delay_0/reset_dly_fg
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/ARST_N
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/HS_IO_CLK
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/HS_IO_CLK_90
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/L0_TXD_DATA
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/TX_CLK_G
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/TX_CLK
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/TXD
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/TXD_N
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/TX_CLK_N
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/DFN1_PAUSE_S0_Q
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/DFN1_PAUSE_S1_Q
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/DFN1_PAUSE_S2_Q
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/LANECTRL_ADDR_CMD_0_ARST_N
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/LANECTRL_ADDR_CMD_0_RX_SYNC_RST
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/LANECTRL_ADDR_CMD_0_TX_DQS
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/LANECTRL_ADDR_CMD_0_TX_DQS_270
add wave -noupdate -group IOG_IOD_DDTX4 /CoreRxIODBitAlign_tb/IOG_IOD_DDRX4_COMP_0/IOG_IOD_DDRTX4_0/LANECTRL_ADDR_CMD_0_TX_SYNC_RST
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {249136770 ps} 0} {{Cursor 2} {7224742 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 318
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {6913297 ps} {7051345 ps}
bookmark add wave bookmark0 {{6974732 ps} {7115517 ps}} 0
