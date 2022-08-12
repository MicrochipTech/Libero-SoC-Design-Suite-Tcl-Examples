
#CDC in AXI interconnect is enabled for S0-REF_CLK,S2-DDR3 and S4-DDR4 SYS_CLK 
set_clock_groups -name {async} -asynchronous -group [ get_clocks {REF_CLK_0} ]
set_clock_groups -name {async} -asynchronous -group [ get_clocks {PF_DDR3_SS_0/CCC_0/pll_inst_0/OUT1}]
set_clock_groups -name {async} -asynchronous -group [ get_clocks {PF_DDR4_SS_0/CCC_0/pll_inst_0/OUT1}]
#set_false_path -from PF_RESET_0/PF_RESET_0/dff_1*
