#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_disable_timings command.
#-----------------------------------------------------------------

# Display the list of disable timing constraints in the current
# timing constraint scenario.
puts "\n---------- List of disable timing constraints ------------"
puts [list_disable_timings]

set logfile "list_disable_timings.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_disable_timings]
close $constraintsfp