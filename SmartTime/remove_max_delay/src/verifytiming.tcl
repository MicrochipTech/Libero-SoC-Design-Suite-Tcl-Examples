#-------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_max_delay command.
#-------------------------------------------------------------

# Remove maximum delay from the current timing constraint scenario.
puts "---------- Remove maximum delay ------------"
puts [remove_max_delay -from [get_ports din_b]]
