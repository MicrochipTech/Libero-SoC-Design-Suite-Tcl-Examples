set_device -family {PolarFire} -die {MPF300T} -speed {-1}
read_adl {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/PCIe_EP_Demo.adl}
read_afl {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/PCIe_EP_Demo.afl}
map_netlist
read_sdc {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/constraint/PCIe_EP_Demo_derived_constraints.sdc}
read_sdc {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/constraint/timing_user_constraints.sdc}
check_constraints {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/constraint/timing_sdc_errors.log}
estimate_jitter -report {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/timing_analysis_jitter_report.txt}
write_sdc -mode smarttime {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/timing_analysis.sdc}
