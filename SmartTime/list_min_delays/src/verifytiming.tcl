#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_min_delays command.
#------------------------------------------------------------

# Display the list of minimum in the current timing
# constraint scenario.
puts "---------- List of minimum delays ------------"
puts [list_min_delays]

set logfile "list_min_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_min_delays]
close $constraintsfp
