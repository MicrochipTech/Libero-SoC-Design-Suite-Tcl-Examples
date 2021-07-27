#-------------------------------------------------------------------------------
# 
# Description: This script runs debug_iod command on the IOD design
#--------------------------------------------------------------------


set IOD_Training_Data [ debug_iod -iod_type {RX_DDRX_B_G_DYN} -inst_path {PF_IOD_GENERIC_RX_C1_0} ]

puts "IOD Training Data: $IOD_Training_Data"