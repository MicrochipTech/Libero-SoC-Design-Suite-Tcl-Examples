# Create clock on CLK_0 port with 8ns
create_clock -name {my_clk} -period  8 [get_ports CLK_0]

# Sets a maximum delay by constraining all paths from all_inputs to my_clk clock with a delay less then 2ns:
set_max_delay 2 -from [all_inputs] -to [get_clocks {my_clk}]

# Specifies the 0.4ns maximum delay by constraining all paths from A port to Q output port.
set_max_delay 0.4 -from [ get_ports { A } ] -to [ get_ports { Q } ]

# Specifies the 1ns maximum delay by constraining all paths from D_0 port.
set_max_delay 1 -from [ get_ports { D_0 } ]
