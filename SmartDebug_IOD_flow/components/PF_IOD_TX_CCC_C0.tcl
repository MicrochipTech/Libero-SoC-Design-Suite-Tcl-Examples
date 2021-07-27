# Exporting Component Description of PF_IOD_TX_CCC_C0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152I
# Create and Configure the core component PF_IOD_TX_CCC_C0
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_IOD_TX_CCC:1.0.121} -component_name {PF_IOD_TX_CCC_C0} -params {\
"BCLK_OFFSET:4" \
"CCC_PLL_MULTIPLIER:4" \
"CCC_PLL_REF_FREQ:125.000" \
"DATA_RATE:1000" \
"DATA_RATIO:8" \
"EXPOSE_BCLK_OFFSET:false" \
"EXPOSE_EXTRA_TRAINING_PORTS:false" \
"PLL_ENABLE_DRI_IF:false" \
"PLL_ENABLE_OUTPUT_2:false" \
"PLL_ENABLE_OUTPUT_3:true" \
"PLL_OUTPUT_DIVIDER_2:4" \
"PLL_OUTPUT_DIVIDER_3:4" \
"PLL_OUTPUT_FREQ_2:125.000 MHz" \
"PLL_OUTPUT_FREQ_3:125.000 MHz" \
"PLL_OUT_2_TO_CLKINT:true" \
"PLL_OUT_2_TO_DEDICATED:false" \
"PLL_OUT_2_TO_GCLKINT:false" \
"PLL_OUT_3_TO_CLKINT:true" \
"PLL_OUT_3_TO_DEDICATED:false" \
"PLL_OUT_3_TO_GCLKINT:false" \
"RATIO:4" \
"RX_FRAC_MODE:false" \
"TX_CLK_TO_DATA:CENTERED" }
# Exporting Component Description of PF_IOD_TX_CCC_C0 to TCL done
