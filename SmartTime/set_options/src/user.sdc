#Created clock on port clk_0 with 8ns period.
create_clock -name {clk_0} -period 8 -waveform {0 4 } [ get_ports { CLK_0 } ]
#Created clock on port clk_2 with 10ns period.
create_clock -name {clk_2} -period 10 -waveform {0 5 } [ get_ports { CLK_2 } ]
