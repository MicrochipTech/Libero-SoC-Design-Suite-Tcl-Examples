# Creates "list_max_delays_result" file.
set list_max_delays_result [open "list_max_delays_result" a+]

puts $list_max_delays_result "========== LIST OF MAXIMUM DELAYS ==========\n"

# Displays details about maximum delay constraints in the current timing constraint scenario.
puts $list_max_delays_result [list_max_delays]

close $list_max_delays_result
