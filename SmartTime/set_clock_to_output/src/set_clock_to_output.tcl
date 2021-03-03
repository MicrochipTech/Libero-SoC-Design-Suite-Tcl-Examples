
# Displays details about all of the input/output delays constraints in the current timing constraint scenario.
#
puts "---------- LIST OF OUTPUT DELAYS BEFORE \"set_clock_to_output\" USAGE ------------"
puts [list_output_delays]


# Get ID of clock to output constraints for an "Q" output relative to a "clk" clock.
#
set id1 [set_clock_to_output -min -0.2 -clock { clk } [ get_ports { Q } ]]
puts "clock_to_output constraint delay ID = $id1"


# Displays details about all of the input/output delays constraints in the current timing constraint scenario.
#
puts "---------- LIST OF OUTPUT DELAYS AFTER \"set_clock_to_output\" USAGE ------------"
puts [list_output_delays]

