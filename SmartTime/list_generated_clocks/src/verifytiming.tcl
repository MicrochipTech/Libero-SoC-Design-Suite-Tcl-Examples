#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_generated_clocks command.
#-----------------------------------------------------------------

# Display details about all of the generated clock constraints in
# the current timing constraint scenario.
puts "\n------ List of generated clocks ------"
puts [list_generated_clocks]
