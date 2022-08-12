# Exporting core SRAM_AXI to TCL
# Create design TCL command for core SRAM_AXI
create_and_configure_core -core_vlnv "Actel:SystemBuilder:PF_SRAM_AHBL_AXI:$PF_SRAM_AHBL_AXIver" -component_name {SRAM_AXI} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:64" \
"AXI4_IDWIDTH:6" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"RDEPTH:512" \
"RWIDTH:80" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:512" \
"WWIDTH:80" }
# Exporting core SRAM_AXI to TCL done
