set_device \
    -family  PolarFire \
    -die     PA5M300T \
    -package fcg1152 \
    -speed   -1 \
    -tempr   {IND} \
    -voltr   {IND}
set_def {VOLTAGE} {1.0}
set_def {VCCI_1.2_VOLTR} {EXT}
set_def {VCCI_1.5_VOLTR} {EXT}
set_def {VCCI_1.8_VOLTR} {EXT}
set_def {VCCI_2.5_VOLTR} {EXT}
set_def {VCCI_3.3_VOLTR} {EXT}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name IOG_IOD_DDRX4_COMP
set_workdir {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP}
set_log     {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP_sdc.log}
set_design_state pre_layout
