#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_max_delay command.
#------------------------------------------------------------

# Remove Max delay from the current timing constraint scenario
puts [list_max_delays]
puts "-------- Remove Max delay --------";
remove_max_delay -from [get_ports din_b]

set logfile "list_max_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_max_delays]
close $constraintsfp