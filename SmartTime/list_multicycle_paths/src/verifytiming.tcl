#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_multicycle_paths command.
#-----------------------------------------------------------------

# Displays details about all of the multicycle paths

puts "========== List of Multicycle paths ==========\n";
puts [list_multicycle_paths];

set logfile "list_multicycle_paths.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_multicycle_paths]
close $constraintsfp