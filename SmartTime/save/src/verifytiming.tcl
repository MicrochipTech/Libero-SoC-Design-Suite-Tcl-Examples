#--------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of save command.
#--------------------------------------------------------

# Create and save set named 'user_set'
puts "\n------- Create 'user_set' set and save -------"
create_set -name user_set -from {clk} -to {din_a_q:CLK}
save
