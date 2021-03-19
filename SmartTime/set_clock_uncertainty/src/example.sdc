#-----------------------------------------------------------------
# File: example.sdc
# Description: Demonstrate usage of set_clock_uncertainty command.
#-----------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

# Set input delay for all input ports.
set_input_delay -clock CLKIN 2.1 [all_inputs];

# Set output delay for all outputs.
set_output_delay -clock CLKIN 1.2 [all_outputs];

# Set clock to clock uncertainty constraint
set_clock_uncertainty 0.4 -setup -from [get_clocks CLKIN] -fall_to [get_clocks CLKIN] 
