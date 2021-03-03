#Set maximum delay on all paths from input port D_0 and A ports to Y output port with 0.4ns. 
set_max_delay 0.4 -from [ get_ports {A} ] -to [ get_ports { Q } ]
