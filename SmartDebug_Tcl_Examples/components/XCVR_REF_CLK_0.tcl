# Exporting Component Description of XCVR_REF_CLK_0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component XCVR_REF_CLK_0
create_and_configure_core -core_vlnv Actel:SgCore:PF_XCVR_REF_CLK:$PF_XCVR_REF_CLKver -component_name {XCVR_REF_CLK_0} -params {\
"ENABLE_FAB_CLK_0:false"  \
"ENABLE_FAB_CLK_1:false"  \
"ENABLE_REF_CLK_0:true"  \
"ENABLE_REF_CLK_1:false"  \
"REF_CLK_MODE_0:DIFFERENTIAL"  \
"REF_CLK_MODE_1:LVCMOS"   }
# Exporting Component Description of XCVR_REF_CLK_0 to TCL done
