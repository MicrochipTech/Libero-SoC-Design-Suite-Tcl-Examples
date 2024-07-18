# Exporting Component Description of DPSRAM to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component DPSRAM
create_and_configure_core -core_vlnv Actel:SgCore:PF_DPSRAM:$PF_DPSRAMver -component_name {DPSRAM} -params {\
"A_BLK_POLARITY:2"  \
"A_BYTE_ENABLE_WIDTH:0"  \
"A_CLK_EDGE:RISE"  \
"A_DEPTH:256"  \
"A_DOUT_ARST_PN:A_DOUT_ARST_N"  \
"A_DOUT_ARST_POLARITY:2"  \
"A_DOUT_EN_PN:A_DOUT_EN"  \
"A_DOUT_EN_POLARITY:2"  \
"A_DOUT_SRST_PN:A_DOUT_SRST_N"  \
"A_DOUT_SRST_POLARITY:2"  \
"A_PMODE:0"  \
"A_REN_PN:A_REN"  \
"A_REN_POLARITY:2"  \
"A_WIDTH:8"  \
"A_WMODE:0"  \
"ADDRESSA_PN:A_ADDR"  \
"ADDRESSB_PN:B_ADDR"  \
"B_BLK_POLARITY:2"  \
"B_BYTE_ENABLE_WIDTH:0"  \
"B_CLK_EDGE:RISE"  \
"B_DEPTH:256"  \
"B_DOUT_ARST_PN:B_DOUT_ARST_N"  \
"B_DOUT_ARST_POLARITY:2"  \
"B_DOUT_EN_PN:B_DOUT_EN"  \
"B_DOUT_EN_POLARITY:2"  \
"B_DOUT_SRST_PN:B_DOUT_SRST_N"  \
"B_DOUT_SRST_POLARITY:2"  \
"B_PMODE:0"  \
"B_REN_PN:B_REN"  \
"B_REN_POLARITY:2"  \
"B_WIDTH:8"  \
"B_WMODE:0"  \
"BLKA_PN:A_BLK_EN"  \
"BLKB_PN:B_BLK_EN"  \
"BUSY_FLAG:0"  \
"BYTEENABLES:0"  \
"CASCADE:0"  \
"CLK_EDGE:RISE"  \
"CLKA_PN:A_CLK"  \
"CLKB_PN:B_CLK"  \
"CLKS:1"  \
"CLOCK_PN:CLK"  \
"DATAA_IN_PN:A_DIN"  \
"DATAA_OUT_PN:A_DOUT"  \
"DATAB_IN_PN:B_DIN"  \
"DATAB_OUT_PN:B_DOUT"  \
"ECC:0"  \
"IMPORT_FILE:"  \
"INIT_RAM:F"  \
"LPMTYPE:LPM_RAM"  \
"PTYPE:2"  \
"RWA_PN:A_WEN"  \
"RWB_PN:B_WEN"  \
"SII_LOCK:0"   }
# Exporting Component Description of DPSRAM to TCL done
