#-----------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of set_current_scenario command.
#-----------------------------------------------------------------

# Create a new timing scenario named "scenario_A".
#
puts "======== Create 'scenario_A' scenario ========"
puts [create_scenario scenario_A]


# Set current timing scenario.
#
puts "======= Set 'scenario_A' as current scenario ========"
puts [set_current_scenario scenario_A]
