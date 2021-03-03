#Created clock on ports CLK_0/CLK_1 with a 20/10 ns periods.
create_clock -name {CLK_0} -period 20 -waveform {0 10 } [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -period 10 -waveform {0 5 } [ get_ports { CLK_1 } ]


#Specified all paths from DFN1_1/CLK pins to DFN1_2/D pins as false paths.
set_false_path -from [ get_pins { DFN1_1/CLK } ] -to [ get_pins { DFN1_2/D } ]

#Specified all paths through Q_1 net as false paths.
set_false_path -through [ get_nets { Q_1 } ] 
