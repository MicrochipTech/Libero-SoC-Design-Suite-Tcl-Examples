#quietly set ACTELLIBNAME PolarFire
#quietly set PROJECT_DIR "C:/Lakshman/Libero/Board/HSV_KIT/DDRX4/CENTERED/RAND/CoreRxIODBitAlign_PF_HSVKit_1400_Mbps/CoreRxIODBitAlign"
## onerror { quit -f }
## onbreak { quit -f }
#
#if {[file exists postsynth/_info]} {
   #echo "INFO: Simulation library postsynth already exists"
#} else {
   #file delete -force postsynth 
   #vlib postsynth
#}
#vmap postsynth postsynth
#vmap PolarFire "C:/Microsemi/Libero_SoC_v12.0/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"
#
#vlog -vlog01compat -work postsynth "${PROJECT_DIR}/synthesis/synthesis_1/IOG_IOD_DDRX4_COMP.v"
#vlog "+incdir+${PROJECT_DIR}/component/work/CoreRxIODBitAlign_tb" -vlog01compat -work postsynth "${PROJECT_DIR}/component/work/CoreRxIODBitAlign_tb/CoreRxIODBitAlign_tb.v"
#
#vsim -L PolarFire -L postsynth  -t 1ps postsynth.CoreRxIODBitAlign_tb
## do wave_post.do
#add wave -r *
#run 1ms
## #add wave /CoreRxIODBitAlign_tb/*
## #run 1000ns
#do wave.do
#run 1ms
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

vlog -sv -work postsynth "${PROJECT_DIR}/synthesis/synthesis_1/IOG_IOD_DDRX4_COMP.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -sv -work postsynth "${PROJECT_DIR}/stimulus/tb.v"

vsim -L PolarFire -L postsynth -L CORERXIODBITALIGN_LIB  -t 1ps -pli //hyd-fs/captures/pc/12_900_20_6_main/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll postsynth.tb
add wave /tb/*
add log -r /*
run 1000ns
