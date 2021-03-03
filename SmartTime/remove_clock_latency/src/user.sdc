# Creates a clock constraint on the CLK_0 port with 20ns period.
create_clock -name {CLK_0} -period 2 -waveform {0 1} [ get_ports { CLK_0 } ]

# Defines the delay between an external clock source and the definition pin of a "CLK_0" clock.
set_clock_latency -source -rise -late 0.01 [ get_clocks { CLK_0 } ]
set_clock_latency -source -rise -early 0.01 [ get_clocks { CLK_0 } ]
set_clock_latency -source -fall -late 0.01 [ get_clocks { CLK_0 } ]
set_clock_latency -source -fall -early 0.01 [ get_clocks { CLK_0 } ]
