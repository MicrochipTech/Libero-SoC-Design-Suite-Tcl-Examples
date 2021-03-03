#The following command displays the list of register to register paths of clock domain clk_2:
puts "List of register to register paths of clock domain clk_2:"
puts [ list_paths -clock clk_2 -type reg_to_reg ]

#The following command displays the list of path from input ports to data pins of registers:
puts "List of path from input ports to data pins of registers:"
puts [ list_paths -clock clk_2 -type external_setup ]

#The following command displays the list of path from input ports to data pins of registers:
puts "List of path from input ports to data pins of registers:"
puts [ list_paths -clock clk_2 -type external_hold ]

#The following command displays the list of path from registers to output ports:
puts "List of path from registers to output ports:"
puts [ list_paths -clock clk_2 -type clock_to_out ]
