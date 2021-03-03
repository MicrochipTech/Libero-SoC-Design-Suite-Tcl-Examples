set scenario_name "scenario_A"
set scenario_name1 "scenario_B"


# Create a new timing scenarios named "scenario_A" and "scenario_B".
#
puts "------- CREATE $scenario_name and $scenario_name1 SCENARIOS --------"
puts [create_scenario $scenario_name]
puts [create_scenario $scenario_name1]


# Get and display the name of the current timing scenario.
#
set get_scenario [ get_current_scenario]
puts "current scenario: $get_scenario"


#Check whether "get_current_scenario" command success or not.
#
if { $scenario_name != $get_scenario } {
	puts "\n======= GET CURRENT SCENARIO FAILED ======="
} else {
	puts "\n======= GET CURRENT SCENARIO SUCCEEDED ======="
}


# Sets "scenario_B" as current timing scenario.
#
puts "\n======= SET CURRENT SCENARIO ========"
puts [ set_current_scenario $scenario_name1]


#Check whether "get_current_scenario" command success or not after
#"set_current_scenario" command's usage.
#
if { $scenario_name1 == $get_scenario } {
	puts "======= SET \"$scenario_name1\" as CURRENT SCENARIO SUCCEEDED =======\n"
} else {
	puts "======= SET \"$scenario_name1\" as CURRENT SCENARIO FAILED =======\n"
}

