
# Creates "list_min_delays_result" file.
set list_min_delays_result [open "list_min_delays_result" a+]

puts $list_min_delays_result "========== LIST OF MINIMUM DELAYS ==========\n"

# Displays details about minimum delay constraints in the current timing constraint scenario.
puts $list_min_delays_result [list_min_delays]

close $list_min_delays_result
