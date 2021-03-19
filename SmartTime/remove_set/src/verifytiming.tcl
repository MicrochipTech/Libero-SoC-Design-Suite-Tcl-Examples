#--------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_set command.
#--------------------------------------------------------

# Creates a set named user_set
puts "\n------- Create 'user_set' set -------"
create_set -name user_set -from {clk} -to {din_a_q:CLK}
save

# Removes 'user_set' set.
puts "\n------- Remove 'user_set' set -------"
remove_set -name {user_set}
save
