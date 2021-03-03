#Created clock on port CLK_1 with a 10.2ns period
create_clock -name {clk_1} -period 10.2 [ get_ports { CLK_1 } ]

#Set min/max input delays in nanoseconds on port D_1 relative to the rising/falling edges of clk_1 clock.
set_input_delay 4 -rise -max  -clock { clk_1 } [ get_ports { D_1 } ]
set_input_delay 2 -rise -min  -clock { clk_1 } [ get_ports { D_1 } ]
set_input_delay 3 -fall -max  -clock { clk_1 } [ get_ports { D_1 } ]
set_input_delay 1 -fall -min  -clock { clk_1 } [ get_ports { D_1 } ]
