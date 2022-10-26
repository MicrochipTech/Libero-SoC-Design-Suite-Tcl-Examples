#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_input_delay command.
#------------------------------------------------------------

# Remove input delay from the current timing constraint scenario
puts [list_input_delays]
puts "-------- Remove input delay --------";
remove_input_delay -clock CLKIN [get_ports din_a]

set logfile "list_input_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_input_delays]
close $constraintsfp