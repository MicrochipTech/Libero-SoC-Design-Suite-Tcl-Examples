#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_clocks command.
#------------------------------------------------------------

# Display the list of clock constraints in the current
# timing constraint scenario.
puts "---------- List of clocks ------------ \n"
puts [list_clocks]

set logfile "list_clocks_generated.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clocks]
close $constraintsfp

