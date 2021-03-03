#create_clock -name {clk_0} -period 10 -waveform {0 5 } [ get_ports { CLK_0 } ]
#create_clock -name {clk_1} -add -period 8 -waveform {0 4 } [ get_ports { CLK_0 } ]
#set_clock_groups  -logically_exclusive -group [ get_clocks { clk_0 } ] -group [ get_clocks { clk_1 } ]
