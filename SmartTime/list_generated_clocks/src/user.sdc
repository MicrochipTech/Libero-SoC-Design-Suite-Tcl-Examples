#Created clock on ports CLK_0/CLK_1 with a 20/10 ns periods.
create_clock -name {CLK_0} -period 20 -waveform {0 10 } [ get_ports { CLK_0 } ]
create_clock -name {CLK_1} -period 10 -waveform {0 5 } [ get_ports { CLK_1 } ]

#Created generated clock on pin DFN1_0/Q with a period twice longer than the period at the reference port CLK_0.
create_generated_clock -name {new_CLK0} -divide_by 2 -source [ get_ports { CLK_0 } ] [ get_pins { DFN1_0/Q } ]

