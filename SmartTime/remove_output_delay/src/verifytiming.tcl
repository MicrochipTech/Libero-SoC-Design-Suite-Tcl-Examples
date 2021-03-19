#----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_output_delay command.
#----------------------------------------------------------------

# Remove output delay from the current timing constraint scenario.
#
puts "---------- Remove output delay ------------"
puts [remove_output_delay -clock CLKIN [get_ports dout_q]]
