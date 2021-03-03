# Creates "list_objects_result" file.
set list_objects_result [open "list_objects_result" a+]
puts $list_objects_result "========== LIST OF OBJECTS DELAYS =========="


# Displays a list of object matching the parameter.
puts $list_objects_result "\n---------- LIST OF OBJECTS:inputs ------------
[list_objects [all_inputs] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:outputs ------------
[list_objects [all_outputs] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:nets ------------
[list_objects [get_nets A*] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:cells ------------
[list_objects [get_cells D*] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:registers ------------
[list_objects [all_registers -clock CLK_0 -clock_pins ] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:clocks ------------
[list_objects [get_clocks C*] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:pins ------------
[list_objects [get_pins I*] ]"

puts $list_objects_result "\n---------- LIST OF OBJECTS:ports ------------
[list_objects [get_ports A*] ]"


close $list_objects_result

