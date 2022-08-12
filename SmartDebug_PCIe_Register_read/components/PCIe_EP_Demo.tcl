# Creating SmartDesign PCIe_EP_Demo
set sd_name {PCIe_EP_Demo}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD0_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD1_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD2_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_RXD3_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD0_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD1_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD2_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_P} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIESS_LANE_TXD3_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_RESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK0_1_7_CALIB_DONE} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_DDR4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CTRLR_READY_DDR3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_LOCK_DDR3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CTRLR_READY_DDR4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_1_PERST_N} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ_0} -port_direction {INOUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_0} -port_direction {INOUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N_0} -port_direction {INOUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA_0} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {A_0} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {led_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {dip_switch_o} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {switch_i} -port_direction {IN} -port_range {[3:0]}

# Add AND3_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND3} -instance_name {AND3_0}



# Add AXI4_Interconnect_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AXI4_Interconnect} -instance_name {AXI4_Interconnect_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {AXI4_Interconnect_0:AXI4mmaster0} -pin_names {AXI4_Interconnect_0:MASTER0_WREADY}



# Add AXItoAPB_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AXItoAPB} -instance_name {AXItoAPB_0}



# Add CCC_111MHz_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CCC_111MHz} -instance_name {CCC_111MHz_0}



# Add CLKINT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_0}



# Add CoreDMA_IO_CTRL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreDMA_IO_CTRL} -instance_name {CoreDMA_IO_CTRL_0}



# Add PCIe_EP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PCIe_EP} -instance_name {PCIe_EP_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PCIe_EP_0:AXI_1_MASTER} -pin_names {PCIe_EP_0:PCIESS_AXI_1_M_WVALID}



# Add PF_DDR3_SS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR3_SS} -instance_name {PF_DDR3_SS_0}



# Add PF_DDR4_SS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_SS} -instance_name {PF_DDR4_SS_0}



# Add PF_RESET_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_RESET} -instance_name {PF_RESET_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_RESET_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_RESET_0:FF_US_RESTORE} -value {GND}



# Add SRAM_AXI_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {SRAM_AXI} -instance_name {SRAM_AXI_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:ACT_N" "ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND3_0:Y" "PF_DDR4_SS_0:SYS_RESET_N" "PF_DDR3_SS_0:SYS_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:MASTER0_WREADY" "CoreDMA_IO_CTRL_0:dma_wready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND3_0:B" "PCIe_EP_0:BANK0_1_7_CALIB_DONE" "BANK0_1_7_CALIB_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CAS_N" "CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CAS_N" "CAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:PLL_REF_CLK" "CCC_111MHz_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND3_0:A" "CCC_111MHz_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CK0" "CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CK0" "CK0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CK0_N" "CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CK0_N" "CK0_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CKE" "CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CKE" "CKE_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:S_CLK0" "AXItoAPB_0:ACLK" "PCIe_EP_0:APB_S_PCLK" "PF_DDR4_SS_0:PLL_REF_CLK" "CLKINT_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CS_N" "CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CS_N" "CS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:CTRLR_READY" "CTRLR_READY_DDR3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:CTRLR_READY" "CTRLR_READY_DDR4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:ODT" "ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:ODT" "ODT_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIE_1_PERST_N" "PCIE_1_PERST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:DEVICE_INIT_DONE" "PF_RESET_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIE_1_INTERRUPT_OUT" "CoreDMA_IO_CTRL_0:pcie_int_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_AXI_1_M_WVALID" "CoreDMA_IO_CTRL_0:dma_wvalid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD0_N" "PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD0_P" "PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD1_N" "PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD1_P" "PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD2_N" "PCIESS_LANE_RXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD2_P" "PCIESS_LANE_RXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD3_N" "PCIESS_LANE_RXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_RXD3_P" "PCIESS_LANE_RXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD0_N" "PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD0_P" "PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD1_N" "PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD1_P" "PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD2_N" "PCIESS_LANE_TXD2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD2_P" "PCIESS_LANE_TXD2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD3_N" "PCIESS_LANE_TXD3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIESS_LANE_TXD3_P" "PCIESS_LANE_TXD3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:S_CLK2" "PF_DDR3_SS_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:ACLK" "PCIe_EP_0:AXI_CLK" "PF_RESET_0:CLK" "SRAM_AXI_0:ACLK" "PF_DDR4_SS_0:SYS_CLK" "CoreDMA_IO_CTRL_0:CLOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:ARESETN" "AXItoAPB_0:ARESETN" "PCIe_EP_0:RESET_N" "PF_RESET_0:FABRIC_RESET_N" "SRAM_AXI_0:ARESETN" "CoreDMA_IO_CTRL_0:RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:PLL_LOCK" "PLL_LOCK_DDR3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:AXI_CLK_STABLE" "PF_RESET_0:PLL_LOCK" "PF_DDR4_SS_0:PLL_LOCK" "PLL_LOCK_DDR4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:RAS_N" "RAS_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:A" "CCC_111MHz_0:REF_CLK_0" "REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:RESET_N" "RESET_N_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreDMA_IO_CTRL_0:RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:SHIELD0" "SHIELD0_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:SHIELD1" "SHIELD1_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreDMA_IO_CTRL_0:TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND3_0:C" "PF_RESET_0:EXT_RST_N" "USER_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR3_SS_0:WE_N" "WE_N_0" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "PF_DDR4_SS_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"A_0" "PF_DDR3_SS_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:BA" "BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA_0" "PF_DDR3_SS_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:BG" "BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dip_switch_o" "CoreDMA_IO_CTRL_0:dip_switch_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "PF_DDR3_SS_0:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:DM_N" "DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:DQ" "DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ_0" "PF_DDR3_SS_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:DQS" "DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_0" "PF_DDR3_SS_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_SS_0:DQS_N" "DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N_0" "PF_DDR3_SS_0:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"led_o" "CoreDMA_IO_CTRL_0:led_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"switch_i" "PCIe_EP_0:switch_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI3mslave0" "AXItoAPB_0:AXISlaveIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mslave1" "CoreDMA_IO_CTRL_0:AXI4_S" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mslave2" "PF_DDR3_SS_0:AXI4slave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mslave3" "SRAM_AXI_0:AXI4_Slave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mslave4" "PF_DDR4_SS_0:AXI4slave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIe_EP_0:PCIE_APB_SLAVE" "AXItoAPB_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mmaster2" "CoreDMA_IO_CTRL_0:AXI4_M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mmaster1" "CoreDMA_IO_CTRL_0:AXI4MasterDMA_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Interconnect_0:AXI4mmaster0" "PCIe_EP_0:AXI_1_MASTER" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign PCIe_EP_Demo
generate_component -component_name ${sd_name}
