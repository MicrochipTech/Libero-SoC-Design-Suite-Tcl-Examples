#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_disable_timing command.
#-----------------------------------------------------------------

# Removes a disable timing constraint by specifying its arguments.
puts "---------- Remove disable timing ------------"
remove_disable_timing [get_cells din_a_q]
