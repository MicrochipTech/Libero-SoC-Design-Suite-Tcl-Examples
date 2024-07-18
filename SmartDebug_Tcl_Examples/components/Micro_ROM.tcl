# Exporting Component Description of Micro_ROM to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component Micro_ROM
create_and_configure_core -core_vlnv Actel:SgCore:PF_UPROM:$PF_UPROMver  -component_name {Micro_ROM} -params {\
"CFGFILE:./src/UPROM.cfg"   }
# Exporting Component Description of Micro_ROM to TCL done
