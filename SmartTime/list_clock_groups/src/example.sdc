#--------------------------------------------------------------
# File: example.sdc
# Description: Setting timing constraints on inputs and outputs.
#--------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];
create_clock -name CLKIN1 -add -period 8 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

puts "Set clock groups"
set_clock_groups -name {clk_group} -logically_exclusive -group [get_clocks CLKIN] -group [get_clocks CLKIN1]
