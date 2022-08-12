# Exporting core Core_UART to TCL
# Exporting Create design command for core Core_UART
create_and_configure_core -core_vlnv "Actel:DirectCore:COREUART:$PF_COREUARTver" -component_name {Core_UART} -params {\
"BAUD_VAL_FRCTN_EN:false"  \
"RX_FIFO:0"  \
"RX_LEGACY_MODE:0"  \
"TX_FIFO:0"  \
"USE_SOFT_FIFO:0"   }
# Exporting core Core_UART to TCL done
