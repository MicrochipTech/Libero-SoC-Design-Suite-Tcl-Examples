# DIsplays details about all of the clock latencies in the current timing constraint scenario.
puts "---------- LIST OF CLOCK LATENCIES ------------"
puts [list_clock_latencies]

# Removes a clock source latency from the CLK_0
puts "---------- REMOVE CLOCK LATENCY PATH ------------"
puts [remove_clock_latency -source [get_clocks {CLK_0}]]

puts "---------- LIST OF CLOCK LATENCIES ------------"
puts [list_clock_latencies]

