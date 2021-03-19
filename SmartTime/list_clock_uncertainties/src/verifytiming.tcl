#--------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_clock_uncertainties command.
#--------------------------------------------------------------------

# Display details about all of the clock uncertainties in the current
# timing constraint scenario.
puts "\n---------- List of clock uncertainties ------------"
puts [list_clock_uncertainties]
