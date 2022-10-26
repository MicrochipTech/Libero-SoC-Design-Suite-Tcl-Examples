#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_min_delay command.
#------------------------------------------------------------

# Remove Min delay from the current timing constraint scenario
puts [list_min_delays]
puts "-------- Remove Min delay --------";
remove_min_delay -from [get_ports din_b]

set logfile "list_min_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_min_delays]
close $constraintsfp