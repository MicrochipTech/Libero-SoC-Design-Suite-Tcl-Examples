open_project -project {Z:\Pramod\Github_Examples\SmartDebug_PCIe_Register_read\PCIe_Register_Read\designer\PCIe_EP_Demo\PCIe_EP_Demo_fp\PCIe_EP_Demo.pro}
enable_device -name {MPF300T} -enable 1
set_programming_file -name {MPF300T} -file {Z:\Pramod\Github_Examples\SmartDebug_PCIe_Register_read\PCIe_Register_Read\designer\PCIe_EP_Demo\PCIe_EP_Demo.ppd}
set_programming_action -action {PROGRAM} -name {MPF300T} 
run_selected_actions
save_project
close_project
