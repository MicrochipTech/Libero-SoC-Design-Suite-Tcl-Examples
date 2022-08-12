# Exporting core CLK_DIV2 to TCL
# Exporting Create design command for core CLK_DIV2
create_and_configure_core -core_vlnv "Actel:SgCore:PF_CLK_DIV:$PF_CLK_DIVver" -component_name {CLK_DIV2} -params {\
"DIVIDER:2"  \
"ENABLE_BIT_SLIP:false"  \
"ENABLE_SRESET:false"   }
# Exporting core CLK_DIV2 to TCL done
