#----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock_latency command.
#----------------------------------------------------------------

# Removes a clock source latency from the CLKIN
puts "---------- Remove clock latency path ------------"
puts [remove_clock_latency -source [get_clocks CLKIN]]
