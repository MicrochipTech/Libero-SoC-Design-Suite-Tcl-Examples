#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_objects command.
#------------------------------------------------------------


# Displays all inputs
puts "========== List of all inputs ==========";
puts [list_objects [all_inputs]]

set logfile "list_objects.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_objects [all_inputs]]

# Displays all pins starting with the characters 'd'.
puts "\n============ List of pins with d===========\n";
puts [list_objects [get_pins d*]]

# set logfile "list_objects.txt"
# set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_objects [get_pins d*]]

# Displays all nets starting with the characters 'd'.
puts "\n============ List of nets with d===========\n";
puts [list_objects [get_nets d*]]

# set logfile "list_objects.txt"
# set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_objects [get_nets d*]]

# Displays all clocks starting with the characters 'C'.
puts "\n============ List of clocks with C ===========\n";
puts [list_objects [get_clocks C*]]

# set logfile "list_objects.txt"
# set constraintsfp [open $logfile "a"]
puts $constraintsfp [list_objects [get_clocks C*]]
close $constraintsfp