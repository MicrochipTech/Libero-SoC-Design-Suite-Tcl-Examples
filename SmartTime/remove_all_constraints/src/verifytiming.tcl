#------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_all_constraints command.
#------------------------------------------------------------------

# Removes all constraint.
puts "\n-------- Remove all contraints --------"
puts [remove_all_constraints]

# Check timing constraints in the current scenario.
check_constraints
puts "\n check_constraints"
puts [check_constraints]