#Created clock on port CLK_1 with a 10ns period
create_clock -name {my_clk} -period 10 [ get_ports { CLK_1 } ]

#Sets a clock source latency of 0.8ns late values of the rising/falling edge of "my_clk" clock.
set_clock_latency -source -late 0.8 [get_clocks my_clk]

#Sets an early clock source latency of 0.5ns on the rising edge of "my_clk" clock.
set_clock_latency -source -early 0.5 -rise [get_clocks my_clk]

