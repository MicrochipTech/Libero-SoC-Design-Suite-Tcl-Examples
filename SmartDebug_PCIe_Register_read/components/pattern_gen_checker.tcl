# Exporting core pattern_gen_checker to TCL
# Exporting Create HDL core command for module pattern_gen_checker
create_hdl_core -file "${working_dir}/$Proj/hdl/PATTERN_GEN_CHECKER.v" -module {pattern_gen_checker} -library {work} -package {}
# Exporting BIF information of  HDL core command for module pattern_gen_checker
hdl_core_add_bif -hdl_core_name {pattern_gen_checker} -bif_definition {AXI4:AMBA:AMBA4:master} -bif_name {AXI4_M} -signal_map {\
"RREADY:rready_o" \
"RVALID:rvalid_i" \
"RLAST:rlast_i" \
"RRESP:rresp_i" \
"RDATA:rdata_i" \
"RID:rid_i" \
"ARREADY:arready_i" \
"ARVALID:arvalid_o" \
"ARBURST:arburst_o" \
"ARSIZE:arsize_o" \
"ARLEN:arlen_o" \
"ARADDR:araddr_o" \
"ARID:arid_o" \
"BREADY:bready_o" \
"BVALID:bvalid_i" \
"BRESP:bresp_i" \
"BID:bid_i" \
"WREADY:wready_i" \
"WVALID:wvalid_o" \
"WLAST:wlast_o" \
"WSTRB:wstrb_o" \
"WDATA:wdata_o" \
"AWREADY:awready_i" \
"AWVALID:awvalid_o" \
"AWBURST:awburst_o" \
"AWSIZE:awsize_o" \
"AWLEN:awlen_o" \
"AWADDR:awaddr_o" \
"AWID:awid_o" }
