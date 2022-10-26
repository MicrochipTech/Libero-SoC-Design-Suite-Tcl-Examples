#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_multicycle_path command.
#------------------------------------------------------------

# Remove Multicycle path from the current timing constraint scenario
puts [list_multicycle_paths]
puts "-------- Remove multicycle paths --------";
remove_multicycle_path -from [get_clocks CLKIN]

set logfile "list_multicycle_paths.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_multicycle_paths]
close $constraintsfp