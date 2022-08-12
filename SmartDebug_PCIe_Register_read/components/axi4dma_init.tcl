# Exporting core axi4dma_init to TCL
# Exporting Create HDL core command for module axi4dma_init
set working_dir [pwd]
create_hdl_core -file "${working_dir}/$Proj/hdl/AXI4DMA_INIT.v" -module {axi4dma_init} -library {work} -package {}
# Exporting BIF information of  HDL core command for module axi4dma_init
hdl_core_add_bif -hdl_core_name {axi4dma_init} -bif_definition {AXI4:AMBA:AMBA4:master} -bif_name {AXI4_M} -signal_map {\
"RREADY:rready_o" \
"RVALID:rvalid_i" \
"RDATA:rdata_i" \
"ARREADY:arready_i" \
"ARVALID:arvalid_o" \
"ARADDR:araddr_o" \
"BREADY:bready_o" \
"BVALID:bvalid_i" \
"WREADY:wready_i" \
"WVALID:wvalid_o" \
"WSTRB:wstrb_o" \
"WDATA:wdata_o" \
"AWREADY:awready_i" \
"AWVALID:awvalid_o" \
"AWADDR:awaddr_o" }
