#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of clone_scenario command.
#------------------------------------------------------------

# Creates a new timing scenario named 'scenario_A'.
puts "\n------- Create scenario_A --------";
puts [create_scenario scenario_A];

# creates a new timing scenario named 'scenario_A_1' by duplicating 'scenario_A'. 
puts "------- Clone scenario scenario_A_1 ----------";
puts [clone_scenario scenario_A scenario_A_1];

set logfile "list_scenarios.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_scenarios]
close $constraintsfp