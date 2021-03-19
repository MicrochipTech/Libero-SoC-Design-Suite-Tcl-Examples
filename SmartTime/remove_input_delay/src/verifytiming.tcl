#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_input_delay command.
#------------------------------------------------------------

# Remove input delay from the current timing constraint scenario.
puts "-------- Remove input delay --------"
puts [remove_input_delay -clock CLKIN [get_ports din_a]]
