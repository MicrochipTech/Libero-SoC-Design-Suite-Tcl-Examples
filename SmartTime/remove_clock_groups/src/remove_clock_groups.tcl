# Creates a clock constraints on the CLK_0 port.
create_clock -name {clk_0} -period 10 -waveform {0 5} [ get_ports { CLK_0 } ]
create_clock -name {clk_1} -add -period 8 -waveform {0 4} [ get_ports { CLK_0 } ]

# Disables timing analysis between the specified clock groups.
puts "---------- SET CLOCK GROUPS ------------"
set id1 [set_clock_groups -name {clk_0_0} -logically_exclusive -group [ get_clocks { clk_0 } ] -group [ get_clocks { clk_1 } ] ]
puts "id1 = $id1";

set id2 [set_clock_groups -name {clk_1_0} -logically_exclusive -group [ get_clocks { clk_0 } ] -group [ get_clocks { clk_1 } ] ]
puts "id2 = $id2";

# Displays details about clock groups
puts "---------- List of [list_clock_groups ]"

# Removes "clk_1_0" clock group by id
puts "---------- REMOVE {clk_1_0} CLOCK GROUPS by ID ------------" 
puts [remove_clock_groups -id $id1]


# Displays details about clock groups after "remove_clock_groups" command's usage
puts "---------- LIST OF CLOCK GROUPS AFTER REMOVE CLOCK GROUPS COMMAND ------------"
puts [list_clock_groups ]
