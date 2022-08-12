set_device -family {PolarFire} -die {MPF300T} -speed {-1}
read_adl {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\top.adl}
read_afl {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\top.afl}
map_netlist
read_sdc {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\constraint\top_derived_constraints.sdc}
check_constraints {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\constraint\placer_sdc_errors.log}
estimate_jitter -report {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\place_and_route_jitter_report.txt}
write_sdc -mode layout {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\place_route.sdc}
