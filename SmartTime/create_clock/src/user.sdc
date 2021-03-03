#Creates clock on port CLK with a period of 8ns
puts [create_clock -name {my_clk} -period 8 -waveform {0 4 } [ get_ports { CLK } ]]
