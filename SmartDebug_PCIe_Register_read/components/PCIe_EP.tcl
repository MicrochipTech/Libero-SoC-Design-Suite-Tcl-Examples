# Creating SmartDesign PCIe_EP
set sd_name {PCIe_EP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DEVICE_INIT_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_CLK_STABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_INTERRUPT_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK0_1_7_CALIB_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_S_PSLVERR} -port_direction {OUT}

sd_create_bus_port -sd_name ${sd_name} -port_name {switch_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARSIZE} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWSIZE} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_BID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_AWID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCIESS_AXI_1_M_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_S_PADDR} -port_direction {IN} -port_range {[25:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_S_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_S_PRDATA} -port_direction {OUT} -port_range {[31:0]}

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI_1_MASTER} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:PCIESS_AXI_1_M_AWID" \
"AWADDR:PCIESS_AXI_1_M_AWADDR" \
"AWLEN:PCIESS_AXI_1_M_AWLEN" \
"AWSIZE:PCIESS_AXI_1_M_AWSIZE" \
"AWBURST:PCIESS_AXI_1_M_AWBURST" \
"AWVALID:PCIESS_AXI_1_M_AWVALID" \
"AWREADY:PCIESS_AXI_1_M_AWREADY" \
"WDATA:PCIESS_AXI_1_M_WDATA" \
"WSTRB:PCIESS_AXI_1_M_WSTRB" \
"WLAST:PCIESS_AXI_1_M_WLAST" \
"WVALID:PCIESS_AXI_1_M_WVALID" \
"WREADY:PCIESS_AXI_1_M_WREADY" \
"BID:PCIESS_AXI_1_M_BID" \
"BRESP:PCIESS_AXI_1_M_BRESP" \
"BVALID:PCIESS_AXI_1_M_BVALID" \
"BREADY:PCIESS_AXI_1_M_BREADY" \
"ARID:PCIESS_AXI_1_M_ARID" \
"ARADDR:PCIESS_AXI_1_M_ARADDR" \
"ARLEN:PCIESS_AXI_1_M_ARLEN" \
"ARSIZE:PCIESS_AXI_1_M_ARSIZE" \
"ARBURST:PCIESS_AXI_1_M_ARBURST" \
"ARVALID:PCIESS_AXI_1_M_ARVALID" \
"ARREADY:PCIESS_AXI_1_M_ARREADY" \
"RID:PCIESS_AXI_1_M_RID" \
"RDATA:PCIESS_AXI_1_M_RDATA" \
"RRESP:PCIESS_AXI_1_M_RRESP" \
"RLAST:PCIESS_AXI_1_M_RLAST" \
"RVALID:PCIESS_AXI_1_M_RVALID" \
"RREADY:PCIESS_AXI_1_M_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PCIE_APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_S_PADDR" \
"PSELx:APB_S_PSEL" \
"PENABLE:APB_S_PENABLE" \
"PWRITE:APB_S_PWRITE" \
"PRDATA:APB_S_PRDATA" \
"PWDATA:APB_S_PWDATA" \
"PREADY:APB_S_PREADY" \
"PSLVERR:APB_S_PSLVERR" } 

# Add PCIe_REF_CLK_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv "Actel:SgCore:PF_XCVR_REF_CLK:$PF_XCVR_REF_CLKver" -instance_name {PCIe_REF_CLK_0}
# Exporting Parameters of instance PCIe_REF_CLK_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PCIe_REF_CLK_0} -params {\
"ENABLE_FAB_CLK_0:false" \
"ENABLE_FAB_CLK_1:false" \
"ENABLE_REF_CLK_0:true" \
"ENABLE_REF_CLK_1:false" \
"FAMILY:26" \
"PARAM_IS_FALSE:false" \
"REF_CLK_MODE_0:DIFFERENTIAL" \
"REF_CLK_MODE_1:LVCMOS" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"TGIGEN_DISPLAY_LOG_WINDOW:false" \
"TGIGEN_DISPLAY_SYMBOL:true" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PCIe_REF_CLK_0}



# Add PCIe_TL_CLK_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIe_TL_CLK} -instance_name {PCIe_TL_CLK_0}



# Add PCIe_TX_PLL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIe_TX_PLL} -instance_name {PCIe_TX_PLL_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIe_TX_PLL_0:PLL_LOCK}



