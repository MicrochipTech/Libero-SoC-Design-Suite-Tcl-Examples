#Created clock on ports CLK_0/CLK_1 with a 20/10 ns periods.
create_clock -name {CLK_0} -period 20 -waveform {0 10} [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -period 10 -waveform {0 5} [ get_ports { CLK_1 } ]

#Set all paths between CLK_0 clocks and DFN1E1_0/CLK pins to 4/2 cycles for setup/hold checks.
set_multicycle_path -setup 4 -from [ get_clocks { CLK_0 } ] -to [ get_pins { DFN1E1_0/CLK } ]
set_multicycle_path -hold 2 -from [ get_clocks { CLK_0 } ] -to [ get_pins { DFN1E1_0/CLK } ]

#Set all paths between CLK_1 clocks and DFN1E1_0/CLK pins to 3/1.5 cycles for setup/hold checks.
set_multicycle_path -setup 3 -from [ get_clocks { CLK_1 } ] -to [ get_pins { DFN1E1_0/CLK } ]
set_multicycle_path -hold 1.5 -from [ get_clocks { CLK_1 } ] -to [ get_pins { DFN1E1_0/CLK } ]
