# Exporting core AXItoAHBL to TCL
# Exporting Create design command for core AXItoAHBL
create_and_configure_core -core_vlnv "Actel:DirectCore:COREAXITOAHBL:$PF_CoreAXITOAHBLver" -component_name {AXItoAHBL} -params {\
"ASYNC_CLOCKS:false"  \
"AXI_SEL_MM_S:0"  \
"EXPOSE_WID:false"  \
"ID_WIDTH:6"  \
"NO_BURST_TRANS:false"  \
"WRAP_SUPPORT:false"   }
# Exporting core AXItoAHBL to TCL done