# Add PCIex4_0 instance
sd_instantiate_core -sd_name ${sd_name} -core_vlnv "Actel:SgCore:PF_PCIE:$PF_PCIEver" -instance_name {PCIex4_0}
# Exporting Parameters of instance PCIex4_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {PCIex4_0} -params {\
"EXPOSE_ALL_DEBUG_PORTS:false" \
"FAMILY:26" \
"Platform:Win32" \
"SD_EXPORT_HIDDEN_PORTS:false" \
"UI_DLL_JITTER_TOLERANCE:Low" \
"UI_EXPOSE_LANE_DRI_PORTS:false" \
"UI_EXPOSE_PCIE_APBLINK_PORTS:true" \
"UI_GPSS1_LANE0_IS_USED:false" \
"UI_GPSS1_LANE1_IS_USED:false" \
"UI_GPSS1_LANE2_IS_USED:false" \
"UI_GPSS1_LANE3_IS_USED:false" \
"UI_IS_CONFIGURED:true" \
"UI_PCIE_0_BAR_MODE:Custom" \
"UI_PCIE_0_CDR_REF_CLK_NUMBER:1" \
"UI_PCIE_0_CDR_REF_CLK_SOURCE:Dedicated" \
"UI_PCIE_0_CLASS_CODE:0x0000" \
"UI_PCIE_0_CONTROLLER_ENABLED:Disabled" \
"UI_PCIE_0_DE_EMPHASIS:-3.5 dB" \
"UI_PCIE_0_DEVICE_ID:0x1556" \
"UI_PCIE_0_EXPOSE_WAKE_SIG:Disabled" \
"UI_PCIE_0_INTERRUPTS:MSI4" \
"UI_PCIE_0_L0_ACC_LATENCY:No limit" \
"UI_PCIE_0_L0_EXIT_LATENCY:64 ns to less than 128 ns" \
"UI_PCIE_0_L1_ACC_LATENCY:No limit" \
"UI_PCIE_0_L1_ENABLE:Disabled" \
"UI_PCIE_0_L1_EXIT_LATENCY:16 us to less than 32 us" \
"UI_PCIE_0_LANE_RATE:Gen1 (2.5 Gbps)" \
"UI_PCIE_0_MASTER_SIZE_BAR_0_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SIZE_BAR_1_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SIZE_BAR_2_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SIZE_BAR_3_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SIZE_BAR_4_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SIZE_BAR_5_TABLE:4 KB" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_0_TABLE:0x0000" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_1_TABLE:0x0000" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_2_TABLE:0x0000" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_3_TABLE:0x0000" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_4_TABLE:0x0000" \
"UI_PCIE_0_MASTER_SOURCE_ADDRESS_BAR_5_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_0_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_1_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_2_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_3_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_4_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TABLE_SIZE_BAR_5_TABLE:4 KB" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_0_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_1_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_2_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_3_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_4_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TRANS_ADDRESS_BAR_5_TABLE:0x0000" \
"UI_PCIE_0_MASTER_TYPE_BAR_0_TABLE:64-bit prefetchable memory" \
"UI_PCIE_0_MASTER_TYPE_BAR_1_TABLE:Disabled" \
"UI_PCIE_0_MASTER_TYPE_BAR_2_TABLE:Disabled" \
"UI_PCIE_0_MASTER_TYPE_BAR_3_TABLE:Disabled" \
"UI_PCIE_0_MASTER_TYPE_BAR_4_TABLE:Disabled" \
"UI_PCIE_0_MASTER_TYPE_BAR_5_TABLE:Disabled" \
"UI_PCIE_0_NUM_FTS:63" \
"UI_PCIE_0_NUMBER_OF_LANES:x1" \
"UI_PCIE_0_PHY_REF_CLK_SLOT:Slot" \
"UI_PCIE_0_PORT_TYPE:End Point" \
"UI_PCIE_0_REF_CLK_FREQ:100" \
"UI_PCIE_0_REVISION_ID:0x0000" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_0:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_1:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_2:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_3:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_4:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_5:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_6:4 KB" \
"UI_PCIE_0_SLAVE_SIZE_TABLE_7:4 KB" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_0:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_1:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_2:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_3:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_4:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_5:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_6:0x0000" \
"UI_PCIE_0_SLAVE_SOURCE_ADDRESS_TABLE_7:0x0000" \
"UI_PCIE_0_SLAVE_STATE_TABLE_0:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_1:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_2:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_3:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_4:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_5:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_6:Disabled" \
"UI_PCIE_0_SLAVE_STATE_TABLE_7:Disabled" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_0:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_1:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_2:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_3:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_4:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_5:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_6:0x0000" \
"UI_PCIE_0_SLAVE_TRANS_ADDRESS_TABLE_7:0x0000" \
"UI_PCIE_0_SUB_SYSTEM_ID:0x0000" \
"UI_PCIE_0_SUB_VENDOR_ID:0x0000" \
"UI_PCIE_0_TRANSMIT_SWING:Full Swing" \
"UI_PCIE_0_VENDOR_ID:0x11AA" \
"UI_PCIE_1_BAR_MODE:Custom" \
"UI_PCIE_1_CDR_REF_CLK_NUMBER:1" \
"UI_PCIE_1_CDR_REF_CLK_SOURCE:Dedicated" \
"UI_PCIE_1_CLASS_CODE:0x0000" \
"UI_PCIE_1_CONTROLLER_ENABLED:Enabled" \
"UI_PCIE_1_DE_EMPHASIS:-3.5 dB" \
"UI_PCIE_1_DEVICE_ID:0x1556" \
"UI_PCIE_1_EXPOSE_WAKE_SIG:Disabled" \
"UI_PCIE_1_INTERRUPTS:MSI4" \
"UI_PCIE_1_L0_ACC_LATENCY:No limit" \
"UI_PCIE_1_L0_EXIT_LATENCY:64 ns to less than 128 ns" \
"UI_PCIE_1_L1_ACC_LATENCY:No limit" \
"UI_PCIE_1_L1_ENABLE:Disabled" \
"UI_PCIE_1_L1_EXIT_LATENCY:16 us to less than 32 us" \
"UI_PCIE_1_LANE_RATE:Gen2 (5.0 Gbps)" \
"UI_PCIE_1_MASTER_SIZE_BAR_0_TABLE:64 KB" \
"UI_PCIE_1_MASTER_SIZE_BAR_1_TABLE:4 KB" \
"UI_PCIE_1_MASTER_SIZE_BAR_2_TABLE:1 MB" \
"UI_PCIE_1_MASTER_SIZE_BAR_3_TABLE:4 KB" \
"UI_PCIE_1_MASTER_SIZE_BAR_4_TABLE:4 KB" \
"UI_PCIE_1_MASTER_SIZE_BAR_5_TABLE:4 KB" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_0_TABLE:0x0000" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_1_TABLE:0x0000" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_2_TABLE:0x0000" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_3_TABLE:0x0000" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_4_TABLE:0x0000" \
"UI_PCIE_1_MASTER_SOURCE_ADDRESS_BAR_5_TABLE:0x0000" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_0_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_1_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_2_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_3_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_4_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TABLE_SIZE_BAR_5_TABLE:4 KB" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_0_TABLE:0x03000000" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_1_TABLE:0x0000" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_2_TABLE:0x10000000" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_3_TABLE:0x0000" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_4_TABLE:0x0000" \
"UI_PCIE_1_MASTER_TRANS_ADDRESS_BAR_5_TABLE:0x0000" \
"UI_PCIE_1_MASTER_TYPE_BAR_0_TABLE:64-bit prefetchable memory" \
"UI_PCIE_1_MASTER_TYPE_BAR_1_TABLE:Disabled" \
"UI_PCIE_1_MASTER_TYPE_BAR_2_TABLE:64-bit prefetchable memory" \
"UI_PCIE_1_MASTER_TYPE_BAR_3_TABLE:Disabled" \
"UI_PCIE_1_MASTER_TYPE_BAR_4_TABLE:Disabled" \
"UI_PCIE_1_MASTER_TYPE_BAR_5_TABLE:Disabled" \
"UI_PCIE_1_NUM_FTS:63" \
"UI_PCIE_1_NUMBER_OF_LANES:x4" \
"UI_PCIE_1_PHY_REF_CLK_SLOT:Slot" \
"UI_PCIE_1_PORT_TYPE:End Point" \
"UI_PCIE_1_REF_CLK_FREQ:100" \
"UI_PCIE_1_REVISION_ID:0x0000" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_0:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_1:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_2:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_3:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_4:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_5:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_6:4 KB" \
"UI_PCIE_1_SLAVE_SIZE_TABLE_7:4 KB" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_0:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_1:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_2:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_3:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_4:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_5:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_6:0x0000" \
"UI_PCIE_1_SLAVE_SOURCE_ADDRESS_TABLE_7:0x0000" \
"UI_PCIE_1_SLAVE_STATE_TABLE_0:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_1:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_2:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_3:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_4:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_5:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_6:Disabled" \
"UI_PCIE_1_SLAVE_STATE_TABLE_7:Disabled" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_0:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_1:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_2:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_3:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_4:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_5:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_6:0x0000" \
"UI_PCIE_1_SLAVE_TRANS_ADDRESS_TABLE_7:0x0000" \
"UI_PCIE_1_SUB_SYSTEM_ID:0x0000" \
"UI_PCIE_1_SUB_VENDOR_ID:0x0000" \
"UI_PCIE_1_TRANSMIT_SWING:Full Swing" \
"UI_PCIE_1_VENDOR_ID:0x11AA" \
"UI_PCIESS_LANE0_IS_USED:true" \
"UI_PCIESS_LANE1_IS_USED:false" \
"UI_PCIESS_LANE2_IS_USED:false" \
"UI_PCIESS_LANE3_IS_USED:false" \
"UI_PROTOCOL_PRESET_USED:PCIe" \
"UI_SIMULATION_LEVEL:BFM" \
"UI_TX_CLK_DIV_FACTOR:1" \
"UI_USE_EMBEDDED_DLL:true" \
"XT_ES_DEVICE:false" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {PCIex4_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PCIex4_0:PCIE_1_INTERRUPT} -pin_slices {[3:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PCIex4_0:PCIE_1_INTERRUPT} -pin_slices {[7:4]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_INTERRUPT[7:4]} -value {GND}
# sd_create_pin_group -sd_name ${sd_name} -group_name {PCIE_IN} -instance_name {PCIex4_0} -pin_names {"PCIE_1_PERST_N" "PCIE_1_INTERRUPT" "PCIE_1_M_RDERR" "PCIE_1_S_WDERR" }
# sd_create_pin_group -sd_name ${sd_name} -group_name {PCIE_OUT} -instance_name {PCIex4_0} -pin_names {"PCIE_1_LTSSM" "PCIE_1_INTERRUPT_OUT" "PCIE_1_M_WDERR" "PCIE_1_S_RDERR" "PCIE_1_L2_EXIT" "PCIE_1_HOT_RST_EXIT" "PCIE_1_DLUP_EXIT" }
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_M_RDERR} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_S_WDERR} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_M_WDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_S_RDERR}
#sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_L2_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_HOT_RST_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_DLUP_EXIT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PCIex4_0:PCIE_1_LTSSM}



