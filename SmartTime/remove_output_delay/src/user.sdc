# Creates a clock constraint on the CLK_0 port with 5ns period.
create_clock -name {clk} -period 5 -waveform {0 2.5} [ get_ports { CLK_0 } ]

#Sets min/max output delays in nanoseconds on output port Q relative to the rising/falling edges of clk_1 clock.
set_output_delay 0.4 -fall -max  -clock { clk } [ get_ports { Q } ]
set_output_delay 0.2 -fall -min  -clock { clk } [ get_ports { Q } ]
set_output_delay 2   -rise -max  -clock { clk } [ get_ports { Q } ]
set_output_delay 1.5 -rise -min  -clock { clk } [ get_ports { Q } ]
