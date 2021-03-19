#------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_generated_clock command.
#------------------------------------------------------------------

# Remove generated clock by name.
puts "-------- Remove generated clock --------"
puts [remove_generated_clock -name {DIVCLKIN}]
