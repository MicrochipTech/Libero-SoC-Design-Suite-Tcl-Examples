# Creates a clock constraint on the CLK port with 20ns and 30ns period
create_clock -name {clk} -period 20 -waveform {0 10 } [ get_ports { CLK } ]
create_clock -name {clk_1} -add -period 30 -waveform {0 15 } [ get_ports { CLK } ]
