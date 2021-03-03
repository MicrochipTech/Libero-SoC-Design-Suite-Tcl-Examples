#Created clock on port CLK_0 with a 10ns period
create_clock -name {clk} -period 2 [ get_ports { CLK_0 } ]

#The following example creates a generated clock on pin DFN1_1/Q with a period twice as long as the period at the reference port CLK_0.
create_generated_clock -name {my_gen_clock} -divide_by 2 -source [ get_ports {CLK_0} ] [ get_pins { DFN1_1/Q } ]
