#----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_output_delay command.
#----------------------------------------------------------------

# Remove output delay from the current timing constraint scenario.
#

puts "---------- Remove output delay ------------"
puts [remove_output_delay -clock CLKIN [get_ports dout_q]]

set logfile "list_output_delays.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_output_delays]
close $constraintsfp
