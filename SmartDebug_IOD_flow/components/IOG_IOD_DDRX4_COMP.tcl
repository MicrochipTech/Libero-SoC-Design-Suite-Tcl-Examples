# Creating SmartDesign IOG_IOD_DDRX4_COMP
set sd_name {IOG_IOD_DDRX4_COMP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESTARTN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SWITCH} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {Algn_Done} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Algn_Err} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_DONE_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_ERR_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_ERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_OOR_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_OOR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_START_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_START_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIT_ALGN_START} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_TRAIN_ERROR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRBS_ERR_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRBS_ERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_CLK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Y} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {prbs_chk_error_o_1} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {BIT_ALGN_EYE_IN} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RXD_N} -port_direction {IN} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {RXD} -port_direction {IN} -port_range {[1:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DEM_BIT_ALGN_TAPDLY_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DEM_BIT_ALGN_TAPDLY} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RX_BIT_ALIGN_LEFT_WIN_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RX_BIT_ALIGN_LEFT_WIN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RX_BIT_ALIGN_RGHT_WIN_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RX_BIT_ALIGN_RGHT_WIN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TXD_N} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {TXD} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}


# Add ACT_UNIQUE_debouncer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_debouncer} -hdl_file {hdl\debounce.v} -instance_name {ACT_UNIQUE_debouncer_0}



# Add ACT_UNIQUE_prbscheck_parallel_fab_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_prbscheck_parallel_fab} -hdl_file {hdl\prbscheck_parallel_fab.v} -instance_name {ACT_UNIQUE_prbscheck_parallel_fab_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ACT_UNIQUE_prbscheck_parallel_fab_0:prbs_en_i} -value {VCC}



# Add ACT_UNIQUE_prbscheck_parallel_fab_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_prbscheck_parallel_fab} -hdl_file {hdl\prbscheck_parallel_fab.v} -instance_name {ACT_UNIQUE_prbscheck_parallel_fab_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {ACT_UNIQUE_prbscheck_parallel_fab_1:prbs_en_i} -value {VCC}



# Add ACT_UNIQUE_rev_bits_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_rev_bits} -hdl_file {hdl\rev_bits.v} -instance_name {ACT_UNIQUE_rev_bits_0}



# Add BUFF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BUFF} -instance_name {BUFF_0}



# Add CORERXIODBITALIGN_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERXIODBITALIGN_C0} -instance_name {CORERXIODBITALIGN_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERXIODBITALIGN_C0_0:BIT_ALGN_HOLD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERXIODBITALIGN_C0_0:BIT_ALGN_SKIP} -value {GND}



# Add CORERXIODBITALIGN_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERXIODBITALIGN_C0} -instance_name {CORERXIODBITALIGN_C0_1}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERXIODBITALIGN_C0_1:BIT_ALGN_HOLD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERXIODBITALIGN_C0_1:BIT_ALGN_SKIP} -value {GND}



# Add debouncer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_debouncer} -hdl_file {hdl\debounce.v} -instance_name {debouncer_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {debouncer_0:SWITCH}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_IOD_GENERIC_RX_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_GENERIC_RX_C1} -instance_name {PF_IOD_GENERIC_RX_C1_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_CLEAR_FLAGS} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_CLEAR_FLAGS} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_EARLY} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_EARLY} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_LATE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_LATE} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_MOVE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_MOVE} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_DIRECTION} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_DIRECTION} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_LOAD} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_LOAD} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_OUT_OF_RANGE} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_OUT_OF_RANGE} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C1_0:HS_IO_CLK_PAUSE} -value {GND}



# Add PF_IOD_GENERIC_TX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_GENERIC_TX_C0} -instance_name {PF_IOD_GENERIC_TX_C0_0}



# Add PF_IOD_TX_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_TX_CCC_C0} -instance_name {PF_IOD_TX_CCC_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_IOD_TX_CCC_C0_0:GL3}



# Add PF_OSC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_C1} -instance_name {PF_OSC_C1_0}



# Add prbsgen_parallel_fab_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_prbsgen_parallel_fab} -hdl_file {hdl\prbsgen_parallel_fab.v} -instance_name {prbsgen_parallel_fab_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {prbsgen_parallel_fab_0:clear_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {prbsgen_parallel_fab_0:prbs_en_i} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {prbsgen_parallel_fab_0:prbs_out_o}



