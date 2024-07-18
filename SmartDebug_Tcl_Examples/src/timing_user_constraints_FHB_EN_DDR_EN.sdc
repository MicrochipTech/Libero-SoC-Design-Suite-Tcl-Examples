#uprom_error is a stable sigbal. Added multicycle path for better timing.
set_multicycle_path -setup_only 2 -from [ get_clocks { PF_CCC_0_0/PF_CCC_0_0/pll_inst_0/OUT0 } ] -to [ get_pins { Fabric_Debug_0/uprom_chk_0/uprom_err/D } ]
set_multicycle_path -hold 2 -from [ get_clocks { PF_CCC_0_0/PF_CCC_0_0/pll_inst_0/OUT0 } ] -to [ get_pins { Fabric_Debug_0/uprom_chk_0/uprom_err/D } ]

#false paths due to FHB auto instantiation
# set_false_path -from [ get_pins { MICROSEMI_FHB_AUTO_INST_0/MUX_CONTROL_REGISTER_0/*/CLK } ]
# set_false_path -through [ get_pins { MICROSEMI_FHB_AUTO_INST_0/SNAPSHOT_SR_FF_0/* } ]
