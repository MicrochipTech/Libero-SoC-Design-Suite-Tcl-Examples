set_component IOG_IOD_CLOCK_IOG_IOD_CLOCK_0_PF_CCC
# Microsemi Corp.
# Date: 2020-Jan-23 19:38:55
#

# Base clock for PLL #0
create_clock -period 10 [ get_pins { pll_inst_0/REF_CLK_0 } ]
create_generated_clock -multiply_by 6 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT0 } ]
create_generated_clock -multiply_by 6 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 90 [ get_pins { pll_inst_0/OUT1 } ]
create_generated_clock -multiply_by 3 -divide_by 2 -source [ get_pins { pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { pll_inst_0/OUT2 } ]
