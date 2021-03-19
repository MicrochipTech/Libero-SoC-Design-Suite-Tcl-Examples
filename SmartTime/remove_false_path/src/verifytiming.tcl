#-------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_false_path command.
#-------------------------------------------------------------

# Remove false path constraints from CLKIN clock to dout_q output port 
puts "------- Remove false path -------"
remove_false_path -from [get_clocks CLKIN] -to [get_ports dout_q]
