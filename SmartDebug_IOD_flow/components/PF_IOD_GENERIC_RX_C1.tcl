# Creating SmartDesign PF_IOD_GENERIC_RX_C1
set sd_name {PF_IOD_GENERIC_RX_C1}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HS_IO_CLK_PAUSE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_CLK_P} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_TRAIN_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_TRAIN_ERROR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_CLK_G} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {DELAY_LINE_DIRECTION} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DELAY_LINE_LOAD} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DELAY_LINE_MOVE} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {EYE_MONITOR_CLEAR_FLAGS} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {EYE_MONITOR_WIDTH} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RXD_N} -port_direction {IN} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {RXD} -port_direction {IN} -port_range {[1:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DELAY_LINE_OUT_OF_RANGE} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {EYE_MONITOR_EARLY} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {EYE_MONITOR_LATE} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L0_RXD_DATA} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L1_RXD_DATA} -port_direction {OUT} -port_range {[7:0]}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_CLEAR_FLAGS} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_CLEAR_FLAGS} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_EARLY} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_EARLY} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_LATE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {EYE_MONITOR_LATE} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_MOVE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_MOVE} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_DIRECTION} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_DIRECTION} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_LOAD} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_LOAD} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_OUT_OF_RANGE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DELAY_LINE_OUT_OF_RANGE} -pin_slices {[1:1]}
# Add CLK_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF_DIFF} -instance_name {CLK_0}



# Add CLKINT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_0}



# Add COREBCLKSCLKALIGN_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_GENERIC_RX_C1_TR} -instance_name {COREBCLKSCLKALIGN_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:CLK_ALGN_RSTRT} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:CLK_ALGN_HOLD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:CLK_ALGN_SKIP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:PLL_BCLKPHS_OFFSET} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:ICB_BCLKPHS_OFFSET} -value {00011001}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREBCLKSCLKALIGN_0:BCLK_IGEAR_RX} -value {GND}



# Add HS_IO_CLK_CASCADED instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {HS_IO_CLK} -instance_name {HS_IO_CLK_CASCADED}



# Add HS_IO_CLK_FIFO instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {HS_IO_CLK} -instance_name {HS_IO_CLK_FIFO}



# Add HS_IO_CLK_RX instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {HS_IO_CLK} -instance_name {HS_IO_CLK_RX}



# Add PAUSE_MX_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {MX2} -instance_name {PAUSE_MX_0}



# Add PF_CLK_DIV_FIFO instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_CLK_DIV_DELAY:1.1.101} -instance_name {PF_CLK_DIV_FIFO}
# Exporting Parameters of instance PF_CLK_DIV_FIFO
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_CLK_DIV_FIFO} -params {\
"DELAY:1" \
"DELAY_LINE_OUTPUT_TO_GLOBAL:false" \
"DELAY_LINE_OUTPUT_TO_HS_IO_CLK:1" \
"DELAY_LINE_OUTPUT_TO_NGMUX:false" \
"DELAY_LINE_SIMULATION_MODE:ENABLED" \
"DELAY_X2:1" \
"DIVIDER:4" \
"ENABLE_BIT_SLIP:false" \
"ENABLE_DELAY_LINE:1" \
"ENABLE_DELAY_LINE_BYPASS_OUTPUT:false" \
"ENABLE_DIVIDER:true" \
"ENABLE_DYNAMIC_CONTROL:1" \
"ENABLE_SRESET:false" \
"FAMILY:26" \
"PARAM_IS_FALSE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_CLK_DIV_FIFO}



# Add PF_CLK_DIV_RXCLK instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_CLK_DIV_DELAY:1.1.101} -instance_name {PF_CLK_DIV_RXCLK}
# Exporting Parameters of instance PF_CLK_DIV_RXCLK
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_CLK_DIV_RXCLK} -params {\
"DELAY:0" \
"DELAY_LINE_OUTPUT_TO_GLOBAL:false" \
"DELAY_LINE_OUTPUT_TO_HS_IO_CLK:1" \
"DELAY_LINE_OUTPUT_TO_NGMUX:false" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DELAY_X2:1" \
"DIVIDER:4" \
"ENABLE_BIT_SLIP:false" \
"ENABLE_DELAY_LINE:1" \
"ENABLE_DELAY_LINE_BYPASS_OUTPUT:false" \
"ENABLE_DIVIDER:true" \
"ENABLE_DYNAMIC_CONTROL:0" \
"ENABLE_SRESET:false" \
"FAMILY:26" \
"PARAM_IS_FALSE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_CLK_DIV_RXCLK}



