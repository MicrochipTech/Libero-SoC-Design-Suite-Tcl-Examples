# Displays details about all of the clock uncertainties.
puts "\n---------- LIST OF CLOCK UNCERTAINTIES ------------"
puts [list_clock_uncertainties]

#Specifies clock to clock uncertainty constraint of 0.4ns between clk and {clk clk_1} clock domains with falling edges:
set id [set_clock_uncertainty 0.4 -setup -from [get_clocks {clk}] -fall_to [get_clocks { clk clk_1 }] ]
puts "clock uncertainty constraint's id = $id";


# Displays details about all of the clock uncertainties after "set_clock_uncertainty" command's usage.
puts "\n---------- LIST OF CLOCK UNCERTAINTIES AFTER \"set_clock_uncertainty\" USAGE ------------"
puts [list_clock_uncertainties]

