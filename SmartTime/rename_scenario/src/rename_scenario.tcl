set scenario_A "scenario_A"
set new_scenario_A "scenario_A_1"
set scenario_B "scenario_B"


# Creates a new timing scenarios nameed "scenario_A" and "scenario_B".
puts "------- CREATE $scenario_A, $scenario_B --------"
puts [create_scenario $scenario_A]
puts [create_scenario $scenario_B]

# Displays a list of names of all of the available timing scenarios.
puts "------- LIST OF SCENARIOS --------"
set list1 [list_scenarios]
puts "list1: $list1"

# Renames an existing timing scenario to a new name.
puts "\n------- RENAME $scenario_A to $new_scenario_A ----------"
puts [rename_scenario $scenario_A $new_scenario_A]

puts "------- LIST OF SCENARIOS --------"
set list2 [list_scenarios]
puts "list2: $list2"

if {$scenario_A in $list1 && $scenario_A ni $list2 } {
    puts "$scenario_A not founded in list\n"
} else {
    puts "Founded $scenario_A in list\n"
}
