new_project \
         -name {PCIe_EP_Demo} \
         -location {/sqahyd/Pramod/Github_Examples/SmartDebug_PCIe_Register_read/PCIe_Register_Read/designer/PCIe_EP_Demo/PCIe_EP_Demo_fp} \
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
