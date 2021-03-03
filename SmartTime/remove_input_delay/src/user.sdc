# Creates a clock constraint on the CLK_0 port with 5ns period.
create_clock -name {CLK_0} -period 5 -waveform {0 2.5 } [ get_ports { CLK_0 } ]

# Creates an input delay on a port list by defining the arrival time of an
# input relative to a clock in the current scenario.
set_input_delay 2 -rise -max  -clock { CLK_0 } [ get_ports { D_0 } ]
set_input_delay 1.5 -rise -min  -clock { CLK_0 } [ get_ports { D_0 } ]
set_input_delay 0.4 -fall -max  -clock { CLK_0 } [ get_ports { D_0 } ]
set_input_delay 0.2 -fall -min  -clock { CLK_0 } [ get_ports { D_0 } ]
