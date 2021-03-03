# Creates a clock constraint on the CLK port with 10ns period
create_clock -name {clk} -period 10 -waveform {0 5 } [ get_ports { CLK } ]

# Sets clock to output constraint -0.2ns minimum delay on "Q" output relative to a "clk" clock.
#set_clock_to_output -max 0.3 -clock { clk } [ get_ports { Q } ]

#Set max output delays in 2ns on output port Q relative to the rising edge of clk clock.
set_output_delay 2 -rise -max  -clock { clk } [ get_ports { Q } ]
