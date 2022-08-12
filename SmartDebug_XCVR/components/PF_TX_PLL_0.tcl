# Exporting core PF_TX_PLL_0 to TCL
# Exporting Create design command for core PF_TX_PLL_0
create_and_configure_core -core_vlnv Actel:SgCore:PF_TX_PLL:2.0.300 -component_name {PF_TX_PLL_0} -params {\
"CORE:PF_TX_PLL"  \
"FAMILY:26"  \
"INIT:0x0"  \
"PARAM_IS_FALSE:false"  \
"SD_EXPORT_HIDDEN_PORTS:false"  \
"TxPLL_AUX_LOW_SEL:true"  \
"TxPLL_AUX_OUT:125"  \
"TxPLL_BANDWIDTH:Low"  \
"TxPLL_CLK_125_EN:true"  \
"TxPLL_DYNAMIC_RECONFIG_INTERFACE_EN:false"  \
"TxPLL_EXT_WAVE_SEL:0"  \
"TxPLL_FAB_LOCK_EN:false"  \
"TxPLL_FAB_REF:200"  \
"TxPLL_JITTER_MODE_SEL:10G SyncE 32Bit"  \
"TxPLL_MODE:NORMAL"  \
"TxPLL_OUT:2500.000"  \
"TxPLL_REF:156.25"  \
"TxPLL_SOURCE:DEDICATED"  \
"TxPLL_SSM_DEPTH:0"  \
"TxPLL_SSM_DIVVAL:1"  \
"TxPLL_SSM_DOWN_SPREAD:false"  \
"TxPLL_SSM_FREQ:64"  \
"TxPLL_SSM_RAND_PATTERN:0"  \
"VCOFREQUENCY:1600"   } -inhibit_configurator 1
# Exporting core PF_TX_PLL_0 to TCL done
