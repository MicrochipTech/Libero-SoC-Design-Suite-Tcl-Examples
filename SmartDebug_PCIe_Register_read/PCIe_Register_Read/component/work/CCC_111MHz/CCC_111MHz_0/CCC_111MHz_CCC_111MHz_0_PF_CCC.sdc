set_component CCC_111MHz_CCC_111MHz_0_PF_CCC
# Microsemi Corp.
# Date: 2022-May-17 09:00:13
#

# Base clock for PLL #0
create_clock -period 20 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 20 -divide_by 9 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
