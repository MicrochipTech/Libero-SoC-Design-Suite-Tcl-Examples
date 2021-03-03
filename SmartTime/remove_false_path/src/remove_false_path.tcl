
# Creates "remove_false_path_result" file.
set remove_false_path_result [open "remove_false_path_result" a+]

# Get the ID of the false path constraint to remove from the current scenario.
set id1 [set_false_path -from [ get_ports { D_0} ]]
puts "Falshe path constraint id = $id1"


# Displays details about all of the false paths in the current timing constraint scenario.
puts $remove_false_path_result "========== List of [list_false_paths]"

# Remove false path constraint by constraint ID
puts $remove_false_path_result "---------- REMOVE FALSE PATH ------------
[remove_false_path -id $id1]"

# Displays details about all of the false paths after "remove_false_path" command usage with constraint ID.
puts $remove_false_path_result "========== List of [list_false_paths]"

close $remove_false_path_result


