#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of get_current_scenario command.
#-----------------------------------------------------------------

# Get and display the name of the current timing scenario.
puts "\n========= Timing current scenario =========\n"
puts [get_current_scenario]

set logfile "get_current_scenario.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [get_current_scenario]
close $constraintsfp