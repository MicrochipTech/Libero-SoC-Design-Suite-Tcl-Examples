# Specifies setup uncertainties of 0.4ns between clk and {clk clk_1} clock domains with falling edges:
puts "\n---------- SET CLOCK UNCERTAINITES ------------"
set id [set_clock_uncertainty 0.4 -setup -from [get_clocks {clk}] -fall_to [get_clocks { clk clk_1 }] ]
puts "id1 = $id";

# Display details about all of the clock uncertainties in the current timing constraint scenario.
puts "\n---------- LIST OF CLOCK UNCERTAINTIES ------------"
puts [list_clock_uncertainties]
