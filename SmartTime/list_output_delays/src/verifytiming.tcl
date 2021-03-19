#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_output_delays command.
#------------------------------------------------------------

# Displays details about all of the output delay constraints
# in the current timing constraint scenario.
puts "\n============ List of output delays ==========="
puts [list_output_delays];
