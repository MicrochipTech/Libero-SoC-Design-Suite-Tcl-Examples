#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of set_options command.
#------------------------------------------------------------

# Set the maximum number of paths reported by list_paths
set_options -analysis_scenario "timing_analysis" -limit_max_paths 1
save

set logfile "get_current_scenario.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [get_current_scenario]
close $constraintsfp