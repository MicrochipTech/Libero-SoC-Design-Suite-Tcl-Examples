#Created "my_clk" clock on port CLK with a 20ns periods.
create_clock -name {my_clk} -period 20 -waveform {0 10 } [ get_ports { CLK } ]

