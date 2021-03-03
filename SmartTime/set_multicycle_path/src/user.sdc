#Created clock on port CLK with 4ns period
create_clock -name {clk} -period 4 [ get_ports { CLK } ]

#Set all paths between DFN1_0/CLK and DFN1_1/D to 4 cycles for setup check.
set_multicycle_path -setup 4 -from [ get_pins { DFN1_0/CLK } ] -to [ get_pins { DFN1_1/D } ]

#Set all paths between DFN1_0/CLK and DFN1_1/D to 3 cycles for hold check.
set_multicycle_path -hold 3 -from [ get_pins { DFN1_0/CLK } ] -to [ get_pins { DFN1_1/D } ]
