# Creates a clock constraint on the CLK port with 10ns period
create_clock -name {CLK} -period 10 -waveform {0 5 } [ get_ports { CLK } ]

