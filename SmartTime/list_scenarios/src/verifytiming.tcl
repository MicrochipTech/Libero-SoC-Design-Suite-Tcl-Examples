#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_scenarios command.
#------------------------------------------------------------

# Creates a new timing scenario named "scenario_A".
puts "\n------- Create scenario_A --------"
puts [create_scenario scenario_A]

# Get and displays a list of available timing scenarios.
set list_scenarios [list_scenarios]

puts "Expected list: \"Primary\" \"timing_analysis\" \"scenario_A\""
puts "List of scenarios: $list_scenarios \n"
