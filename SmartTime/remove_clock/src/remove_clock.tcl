# Displays details about all of the clock constraints in the current timing constraint scenario.
puts "---------- List of [list_clocks]"


# Creates "my_CLK_2" clock constraint on the CLK_2 port with 5ns period
puts "---------- CREATE CLOCK ------------"
set clock_Id [create_clock -name {my_CLK_2} -period 5 -waveform {0 2.5 } [ get_ports { CLK_2 } ]]
puts "\nclock_Id = $clock_Id\n";


# Displays the details of all clock constraints after "create_clock" command's usage.
puts "---------- LIST OF CLOCKS AFTER NEW CLOCK CREATION ------------"
puts [list_clocks]


# Removes the "my_CLK_2" clock constraint from the current timing scenario.
puts "---------- REMOVE \"my_CLK_2\" CLOCK VIA \"$clock_Id\" CONSTRAINTS ID ------------"
puts [ remove_clock -id $clock_Id ]


# Displays details of all clock constraints after "remove_clock" command's usage.
puts "---------- LIST OF CLOCKS ------------"
puts [list_clocks]


# Checks whether "my_CLK_2" command succeeded or not.
if {[catch {remove_clock -id $clock_Id } result] == 0} {
	puts "===== REMOVE CLOCK FAILED =====\n"
} else {
	puts "===== REMOVE CLOCK SUCCEEDED =====\n"
}
