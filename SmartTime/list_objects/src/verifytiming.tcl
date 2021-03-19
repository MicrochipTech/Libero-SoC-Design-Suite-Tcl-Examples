#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of list_objects command.
#------------------------------------------------------------

# Displays all inputs
puts "\n============ All inputs ==========="
puts "[list_objects [all_inputs]]\n"

# Displays all pins starting with the characters 'd'.
puts "\n============ Get pins ==========="
puts "[list_objects [get_pins d*]]\n"

# Displays all nets starting with the characters 'd'.
puts "\n============ Get nets ==========="
puts "[list_objects [get_nets d*]]\n"

# Displays all clocks starting with the characters 'C'.
puts "\n============ Get clock ==========="
puts "[list_objects [get_clocks C*]]\n"
