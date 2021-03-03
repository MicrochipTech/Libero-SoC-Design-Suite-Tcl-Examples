# Displays details about all of the minimum delay constraints in the current
# timing constraint scenario.
puts "---------- List of [list_min_delays]"

# Removes a minimum delay constraint in the current timing scenario by
# specifying its exact arguments.
puts "---------- REMOVE MINIMUM DELAY ------------"
puts [ remove_min_delay -from [ get_ports { D_0 } ] -to [ get_ports { Q } ] ]

puts "---------- LIST OF MIN DELAYS AFTER REMOVE ------------"
puts [list_min_delays]
