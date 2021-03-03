# "set_clock_groups" command disables timing analysis between the specified clock groups.
puts "\n---------- SET CLOCK GROUPS ------------"
set id1 [set_clock_groups -name {clk_0_0} -logically_exclusive -group [ get_clocks { clk_0 } ] -group [ get_clocks { clk_1 } ] ]
puts "id1 = $id1";

set id2 [set_clock_groups -name {clk_1_0} -logically_exclusive -group [ get_clocks { clk_0 } ] -group [ get_clocks { clk_1 } ] ]
puts "id2 = $id2";

# Lists all existing clock groups in the design.
puts "\n---------- List of [list_clock_groups ]"

