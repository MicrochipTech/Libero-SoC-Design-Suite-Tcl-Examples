#Created clock on port CLK_0 with a 4ns period.
create_clock -name {clk} -period 4 [ get_ports { CLK_0 } ]

#Set maximum delay on all paths from clock_pins of "clk" clock.
set_max_delay 2 -from [ all_registers -clock clk -clock_pins ]

