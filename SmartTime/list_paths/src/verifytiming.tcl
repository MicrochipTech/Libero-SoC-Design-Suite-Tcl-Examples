#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_paths command.
#------------------------------------------------------------

# Display the list of path from registers to output
puts "\n------ List of paths ------\n"
puts [list_paths -clock CLKIN -type clock_to_out]

set logfile "list_paths.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_paths -clock CLKIN -type clock_to_out]
close $constraintsfp
