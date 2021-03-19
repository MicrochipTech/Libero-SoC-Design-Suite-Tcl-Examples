#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_paths command.
#------------------------------------------------------------

# Display the list of path from registers to output
puts [list_paths -clock CLKIN -type clock_to_out];
