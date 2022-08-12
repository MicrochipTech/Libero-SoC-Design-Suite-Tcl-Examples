# Exporting core OSC_160MHz to TCL
# Exporting Create design command for core OSC_160MHz
create_and_configure_core -core_vlnv "Actel:SgCore:PF_OSC:$PF_OSCver" -component_name {OSC_160MHz} -params {\
"RCOSC_2MHZ_CLK_DIV_EN:false"  \
"RCOSC_2MHZ_GL_EN:false"  \
"RCOSC_2MHZ_NGMUX_EN:false"  \
"RCOSC_160MHZ_CLK_DIV_EN:true"  \
"RCOSC_160MHZ_GL_EN:false"  \
"RCOSC_160MHZ_NGMUX_EN:false"   }
# Exporting core OSC_160MHz to TCL done
