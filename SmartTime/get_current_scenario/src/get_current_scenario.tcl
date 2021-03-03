set scenario_name "scenario_A"

# Create a new timing scenario named "scenario_A".
puts "------- CREATE $scenario_name --------"
puts [create_scenario $scenario_name]

# Get and display the name of the current timing scenario.
set get_scenario [ get_current_scenario]
puts "current scenario: $get_scenario"

#Check whether "get_current_scenario" command success or not.
if { $scenario_name != $get_scenario } {
	puts "\n======= GET CURRENT SCENARIO FAILED ======="
} else {
	puts "\n======= GET CURRENT SCENARIO SUCCEEDED ======="
}
