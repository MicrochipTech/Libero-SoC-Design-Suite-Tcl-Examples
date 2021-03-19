#------------------------------------------------------------
# File: example.sdc
#------------------------------------------------------------

# Create a clock as a reference to specify timing constraints.
create_clock -name CLKIN -period 10 [get_ports clk];

