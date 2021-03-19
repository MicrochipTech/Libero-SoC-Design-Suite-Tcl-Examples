#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of expand_path command.
#------------------------------------------------------------

# Display expanded path information (path details) for paths.
puts [expand_path -clock CLKIN -type clock_to_out -format text];
