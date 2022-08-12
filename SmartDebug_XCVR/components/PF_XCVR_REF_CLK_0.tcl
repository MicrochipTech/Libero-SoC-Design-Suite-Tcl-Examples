# Exporting core PF_XCVR_REF_CLK_0 to TCL
# Exporting Create design command for core PF_XCVR_REF_CLK_0
create_and_configure_core -core_vlnv Actel:SgCore:PF_XCVR_REF_CLK:1.0.103 -component_name {PF_XCVR_REF_CLK_0} -params {\
"ENABLE_FAB_CLK_0:false"  \
"ENABLE_FAB_CLK_1:false"  \
"ENABLE_REF_CLK_0:true"  \
"ENABLE_REF_CLK_1:false"  \
"FAMILY:26"  \
"PARAM_IS_FALSE:false"  \
"REF_CLK_MODE_0:DIFFERENTIAL"  \
"REF_CLK_MODE_1:LVCMOS"  \
"SD_EXPORT_HIDDEN_PORTS:false"  \
"TGIGEN_DISPLAY_LOG_WINDOW:false"  \
"TGIGEN_DISPLAY_SYMBOL:true"   } -inhibit_configurator 1
# Exporting core PF_XCVR_REF_CLK_0 to TCL done
