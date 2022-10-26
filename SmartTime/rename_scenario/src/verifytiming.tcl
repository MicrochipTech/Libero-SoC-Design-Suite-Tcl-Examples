#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of rename_scenario command.
#------------------------------------------------------------

# Creates a new timing scenario named "scenario_A".
puts "\n------- Create scenario_A scenario --------"
puts [create_scenario scenario_A]

puts [list_scenarios]

# Renames an existing timing scenario to a new name.
puts "\n------- Rename 'scenario_A' to 'scenario_A_1 ----------"
puts [rename_scenario scenario_A scenario_A_1]

puts [list_scenarios]

set logfile "rename_scenario.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_scenarios]
close $constraintsfp

