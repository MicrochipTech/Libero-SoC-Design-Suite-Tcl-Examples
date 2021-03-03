
# Creates "list_input_delays_result" file.
set list_input_delays_result [open "list_input_delays_result" a+]

puts $list_input_delays_result "========== LIST OF INPUT DELAYS ==========\n"

# Displays details about all of the input delay constraints in the current
# timing constraint scenario.
puts $list_input_delays_result [list_input_delays]

close $list_input_delays_result

