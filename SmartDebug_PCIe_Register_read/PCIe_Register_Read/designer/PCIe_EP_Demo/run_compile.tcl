set_defvar -name {SPEED}   -value {-1}
set_defvar -name {VOLTAGE} -value {1.0}
set_defvar -name {TEMPR}   -value {EXT}
set_defvar -name {PART_RANGE}   -value {EXT}
set_defvar -name {IO_DEFT_STD} -value {LVCMOS18}
set_defvar -name {PACOMP_PARPT_MAX_NET} -value {10}
set_defvar -name {PA4_GB_MAX_RCLKINT_INSERTION} -value {16}
set_defvar -name {PA4_GB_MIN_GB_FANOUT_TO_USE_RCLKINT} -value {1000}
set_defvar -name {PA4_GB_MAX_FANOUT_DATA_MOVE} -value {5000}
set_defvar -name {PA4_GB_HIGH_FANOUT_THRESHOLD} -value {5000}
set_defvar -name {PA4_GB_COUNT} -value {36}
set_defvar -name {RESTRICTPROBEPINS} -value {0}
set_defvar -name {RESTRICTSPIPINS} -value {0}
set_defvar -name {PDC_IMPORT_HARDERROR} -value {1}
set_defvar -name {PA4_IDDQ_FF_FIX} -value {1}
set_defvar -name {BLOCK_PLACEMENT_CONFLICTS} -value {ERROR}
set_defvar -name {BLOCK_ROUTING_CONFLICTS} -value {LOCK}
set_defvar -name {RTG4_MITIGATION_ON} -value {0}
set_defvar -name {USE_CONSTRAINT_FLOW} -value True
set_defvar -name {FHB_AUTO_INSTANTIATION} -value {0}

set_partition_info -name "/PCIe_EP_Demo" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR4_SS_0/DDRCTRL_0/IeLFk51fKvqEJyb0giD6/Ic6dpnDELamcc/Icmi06DfJ7LH6" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR4_SS_0/DDRCTRL_0/IeLFk51fKvqEJyb0giD6/Ic6dpnDELamcc/Icr4gHi8Fm7cu" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR4_SS_0/DDRPHY_BLK_0/IOD_TRAINING_0/COREDDR_TIP_INT_U/TIP_CTRL_BLK/LEVELLING/RDLVL/RDLVL_SMS/genblk1\[1\]\.RDLVL_TRAIN" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR4_SS_0/DDRPHY_BLK_0/IOD_TRAINING_0/COREDDR_TIP_INT_U/TIP_CTRL_BLK/LEVELLING/RDLVL/RDLVL_SMS/genblk1\[0\]\.RDLVL_TRAIN" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR4_SS_0" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR3_SS_0/DDRCTRL_0/IeLFk51fKvqEJyb0giD6/Ic6dpnDELamcc/Icmi06DfJ7LH6" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR3_SS_0/DDRCTRL_0/IeLFk51fKvqEJyb0giD6/Ic6dpnDELamcc/Icr4gHi8Fm7cu" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR3_SS_0/DDRPHY_BLK_0/IOD_TRAINING_0/COREDDR_TIP_INT_U/TIP_CTRL_BLK/LEVELLING/RDLVL/RDLVL_SMS/genblk1\[1\]\.RDLVL_TRAIN" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR3_SS_0/DDRPHY_BLK_0/IOD_TRAINING_0/COREDDR_TIP_INT_U/TIP_CTRL_BLK/LEVELLING/RDLVL/RDLVL_SMS/genblk1\[0\]\.RDLVL_TRAIN" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/PF_DDR3_SS_0" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/CoreDMA_IO_CTRL_0/CoreDMA_Controller_0/CoreDMA_Controller_0" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/CoreDMA_IO_CTRL_0" -timestamp "1652758734"
set_partition_info -name "/PCIe_EP_Demo/AXItoAPB_0" -timestamp "1652758734"
set_compile_info \
    -category {"Device Selection"} \
    -name {"Family"} \
    -value {"PolarFire"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Device"} \
    -value {"MPF300T"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Package"} \
    -value {"FCG1152"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Speed Grade"} \
    -value {"-1"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Core Voltage"} \
    -value {"1.0V"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Part Range"} \
    -value {"EXT"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"Default I/O technology"} \
    -value {"LVCMOS 1.8V"}
set_compile_info \
    -category {"Device Selection"} \
    -name {"FPGA Hardware Breakpoint Auto Instantation"} \
    -value {"Off"}
set_compile_info \
    -category {"Source Files"} \
    -name {"Topcell"} \
    -value {"PCIe_EP_Demo"}
set_compile_info \
    -category {"Source Files"} \
    -name {"Format"} \
    -value {"Verilog"}
set_compile_info \
    -category {"Source Files"} \
    -name {"Source"} \
    -value {"/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/synthesis/PCIe_EP_Demo.vm"}
set_compile_info \
    -category {"Options"} \
    -name {"Limit the number of high fanout nets to display to"} \
    -value {"10"}
compile \
    -desdir {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo} \
    -design PCIe_EP_Demo \
    -fam PolarFire \
    -die PA5M300T \
    -pkg fcg1152 \
    -merge_pdc 0
