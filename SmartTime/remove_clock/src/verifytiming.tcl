#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock command.
#------------------------------------------------------------

# Removes clock constraint.
puts "-------- Remove 'CLKIN1' clock --------"
puts [remove_clock -name CLKIN1]

set logfile "list_clocks.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clocks]
close $constraintsfp