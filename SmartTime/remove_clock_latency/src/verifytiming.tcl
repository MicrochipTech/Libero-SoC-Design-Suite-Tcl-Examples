#----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock_latency command.
#----------------------------------------------------------------
puts [list_clock_latencies]
# Removes a clock source latency from the CLKIN
puts "---------- Remove clock latency path ------------"
puts [remove_clock_latency -source [get_clocks CLKIN]]

set logfile "list_clock_latencies.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clock_latencies]
close $constraintsfp