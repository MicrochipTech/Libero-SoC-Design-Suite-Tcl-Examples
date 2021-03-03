# Specifies the maximum number of paths reported by list_paths:
#
set_options -analysis_scenario "timing_analysis" -limit_max_paths 1
save

# The following command displays the list of path from clocks to output ports:
#
puts "List of path from clocks to output ports:"
puts [ list_paths -clock clk_2 -type clock_to_out ]

# The following command displays the list of path from registers to output ports:
#
puts "List of path from registers to output ports:"
puts [ list_paths -clock clk_2 -type reg_to_reg ]

puts "========== EXPAND PATH \"clock_to_out\" with index -2(will consider as 1) =========="
puts [ expand_path -clock clk_2 -type clock_to_out -format text -index -2 ]

puts "========== EXPAND PATH \"reg_to_reg\" with index 1 =========="
puts [ expand_path -clock clk_2 -type reg_to_reg -format text -index 1 ]

puts "========== EXPAND PATH \"clock_to_out\" with indexes 1, 2, 3 ==========\n"

puts "Specifies the maximum number of paths reported by list_paths with 1. So this
means that displays only path with 1 index."
puts [ expand_path -clock clk_2 -type clock_to_out -format text -index {1 3} ]
