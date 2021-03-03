# Create clock on CLK port with 10ns period
#
create_clock -name {CLK} -period 10 -waveform {0 5} [ get_ports { CLK } ]

# Displays the list of disable timing constraints for the current scenario before "set_disable_timing" usage.
#
puts "---------- List of [list_disable_timings]"

#The following example set disables timing arcs within A port to Y port:
#
puts "---------- SET DISABLE TIMING ------------"
set id1 [set_disable_timing -from A -to Y [ get_cells { AND2_0 } ]]
puts "Disable timing constraint ID is $id1";

# Displays the list of disable timing constraints after "set_disable_timing" usage.
#
puts "---------- List of DISABLE TIMING after \"set_disable_timing\" usage ------------
[list_disable_timings]"

