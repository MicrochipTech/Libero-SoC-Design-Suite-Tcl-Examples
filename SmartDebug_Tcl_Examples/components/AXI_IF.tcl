# Exporting core AXI_IF to TCL
# Exporting Create HDL core command for module AXI_IF
create_hdl_core -file {hdl/AXI_IF.v} -module {AXI_IF} -library {work} -package {}
# Exporting BIF information of  HDL core command for module AXI_IF
hdl_core_add_bif -hdl_core_name {AXI_IF} -bif_definition {AXI:AMBA:AMBA3:mirroredSlave} -bif_name {BIF_1} -signal_map {\
"AWID:AWID" \
"AWADDR:AWADDR" \
"AWLEN:AWLEN" \
"AWSIZE:AWSIZE" \
"AWBURST:AWBURST" \
"AWLOCK:AWLOCK" \
"AWVALID:AWVALID" \
"AWREADY:AWREADY" \
"WID:WID" \
"WDATA:WDATA" \
"WSTRB:WSTRB" \
"WLAST:WLAST" \
"WVALID:WVALID" \
"WREADY:WREADY" \
"BVALID:BVALID" \
"BREADY:BREADY" \
"ARID:ARID" \
"ARADDR:ARADDR" \
"ARLEN:ARLEN" \
"ARSIZE:ARSIZE" \
"ARBURST:ARBURST" \
"ARLOCK:ARLOCK" \
"ARVALID:ARVALID" \
"ARREADY:ARREADY" \
"RDATA:RDATA" \
"RLAST:RLAST" \
"RVALID:RVALID" \
"RREADY:RREADY" }
