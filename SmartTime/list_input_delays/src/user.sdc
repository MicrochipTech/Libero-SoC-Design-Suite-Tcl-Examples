#Created clock on ports CLK_0 with a 10 ns periods.
create_clock -name {my_CLK_0} -period 10 -waveform {0 5} [ get_ports { CLK_0 } ]

#Set min/max input delays in nanoseconds on port D_0 relative to the rising/falling edges of my_CLK_0 clock.
set_input_delay 0.4 -rise -max  -clock { my_CLK_0 } [ get_ports { D_0 } ]
set_input_delay 0.3 -rise -min  -clock { my_CLK_0 } [ get_ports { D_0 } ]
set_input_delay 0.2 -fall -max  -clock { my_CLK_0 } [ get_ports { D_0 } ]
set_input_delay 0.1 -fall -min  -clock { my_CLK_0 } [ get_ports { D_0 } ]
