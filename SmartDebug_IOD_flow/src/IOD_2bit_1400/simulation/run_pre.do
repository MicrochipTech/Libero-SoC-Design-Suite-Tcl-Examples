quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "C:/Lakshman/Libero/Board/HSV_KIT/DDRX4/CENTERED/RAND/CoreRxIODBitAlign_PF_HSVKit_1400_Mbps/CoreRxIODBitAlign"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "C:/Microsemi/Libero_SoC_v12.0/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/CoreTxIOD.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/CoreRxIODBitAlign_top.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/CoreRxIODBitAlign_top.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_CLOCK/IOG_IOD_CLOCK_0/IOG_IOD_CLOCK_IOG_IOD_CLOCK_0_PF_CCC.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_CLOCK/IOG_IOD_CLOCK.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRTX4/LANECTRL_ADDR_CMD_0/IOG_IOD_DDRTX4_LANECTRL_ADDR_CMD_0_PF_LANECTRL.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRTX4/PF_IOD_TX_CLK/IOG_IOD_DDRTX4_PF_IOD_TX_CLK_PF_IOD.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRTX4/PF_IOD_TX/IOG_IOD_DDRTX4_PF_IOD_TX_PF_IOD.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRTX4/IOG_IOD_DDRTX4.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_PF/PF_CLK_DIV_FIFO/IOG_IOD_DDRX4_PF_PF_CLK_DIV_FIFO_PF_CLK_DIV_DELAY.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_PF/PF_CLK_DIV_RXCLK/IOG_IOD_DDRX4_PF_PF_CLK_DIV_RXCLK_PF_CLK_DIV_DELAY.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_PF/PF_IOD_RX/IOG_IOD_DDRX4_PF_PF_IOD_RX_PF_IOD.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_PF/PF_LANECTRL_0/IOG_IOD_DDRX4_PF_PF_LANECTRL_0_PF_LANECTRL.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_PF/IOG_IOD_DDRX4_PF.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MON/PF_INIT_MON_0/PF_INIT_MON_PF_INIT_MON_0_PF_INIT_MONITOR.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PF_INIT_MON/PF_INIT_MON.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0_0/PF_OSC_C0_PF_OSC_C0_0_PF_OSC.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PF_OSC_C0/PF_OSC_C0.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/debounce.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/prbscheck_parallel_fab.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/prbsgen_parallel_fab.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/reset_delay.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/rev_bits.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/IOG_IOD_DDRX4_COMP/IOG_IOD_DDRX4_COMP.v"
vlog "+incdir+${PROJECT_DIR}/component/work/CoreRxIODBitAlign_tb" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/CoreRxIODBitAlign_tb/CoreRxIODBitAlign_tb.v"

vsim -L PolarFire -L presynth  -t 1ps presynth.CoreRxIODBitAlign_tb
do wave_pre.do
run 1ms
# #add wave /CoreRxIODBitAlign_tb/*
# #run 1000ns
do wave.do
run 1ms
