#Created clock with my_CLK_0/my_CLK_1 names on ports CLK_0/CLK_1 with a 20/10 ns periods.
create_clock -name {my_CLK_0} -period 20 -waveform {0 10 } [ get_ports { CLK_0 } ]
create_clock -name {my_CLK_1} -period 10 -waveform {0 5 } [ get_ports { CLK_1 } ]

