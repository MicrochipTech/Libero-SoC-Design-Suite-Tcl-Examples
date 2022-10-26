#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock_groups command.
#------------------------------------------------------------
puts [list_clock_groups]
# Removes clock group
puts "---------- Remove clock group by name ------------";
puts [remove_clock_groups -name clk_group -logically_exclusive];

set logfile "list_clock_groups.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clock_groups]
close $constraintsfp
