# Creates "remove_output_delay_result" file.
set remove_output_delay_result [open "remove_output_delay_result" a+]

puts $remove_output_delay_result "========== List of [list_output_delays]"

# Removes the output delay from CLK_0 on Q output port:
puts $remove_output_delay_result "---------- REMOVE OUPUT DELAYS ------------
[ remove_output_delay -clock clk [get_ports Q] ]"

puts $remove_output_delay_result "---------- List of output delays after \"remove_output_delay\" command usage ----------"
puts $remove_output_delay_result "---------- List of [list_output_delays]"

close $remove_output_delay_result


