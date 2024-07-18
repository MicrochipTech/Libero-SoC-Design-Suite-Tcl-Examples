#==============================================================================
#File: DDR.tcl
#
#Description:
#This TCl script does Debug activities on DDR.
#
#
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#==============================================================================


# [1] debug_ddr: It retrieves the training data from the Training IP and displays the status of different stages of training, along with the eye width chart.
# debug_ddr \
 -ddr_type {Specifies the DDR type} \
 -data_width {Specifies the data width. Supported data widths are 16, 32, and 64.} \
 -slot {Specifies the slot that is used for the memory} \
 -inst_path {Specifies the instance path from the top module} \
 -frequency {Specifies the frequency in MHz.}

# Syntax:
# debug_ddr \
 -deviceName "device name"\
 -ddr_type "DDR Type" \
 -data_width "integer value" \
 -slot "DDR Slot" \
 -inst_path "Instace Path from Top" \
 -frequency "decimal value"
debug_ddr -ddr_type {DDR4} -data_width 32 -slot {NORTH_NW} -inst_path {DDR4_Interface_0/DDR4_0} -frequency 800.00 


# [2] export_ddr_training_data: It exports the training data read from the device into a simple text file, which assists users in comparing data between multiple runs by exporting the training data.
# export_ddr_training_data -file {Specifies the file name where the exported data will be saved.}

# Syntax:
# export_ddr_training_data -file {file name}
export_ddr_training_data -file {../../../Memory_DDR.txt}