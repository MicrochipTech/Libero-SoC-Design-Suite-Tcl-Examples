# Creating SmartDesign DDR4_Interface
set sd_name {DDR4_Interface}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK_y_VDDI_STATUS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_RST_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CTRLR_READY_DDR4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_DDR4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_rd_wrt_err} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {transactions_complete} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}

# Add AXI_IF_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {AXI_IF} -instance_name {AXI_IF_0}
# Exporting Parameters of instance AXI_IF_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {AXI_IF_0} -params {\
"Bresp_0:4" \
"burst_count:1" \
"Idle_0:0" \
"Idle_1:1" \
"Read_0:2" \
"Read_1:3" \
"Read_2:4" \
"read_burst_count:1" \
"read_enable:0" \
"Write_0:2" \
"Write_1:3" \
"Write_2:5" \
"write_enable:0" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {AXI_IF_0}
sd_update_instance -sd_name ${sd_name} -instance_name {AXI_IF_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {AXI_IF_0:WD}



# Add CMD_Decoder_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {CMD_Decoder} -hdl_file {hdl\CMD_Decoder.v} -instance_name {CMD_Decoder_0}



# Add DDR4_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR4_Splash} -instance_name {DDR4_0}



# Add PF_RESET_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_RESET} -instance_name {PF_RESET_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_RESET_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_RESET_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_RESET_0:PLL_POWERDOWN_B}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "DDR4_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:AXI_BUSY" "CMD_Decoder_0:AXI_BUSY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:CLK" "CMD_Decoder_0:CLK" "DDR4_0:SYS_CLK" "PF_RESET_0:CLK" "SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:RESETn" "CMD_Decoder_0:RESETn" "PF_RESET_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:ddr_rd_wrt_err" "ddr_rd_wrt_err" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:read_start" "CMD_Decoder_0:read_start" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:write_start" "CMD_Decoder_0:write_start" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BANK_y_VDDI_STATUS" "PF_RESET_0:BANK_x_VDDI_STATUS" "PF_RESET_0:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "DDR4_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "DDR4_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "DDR4_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "DDR4_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CMD_Decoder_0:DDR_READY" "CTRLR_READY_DDR4" "DDR4_0:CTRLR_READY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CMD_Decoder_0:transactions_complete" "transactions_complete" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "DDR4_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:PLL_LOCK" "PF_RESET_0:PLL_LOCK" "PLL_LOCK_DDR4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:PLL_REF_CLK" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:SYS_RESET_N" "INIT_DONE" "PF_RESET_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_POR_N" "PF_RESET_0:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RESET_0:EXT_RST_N" "USER_RST_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "DDR4_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:r_xfer_size" "CMD_Decoder_0:r_xfer_size" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:w_xfer_size" "CMD_Decoder_0:w_xfer_size" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "DDR4_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG" "DDR4_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:DM_N" "DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_0:DQS_N" "DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI_IF_0:BIF_1" "DDR4_0:AXI3slave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign DDR4_Interface
generate_component -component_name ${sd_name}
