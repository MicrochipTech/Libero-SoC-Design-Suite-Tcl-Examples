# Creating SmartDesign PCIe_TL_CLK
set sd_name {PCIe_TL_CLK}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVICE_INIT_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK0_1_7_CALIB_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125MHz} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TL_CLK} -port_direction {OUT}


# Add AND3_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND3} -instance_name {AND3_0}



# Add CLK_DIV2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLK_DIV2} -instance_name {CLK_DIV2_0}



# Add NGMUX_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {NGMUX} -instance_name {NGMUX_0}



# Add OSC_160MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {OSC_160MHz} -instance_name {OSC_160MHz_0}



# Add PCIe_INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIe_INIT_MONITOR} -instance_name {PCIe_INIT_MONITOR_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:FABRIC_POR_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_INIT_MONITOR_0:AUTOCALIB_DONE}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BANK0_1_7_CALIB_DONE" "AND3_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_125MHz" "NGMUX_0:CLK1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_DIV2_0:CLK_OUT" "NGMUX_0:CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_INIT_MONITOR_0:DEVICE_INIT_DONE" "DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_DIV2_0:CLK_IN" "OSC_160MHz_0:RCOSC_160MHZ_CLK_DIV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_INIT_MONITOR_0:BANK_0_CALIB_STATUS" "AND3_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_INIT_MONITOR_0:BANK_1_CALIB_STATUS" "AND3_0:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_INIT_MONITOR_0:BANK_7_CALIB_STATUS" "AND3_0:C" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_INIT_MONITOR_0:PCIE_INIT_DONE" "NGMUX_0:SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TL_CLK" "NGMUX_0:CLK_OUT" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PCIe_TL_CLK
generate_component -component_name ${sd_name}
