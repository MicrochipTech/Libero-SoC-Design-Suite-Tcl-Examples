#Created clock on ports CLK_1 with a 10 ns periods.
create_clock -name {my_CLK_1} -period 10 -waveform {0 5 } [ get_ports { CLK_1 } ]

#Set min/max output delays in nanoseconds on port Q_1 relative to the rising/falling edges of my_CLK_1 clock.
set_output_delay 0.8 -rise -max  -clock { my_CLK_1 } [ get_ports { Q_1 } ]
set_output_delay 0.7 -rise -min  -clock { my_CLK_1 } [ get_ports { Q_1 } ]
set_output_delay 0.6 -fall -max  -clock { my_CLK_1 } [ get_ports { Q_1 } ]
set_output_delay 0.5 -fall -min  -clock { my_CLK_1 } [ get_ports { Q_1 } ]