# Add rev_bits_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {ACT_UNIQUE_rev_bits} -hdl_file {hdl\rev_bits.v} -instance_name {rev_bits_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_debouncer_0:CLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "PF_IOD_TX_CCC_C0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_debouncer_0:DB_OUT" "PF_IOD_TX_CCC_C0_0:POWERDOWN_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_debouncer_0:RESET_N" "PF_CCC_C0_0:PLL_LOCK_0" "PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_debouncer_0:SWITCH" "SWITCH" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_0:clk_i" "ACT_UNIQUE_prbscheck_parallel_fab_1:clk_i" "CORERXIODBITALIGN_C0_0:SCLK" "CORERXIODBITALIGN_C0_1:SCLK" "PF_IOD_GENERIC_RX_C1_0:RX_CLK_G" "debouncer_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_0:prbs_chk_error_o" "PRBS_ERR" "PRBS_ERR_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_0:resetn_i" "ACT_UNIQUE_prbscheck_parallel_fab_1:resetn_i" "CORERXIODBITALIGN_C0_0:RESETN" "CORERXIODBITALIGN_C0_1:RESETN" "PF_IOD_GENERIC_RX_C1_0:CLK_TRAIN_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_1:prbs_chk_error_o" "prbs_chk_error_o_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Algn_Done" "BIT_ALGN_DONE_0" "CORERXIODBITALIGN_C0_0:BIT_ALGN_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Algn_Err" "BIT_ALGN_ERR" "CORERXIODBITALIGN_C0_0:BIT_ALGN_ERR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_DONE" "CORERXIODBITALIGN_C0_1:BIT_ALGN_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_ERR_0" "CORERXIODBITALIGN_C0_1:BIT_ALGN_ERR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_OOR" "CORERXIODBITALIGN_C0_1:BIT_ALGN_OOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_OOR_0" "CORERXIODBITALIGN_C0_0:BIT_ALGN_OOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_START" "BIT_ALGN_START_0" "CORERXIODBITALIGN_C0_0:BIT_ALGN_START" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_START_1" "CORERXIODBITALIGN_C0_1:BIT_ALGN_START" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BUFF_0:A" "RESTARTN" "debouncer_0:SWITCH" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BUFF_0:Y" "Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_TRAIN_ERROR" "PF_IOD_GENERIC_RX_C1_0:CLK_TRAIN_ERROR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:BIT_ALGN_CLR_FLGS" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_CLEAR_FLAGS[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:BIT_ALGN_DIR" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_DIRECTION[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:BIT_ALGN_LOAD" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_LOAD[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:BIT_ALGN_MOVE" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_MOVE[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:BIT_ALGN_RSTRT" "CORERXIODBITALIGN_C0_1:BIT_ALGN_RSTRT" "debouncer_0:DB_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:IOD_EARLY" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_EARLY[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:IOD_LATE" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_LATE[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:IOD_OOR" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_OUT_OF_RANGE[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:PLL_LOCK" "CORERXIODBITALIGN_C0_1:PLL_LOCK" "PF_IOD_GENERIC_TX_C0_0:ARST_N" "PF_IOD_TX_CCC_C0_0:PLL_LOCK" "PLL_LOCK" "debouncer_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:BIT_ALGN_CLR_FLGS" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_CLEAR_FLAGS[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:BIT_ALGN_DIR" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_DIRECTION[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:BIT_ALGN_LOAD" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_LOAD[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:BIT_ALGN_MOVE" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_MOVE[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:IOD_EARLY" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_EARLY[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:IOD_LATE" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_LATE[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:IOD_OOR" "PF_IOD_GENERIC_RX_C1_0:DELAY_LINE_OUT_OF_RANGE[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "PF_OSC_C1_0:RCOSC_160MHZ_GL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:ARST_N" "PF_IOD_TX_CCC_C0_0:CLK_TRAIN_DONE" "prbsgen_parallel_fab_0:resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:RX_CLK_N" "RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:RX_CLK_P" "RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:TX_CLK" "TX_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:TX_CLK_N" "TX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_TX_CCC_C0_0:TX_CLK_G" "prbsgen_parallel_fab_0:clk_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_0:data_in_i" "rev_bits_0:out_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_prbscheck_parallel_fab_1:data_in_i" "ACT_UNIQUE_rev_bits_0:out_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_UNIQUE_rev_bits_0:in_data" "PF_IOD_GENERIC_RX_C1_0:L1_RXD_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIT_ALGN_EYE_IN" "CORERXIODBITALIGN_C0_0:BIT_ALGN_EYE_IN" "CORERXIODBITALIGN_C0_1:BIT_ALGN_EYE_IN" "PF_IOD_GENERIC_RX_C1_0:EYE_MONITOR_WIDTH" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:DEM_BIT_ALGN_TAPDLY" "DEM_BIT_ALGN_TAPDLY_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:RX_BIT_ALIGN_LEFT_WIN" "RX_BIT_ALIGN_LEFT_WIN_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_0:RX_BIT_ALIGN_RGHT_WIN" "RX_BIT_ALIGN_RGHT_WIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:DEM_BIT_ALGN_TAPDLY" "DEM_BIT_ALGN_TAPDLY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:RX_BIT_ALIGN_LEFT_WIN" "RX_BIT_ALIGN_LEFT_WIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERXIODBITALIGN_C0_1:RX_BIT_ALIGN_RGHT_WIN" "RX_BIT_ALIGN_RGHT_WIN_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:L0_RXD_DATA" "rev_bits_0:in_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:RXD" "RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C1_0:RXD_N" "RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:L0_TXD_DATA" "PF_IOD_GENERIC_TX_C0_0:L1_TXD_DATA" "prbsgen_parallel_fab_0:prbs_out_msb_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:TXD" "TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:TXD_N" "TXD_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_TX_C0_0:IOD_TX_CLKS" "PF_IOD_TX_CCC_C0_0:IOD_TX_CLKS" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign IOG_IOD_DDRX4_COMP
generate_component -component_name ${sd_name}
