#------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of set_multicycle_path command.
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

# Set multiple clock cycles on all paths starting clock domain
set_multicycle_path 2 -from [get_clocks CLKIN]
