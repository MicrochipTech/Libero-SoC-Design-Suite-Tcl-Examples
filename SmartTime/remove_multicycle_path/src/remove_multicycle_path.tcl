# Creates "remove_multicycle_path_result" file.
set remove_multicycle_path_result [open "remove_multicycle_path_result" a+]


# Displays details about all of the multicycle paths in the current timing constraint scenario.
#
puts $remove_multicycle_path_result "--------- List of [list_multicycle_paths]"


# Removes a multicycle path constraint in the current timing scenario by specifying its exact arguments.
#
puts $remove_multicycle_path_result "--------- REMOVE MULTICYCLE PATHS ----------
[remove_multicycle_path -from [ get_clocks { CLK_0 } ] -to [ get_ports { Q_0 } ]]"


# Displays details about multicycle paths after "remove_multicycle_path" command's usage.
#
puts $remove_multicycle_path_result "--------- LIST OF MULTICYCLE PATHS DELAYS AFTER \"remove_multicycle_path\" command's usage ---------
[list_multicycle_paths]"

close $remove_multicycle_path_result


