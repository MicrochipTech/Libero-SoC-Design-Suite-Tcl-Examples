new_project \
         -name {IOG_IOD_DDRX4_COMP} \
         -location {C:\Lakshman\Libero\Board\HSV_KIT\DDRX4\CENTERED\CoreRxIODBitAlign_PF_HSVKit_1400_Mbps\CoreRxIODBitAlign\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP_fp} \
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
