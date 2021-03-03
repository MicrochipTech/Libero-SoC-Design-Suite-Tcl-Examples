# Specifies setup uncertainties of 0.4ns between clk and {clk clk_1} clock domains with falling edges:
# Get clock uncertainty constraint ID.
set id [set_clock_uncertainty 0.4 -setup -from [get_clocks {clk}] -fall_to [get_clocks { clk clk_1 }] ]
puts "Clock uncertainty constraint ID = $id";

# Displays details about all of the clock uncertainty in the current timing constraint scenario.
puts "---------- LIST OF CLOCK UNCERTAINTIES ------------"
puts [list_clock_uncertainties]

# removes a clock-to-clock uncertainty from the current timing scenario with constraint id.
puts "---------- REMOVE CLOCK UNCERTAINTIES WITH CONSTRAINT ID ------------"
puts [remove_clock_uncertainty -id $id]

puts "---------- LIST OF CLOCK UNCERTAINTIES AFTER \"remove_clock_uncertainty\" USAGE ------------"
puts [list_clock_uncertainties]
