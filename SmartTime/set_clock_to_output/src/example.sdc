#------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of set_clock_to_output command.
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

# Set clock to output constraints for output relative to clock.
set_clock_to_output -min 0.2 -clock CLKIN [get_ports dout_q];
