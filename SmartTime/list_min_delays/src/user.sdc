#Set minimum delay on all paths from D_E_0 ports to Y output port. 
set_min_delay 0.1 -from [ get_ports { D_E_0 } ] -to [ get_ports { Y } ]
