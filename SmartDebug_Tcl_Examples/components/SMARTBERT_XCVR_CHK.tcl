# Exporting Component Description of SMARTBERT_XCVR_CHK to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component SMARTBERT_XCVR_CHK
create_and_configure_core -core_vlnv Actel:SystemBuilder:CORESMARTBERT:$CORESMARTBERTver -component_name {SMARTBERT_XCVR_CHK} -params {\
"UI_CDR_REFERENCE_CLK_FREQ:156.25" \
"UI_CDR_REFERENCE_CLK_SOURCE:Dedicated" \
"UI_DATA_RATE:5000" \
"UI_NUMBER_OF_LANES:1" \
"UI_PATTERN_PRBS23:true" \
"UI_PATTERN_PRBS31:true" \
"UI_PATTERN_PRBS7:true" \
"UI_PATTERN_PRBS9:true" \
"UI_TX_CLK_DIV_FACTOR:1" }
# Exporting Component Description of SMARTBERT_XCVR_CHK to TCL done
