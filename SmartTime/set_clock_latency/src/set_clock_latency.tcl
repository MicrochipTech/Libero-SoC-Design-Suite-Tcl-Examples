# Display details about all of the clock latencies in the current timing
# constraint scenario.
puts "\n---------- LIST OF CLOCK LATENCIES ------------\n"
puts [list_clock_latencies]

#Sets an early clock source latency of 0.6ns on the falling edge of "my_clk" clock.
set_clock_latency -source -early 0.6 -fall [get_clocks my_clk]

# Display details after "set_clock_latency" usage.
puts "\n---------- LIST OF CLOCK LATENCIES AFTER \"set_clock_latency\" USAGE ------------\n"
puts [list_clock_latencies]
