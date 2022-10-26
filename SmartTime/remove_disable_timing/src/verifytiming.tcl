#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_disable_timing command.
#-----------------------------------------------------------------
puts [list_disable_timings]
# Removes a disable timing constraint by specifying its arguments.
puts "---------- Remove disable timing ------------"
remove_disable_timing [get_cells din_a_q]

set logfile "list_disable_timings.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_disable_timings]
close $constraintsfp