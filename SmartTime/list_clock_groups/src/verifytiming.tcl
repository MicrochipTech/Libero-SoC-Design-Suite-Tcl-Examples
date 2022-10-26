#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_clock_groups command.
#------------------------------------------------------------

# Displays all existing clock groups in the design.
puts "--------- List of clock groups ---------" 
puts [list_clock_groups]

set logfile "list_clock_groups.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clock_groups]
close $constraintsfp
