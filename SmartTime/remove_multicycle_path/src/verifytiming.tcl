#------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_multicycle_path command.
#------------------------------------------------------------------

# Removes a multicycle path constraint in the current timing scenario
#
puts "------- Remove multicycle paths --------"
puts [remove_multicycle_path -from [get_clocks CLKIN]]
