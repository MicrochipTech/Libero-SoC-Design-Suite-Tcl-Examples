#--------------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_clock_uncertainties command.
#--------------------------------------------------------------------

# Display details about all of the clock uncertainties in the current
# timing constraint scenario.
puts "\n---------- List of clock uncertainties ------------"
puts [list_clock_uncertainties]

set logfile "list_clock_uncertainties.txt"
set constraintsfp [open $logfile "w"]
puts $constraintsfp [list_clock_uncertainties]
close $constraintsfp