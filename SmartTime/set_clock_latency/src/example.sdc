#------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of set_clock_latency command.
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

#Sets a clock source latency to "CLKIN" clock.
set_clock_latency -source -late 0.8 [get_clocks CLKIN]
