# Creating SmartDesign UART_SD
set sd_name {UART_SD}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid_o} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {coredma_ch1_type_o} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {coredma_size_o} -port_direction {OUT} -port_range {[24:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {coredma_ch0_type_o} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {coredma_int_i} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {clk_count_i} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp_i} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_i} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arburst_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arsize_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlen_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {araddr_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid_o} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp_i} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bid_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstrb_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_o} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awburst_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awsize_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlen_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awid_o} -port_direction {OUT} -port_range {[3:0]}

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4_M} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:awid_o" \
"AWADDR:awaddr_o" \
"AWLEN:awlen_o" \
"AWSIZE:awsize_o" \
"AWBURST:awburst_o" \
"AWVALID:awvalid_o" \
"AWREADY:awready_i" \
"WDATA:wdata_o" \
"WSTRB:wstrb_o" \
"WLAST:wlast_o" \
"WVALID:wvalid_o" \
"WREADY:wready_i" \
"BID:bid_i" \
"BRESP:bresp_i" \
"BVALID:bvalid_i" \
"BREADY:bready_o" \
"ARID:arid_o" \
"ARADDR:araddr_o" \
"ARLEN:arlen_o" \
"ARSIZE:arsize_o" \
"ARBURST:arburst_o" \
"ARVALID:arvalid_o" \
"ARREADY:arready_i" \
"RID:rid_i" \
"RDATA:rdata_i" \
"RRESP:rresp_i" \
"RLAST:rlast_i" \
"RVALID:rvalid_i" \
"RREADY:rready_o" } 

# Add cmd_ctrlr_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {cmd_ctrlr} -hdl_file {hdl\CMD_CTRLR.v} -instance_name {cmd_ctrlr_0}



# Add CORE_UART_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Core_UART} -instance_name {CORE_UART_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORE_UART_0:BIT8} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORE_UART_0:CSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORE_UART_0:ODD_N_EVEN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORE_UART_0:OVERFLOW}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORE_UART_0:PARITY_EN} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORE_UART_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORE_UART_0:FRAMING_ERR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORE_UART_0:BAUD_VAL} -value {0000001101100}



# Add pattern_gen_checker_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pattern_gen_checker} -instance_name {pattern_gen_checker_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:clk_i" "CLK" "CORE_UART_0:CLK" "cmd_ctrlr_0:clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_init_i" "cmd_ctrlr_0:mem_init_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_read_i" "cmd_ctrlr_0:mem_read_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_test_i" "cmd_ctrlr_0:mem_test_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE_UART_0:OEN" "cmd_ctrlr_0:uart_oen_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"cmd_ctrlr_0:uart_wen_o" "CORE_UART_0:WEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"cmd_ctrlr_0:uart_rxrdy_i" "CORE_UART_0:RXRDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"cmd_ctrlr_0:uart_txrdy_i" "CORE_UART_0:TXRDY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_init_done_o" "cmd_ctrlr_0:mem_init_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_read_status_o" "cmd_ctrlr_0:mem_read_status_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_test_done_o" "cmd_ctrlr_0:mem_test_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_test_err_o" "cmd_ctrlr_0:mem_test_err_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:resetn_i" "RESET_N" "cmd_ctrlr_0:resetn_i" "CORE_UART_0:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "CORE_UART_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "CORE_UART_0:TX" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"clk_count_i" "cmd_ctrlr_0:clk_count_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_address_i" "cmd_ctrlr_0:mem_address_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:mem_size_i" "cmd_ctrlr_0:mem_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:offset_data_i" "cmd_ctrlr_0:offset_data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:pattern_i" "cmd_ctrlr_0:pattern_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:ram_addr_i" "cmd_ctrlr_0:ram_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE_UART_0:DATA_IN" "cmd_ctrlr_0:uart_data_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE_UART_0:DATA_OUT" "cmd_ctrlr_0:uart_data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"coredma_ch0_type_o" "cmd_ctrlr_0:coredma_ch0_type_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"coredma_ch1_type_o" "cmd_ctrlr_0:coredma_ch1_type_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"coredma_int_i" "cmd_ctrlr_0:coredma_int_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"coredma_size_o" "cmd_ctrlr_0:coredma_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"cmd_ctrlr_0:err_loc_i" "pattern_gen_checker_0:err_loc_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pattern_gen_checker_0:ram_data_o" "cmd_ctrlr_0:ram_data_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_M" "pattern_gen_checker_0:AXI4_M" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign UART_SD
generate_component -component_name ${sd_name}
