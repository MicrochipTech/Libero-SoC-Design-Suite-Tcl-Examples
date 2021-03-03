
# Displays the list of disable timing constraints before "set_disable_timing" usage
puts "\n---------- LIST OF DISABLE TIMING BEFORE \"set_disable_timing\" USAGE ------------"
puts [list_disable_timings]

# The following example set disables timing arcs within A port to Y port:
puts "\n---------- SET DISABLE TIMING ------------"
set id [set_disable_timing -from A -to  Y [ get_cells { AND2_0 } ]]

# Displays the list of disable timing constraints for the current scenario.
puts "\n---------- LIST OF DISABLE TIMING AFTER \"set_disable_timing\" USAGE ------------
[list_disable_timings]"
