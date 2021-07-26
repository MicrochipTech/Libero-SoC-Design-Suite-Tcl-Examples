open_project -project {X:\kiran\TCL_github\SD_tcls\SD_IODtestcase\IOD_2bit_1400\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP_fp\IOG_IOD_DDRX4_COMP.pro}
enable_device -name {MPF300T} -enable 1
set_programming_file -name {MPF300T} -file {X:\kiran\TCL_github\SD_tcls\SD_IODtestcase\IOD_2bit_1400\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP.ppd}
set_programming_action -action {PROGRAM} -name {MPF300T} 
run_selected_actions
save_project
close_project
