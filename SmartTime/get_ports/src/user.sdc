#Created clock on port CLK_1 with a 10.2ns period
create_clock -name {clk_1} -period 10.2 [ get_ports { CLK_1 } ]

#Specified all paths from clk_1 clock pins to Q output port through DFN1_0 as false paths.
set_false_path -from [ get_clocks { clk_1 } ] -through [ get_pins { DFN1_0/Q } ] -to [ get_ports { Q } ]
