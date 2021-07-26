quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "D:/POLARFIRE_Sandbox/IOD_12_5/TX_Ce_RX_Dy_x4_1400"

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap PolarFire "//hyd-fs/captures/pc/12_900_20_6_main/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"
if {[file exists CORERXIODBITALIGN_LIB/_info]} {
   echo "INFO: Simulation library CORERXIODBITALIGN_LIB already exists"
} else {
   file delete -force CORERXIODBITALIGN_LIB 
   vlib CORERXIODBITALIGN_LIB
}
vmap CORERXIODBITALIGN_LIB "CORERXIODBITALIGN_LIB"

vlog -sv -work postsynth "${PROJECT_DIR}/synthesis/IOG_IOD_DDRX4_COMP.v"
vlog "+incdir+${PROJECT_DIR}/component/work/sd_tb" -sv -work postsynth "${PROJECT_DIR}/component/work/sd_tb/sd_tb.v"

vsim -L PolarFire -L postsynth -L CORERXIODBITALIGN_LIB  -t 1ps -pli //hyd-fs/captures/pc/12_900_20_6_main/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll postsynth.sd_tb
add wave /sd_tb/*
add log -r /*
run 1000ns
