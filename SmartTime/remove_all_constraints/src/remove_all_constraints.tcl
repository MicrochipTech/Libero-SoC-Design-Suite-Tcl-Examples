set id1 [set_false_path -from [ get_ports { D_0} ]]
puts "id1 = $id1"

#Displays details about contraints.
puts "---------- LIST OF CLOCKS ------------"
puts [list_clocks]

puts "---------- LIST OF INPUT DELAYS ------------"
puts [list_input_delays]

puts "---------- LIST OF FALSE PATHS DELAYS ------------"
puts [list_false_paths]

puts "---------- LIST OF MULTICYCLE PATHS DELAYS ------------"
puts [list_multicycle_paths]

puts "---------- LIST OF GENERATED CLOCKS ------------"
puts [list_generated_clocks]

puts "---------- LIST OF CLOCK LATENCIES ------------"
puts [list_clock_latencies]


#Remove all contraints.
puts "=========== REMOVE ALL CONSTRAINTS ============"
puts [remove_all_constraints]
save

#Display contraints list after remove of all constraints.
puts "---------- LIST OF CLOCKS ------------"
puts [list_clocks]

puts "---------- LIST OF INPUT DELAYS ------------"
puts [list_input_delays]

puts "---------- LIST OF FALSE PATHS DELAYS ------------"
puts [list_false_paths]

puts "---------- LIST OF MULTICYCLE PATHS DELAYS ------------"
puts [list_multicycle_paths]

puts "---------- LIST OF GENERATED CLOCKS ------------"
puts [list_generated_clocks]

puts "---------- LIST OF CLOCK LATENCIES ------------"
puts [list_clock_latencies]
