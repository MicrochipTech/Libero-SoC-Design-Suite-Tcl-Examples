#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock_groups command.
#------------------------------------------------------------

# Removes clock group
puts "---------- Remove clock group by name ------------";
puts [remove_clock_groups -name clk_group -logically_exclusive];
