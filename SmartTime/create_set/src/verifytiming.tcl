#--------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of create_set command.
#--------------------------------------------------------

# Creates a set named user_set
puts "\n------- Create 'user_set' set -------"
create_set -name user_set -from {clk} -to {din_a_q:CLK}
save

set logfile "expand_path.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [expand_path -set user_set]
close $constraintsfp