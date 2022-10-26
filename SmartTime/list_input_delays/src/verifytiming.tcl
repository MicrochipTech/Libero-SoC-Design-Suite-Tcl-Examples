#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_input_delays command.
#------------------------------------------------------------

# Display details about all of the input delay constraints
#
puts "========== List of input delays ==========\n";
puts [list_input_delays];

set logfile "list_input_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_input_delays]
close $constraintsfp
