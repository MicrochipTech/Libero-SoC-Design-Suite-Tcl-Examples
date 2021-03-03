#Created clock on port CLK_1 with a 10ns period.
create_clock -name { clk_1 } -period 10 -waveform { 0 4 } [ get_ports { CLK_1 } ]

#Specified all paths from clk_1 as false paths.
set_false_path -from [ get_cells { DFN1_0 } ]

#Specified all paths through Q_1 net as false paths.
set_false_path -through [ get_nets { Q_1 } ] 
