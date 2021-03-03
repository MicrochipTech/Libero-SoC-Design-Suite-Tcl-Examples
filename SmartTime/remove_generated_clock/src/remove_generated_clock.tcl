# Displays the details of all clock constraints after "create_clock" command's usage.
puts "---------- List of [list_clocks]"

# Displays the details of all generated clock constraints.
puts "List of [list_generated_clocks]"

# Removes and check whether "gen_new_clk" generated clock removed or not.
if {[catch {remove_generated_clock -name {gen_new_clk}} result] == 0} {
	puts "===== REMOVE GENERATED CLOCK FAILED =====\n"
} else {
	puts "===== REMOVE GENERATED CLOCK SUCCEEDED =====\n"
}

# Displays generated clock constraints after "remove_generated_clock" constraints.
puts "List of [list_generated_clocks]"

