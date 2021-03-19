#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock command.
#------------------------------------------------------------

# Removes clock constraint.
puts "-------- Remove 'CLKIN1' clock --------"
puts [remove_clock -name CLKIN1]
