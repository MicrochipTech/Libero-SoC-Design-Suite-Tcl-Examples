set scenario_A "scenario_A"
set new_scenario_A "scenario_A_1"

# Creates a new timing scenario named "scenario_A".
puts "------- CREATE scenario_A --------"
puts [create_scenario $scenario_A]

# Creates a new timing scenario named "my_new_scenario".
puts "------- CREATE \"my new scenario\" --------"
puts [create_scenario {my_new_scenario}]

# Display a list of names of all of the available timing scenarios.
puts "------- LIST OF SCENARIOS --------"
set list1 [list_scenarios]

# creates a new timing scenario named "scenario_A_1" by duplicating "scenario_A". 
puts "------- CLONE SCENARIO scenario_A_1 ----------"
puts [ clone_scenario $scenario_A $new_scenario_A ]

# Display a list of names of all of the available timing scenarios after "clone_scenario" command's usage.
puts "------- LIST OF SCENARIOS --------"
set list2 [list_scenarios]

if {$scenario_A in $list2 && $new_scenario_A in $list2 } {
    puts "$scenario_A and $new_scenario_A are founded in list\n"
} else {
    puts "$scenario_A and $new_scenario_A are not founded in list\n"
}
