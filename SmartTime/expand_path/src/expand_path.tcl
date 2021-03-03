# Creates "expand_path" file.
set expand_path_result [open "expand_path_result" a+]

puts $expand_path_result "========== LIST OF PATHS ==========\n
List of path from registers to output ports:(from DFN1_2:CLK to Y)"

# The following command displays the list of path from registers to output
# ports in the "expand_path" file.
puts $expand_path_result "[ list_paths -clock clk_2 -type clock_to_out ]\n

========== EXPAND PATH ==========\n
[ expand_path -clock clk_2 -type clock_to_out -format text -index -2 ]\n

[ expand_path -clock clk_2 -type clock_to_out -format text -index {1 3} ]\n"

close $expand_path_result
