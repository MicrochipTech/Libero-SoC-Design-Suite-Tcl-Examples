# Exporting core axi_io_ctrl to TCL
# Exporting Create HDL core command for module axi_io_ctrl
create_hdl_core -file "${working_dir}/$Proj/hdl/AXI_IO_CTRL.v" -module {axi_io_ctrl} -library {work} -package {}
# Exporting BIF information of  HDL core command for module axi_io_ctrl
hdl_core_add_bif -hdl_core_name {axi_io_ctrl} -bif_definition {AXI4:AMBA:AMBA4:slave} -bif_name {AXI4_S} -signal_map {\
"RREADY:rready_i" \
"RVALID:rvalid_o" \
"RLAST:rlast_o" \
"RRESP:rresp_o" \
"RDATA:rdata_o" \
"RID:rid_o" \
"ARREADY:arready_o" \
"ARVALID:arvalid_i" \
"ARADDR:araddr_i" \
"ARID:arid_i" \
"BREADY:bready_i" \
"BVALID:bvalid_o" \
"BRESP:bresp_o" \
"BID:bid_o" \
"WREADY:wready_o" \
"WVALID:wvalid_i" \
"WLAST:wlast_i" \
"WDATA:wdata_i" \
"AWREADY:awready_o" \
"AWVALID:awvalid_i" \
"AWADDR:awaddr_i" \
"AWID:awid_i" }
