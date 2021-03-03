# Create "clk" clock with 20ns period on CLK port.
create_clock -name {clk} -period 2 -waveform {0 1} [ get_ports { CLK_0 } ]
 
# Create a generated clock on pin "DFN1_0/Q" with a period twice as long as the period at the reference port CLK_0.
create_generated_clock -name {gen_new_clk} -divide_by 2 -source [ get_ports { CLK_0 } ] [ get_pins { DFN1_0/Q } ]
