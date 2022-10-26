#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_max_delays command.
#------------------------------------------------------------

# Display the list of maximum delays in the current timing
# constraint scenario.
puts "---------- List of max delays ------------"
puts [list_max_delays]

set logfile "list_max_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_max_delays]
close $constraintsfp