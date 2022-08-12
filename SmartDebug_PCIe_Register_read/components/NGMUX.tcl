# Exporting core NGMUX to TCL
# Exporting Create design command for core NGMUX
create_and_configure_core -core_vlnv "Actel:SgCore:PF_NGMUX:$PF_NGMUX_Ver" -component_name {NGMUX} -params {\
"ENABLE_NON_TOGGLING_CLK_SWITCH_SUPPORT:false"   }
# Exporting core NGMUX to TCL done
