# Creating SmartDesign CoreDMA_IO_CTRL
set sd_name {CoreDMA_IO_CTRL}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLOCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DMA_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {dma_wready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pcie_int_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {dma_wvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rlast_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {arvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bready_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {bvalid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wvalid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {wlast_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {awvalid_i} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {awid_o} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awlen_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awsize_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awburst_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_o} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wstrb_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bid_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp_i} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid_o} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {araddr_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arlen_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arsize_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arburst_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid_i} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_i} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp_i} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_AWID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_BID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_ARID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_RID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DMA_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {led_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {dip_switch_o} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rresp_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rdata_o} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rid_o} -port_direction {OUT} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {araddr_i} -port_direction {IN} -port_range {[10:3]}
sd_create_bus_port -sd_name ${sd_name} -port_name {arid_i} -port_direction {IN} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bresp_o} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {bid_o} -port_direction {OUT} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awaddr_i} -port_direction {IN} -port_range {[10:3]}
sd_create_bus_port -sd_name ${sd_name} -port_name {awid_i} -port_direction {IN} -port_range {[5:0]}

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

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4MasterDMA_IF} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:DMA_AWID" \
"AWADDR:DMA_AWADDR" \
"AWLEN:DMA_AWLEN" \
"AWSIZE:DMA_AWSIZE" \
"AWBURST:DMA_AWBURST" \
"AWVALID:DMA_AWVALID" \
"AWREADY:DMA_AWREADY" \
"WDATA:DMA_WDATA" \
"WSTRB:DMA_WSTRB" \
"WLAST:DMA_WLAST" \
"WVALID:DMA_WVALID" \
"WREADY:DMA_WREADY" \
"BID:DMA_BID" \
"BRESP:DMA_BRESP" \
"BVALID:DMA_BVALID" \
"BREADY:DMA_BREADY" \
"ARID:DMA_ARID" \
"ARADDR:DMA_ARADDR" \
"ARLEN:DMA_ARLEN" \
"ARSIZE:DMA_ARSIZE" \
"ARBURST:DMA_ARBURST" \
"ARVALID:DMA_ARVALID" \
"ARREADY:DMA_ARREADY" \
"RID:DMA_RID" \
"RDATA:DMA_RDATA" \
"RRESP:DMA_RRESP" \
"RLAST:DMA_RLAST" \
"RVALID:DMA_RVALID" \
"RREADY:DMA_RREADY" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4_S} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:awid_i" \
"AWADDR:awaddr_i" \
"AWVALID:awvalid_i" \
"AWREADY:awready_o" \
"WDATA:wdata_i" \
"WLAST:wlast_i" \
"WVALID:wvalid_i" \
"WREADY:wready_o" \
"BID:bid_o" \
"BRESP:bresp_o" \
"BVALID:bvalid_o" \
"BREADY:bready_i" \
"ARID:arid_i" \
"ARADDR:araddr_i" \
"ARVALID:arvalid_i" \
"ARREADY:arready_o" \
"RID:rid_o" \
"RDATA:rdata_o" \
"RRESP:rresp_o" \
"RLAST:rlast_o" \
"RVALID:rvalid_o" \
"RREADY:rready_i" } 

# Add axi4dma_init_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {axi4dma_init} -instance_name {axi4dma_init_0}



# Add axi_io_ctrl_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {axi_io_ctrl} -instance_name {axi_io_ctrl_0}



# Add CoreAXI4_Lite_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAXI4_Lite} -instance_name {CoreAXI4_Lite_0}



# Add CoreDMA_Controller_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreDMA_Controller} -instance_name {CoreDMA_Controller_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreDMA_Controller_0:STRTDMAOP} -value {GND}



# Add UART_SD_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_SD} -instance_name {UART_SD_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma_ch0_start_i" "axi4dma_init_0:coredma_ch0_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma_ch1_start_i" "axi4dma_init_0:coredma_ch1_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:clk_i" "CLOCK" "UART_SD_0:CLK" "axi4dma_init_0:clk_i" "CoreDMA_Controller_0:CLOCK" "CoreAXI4_Lite_0:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_wready_i" "axi_io_ctrl_0:dma_wready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_wvalid_i" "axi_io_ctrl_0:dma_wvalid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pcie_int_i" "axi_io_ctrl_0:pcie_int_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:resetn_i" "RESETN" "UART_SD_0:RESET_N" "axi4dma_init_0:resetn_i" "CoreDMA_Controller_0:RESETN" "CoreAXI4_Lite_0:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_SD_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_SD_0:TX" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma_status_i" "axi4dma_init_0:coredma_status_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:clk_count_o" "UART_SD_0:clk_count_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma0_start_o" "axi4dma_init_0:coredma0_start_pcie_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma1_start_o" "axi4dma_init_0:coredma1_start_pcie_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma_size_o" "axi4dma_init_0:dma_size_pcie_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:coredma_int_i" "CoreDMA_Controller_0:INTERRUPT" "UART_SD_0:coredma_int_i" "axi4dma_init_0:coredma_int_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:dip_switch_o" "dip_switch_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:led_o" "led_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_SD_0:coredma_ch0_type_o" "axi4dma_init_0:coredma0_start_uart_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_SD_0:coredma_ch1_type_o" "axi4dma_init_0:coredma1_start_uart_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_SD_0:coredma_size_o" "axi4dma_init_0:dma_size_uart_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_SD_0:AXI4_M" "AXI4_M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_io_ctrl_0:AXI4_S" "AXI4_S" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4dma_init_0:AXI4_M" "CoreAXI4_Lite_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreDMA_Controller_0:AXI4MasterDMA_IF" "AXI4MasterDMA_IF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreDMA_Controller_0:AXI4SlaveCtrl_IF" "CoreAXI4_Lite_0:AXI4mslave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign CoreDMA_IO_CTRL
generate_component -component_name ${sd_name}