# Add PF_IOD_CLK_TRAINING instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_IOD:1.0.218} -instance_name {PF_IOD_CLK_TRAINING}
# Exporting Parameters of instance PF_IOD_CLK_TRAINING
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_IOD_CLK_TRAINING} -params {\
"BANK_CLK_WIDTH:0" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1400" \
"DELAY_LINE_EDGE_DETECT:false" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DISABLE_LANECTRL_PAUSE:false" \
"DO_READ_ENABLE:false" \
"ENABLE_INDEPENDENT_RX_TX_CLOCK:false" \
"ENABLE_LANECTRL_RESET:true" \
"EXPOSE_BOTH_DQSW:false" \
"EXTENDED_WRITE_LEVELING:false" \
"FAB_CLK_INVERSION:false" \
"FAMILY:26" \
"FORMAL_NAME_0:HS_IO_CLK_TRAINING" \
"FORMAL_NAME_1:NA" \
"FORMAL_NAME_2:NA" \
"FORMAL_NAME_3:NA" \
"FORMAL_NAME_4:NA" \
"FORMAL_NAME_5:NA" \
"FORMAL_NAME_6:NA" \
"FORMAL_NAME_7:NA" \
"FORMAL_NAME_8:NA" \
"FORMAL_NAME_9:NA" \
"FORMAL_NAME_10:NA" \
"FORMAL_NAME_11:NA" \
"FORMAL_NAME_12:NA" \
"FORMAL_NAME_13:NA" \
"FORMAL_NAME_14:NA" \
"FORMAL_NAME_15:NA" \
"FORMAL_NAME_16:NA" \
"FORMAL_NAME_17:NA" \
"FORMAL_NAME_18:NA" \
"FORMAL_NAME_19:NA" \
"FORMAL_NAME_20:NA" \
"FORMAL_NAME_21:NA" \
"FORMAL_NAME_22:NA" \
"FORMAL_NAME_23:NA" \
"FORMAL_NAME_24:NA" \
"FORMAL_NAME_25:NA" \
"FORMAL_NAME_26:NA" \
"FORMAL_NAME_27:NA" \
"FORMAL_NAME_28:NA" \
"FORMAL_NAME_29:NA" \
"FORMAL_NAME_30:NA" \
"FORMAL_NAME_31:NA" \
"FORMAL_NAME_32:NA" \
"FORMAL_NAME_33:NA" \
"FORMAL_NAME_34:NA" \
"FORMAL_NAME_35:NA" \
"FORMAL_NAME_36:NA" \
"FORMAL_NAME_37:NA" \
"FORMAL_NAME_38:NA" \
"FORMAL_NAME_39:NA" \
"FORMAL_NAME_40:NA" \
"FORMAL_NAME_41:NA" \
"FORMAL_NAME_42:NA" \
"FORMAL_NAME_43:NA" \
"FORMAL_NAME_44:NA" \
"FORMAL_NAME_45:NA" \
"FORMAL_NAME_46:NA" \
"FORMAL_NAME_47:NA" \
"FORMAL_NAME_48:NA" \
"FORMAL_NAME_49:NA" \
"FORMAL_NAME_50:NA" \
"FORMAL_NAME_51:NA" \
"FORMAL_NAME_52:NA" \
"FORMAL_NAME_53:NA" \
"FORMAL_NAME_54:NA" \
"FORMAL_NAME_55:NA" \
"FORMAL_NAME_56:NA" \
"FORMAL_NAME_57:NA" \
"FORMAL_NAME_58:NA" \
"FORMAL_NAME_59:NA" \
"FORMAL_NAME_60:NA" \
"FORMAL_NAME_61:NA" \
"FORMAL_NAME_62:NA" \
"FORMAL_NAME_63:NA" \
"FORMAL_NAME_64:NA" \
"FORMAL_NAME_65:NA" \
"FORMAL_NAME_66:NA" \
"FORMAL_NAME_67:NA" \
"FORMAL_NAME_68:NA" \
"FORMAL_NAME_69:NA" \
"FORMAL_NAME_70:NA" \
"FORMAL_NAME_71:NA" \
"FORMAL_NAME_72:NA" \
"FORMAL_NAME_73:NA" \
"FORMAL_NAME_74:NA" \
"FORMAL_NAME_75:NA" \
"FORMAL_NAME_76:NA" \
"FORMAL_NAME_77:NA" \
"FORMAL_NAME_78:NA" \
"FORMAL_NAME_79:NA" \
"FORMAL_NAME_80:NA" \
"FORMAL_NAME_81:NA" \
"FORMAL_NAME_82:NA" \
"FORMAL_NAME_83:NA" \
"FORMAL_NAME_84:NA" \
"FORMAL_NAME_85:NA" \
"FORMAL_NAME_86:NA" \
"FORMAL_NAME_87:NA" \
"FORMAL_NAME_88:NA" \
"FORMAL_NAME_89:NA" \
"FORMAL_NAME_90:NA" \
"FORMAL_NAME_91:NA" \
"FORMAL_NAME_92:NA" \
"FORMAL_NAME_93:NA" \
"FORMAL_NAME_94:NA" \
"FORMAL_NAME_95:NA" \
"FORMAL_NAME_96:NA" \
"FORMAL_NAME_97:NA" \
"FORMAL_NAME_98:NA" \
"FORMAL_NAME_99:NA" \
"FORMAL_NAME_100:NA" \
"FORMAL_NAME_101:NA" \
"FORMAL_NAME_102:NA" \
"FORMAL_NAME_103:NA" \
"FORMAL_NAME_104:NA" \
"FORMAL_NAME_105:NA" \
"FORMAL_NAME_106:NA" \
"FORMAL_NAME_107:NA" \
"FORMAL_NAME_108:NA" \
"FORMAL_NAME_109:NA" \
"FORMAL_NAME_110:NA" \
"FORMAL_NAME_111:NA" \
"FORMAL_NAME_112:NA" \
"FORMAL_NAME_113:NA" \
"FORMAL_NAME_114:NA" \
"FORMAL_NAME_115:NA" \
"FORMAL_NAME_116:NA" \
"FORMAL_NAME_117:NA" \
"FORMAL_NAME_118:NA" \
"FORMAL_NAME_119:NA" \
"FORMAL_NAME_120:NA" \
"FORMAL_NAME_121:NA" \
"FORMAL_NAME_122:NA" \
"FORMAL_NAME_123:NA" \
"FORMAL_NAME_124:NA" \
"FORMAL_NAME_125:NA" \
"FORMAL_NAME_126:NA" \
"FORMAL_NAME_127:NA" \
"INTERFACE_NAME:RX_DDRX_B_G_DYN" \
"IO_ADD_BUFFER:false" \
"IO_CALIB_CODE_SOURCE:BANK" \
"IO_DIFF:false" \
"IO_ENABLE_DYNAMIC_CALIB:false" \
"IO_ENABLE_DYNAMIC_ODT:true" \
"IO_ENABLE_FEEDBACK:false" \
"IO_TECH:LVCMOS25" \
"MODE:TRN_BCLK_SCLK" \
"NUMBER_OF_IOS:1" \
"OE_CLK_INVERSION:false" \
"OE_DATA_WIDTH:3" \
"OE_ENABLE:false" \
"OE_ENABLE_STR:FSDEX4" \
"OE_INVERSION:false" \
"OE_OVERRIDE_MODE:NO" \
"PARAM_IS_FALSE:false" \
"RATIO:4" \
"RX_BIT_SLIP_ENABLE:false" \
"RX_BYPASS_DATA_ENABLE:false" \
"RX_CLK_SELECTION:BCLK" \
"RX_DATA_WIDTH:7" \
"RX_DELAY_LINE_2X_DELAYS:false" \
"RX_DELAY_LINE_DELAY:1" \
"RX_DELAY_LINE_ENABLE:DISABLED" \
"RX_DQS_90_WIDTH:1" \
"RX_ENABLE:true" \
"RX_ENABLE_STR:FDDRX4" \
"RX_EYE_MONITOR_ENABLE:true" \
"RX_EYE_MONITOR_WIDTH:2" \
"RX_EYE_MONITOR_WIDTH_SOURCE:LANECTRL" \
"RX_FIFO_ENABLE:false" \
"RX_N_PORT_ENABLE:false" \
"RX_PORT_ENABLE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"SWITCH_ENABLE:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"TX_CLK_SELECTION:OFF" \
"TX_DATA_WIDTH:7" \
"TX_DELAY_LINE_DELAY:1" \
"TX_DELAY_LINE_ENABLE:DISABLED" \
"TX_ENABLE:false" \
"TX_ENABLE_STR:FDDTX4" \
"TX_FORCE_OUTBUF:false" \
"TX_PORT_ENABLE:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_IOD_CLK_TRAINING}



# Add PF_IOD_RX instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_IOD:1.0.218} -instance_name {PF_IOD_RX}
# Exporting Parameters of instance PF_IOD_RX
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_IOD_RX} -params {\
"BANK_CLK_WIDTH:0" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1400" \
"DELAY_LINE_EDGE_DETECT:false" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DISABLE_LANECTRL_PAUSE:false" \
"DO_READ_ENABLE:false" \
"ENABLE_INDEPENDENT_RX_TX_CLOCK:false" \
"ENABLE_LANECTRL_RESET:true" \
"EXPOSE_BOTH_DQSW:false" \
"EXTENDED_WRITE_LEVELING:false" \
"FAB_CLK_INVERSION:false" \
"FAMILY:26" \
"FORMAL_NAME_0:RXD:NO_IOD_N_SIDE%STATIC_DELAY" \
"FORMAL_NAME_1:RXD%STATIC_DELAY" \
"FORMAL_NAME_2:NA" \
"FORMAL_NAME_3:NA" \
"FORMAL_NAME_4:NA" \
"FORMAL_NAME_5:NA" \
"FORMAL_NAME_6:NA" \
"FORMAL_NAME_7:NA" \
"FORMAL_NAME_8:NA" \
"FORMAL_NAME_9:NA" \
"FORMAL_NAME_10:NA" \
"FORMAL_NAME_11:NA" \
"FORMAL_NAME_12:NA" \
"FORMAL_NAME_13:NA" \
"FORMAL_NAME_14:NA" \
"FORMAL_NAME_15:NA" \
"FORMAL_NAME_16:NA" \
"FORMAL_NAME_17:NA" \
"FORMAL_NAME_18:NA" \
"FORMAL_NAME_19:NA" \
"FORMAL_NAME_20:NA" \
"FORMAL_NAME_21:NA" \
"FORMAL_NAME_22:NA" \
"FORMAL_NAME_23:NA" \
"FORMAL_NAME_24:NA" \
"FORMAL_NAME_25:NA" \
"FORMAL_NAME_26:NA" \
"FORMAL_NAME_27:NA" \
"FORMAL_NAME_28:NA" \
"FORMAL_NAME_29:NA" \
"FORMAL_NAME_30:NA" \
"FORMAL_NAME_31:NA" \
"FORMAL_NAME_32:NA" \
"FORMAL_NAME_33:NA" \
"FORMAL_NAME_34:NA" \
"FORMAL_NAME_35:NA" \
"FORMAL_NAME_36:NA" \
"FORMAL_NAME_37:NA" \
"FORMAL_NAME_38:NA" \
"FORMAL_NAME_39:NA" \
"FORMAL_NAME_40:NA" \
"FORMAL_NAME_41:NA" \
"FORMAL_NAME_42:NA" \
"FORMAL_NAME_43:NA" \
"FORMAL_NAME_44:NA" \
"FORMAL_NAME_45:NA" \
"FORMAL_NAME_46:NA" \
"FORMAL_NAME_47:NA" \
"FORMAL_NAME_48:NA" \
"FORMAL_NAME_49:NA" \
"FORMAL_NAME_50:NA" \
"FORMAL_NAME_51:NA" \
"FORMAL_NAME_52:NA" \
"FORMAL_NAME_53:NA" \
"FORMAL_NAME_54:NA" \
"FORMAL_NAME_55:NA" \
"FORMAL_NAME_56:NA" \
"FORMAL_NAME_57:NA" \
"FORMAL_NAME_58:NA" \
"FORMAL_NAME_59:NA" \
"FORMAL_NAME_60:NA" \
"FORMAL_NAME_61:NA" \
"FORMAL_NAME_62:NA" \
"FORMAL_NAME_63:NA" \
"FORMAL_NAME_64:NA" \
"FORMAL_NAME_65:NA" \
"FORMAL_NAME_66:NA" \
"FORMAL_NAME_67:NA" \
"FORMAL_NAME_68:NA" \
"FORMAL_NAME_69:NA" \
"FORMAL_NAME_70:NA" \
"FORMAL_NAME_71:NA" \
"FORMAL_NAME_72:NA" \
"FORMAL_NAME_73:NA" \
"FORMAL_NAME_74:NA" \
"FORMAL_NAME_75:NA" \
"FORMAL_NAME_76:NA" \
"FORMAL_NAME_77:NA" \
"FORMAL_NAME_78:NA" \
"FORMAL_NAME_79:NA" \
"FORMAL_NAME_80:NA" \
"FORMAL_NAME_81:NA" \
"FORMAL_NAME_82:NA" \
"FORMAL_NAME_83:NA" \
"FORMAL_NAME_84:NA" \
"FORMAL_NAME_85:NA" \
"FORMAL_NAME_86:NA" \
"FORMAL_NAME_87:NA" \
"FORMAL_NAME_88:NA" \
"FORMAL_NAME_89:NA" \
"FORMAL_NAME_90:NA" \
"FORMAL_NAME_91:NA" \
"FORMAL_NAME_92:NA" \
"FORMAL_NAME_93:NA" \
"FORMAL_NAME_94:NA" \
"FORMAL_NAME_95:NA" \
"FORMAL_NAME_96:NA" \
"FORMAL_NAME_97:NA" \
"FORMAL_NAME_98:NA" \
"FORMAL_NAME_99:NA" \
"FORMAL_NAME_100:NA" \
"FORMAL_NAME_101:NA" \
"FORMAL_NAME_102:NA" \
"FORMAL_NAME_103:NA" \
"FORMAL_NAME_104:NA" \
"FORMAL_NAME_105:NA" \
"FORMAL_NAME_106:NA" \
"FORMAL_NAME_107:NA" \
"FORMAL_NAME_108:NA" \
"FORMAL_NAME_109:NA" \
"FORMAL_NAME_110:NA" \
"FORMAL_NAME_111:NA" \
"FORMAL_NAME_112:NA" \
"FORMAL_NAME_113:NA" \
"FORMAL_NAME_114:NA" \
"FORMAL_NAME_115:NA" \
"FORMAL_NAME_116:NA" \
"FORMAL_NAME_117:NA" \
"FORMAL_NAME_118:NA" \
"FORMAL_NAME_119:NA" \
"FORMAL_NAME_120:NA" \
"FORMAL_NAME_121:NA" \
"FORMAL_NAME_122:NA" \
"FORMAL_NAME_123:NA" \
"FORMAL_NAME_124:NA" \
"FORMAL_NAME_125:NA" \
"FORMAL_NAME_126:NA" \
"FORMAL_NAME_127:NA" \
"INTERFACE_NAME:RX_DDRX_B_G_DYN" \
"IO_ADD_BUFFER:true" \
"IO_CALIB_CODE_SOURCE:BANK" \
"IO_DIFF:1" \
"IO_ENABLE_DYNAMIC_CALIB:false" \
"IO_ENABLE_DYNAMIC_ODT:0" \
"IO_ENABLE_FEEDBACK:false" \
"IO_TECH:LVCMOS25" \
"MODE:FDDX" \
"NUMBER_OF_IOS:2" \
"OE_CLK_INVERSION:0" \
"OE_DATA_WIDTH:3" \
"OE_ENABLE:0" \
"OE_ENABLE_STR:FSDEX4" \
"OE_INVERSION:0" \
"OE_OVERRIDE_MODE:NO" \
"PARAM_IS_FALSE:false" \
"RATIO:4" \
"RX_BIT_SLIP_ENABLE:0" \
"RX_BYPASS_DATA_ENABLE:0" \
"RX_CLK_SELECTION:DQSR" \
"RX_DATA_WIDTH:7" \
"RX_DELAY_LINE_2X_DELAYS:1" \
"RX_DELAY_LINE_DELAY:1" \
"RX_DELAY_LINE_ENABLE:DYNAMIC" \
"RX_DQS_90_WIDTH:0" \
"RX_ENABLE:1" \
"RX_ENABLE_STR:FDDRX4" \
"RX_EYE_MONITOR_ENABLE:1" \
"RX_EYE_MONITOR_WIDTH:2" \
"RX_EYE_MONITOR_WIDTH_SOURCE:LANECTRL" \
"RX_FIFO_ENABLE:1" \
"RX_N_PORT_ENABLE:false" \
"RX_PORT_ENABLE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"SWITCH_ENABLE:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"TX_CLK_SELECTION:OFF" \
"TX_DATA_WIDTH:7" \
"TX_DELAY_LINE_DELAY:1" \
"TX_DELAY_LINE_ENABLE:DISABLED" \
"TX_ENABLE:0" \
"TX_ENABLE_STR:FDDTX4" \
"TX_FORCE_OUTBUF:false" \
"TX_PORT_ENABLE:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_IOD_RX}



# Add PF_LANECTRL_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_LANECTRL:2.0.102} -instance_name {PF_LANECTRL_0}
# Exporting Parameters of instance PF_LANECTRL_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_LANECTRL_0} -params {\
"BANK_CLK_WIDTH:1" \
"CDR_DIV_CLK_PERIOD:8" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1400" \
"DELAY_LINE_SIM_ENABLE:true" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DO_READ_ENABLE:false" \
"DQS_READ_SOURCE:BANK_CLK" \
"DQS_WRITE_LEVELING:0" \
"DQS_WRITE_SOURCE:OFF" \
"ENABLE_ODT:false" \
"ENABLE_PAUSE_EXTENSION:3" \
"ENABLE_RANK2:false" \
"FAMILY:26" \
"FIFO_MODE:CONTINUOUS" \
"FIFO_READ_POINTER_MODE:3" \
"FIFO_TWO_HS_IO_CLK:1" \
"FORMAL_NAME:RX%DUPLICATE" \
"INTERFACE_NAME:RX_DDRX_B_G_DYN" \
"IO_DYNAMIC_CALIB_CODE_UPDATE:false" \
"LOCAL_CLOCK_SEL:OFF" \
"MODE:GENERIC" \
"PARAM_IS_FALSE:false" \
"RATIO:4" \
"READ_DELAY:1" \
"READ_DELAY_MODE:DYNAMIC" \
"READ_OFFSET:CODE" \
"READ_OFFSET_DIR:UP" \
"RX_DQS_90_WIDTH:0" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"WRITE_DELAY:1" \
"WRITE_DELAY_MODE:OFF" \
"WRITE_OFFSET:OFF" \
"WRITE_OFFSET_DIR:UP" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_LANECTRL_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_LANECTRL_0:HS_IO_CLK} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_LANECTRL_0:HS_IO_CLK} -pin_slices {[1:1]}
sd_invert_pins -sd_name ${sd_name} -pin_names {PF_LANECTRL_0:RESET}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARST_N" "COREBCLKSCLKALIGN_0:BCLKSCLK_TRAIN_START" "COREBCLKSCLKALIGN_0:RESETN" "PF_LANECTRL_0:RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:A" "PF_CLK_DIV_FIFO:CLK_DIV_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:Y" "COREBCLKSCLKALIGN_0:SCLK" "PF_IOD_CLK_TRAINING:FAB_CLK" "PF_IOD_RX:FAB_CLK" "PF_LANECTRL_0:FAB_CLK" "RX_CLK_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_0:PADN" "RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_0:PADP" "RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_0:Y" "HS_IO_CLK_CASCADED:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_TRAIN_DONE" "COREBCLKSCLKALIGN_0:BCLKSCLK_TRAIN_DONE" "PAUSE_MX_0:S" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_TRAIN_ERROR" "COREBCLKSCLKALIGN_0:ICB_CLK_ALGN_ERR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:BCLKSCLK_ALGN_PAUSE" "PAUSE_MX_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:ICB_CLK_ALGN_CLR_FLGS" "PF_IOD_CLK_TRAINING:EYE_MONITOR_CLEAR_FLAGS_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:ICB_CLK_ALGN_DIR" "PF_CLK_DIV_FIFO:DELAY_LINE_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:ICB_CLK_ALGN_LOAD" "PF_CLK_DIV_FIFO:DELAY_LINE_LOAD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:ICB_CLK_ALGN_MOV" "PF_CLK_DIV_FIFO:DELAY_LINE_MOVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:IOD_EARLY" "PF_IOD_CLK_TRAINING:EYE_MONITOR_EARLY_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:IOD_LATE" "PF_IOD_CLK_TRAINING:EYE_MONITOR_LATE_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREBCLKSCLKALIGN_0:IOD_OOR" "PF_CLK_DIV_FIFO:DELAY_LINE_OUT_OF_RANGE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_DIRECTION[0:0]" "PF_IOD_RX:DELAY_LINE_DIRECTION_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_DIRECTION[1:1]" "PF_IOD_RX:DELAY_LINE_DIRECTION_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_LOAD[0:0]" "PF_IOD_RX:DELAY_LINE_LOAD_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_LOAD[1:1]" "PF_IOD_RX:DELAY_LINE_LOAD_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_MOVE[0:0]" "PF_IOD_RX:DELAY_LINE_MOVE_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_MOVE[1:1]" "PF_IOD_RX:DELAY_LINE_MOVE_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_OUT_OF_RANGE[0:0]" "PF_IOD_RX:DELAY_LINE_OUT_OF_RANGE_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DELAY_LINE_OUT_OF_RANGE[1:1]" "PF_IOD_RX:DELAY_LINE_OUT_OF_RANGE_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_CLEAR_FLAGS[0:0]" "PF_IOD_RX:EYE_MONITOR_CLEAR_FLAGS_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_CLEAR_FLAGS[1:1]" "PF_IOD_RX:EYE_MONITOR_CLEAR_FLAGS_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_EARLY[0:0]" "PF_IOD_RX:EYE_MONITOR_EARLY_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_EARLY[1:1]" "PF_IOD_RX:EYE_MONITOR_EARLY_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_LATE[0:0]" "PF_IOD_RX:EYE_MONITOR_LATE_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_LATE[1:1]" "PF_IOD_RX:EYE_MONITOR_LATE_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_CASCADED:Y" "PF_CLK_DIV_FIFO:CLK_IN" "PF_CLK_DIV_RXCLK:CLK_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_FIFO:A" "PF_CLK_DIV_FIFO:CLK_OUT_HS_IO_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_FIFO:Y" "PF_IOD_CLK_TRAINING:HS_IO_CLK" "PF_IOD_RX:HS_IO_CLK" "PF_LANECTRL_0:HS_IO_CLK[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_PAUSE" "PAUSE_MX_0:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_RX:A" "PF_CLK_DIV_RXCLK:CLK_OUT_HS_IO_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_RX:Y" "PF_LANECTRL_0:HS_IO_CLK[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PAUSE_MX_0:Y" "PF_LANECTRL_0:HS_IO_CLK_PAUSE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CLK_TRAINING:ARST_N" "PF_IOD_RX:ARST_N" "PF_LANECTRL_0:ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CLK_TRAINING:RX_SYNC_RST" "PF_IOD_RX:RX_SYNC_RST" "PF_LANECTRL_0:RX_SYNC_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CLK_TRAINING:TX_SYNC_RST" "PF_IOD_RX:TX_SYNC_RST" "PF_LANECTRL_0:TX_SYNC_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_RX:RX_DQS_90" "PF_LANECTRL_0:RX_DQS_90" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"EYE_MONITOR_WIDTH" "PF_LANECTRL_0:EYE_MONITOR_WIDTH_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L0_RXD_DATA" "PF_IOD_RX:RX_DATA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L1_RXD_DATA" "PF_IOD_RX:RX_DATA_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CLK_TRAINING:EYE_MONITOR_LANE_WIDTH" "PF_IOD_RX:EYE_MONITOR_LANE_WIDTH" "PF_LANECTRL_0:EYE_MONITOR_WIDTH_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_RX:FIFO_RD_PTR" "PF_LANECTRL_0:FIFO_RD_PTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_RX:FIFO_WR_PTR" "PF_LANECTRL_0:FIFO_WR_PTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_RX:PAD_I" "RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_RX:PAD_I_N" "RXD_N" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PF_IOD_GENERIC_RX_C1
generate_component -component_name ${sd_name}
