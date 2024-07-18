# Creating SmartDesign XCVR_Debug
set sd_name {XCVR_Debug}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_RESET_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}



# Add SMARTBERT_XCVR_CHK instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SMARTBERT_XCVR_CHK} -instance_name {SMARTBERT_XCVR_CHK}



# Add TX_PLL_XCVR_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {TX_PLL_XCVR_0} -instance_name {TX_PLL_XCVR_0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {TX_PLL_XCVR_0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {TX_PLL_XCVR_0_0:CLK_125}



# Add XCVR_REF_CLK_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {XCVR_REF_CLK_0} -instance_name {XCVR_REF_CLK_0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "SMARTBERT_XCVR_CHK:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "SMARTBERT_XCVR_CHK:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "SMARTBERT_XCVR_CHK:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "SMARTBERT_XCVR_CHK:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_N" "XCVR_REF_CLK_0_0:REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REF_CLK_PAD_P" "XCVR_REF_CLK_0_0:REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SMARTBERT_XCVR_CHK:LANE0_CDR_REF_CLK_0" "TX_PLL_XCVR_0_0:REF_CLK" "XCVR_REF_CLK_0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SMARTBERT_XCVR_CHK:SYS_RESET_N" "SYS_RESET_N" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"SMARTBERT_XCVR_CHK:CLKS_FROM_TXPLL_0" "TX_PLL_XCVR_0_0:CLKS_TO_XCVR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign XCVR_Debug
generate_component -component_name ${sd_name}
