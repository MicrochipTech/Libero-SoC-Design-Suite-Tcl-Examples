#------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of set_max_delay command.
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

# Set maximum delay for dout_q port
set_max_delay 3.8 -to [get_ports dout_q]