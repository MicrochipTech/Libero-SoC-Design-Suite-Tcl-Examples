#----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_clock_latencies command.
#----------------------------------------------------------------

# Display details about clock latencies in the current timing
# constraint scenario.
puts "\n---------- List of clock latencies ------------\n"
puts [list_clock_latencies]
