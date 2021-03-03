#Creates clocks on ports CLK_0/CLK_1 with a 10/8 ns periods.
create_clock -name {CLK_0} -period 10 -waveform {0 5} [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -period 8 -waveform {0 4} [ get_ports { CLK_1 } ]

#Sets a clock source latency of 0.01ns of "CLK_0" clock.
set_clock_latency -source 0.01 [get_clocks { CLK_0 }]
