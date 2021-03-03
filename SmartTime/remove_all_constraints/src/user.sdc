#Create clock on CLK_0/CLK_1 ports with 2/10 ns period.
create_clock -name {CLK_0} -period 2 -waveform {0 1} [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -period 10 -waveform {0 5} [ get_ports { CLK_1 } ]

#Specified all paths from clk_1 clock pins to Q output port through DFN1_0 as false paths.
set_false_path -from [ get_clocks { CLK_1 } ] -through [ get_pins { DFN1_0/Q } ] -to [ get_ports { Q } ]

#Set min/max input delays in nanoseconds on port D_0 relative to the rising/falling edges of "CLK_1" clock.
set_input_delay 4 -rise -max  -clock { CLK_1 } [ get_ports { D_0 } ]
set_input_delay 2 -rise -min  -clock { CLK_1 } [ get_ports { D_0 } ]

#The following example creates a generated clock on pin DFN1_0/Q with a period twice as long as the period at the reference port CLK_0.
create_generated_clock -name {new_CLK0} -divide_by 2 -source [ get_ports { CLK_0 } ] [ get_pins { DFN1_0/Q } ]

#Set all paths between DFN1_0/CLK and DFN1_1/D to 4 cycles for setup check.
set_multicycle_path -setup 4 -from [ get_pins { DFN1_0/CLK } ] -to [ get_pins { DFN1_1/D } ]
#Set all paths between DFN1_0/CLK and DFN1_1/D to 3 cycles for hold check.
set_multicycle_path -hold 3 -from [ get_pins { DFN1_0/CLK } ] -to [ get_pins { DFN1_1/D } ]

#Sets a clock source latency of 0.8ns late values of the rising/falling edge of "my_clk" clock.
set_clock_latency -source -late 0.8 [get_clocks CLK_0]
#Sets an early clock source latency of 0.5ns on the rising edge of "my_clk" clock.
set_clock_latency -source -early 0.5 -rise [get_clocks CLK_0]

