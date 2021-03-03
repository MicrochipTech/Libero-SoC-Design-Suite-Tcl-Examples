# creates a new timing scenario named "scenario_A".
puts "------- CREATE \"scenario_A\" \"scenario_B\" SCENARIOS --------"
puts [create_scenario {scenario_A}]
puts [create_scenario {scenario_B}]

# Displays a list of names of all of the available timing scenarios.
puts "------- LIST OF SCENARIOS --------"
puts "[list_scenarios]\n"

# Removes a scenario from the constraint database.
puts "------- REMOVE \"scenario_A\" ----------"
puts [remove_scenario {scenario_A}]

puts "------- LIST OF SCENARIOS --------"
puts "[list_scenarios]\n"
