set_device -family {PolarFire} -die {MPF300T} -speed {-1}
read_adl {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP.adl}
read_afl {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP.afl}
map_netlist
read_sdc {C:\ALL_OLD_DATA\20211\IOD_2bitERR\constraint\IOG_IOD_DDRX4_COMP_derived_constraints.sdc}
check_constraints {C:\ALL_OLD_DATA\20211\IOD_2bitERR\constraint\placer_sdc_errors.log}
write_sdc -mode layout {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\place_route.sdc}
