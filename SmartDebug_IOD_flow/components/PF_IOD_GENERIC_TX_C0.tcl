# Creating SmartDesign PF_IOD_GENERIC_TX_C0
set sd_name {PF_IOD_GENERIC_TX_C0}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HS_IO_CLK_90} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HS_IO_CLK_PAUSE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HS_IO_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_CLK_G} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_CLK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_CLK} -port_direction {OUT} -port_is_pad {1}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {L0_TXD_DATA} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L1_TXD_DATA} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {CLK_ALIGN_IOD_RX} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TXD_N} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {TXD} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {IOD_TX_CLKS} -port_bif_vlnv {Actel:busdef.clock:PF_IOD_TX_CLK:1.0} -port_bif_role {slave} -port_bif_mapping {\
"HS_IO_CLK_0:HS_IO_CLK" \
"TX_CLK_G:TX_CLK_G" \
"HS_IO_CLK_PAUSE:HS_IO_CLK_PAUSE" \
"CLK_ALIGN_IOD_RX:CLK_ALIGN_IOD_RX" \
"HS_IO_CLK_90:HS_IO_CLK_90" } 

sd_create_pin_slices -sd_name ${sd_name} -pin_name {CLK_ALIGN_IOD_RX} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CLK_ALIGN_IOD_RX} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CLK_ALIGN_IOD_RX} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CLK_ALIGN_IOD_RX} -pin_slices {[3:3]}
# Add LANECTRL_ADDR_CMD_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_LANECTRL:2.0.102} -instance_name {LANECTRL_ADDR_CMD_0}
# Exporting Parameters of instance LANECTRL_ADDR_CMD_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {LANECTRL_ADDR_CMD_0} -params {\
"BANK_CLK_WIDTH:1" \
"CDR_DIV_CLK_PERIOD:8" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1000" \
"DELAY_LINE_SIM_ENABLE:true" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DO_READ_ENABLE:false" \
"DQS_READ_SOURCE:BANK_CLK" \
"DQS_WRITE_LEVELING:0" \
"DQS_WRITE_SOURCE:OFF" \
"ENABLE_ODT:false" \
"ENABLE_PAUSE_EXTENSION:1" \
"ENABLE_RANK2:false" \
"FAMILY:26" \
"FIFO_MODE:CONTINUOUS" \
"FIFO_READ_POINTER_MODE:3" \
"FIFO_TWO_HS_IO_CLK:false" \
"FORMAL_NAME:LANE_RESET%DUPLICATE" \
"INTERFACE_NAME:TX_DDRX_B_C" \
"IO_DYNAMIC_CALIB_CODE_UPDATE:false" \
"LOCAL_CLOCK_SEL:OFF" \
"MODE:DDRE" \
"PARAM_IS_FALSE:false" \
"RATIO:4" \
"READ_DELAY:1" \
"READ_DELAY_MODE:OFF" \
"READ_OFFSET:OFF" \
"READ_OFFSET_DIR:UP" \
"RX_DQS_90_WIDTH:0" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"WRITE_DELAY:1" \
"WRITE_DELAY_MODE:DYNAMIC" \
"WRITE_OFFSET:OFF" \
"WRITE_OFFSET_DIR:UP" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {LANECTRL_ADDR_CMD_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LANECTRL_ADDR_CMD_0:HS_IO_CLK} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {LANECTRL_ADDR_CMD_0:HS_IO_CLK} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LANECTRL_ADDR_CMD_0:RESET} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {LANECTRL_ADDR_CMD_0:DELAY_LINE_LOAD} -value {VCC}



# Add OR2_PAUSE instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_PAUSE}
sd_invert_pins -sd_name ${sd_name} -pin_names {OR2_PAUSE:B}



# Add PF_IOD_CLK_TRAINING instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_IOD:1.0.218} -instance_name {PF_IOD_CLK_TRAINING}
# Exporting Parameters of instance PF_IOD_CLK_TRAINING
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_IOD_CLK_TRAINING} -params {\
"BANK_CLK_WIDTH:0" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1000" \
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
"INTERFACE_NAME:TX_DDRX_B_C" \
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
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_CLK_TRAINING:RX_DATA_0} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_CLK_TRAINING:RX_DATA_0} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_CLK_TRAINING:RX_DATA_0} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_CLK_TRAINING:RX_DATA_0} -pin_slices {[6:6]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_CLK_TRAINING:EYE_MONITOR_CLEAR_FLAGS_0} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_CLK_TRAINING:ODT_EN_0} -value {GND}



