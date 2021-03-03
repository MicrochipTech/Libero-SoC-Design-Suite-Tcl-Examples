# Creates "remove_input_delay_result" file.
set remove_input_delay_result [open "remove_input_delay_result" a+]

puts $remove_input_delay_result "========== List of [list_input_delays]"

# Removes the input delay from CLK_0 on input port D_0:
puts $remove_input_delay_result "---------- REMOVE INPUT DELAYS ------------
[ remove_input_delay -clock CLK_0 [get_ports D_0] ]"

puts $remove_input_delay_result "---------- List of input delays after \"remove_input_delay\" command usage ----------"
puts $remove_input_delay_result "---------- List of [list_input_delays]"

close $remove_input_delay_result


