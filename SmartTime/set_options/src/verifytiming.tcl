#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of set_options command.
#------------------------------------------------------------

# Set the maximum number of paths reported by list_paths
set_options -analysis_scenario "timing_analysis" -limit_max_paths 1
save
