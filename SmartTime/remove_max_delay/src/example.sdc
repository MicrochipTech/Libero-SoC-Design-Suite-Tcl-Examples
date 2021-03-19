#---------------------------------------------------------------
# File: example.sdc
# Description: Setting timing constraints on inputs and outputs.
#---------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

# Set maximum delay for dout_q port
set_max_delay 2.1 -to [get_ports dout_q]

# Sets maximum delay by constraining all paths from din_b port.
set_max_delay 1 -from [get_ports din_b]
