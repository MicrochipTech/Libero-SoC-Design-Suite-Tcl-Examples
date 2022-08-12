open_project -project {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\top_fp\top.pro}
enable_device -name {MPF300T} -enable 1
set_programming_file -name {MPF300T} -file {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\designer\top\top.ppd}
set_programming_action -action {PROGRAM} -name {MPF300T} 
run_selected_actions
save_project
close_project
