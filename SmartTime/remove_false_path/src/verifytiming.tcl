#-------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_false_path command.
#-------------------------------------------------------------
puts [list_false_paths]
# Remove false path constraints from CLKIN clock to dout_q output port 
puts "------- Remove false path -------"
remove_false_path -from [get_clocks CLKIN] -to [get_ports dout_q]

set logfile "list_false_paths.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_false_paths]
close $constraintsfp