set_device \
    -fam PolarFire \
    -die PA5M300T \
    -pkg fcg1152
set_proj_dir \
    -path {C:\ALL_OLD_DATA\20211\IOD_2bitERR}
set_impl_dir \
    -path {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP}
set_is_relative_path \
    -value {FALSE}
set_root_path_dir \
    -path {}
set_first_stage \
    -address 00000000
set_second_stage \
    -uprom_address 00000000 \
    -snvm_address 00000000 \
    -spi_address 00000400 \
    -spi_binding spi_noauth \
   -ramBrodcast 1
set_override_file \
    -path {}
set_auto_calib_timeout \
    -value {3000}
