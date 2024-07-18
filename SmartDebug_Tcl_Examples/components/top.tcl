   
# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {A_WEN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_RESET_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BUSY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CTRLR_READY_DDR4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {error} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {match_out} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {transactions_complete} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {uprom_err} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}


sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}

# Add DDR4_Interface_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR4_Interface} -instance_name {DDR4_Interface_0}



# Add Fabric_Debug_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Fabric_Debug} -instance_name {Fabric_Debug_0}



# Add PF_CCC_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_0} -instance_name {PF_CCC_0_0}



# Add PF_INIT_MON_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MON} -instance_name {PF_INIT_MON_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MON_0:AUTOCALIB_DONE}



# Add reset_des_sync_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {reset_des_sync} -instance_name {reset_des_sync_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_des_sync_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {reset_des_sync_0:FF_US_RESTORE} -value {GND}



# Add XCVR_Debug_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {XCVR_Debug} -instance_name {XCVR_Debug_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "DDR4_Interface_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"A_WEN" "Fabric_Debug_0:A_WEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BUSY" "Fabric_Debug_0:BUSY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "DDR4_Interface_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "DDR4_Interface_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "DDR4_Interface_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "DDR4_Interface_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "DDR4_Interface_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CTRLR_READY_DDR4" "DDR4_Interface_0:CTRLR_READY_DDR4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:BANK_y_VDDI_STATUS" "PF_INIT_MON_0:BANK_4_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:FPGA_POR_N" "PF_INIT_MON_0:FABRIC_POR_N" "reset_des_sync_0:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:INIT_DONE" "PF_INIT_MON_0:DEVICE_INIT_DONE" "reset_des_sync_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:PLL_LOCK_DDR4" "PLL_LOCK_DDR4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:REF_CLK_0" "PF_CCC_0_0:REF_CLK_0" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:SYS_CLK" "SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:USER_RST_N" "SYS_RESET_N" "XCVR_Debug_0:SYS_RESET_N" "reset_des_sync_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:ddr_rd_wrt_err" "ddr_rd_wrt_err" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:transactions_complete" "transactions_complete" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Fabric_Debug_0:clk" "PF_CCC_0_0:OUT0_FABCLK_0" "reset_des_sync_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Fabric_Debug_0:error" "error" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Fabric_Debug_0:match_out" "match_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Fabric_Debug_0:rst_n" "reset_des_sync_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Fabric_Debug_0:uprom_err" "uprom_err" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "XCVR_Debug_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "XCVR_Debug_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "XCVR_Debug_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "XCVR_Debug_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0_0:PLL_LOCK_0" "reset_des_sync_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0_0:PLL_POWERDOWN_N_0" "reset_des_sync_0:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_INIT_MON_0:BANK_6_VDDI_STATUS" "reset_des_sync_0:BANK_x_VDDI_STATUS" "reset_des_sync_0:BANK_y_VDDI_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "XCVR_Debug_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "XCVR_Debug_0:REF_CLK_PAD_P" }



# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "DDR4_Interface_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "DDR4_Interface_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG" "DDR4_Interface_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:DM_N" "DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4_Interface_0:DQS_N" "DQS_N" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
