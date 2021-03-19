#-------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_min_delay command.
#-------------------------------------------------------------

# Remove minimum delay from the current timing constraint scenario.
#
puts "---------- Remove minimum delay ------------"
puts [remove_min_delay -from [get_ports din_b]]
