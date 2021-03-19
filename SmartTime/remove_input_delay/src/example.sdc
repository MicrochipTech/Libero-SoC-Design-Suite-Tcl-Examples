#------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of remove_input_delay command.
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set input delay for din_a input port.
set_input_delay -clock CLKIN 1.8 [get_ports din_a];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];
