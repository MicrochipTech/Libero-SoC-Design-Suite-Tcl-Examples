# Creating SmartDesign AXItoAPB
set sd_name {AXItoAPB}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSELS0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PREADYS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PSLVERRS0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RREADY} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PRDATAS0} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AWID} -port_direction {IN} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AWADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AWLEN} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {WID_BIF} -port_direction {IN} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BID} -port_direction {OUT} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ARID} -port_direction {IN} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ARADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ARLEN} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RID} -port_direction {OUT} -port_range {[5:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {RRESP} -port_direction {OUT} -port_range {[1:0]}

sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave0} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:PADDRS" \
"PSELx:PSELS0" \
"PENABLE:PENABLES" \
"PWRITE:PWRITES" \
"PRDATA:PRDATAS0" \
"PWDATA:PWDATAS" \
"PREADY:PREADYS0" \
"PSLVERR:PSLVERRS0" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXISlaveIF} -port_bif_vlnv {AMBA:AMBA3:AXI:r1p0_5} -port_bif_role {slave} -port_bif_mapping {\
"AWID:AWID" \
"AWADDR:AWADDR" \
"AWLEN:AWLEN" \
"AWSIZE:AWSIZE" \
"AWBURST:AWBURST" \
"AWVALID:AWVALID" \
"AWREADY:AWREADY" \
"WID:WID_BIF" \
"WDATA:WDATA" \
"WSTRB:WSTRB" \
"WLAST:WLAST" \
"WVALID:WVALID" \
"WREADY:WREADY" \
"BID:BID" \
"BRESP:BRESP" \
"BVALID:BVALID" \
"BREADY:BREADY" \
"ARID:ARID" \
"ARADDR:ARADDR" \
"ARLEN:ARLEN" \
"ARSIZE:ARSIZE" \
"ARBURST:ARBURST" \
"ARVALID:ARVALID" \
"ARREADY:ARREADY" \
"RID:RID" \
"RDATA:RDATA" \
"RRESP:RRESP" \
"RLAST:RLAST" \
"RVALID:RVALID" \
"RREADY:RREADY" } 

# Add AHBtoAPB_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AHBtoAPB} -instance_name {AHBtoAPB_0}



# Add AXItoAHBL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {AXItoAHBL} -instance_name {AXItoAHBL_0}



# Add Core_AHBL_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Core_AHBL} -instance_name {Core_AHBL_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Core_AHBL_0:REMAP_M0} -value {GND}



# Add Core_APB_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Core_APB} -instance_name {Core_APB_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Core_AHBL_0:HCLK" "ACLK" "AHBtoAPB_0:HCLK" "AXItoAHBL_0:ACLK" "AXItoAHBL_0:HCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Core_AHBL_0:HRESETN" "ARESETN" "AHBtoAPB_0:HRESETN" "AXItoAHBL_0:HRESETN" "AXItoAHBL_0:ARESETN" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Core_APB_0:APB3mmaster" "AHBtoAPB_0:APBmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave0" "Core_APB_0:APBmslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXISlaveIF" "AXItoAHBL_0:AXISlaveIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Core_AHBL_0:AHBmmaster0" "AXItoAHBL_0:AHBMasterIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Core_AHBL_0:AHBmslave0" "AHBtoAPB_0:AHBslave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign AXItoAPB
generate_component -component_name ${sd_name}