# Add PF_IOD_TX instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_IOD:1.0.218} -instance_name {PF_IOD_TX}
# Exporting Parameters of instance PF_IOD_TX
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_IOD_TX} -params {\
"BANK_CLK_WIDTH:0" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1000" \
"DELAY_LINE_EDGE_DETECT:false" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DISABLE_LANECTRL_PAUSE:false" \
"DO_READ_ENABLE:false" \
"ENABLE_INDEPENDENT_RX_TX_CLOCK:false" \
"ENABLE_LANECTRL_RESET:true" \
"EXPOSE_BOTH_DQSW:1" \
"EXTENDED_WRITE_LEVELING:false" \
"FAB_CLK_INVERSION:false" \
"FAMILY:26" \
"FORMAL_NAME_0:TXD:NO_IOD_N_SIDE" \
"FORMAL_NAME_1:TXD" \
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
"INTERFACE_NAME:TX_DDRX_B_C" \
"IO_ADD_BUFFER:true" \
"IO_CALIB_CODE_SOURCE:BANK" \
"IO_DIFF:1" \
"IO_ENABLE_DYNAMIC_CALIB:false" \
"IO_ENABLE_DYNAMIC_ODT:true" \
"IO_ENABLE_FEEDBACK:false" \
"IO_TECH:LVCMOS25" \
"MODE:DDX" \
"NUMBER_OF_IOS:2" \
"OE_CLK_INVERSION:0" \
"OE_DATA_WIDTH:3" \
"OE_ENABLE:1" \
"OE_ENABLE_STR:SDEX4" \
"OE_INVERSION:0" \
"OE_OVERRIDE_MODE:NO" \
"PARAM_IS_FALSE:false" \
"RATIO:4" \
"RX_BIT_SLIP_ENABLE:false" \
"RX_BYPASS_DATA_ENABLE:false" \
"RX_CLK_SELECTION:OFF" \
"RX_DATA_WIDTH:7" \
"RX_DELAY_LINE_2X_DELAYS:false" \
"RX_DELAY_LINE_DELAY:1" \
"RX_DELAY_LINE_ENABLE:DISABLED" \
"RX_DQS_90_WIDTH:1" \
"RX_ENABLE:0" \
"RX_ENABLE_STR:DDRX4" \
"RX_EYE_MONITOR_ENABLE:0" \
"RX_EYE_MONITOR_WIDTH:2" \
"RX_EYE_MONITOR_WIDTH_SOURCE:LANECTRL" \
"RX_FIFO_ENABLE:0" \
"RX_N_PORT_ENABLE:false" \
"RX_PORT_ENABLE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"SWITCH_ENABLE:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"TX_CLK_SELECTION:DQSW270" \
"TX_DATA_WIDTH:7" \
"TX_DELAY_LINE_DELAY:1" \
"TX_DELAY_LINE_ENABLE:STATIC" \
"TX_ENABLE:1" \
"TX_ENABLE_STR:DDTX4" \
"TX_FORCE_OUTBUF:1" \
"TX_PORT_ENABLE:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_IOD_TX}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_TX:OE_DATA_0} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_TX:OE_DATA_1} -value {VCC}



# Add PF_IOD_TX_CLK instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv {Actel:SgCore:PF_IOD:1.0.218} -instance_name {PF_IOD_TX_CLK}
# Exporting Parameters of instance PF_IOD_TX_CLK
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PF_IOD_TX_CLK} -params {\
"BANK_CLK_WIDTH:0" \
"CDR_LANECTRL_OVERLAY_ENABLE:false" \
"DATA_RATE:1000" \
"DELAY_LINE_EDGE_DETECT:false" \
"DELAY_LINE_SIMULATION_MODE:DISABLED" \
"DISABLE_LANECTRL_PAUSE:false" \
"DO_READ_ENABLE:false" \
"ENABLE_INDEPENDENT_RX_TX_CLOCK:false" \
"ENABLE_LANECTRL_RESET:true" \
"EXPOSE_BOTH_DQSW:1" \
"EXTENDED_WRITE_LEVELING:false" \
"FAB_CLK_INVERSION:false" \
"FAMILY:26" \
"FORMAL_NAME_0:TX_CLK" \
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
"INTERFACE_NAME:TX_DDRX_B_C" \
"IO_ADD_BUFFER:true" \
"IO_CALIB_CODE_SOURCE:BANK" \
"IO_DIFF:1" \
"IO_ENABLE_DYNAMIC_CALIB:false" \
"IO_ENABLE_DYNAMIC_ODT:true" \
"IO_ENABLE_FEEDBACK:false" \
"IO_TECH:LVCMOS25" \
"MODE:DDX" \
"NUMBER_OF_IOS:1" \
"OE_CLK_INVERSION:0" \
"OE_DATA_WIDTH:1" \
"OE_ENABLE:1" \
"OE_ENABLE_STR:SDEX2" \
"OE_INVERSION:0" \
"OE_OVERRIDE_MODE:NO" \
"PARAM_IS_FALSE:false" \
"RATIO:2" \
"RX_BIT_SLIP_ENABLE:false" \
"RX_BYPASS_DATA_ENABLE:false" \
"RX_CLK_SELECTION:OFF" \
"RX_DATA_WIDTH:3" \
"RX_DELAY_LINE_2X_DELAYS:false" \
"RX_DELAY_LINE_DELAY:1" \
"RX_DELAY_LINE_ENABLE:DISABLED" \
"RX_DQS_90_WIDTH:1" \
"RX_ENABLE:0" \
"RX_ENABLE_STR:DDRX2" \
"RX_EYE_MONITOR_ENABLE:0" \
"RX_EYE_MONITOR_WIDTH:2" \
"RX_EYE_MONITOR_WIDTH_SOURCE:LANECTRL" \
"RX_FIFO_ENABLE:0" \
"RX_N_PORT_ENABLE:false" \
"RX_PORT_ENABLE:false" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"SWITCH_ENABLE:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" \
"TX_CLK_SELECTION:DQSW" \
"TX_DATA_WIDTH:3" \
"TX_DELAY_LINE_DELAY:1" \
"TX_DELAY_LINE_ENABLE:STATIC" \
"TX_ENABLE:1" \
"TX_ENABLE_STR:DDTX2" \
"TX_FORCE_OUTBUF:1" \
"TX_PORT_ENABLE:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PF_IOD_TX_CLK}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_TX_CLK:TX_DATA_0} -value {0101}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_TX_CLK:OE_DATA_0} -value {11}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARST_N" "OR2_PAUSE:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_ALIGN_IOD_RX[0:0]" "PF_IOD_CLK_TRAINING:RX_DATA_0[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_ALIGN_IOD_RX[1:1]" "PF_IOD_CLK_TRAINING:RX_DATA_0[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_ALIGN_IOD_RX[2:2]" "PF_IOD_CLK_TRAINING:RX_DATA_0[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_ALIGN_IOD_RX[3:3]" "PF_IOD_CLK_TRAINING:RX_DATA_0[6:6]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK" "LANECTRL_ADDR_CMD_0:HS_IO_CLK[1:1]" "PF_IOD_CLK_TRAINING:HS_IO_CLK" "PF_IOD_TX:HS_IO_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_90" "LANECTRL_ADDR_CMD_0:HS_IO_CLK[0:0]" "PF_IOD_TX_CLK:HS_IO_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HS_IO_CLK_PAUSE" "OR2_PAUSE:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:ARST_N" "PF_IOD_CLK_TRAINING:ARST_N" "PF_IOD_TX:ARST_N" "PF_IOD_TX_CLK:ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:FAB_CLK" "PF_IOD_CLK_TRAINING:FAB_CLK" "PF_IOD_TX:FAB_CLK" "PF_IOD_TX_CLK:FAB_CLK" "TX_CLK_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:HS_IO_CLK_PAUSE" "OR2_PAUSE:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:RX_SYNC_RST" "PF_IOD_CLK_TRAINING:RX_SYNC_RST" "PF_IOD_TX:RX_SYNC_RST" "PF_IOD_TX_CLK:RX_SYNC_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:TX_DQS" "PF_IOD_TX:TX_DQS" "PF_IOD_TX_CLK:TX_DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:TX_DQS_270" "PF_IOD_TX:TX_DQS_270" "PF_IOD_TX_CLK:TX_DQS_270" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANECTRL_ADDR_CMD_0:TX_SYNC_RST" "PF_IOD_CLK_TRAINING:TX_SYNC_RST" "PF_IOD_TX:TX_SYNC_RST" "PF_IOD_TX_CLK:TX_SYNC_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_TX_CLK:PAD_O" "TX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_TX_CLK:PAD_O_N" "TX_CLK_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"L0_TXD_DATA" "PF_IOD_TX:TX_DATA_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L1_TXD_DATA" "PF_IOD_TX:TX_DATA_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_TX:PAD_O" "TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_TX:PAD_O_N" "TXD_N" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PF_IOD_GENERIC_TX_C0
generate_component -component_name ${sd_name}
