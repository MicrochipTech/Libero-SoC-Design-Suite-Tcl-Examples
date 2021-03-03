# Creates a clock constraint on the CLK_0 port with 10ns and 8ns period
create_clock -name {clk_0} -period 10 -waveform {0 5 } [ get_ports { CLK_0 } ]
create_clock -name {clk_1} -add -period 8 -waveform {0 4 } [ get_ports { CLK_0 } ]