# Add sw_debounce_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {sw_debounce} -hdl_file {hdl\SW_Debounce.v} -instance_name {sw_debounce_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:APB_S_PCLK" "APB_S_PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"sw_debounce_0:clk_i" "PCIex4_0:AXI_CLK" "AXI_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:AXI_CLK_STABLE" "AXI_CLK_STABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_TL_CLK_0:BANK0_1_7_CALIB_DONE" "BANK0_1_7_CALIB_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_TL_CLK_0:DEVICE_INIT_DONE" "DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIE_1_INTERRUPT_OUT" "PCIE_1_INTERRUPT_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIE_1_PERST_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_REF_CLK_0:REF_CLK" "PCIe_TX_PLL_0:REF_CLK" "PCIex4_0:PCIESS_LANE0_CDR_REF_CLK_0" "PCIex4_0:PCIESS_LANE2_CDR_REF_CLK_0" "PCIex4_0:PCIESS_LANE3_CDR_REF_CLK_0" "PCIex4_0:PCIESS_LANE1_CDR_REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_TL_CLK_0:TL_CLK" "PCIex4_0:PCIE_1_TL_CLK_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_TL_CLK_0:CLK_125MHz" "PCIe_TX_PLL_0:CLK_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_REF_CLK_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_REF_CLK_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"sw_debounce_0:resetn_i" "PCIex4_0:APB_S_PRESET_N" "RESET_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIE_1_INTERRUPT[3:0]" "sw_debounce_0:interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"sw_debounce_0:switch_i" "switch_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:AXI_1_MASTER" "AXI_1_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:PCIE_APB_SLAVE" "PCIE_APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIex4_0:CLKS_FROM_TXPLL_TO_PCIE_1" "PCIe_TX_PLL_0:CLKS_TO_XCVR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PCIe_EP
generate_component -component_name ${sd_name}
