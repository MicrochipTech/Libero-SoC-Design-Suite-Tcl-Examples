# Creates a clock constraint on the CLK port with 10ns period.
create_clock -name {CLK} -period 10 -waveform {0 5 } [ get_ports { CLK } ]

#The following example set disables timing arcs within A port to Y port:
puts "---------- SET DISABLE TIMING ------------"
set id1 [set_disable_timing -from A -to Y [ get_cells { AND2_0 } ]]
puts "id1 = $id1";

# DIsplays the list of disable timing constraints for the current scenario.
puts "---------- LIST OF DISABLE TIMING ------------"
puts [list_disable_timings]

# Removes a disable timing constraint by specifying its arguments.
puts "---------- REMOVE DISABLE TIMING ------------"
puts [remove_disable_timing -from A -to Y [ get_cells { AND2_0 } ]]

puts "---------- LIST OF DISABLE TIMING AFTER REMOVE DISABLE TIMING ------------"
puts [list_disable_timings]
