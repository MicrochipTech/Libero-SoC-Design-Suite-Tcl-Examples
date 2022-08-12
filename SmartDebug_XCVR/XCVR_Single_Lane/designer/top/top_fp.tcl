new_project \
         -name {top} \
         -location {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {MPF300T} \
         -name {MPF300T}
enable_device \
         -name {MPF300T} \
         -enable {TRUE}
save_project
close_project
