# Creating SmartDesign Fabric_Debug
set sd_name {Fabric_Debug}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {A_WEN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rst_n} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {BUSY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {error} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {match_out} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {uprom_err} -port_direction {OUT}



# Add count_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {count} -hdl_file {hdl\count.v} -instance_name {count_0}



# Add count_chk_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {count_chk} -hdl_file {hdl\count_chk.v} -instance_name {count_chk_0}



# Add DPSRAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DPSRAM} -instance_name {DPSRAM_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DPSRAM_0:B_DIN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DPSRAM_0:B_WEN} -value {GND}



# Add match_data_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {match_data} -hdl_file {hdl\match_data.v} -instance_name {match_data_0}



# Add Micro_ROM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Micro_ROM} -instance_name {Micro_ROM_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Micro_ROM_0:ADDR} -pin_slices {[15:5]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Micro_ROM_0:ADDR[15:5]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Micro_ROM_0:ADDR} -pin_slices {[4:0]}



# Add uprom_chk_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {uprom_chk} -hdl_file {hdl\uprom_chk.v} -instance_name {uprom_chk_0}



# Add URAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {URAM} -instance_name {URAM_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A_WEN" "DPSRAM_0:A_WEN" "Micro_ROM_0:BLK" "count_chk_0:A_WEN" "uprom_chk_0:wen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BUSY" "Micro_ROM_0:BUSY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DPSRAM_0:CLK" "URAM_0:CLK" "clk" "count_0:clk" "count_chk_0:clk" "match_data_0:clk" "uprom_chk_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"URAM_0:W_EN" "count_chk_0:wen_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"count_0:rst_n" "count_chk_0:rst_n" "match_data_0:rst_n" "rst_n" "uprom_chk_0:rst_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"count_chk_0:error" "error" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"match_data_0:match_out" "match_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"uprom_chk_0:uprom_err" "uprom_err" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DPSRAM_0:A_ADDR" "DPSRAM_0:A_DIN" "count_0:coutA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DPSRAM_0:B_ADDR" "count_0:coutB" "count_chk_0:B_ADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DPSRAM_0:B_DOUT" "count_chk_0:cin" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Micro_ROM_0:ADDR[4:0]" "uprom_chk_0:addr_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Micro_ROM_0:DATAR" "uprom_chk_0:data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"URAM_0:R_ADDR" "count_chk_0:waddr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"URAM_0:R_DATA" "match_data_0:data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"URAM_0:W_ADDR" "count_chk_0:raddr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"URAM_0:W_DATA" "count_chk_0:mem_out" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Fabric_Debug
generate_component -component_name ${sd_name}
