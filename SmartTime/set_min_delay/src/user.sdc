# Create clock on CLK port with 8ns
create_clock -name {my_clk} -period  8 [get_ports CLK]

#Sets a minimum delay by constraining all paths from all_inputs to my_clk clock with a delay less then 2ns:
set_min_delay 2 -from [all_inputs] -to [get_clocks {my_clk}]
