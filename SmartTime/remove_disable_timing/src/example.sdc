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

# Disables timing arcs within a cell
set_disable_timing [get_cells din_a_q]
