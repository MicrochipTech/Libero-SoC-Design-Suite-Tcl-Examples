# Creates a clock constraint on the CLK port with 20ns period
create_clock -name {clk} -period 20 -waveform {0 10 } [ get_ports { CLK } ]

# Displays details about all of the input/output delay constraints in the current
# timing constraint scenario.
puts "---------- LIST OF INPUT DELAYS ------------"
puts [list_input_delays]


# Defines the external setup and hold delays for an input relative to a clock.
set ID [set_external_check -setup 0.2 -clock { clk } [ get_ports { D } ]]
puts "External check sonctraints ID = $ID"

# Sets external 0.1ns hold delays for "D" input port relative to a "clk" clock.
set_external_check -hold 0.1 -clock { clk } [ get_ports { D } ]


# Displays details about all of the input/output delay constraints after "set_external_check" command's usage.
puts "---------- LIST OF INPUT DELAYS AFTER \"set_external_check\" USAGE ------------"
puts [list_input_delays]

