set_component PF_IOD_TX_CCC_C0_TR
set_false_path -ignore_errors -from [ get_cells { */genblk1.U_PLL_BCLKSCLKALIGN/hold_state_flag } ] -to [ get_cells { */genblk1.U_PLL_BCLKSCLKALIGN/current_state[*] } ]
