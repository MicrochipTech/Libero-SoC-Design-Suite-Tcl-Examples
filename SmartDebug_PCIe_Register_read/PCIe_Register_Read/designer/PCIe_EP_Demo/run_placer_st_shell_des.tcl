set_device \
    -family  PolarFire \
    -die     PA5M300T \
    -package fcg1152 \
    -speed   -1 \
    -tempr   {EXT} \
    -voltr   {EXT}
set_def {VOLTAGE} {1.0}
set_def {VCCI_1.2_VOLTR} {EXT}
set_def {VCCI_1.5_VOLTR} {EXT}
set_def {VCCI_1.8_VOLTR} {EXT}
set_def {VCCI_2.5_VOLTR} {EXT}
set_def {VCCI_3.3_VOLTR} {EXT}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name PCIe_EP_Demo
set_workdir {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo}
set_log     {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/PCIe_EP_Demo_sdc.log}
set_design_state pre_layout
