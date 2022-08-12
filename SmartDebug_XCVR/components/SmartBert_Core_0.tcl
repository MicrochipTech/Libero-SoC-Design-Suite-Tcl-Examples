# Exporting core SmartBert_Core_0 to TCL
# Create design TCL command for core SmartBert_Core_0
create_and_configure_core -core_vlnv Actel:SystemBuilder:CORESMARTBERT:2.8.101 -component_name {SmartBert_Core_0} -params {\
"UI_CDR_REFERENCE_CLK_FREQ:156.25" \
"UI_CDR_REFERENCE_CLK_SOURCE:Dedicated" \
"UI_DATA_RATE:5000" \
"UI_NUMBER_OF_LANES:1" \
"UI_PATTERN_PRBS23:true" \
"UI_PATTERN_PRBS31:true" \
"UI_PATTERN_PRBS7:true" \
"UI_PATTERN_PRBS9:true" \
"UI_TX_CLK_DIV_FACTOR:1" }
# Exporting core SmartBert_Core_0 to TCL done
