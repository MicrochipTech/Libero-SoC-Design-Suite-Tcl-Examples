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

# Create generated clock on output port with a period twice as
# long as the period at the reference clock port.
create_generated_clock -name {DIVCLKIN} -divide_by 2 -source [get_ports clk] [get_ports clk_out]
