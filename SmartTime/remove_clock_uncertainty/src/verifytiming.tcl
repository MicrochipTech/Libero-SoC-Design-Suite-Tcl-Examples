#--------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of remove_clock_uncertainty command.
#--------------------------------------------------------------------

# Set to clock to clock uncertainty constraint
set ID [set_clock_uncertainty 0.4 -setup -from [get_clocks CLKIN] -fall_to [get_clocks CLKIN]]
puts "\nClock uncertainty constraint ID: $ID"

# Remove a clock-to-clock uncertainty from the current timing
# scenario with constraint id.
puts "\nRemove clock uncertainties with constraint ID"
puts [remove_clock_uncertainty -id $ID]
