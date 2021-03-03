
# Creates "list_input_output_delays_result" file.
set list_input_output_delays_result [open "list_input_output_delays_result" a+]

# Displays details about all of the input delay constraints in the current
# timing constraint scenario.
puts $list_input_output_delays_result "========== LIST OF [list_input_delays]"

# Displays details about all of the output delay constraints in the current
# timing constraint scenario.
puts $list_input_output_delays_result "========== LIST OF [list_output_delays]"

close $list_input_output_delays_result

