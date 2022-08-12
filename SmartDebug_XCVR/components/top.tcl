# Creating SmartDesign top
set sd_name {top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_RESET_N} -port_direction {IN}


# Add PF_TX_PLL_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_0} -instance_name {PF_TX_PLL_0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_TX_PLL_0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_TX_PLL_0_0:CLK_125}



# Add PF_XCVR_REF_CLK_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_0} -instance_name {PF_XCVR_REF_CLK_0_0}



# Add SmartBert_Core_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SmartBert_Core_0} -instance_name {SmartBert_Core_0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "SmartBert_Core_0_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "SmartBert_Core_0_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "SmartBert_Core_0_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "SmartBert_Core_0_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_0_0:REF_CLK" "SmartBert_Core_0_0:LANE0_CDR_REF_CLK_0" "PF_XCVR_REF_CLK_0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "PF_XCVR_REF_CLK_0_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "PF_XCVR_REF_CLK_0_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SYS_RESET_N" "SmartBert_Core_0_0:SYS_RESET_N" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_0_0:CLKS_TO_XCVR" "SmartBert_Core_0_0:CLKS_FROM_TXPLL_0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}
