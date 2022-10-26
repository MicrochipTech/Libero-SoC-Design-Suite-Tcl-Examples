#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of create_scenario command.
#------------------------------------------------------------

# Creates a new timing scenario named "scenario_A".
puts "\n------- Create scenario_A --------"
puts [create_scenario scenario_A]

set logfile "get_current_scenario.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [get_current_scenario]
close $constraintsfp