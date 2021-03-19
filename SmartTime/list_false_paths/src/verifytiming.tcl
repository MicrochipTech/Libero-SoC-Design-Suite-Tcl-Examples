#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_false_paths command.
#------------------------------------------------------------

# Display the list of false path constraints in the current
# timing constraint scenario.
puts "\n---------- List of false paths delays ------------"
puts [list_false_paths]

