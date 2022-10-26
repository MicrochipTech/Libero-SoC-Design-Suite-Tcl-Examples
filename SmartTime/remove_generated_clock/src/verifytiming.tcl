#------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_generated_clock command.
#------------------------------------------------------------------
puts [list_generated_clocks]
# Remove generated clock by name.
puts "-------- Remove generated clock --------"
puts [remove_generated_clock -name {DIVCLKIN}]

set logfile "list_generated_clocks.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_generated_clocks]
close $constraintsfp