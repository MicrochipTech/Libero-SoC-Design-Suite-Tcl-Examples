# Displays details about all of the maximum delay constraints in the current
# timing constraint scenario.
puts "---------- List of [list_max_delays]"

# Removes a maximum delay constraint from the current timing scenario by specifying its exact arguments.
puts "---------- REMOVE MAX DELAYS ------------"
puts [ remove_max_delay -from [ get_ports { A } ] -to [ get_ports { Q } ] ]

# Displays details about all of the maximum delay constraints after "remove_max_delay" command usage
puts "---------- LIST OF MAX DELAYS AFTER REMOVE ------------"
puts [list_max_delays]

