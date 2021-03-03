# Creates a clock constraints on the CLK_0 port with 8/10ns period
create_clock -name {CLK_0} -period 8 -waveform {0 4} [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -add -period 10 -waveform {0 5} [ get_ports { CLK_0 } ]

# Sets all paths between CLK_1 and Q_0 to 3/1.5 cycles for setup/hold check.
set_multicycle_path -setup 3 -from [ get_clocks { CLK_1 } ] -to [ get_ports { Q_0 } ]
set_multicycle_path -hold 3.5 -from [ get_clocks { CLK_1 } ] -to [ get_ports { Q_0 } ]

# Sets all paths between CLK_0 and Q_0 to 2/4 cycles for setup/hold check.
set_multicycle_path -setup 4 -from [ get_clocks { CLK_0 } ] -to [ get_ports { Q_0 } ]
set_multicycle_path -hold 2 -from [ get_clocks { CLK_0 } ] -to [ get_ports { Q_0 } ]
