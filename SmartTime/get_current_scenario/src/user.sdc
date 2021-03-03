#Create clock on CLK_0 port with 4ns period
#create_clock -name {clk_0} -period 4 -waveform { 0 2 } [ get_ports { CLK_0 } ]
