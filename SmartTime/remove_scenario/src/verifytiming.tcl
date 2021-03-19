#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_scenario command.
#------------------------------------------------------------

# creates a new timing scenario named "scenario_A".
puts "------- Create \"scenario_A\" scenario --------"
puts [create_scenario {scenario_A}]

# Removes a scenario from the available timing scenarios.
puts "------- Remove \"scenario_A\" ----------"
puts [remove_scenario {scenario_A}]
