# Creates a new timing scenario named "scenario_A".
puts "\n------- CREATE scenario_A --------"
puts [create_scenario scenario_A]

# Get and displays a list of names of all of the available timing scenarios.
set list_scenarios [list_scenarios]

puts "expected list: \"Primary\" \"timing_analysis\" \"scenario_A\"\n"
puts "List of scenarios: $list_scenarios \n"


#set expected_list {"Primary" "timing_analysis" "scenario_A"}

##Checks whether "list_scenarios" command success or not.
#if { $expected_list eq $list_scenarios } {
#	puts "\n======= LIST OF SCENARIOS SUCCEEDED =======\n"
#} else {
#	puts "\n======= LIST OF SCENARIOS FAILED ======="
#	puts "expected_list: $expected_list\n"
#}
