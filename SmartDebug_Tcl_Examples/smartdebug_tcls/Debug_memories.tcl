#==============================================================================
#File: Debug_memories.tcl
#
#Description:
# This Tcl script performs debug activities on memories such as LSRAM(DPSRAM),USRAM,UPROM,sNVM.
#
#
# The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#==============================================================================

# To write in LSRAM and USRAM, we need to switch on DIP1 as specified in the AN4594 user guide.

# Debug LSRAM (DPSRAM)

# To read and write to a logical block of LSRAM
# [1] read_lsram: This command reads a specified block of large SRAM from the device. When logicalBlockName is specified, it will read the logical block of LSRAM.
 
# read_lsram \
 -deviceName "Optional if only one device is available in the current configuration; specifies the device name." \
 -logicalBlockName "Specifies the name for the user-defined memory block"\
 -port "Specifies the port for the memory block selected"\
 -fileName "Optional; specifies the output file name for the data read from the device" \
 -file "Optional; specifies the output file name for the data read from the device"
 

# Syntax:
# read_lsram \
  -deviceName "device name" \
  -logicalBlockName "LSRAM user-defined block name" \
  -port "LSRAM port name" \
  -fileName "Data file name"\
  -file "Data file name"
# Example:
read_lsram -deviceName {MPF300TS} \
           -logicalBlockName {Fabric_Debug_0/DPSRAM_0/DPSRAM_0} \
		   -port {Port B} \
		   -fileName {../../../DPSRAM_before_write_log.txt}


# [2]write_lsram: This command writes to a specified block of large SRAM on the device. When the logicalBlockName is specified, it will write to the logical block of lsram.
# write_lsram [-deviceName "Optional user-defined device name"] \
# -logicalBlockName {block name} \
# -port {port name} \
# -offset {offset value} \
# -logicalValue {hexadecimal value} \
 

# Syntax:
# write_lsram \
   -deviceName "device name"\
   -logicalBlockName "LSRAM user defined block name"\
   -port "LSRAM port name"\
   -offset "integer value"\
   -logicalValue "LSRAM block word value"

write_lsram -deviceName {MPF300TS} \
            -logicalBlockName {Fabric_Debug_0/DPSRAM_0/DPSRAM_0} \
			-port {Port B} \
			-offset {0} -offset {1} -offset {2} \
			-logicalValue {12} -logicalValue {1F} -logicalValue {F0} 


write_lsram -deviceName {MPF300TS} \
            -logicalBlockName {Fabric_Debug_0/DPSRAM_0/DPSRAM_0} \
			-port {Port B} \
			-offset {3} -logicalValue {FF} 

# Here we are reading it back to check whether it has been written correctly or not.
read_lsram -deviceName {MPF300TS}\
           -logicalBlockName {Fabric_Debug_0/DPSRAM_0/DPSRAM_0} \
		   -port {Port B} \
		   -file {../../../DPSRAM_after_write_log.txt}



# To read from and write to a physical block of LSRAM
# [3]read_lsram [-deviceName "Optional user-defined device name"] \
# [-name "LSRAM block name"] \
# [-fileName "Optional: Specifies the output file name for the data read from the device."] \
# [-file "Optional: Specifies the output file name for the data read from the device."]

# Syntax:
# read_lsram \
   -deviceName "device name"\
   -name "LSRAM block name" \
   -fileName "Data file name"\
   -file "Data file name"
read_lsram -deviceName {MPF300TS}\
           -name {Fabric_Debug_0/DPSRAM_0/DPSRAM_0/DPSRAM_DPSRAM_0_PF_DPSRAM_R0C0/INST_RAM1K20_IP} \
		   -file {../../../DPSRAM_before_write_phys.txt}

# To write on physical block of lsram
# [4] write_lsram [-deviceName "Optional user-defined device name"] \
 -name {LSRAM block name} \
 -offset {integer value} \
 -value {integer value} 
 
# Syntax:
# write_lsram \
    -deviceName "device name"\
	-name "LSRAM block name"\
	-offset "integer value"\
	-value "integer value" 

write_lsram -deviceName {MPF300TS} \
            -name {Fabric_Debug_0/DPSRAM_0/DPSRAM_0/DPSRAM_DPSRAM_0_PF_DPSRAM_R0C0/INST_RAM1K20_IP} \
			-offset {2} -value {10} 
write_lsram -deviceName {MPF300TS} \
            -name {Fabric_Debug_0/DPSRAM_0/DPSRAM_0/DPSRAM_DPSRAM_0_PF_DPSRAM_R0C0/INST_RAM1K20_IP} \
			-offset {17} -value {245} 
write_lsram -deviceName {MPF300TS} \
            -name {Fabric_Debug_0/DPSRAM_0/DPSRAM_0/DPSRAM_DPSRAM_0_PF_DPSRAM_R0C0/INST_RAM1K20_IP} \
			-offset {18} -offset {19} -offset {20} -value {243} -value {100} -value {270} 
read_lsram -deviceName {MPF300TS} \
           -name {Fabric_Debug_0/DPSRAM_0/DPSRAM_0/DPSRAM_DPSRAM_0_PF_DPSRAM_R0C0/INST_RAM1K20_IP} \
		   -file {../../../DPSRAM_after_write_phys.txt}





# ############# Debug USRAM

# [1]To read and write on logical block of usram

# read_usram: It reads a specified block of large USRAM from the device. When we specify logicalBlockName, it will read the logical block of USRAM. 
# read_usram -deviceName "device name" \
# -logicalBlockName "USRAM user defined block name" \
# -port "USRAM port name"\
# -fileName "Data file name"

# Syntax:
#  read_usram \
   -deviceName "device name" \
   -logicalBlockName "USRAM user defined block name" -port "USRAM port name"\
   -file "Data file name" \
   -fileName "Data file name"

read_usram -deviceName {MPF300TS} \
             -logicalBlockName {Fabric_Debug_0/URAM_0/URAM_0} \
			 -port {Port A} \
			 -fileName {../../../USRAM_before_write_log.txt}


# write_usram:It writes to a specified block of large USRAM on the device. When we specify logicalBlockName, it will write to the logical block of USRAM.
# write_usram -deviceName "device name" \
 -logicalBlockName "USRAM user defined block name" \
 -port "USRAM port name" \
 -offset "integer value" \
 -logicalValue "USRAM block word value" \
 -value "integer value"

# Syntax:
# write_usram -deviceName "device name" \
# -logicalBlockName "USRAM user defined block name"\
# -port "USRAM port name" \
# -offset "integer value" \
# -logicalValue "USRAM block word value"
write_usram -deviceName {MPF300TS}\
            -logicalBlockName {Fabric_Debug_0/URAM_0/URAM_0} \
			-port {Port A} \
			-offset {2} -logicalValue {FFFF} 
write_usram -logicalBlockName {Fabric_Debug_0/URAM_0/URAM_0} \
            -port {Port A} \
			-offset {1} -offset {2} \
			-logicalValue {FEFE} -logicalValue {ABAB}
read_usram -deviceName {MPF300TS} \
             -logicalBlockName {Fabric_Debug_0/URAM_0/URAM_0} \
			 -port {Port A} \
			 -file {../../../USRAM_after_write_log.txt}

# To read and write on a Physical block of usram
# read_usram [-deviceName "device name"] \
 [-name "USRAM block name"] 

# Syntax:
# read_usram \
    -deviceName "device name" \
	-name "USRAM block name" \
    -file "Data file name" \
	-fileName "Data file name"
read_usram -deviceName {MPF300TS} \
           -name {Fabric_Debug_0/URAM_0/URAM_0/URAM_URAM_0_PF_URAM_R0C0/RAM64x12_PHYS_0/INST_RAM64x12_IP} \
		   -fileName {../../../USRAM_before_write_phys.txt}

# To write on physical block of usram
# write_usram [-deviceName "device name"] \
 [-name "USRAM block name"] \
 [-offset "integer value"] \
 [-value "integer value"]

# Syntax:
# write_usram \
    -deviceName "device name"\
	-name "USRAM block name"\
	-offset "integer value"\
	-value "integer value" 
write_usram -name {Fabric_Debug_0/URAM_0/URAM_0/URAM_URAM_0_PF_URAM_R0C0/RAM64x12_PHYS_0/INST_RAM64x12_IP} \
            -offset {0} -value {4} 
write_usram -name {Fabric_Debug_0/URAM_0/URAM_0/URAM_URAM_0_PF_URAM_R0C0/RAM64x12_PHYS_0/INST_RAM64x12_IP} \
            -offset {1} -value {1279} 
write_usram -name {Fabric_Debug_0/URAM_0/URAM_0/URAM_URAM_0_PF_URAM_R0C0/RAM64x12_PHYS_0/INST_RAM64x12_IP} \
            -offset {2} -value {256}
read_usram -name {Fabric_Debug_0/URAM_0/URAM_0/URAM_URAM_0_PF_URAM_R0C0/RAM64x12_PHYS_0/INST_RAM64x12_IP} \
           -fileName {../../../USRAM_after_write_phys.txt}
 

# ######## Debug uPROM

# This lists all clients configured in the design. The following Tcl command reads a uPROM memory block from the device. You need to specify the client name along with its correct start address and the number of words.
# read_uprom_memory -deviceName "Optional user-defined device name." \
# -client "Specifie the name of client for memory read." \
# -startaddress "Specifies the start address of the uPROM memory block." \
# -words "Specifies the number of 9-bit words." 
# -fileName "Name of output file for memory read in .txt format"


# Syntax:
# read_uprom_memory -deviceName "device name" \
                      -client "client name" \
					  -startaddress "start address"\
					  -words "integer value" \
					  -fileName "Data file name"
					  
# [i] Debug uPROM Memory in User Design View
read_uprom_memory -deviceName {MPF300TS} \
                    -client {MicroPROM_0} \
					-startaddress {0} \
					-words {23} \
					-fileName "../../../UPROM_data.txt"
					
# [ii] Debug uPROM Memory in Direct Address View
read_uprom_memory -startaddress {0} -words {7}

 
# ######## Debug sNVM

# [1] read_snvm_memory: This command reads client or page(s) in the sNVM memory from the device and returns plain text (status and data of the page). Use a client name with appropriate -startpage, -endpage, or -uskKey option values to retrieve the data.
# read_snvm_memory -deviceName "Optional user-defined device name." \
# -client "Name of the client configured in Libero." \
# -startpage "Start page number configured in Libero." \
# -endpage "End page number" \
# -uskKey "User Secret Key security key configured for the client in hexadecimal format" \
# -fileName "Name of output file for memory read." 

# Syntax:
# read_snvm_memory -deviceName "device name" \
                      -client "client name" \
					  -startpage "integer value" \
                      -endpage "integer value" \
					  -uskKey "usk key" \
					  -fileName "snvm data file name" 
#[i] Reading it in client view:
read_snvm_memory -deviceName {MPF300TS} \
                 -client {INIT_STAGE_1_SNVM_CLIENT} \
				 -startpage {202} -endpage {219} \
				 -uskKey {0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0}  \
				 -fileName {../../../snvm_data_init_client1.txt}
# Reading another client:
read_snvm_memory -deviceName {MPF300TS} \
                 -client {INIT_STAGE_2_3_SNVM_CLIENT} \
				 -startpage {0} -endpage {8} \
				 -uskKey {0:0:0:0:0:0:0:0:0} \
				 -fileName {../../../snvm_data_init_client2.txt}
# Reading a user-configured client.
read_snvm_memory -client {Client1} \
                 -startpage {17} -endpage {17} \
                 -uskKey {0} -fileName {../../../snvm_data_client1.txt}

# [ii]Reading it in page View
read_snvm_memory -startpage {17} -endpage {17} -uskKey {0}

# [2]export_snvm_data:This command export the sNVM data to a text file.
# export_snvm_data -deviceName "Optional user-defined device name." \
 -client "Name of the client configured in Libero." \
 -startpage "Start page number configured in Libero." \
 -endpage "End page number" \
 -uskKey "User Secret Key security key configured for the client in hexadecimal format" \
 -fileName "path to the file" 
 


# Syntax:
# export_snvm_data -deviceName "device name" \
                     -client "client name" \
					 -startpage "integer value" \
					 -endpage "integer value" \
					 -uskKey "usk key"\
					 -fileName "File Name" 

# [i]exporting data in client view.
export_snvm_data -deviceName {MPF300TS} \
                   -client {INIT_STAGE_1_SNVM_CLIENT} \
				   -startpage {202} -endpage {219} \
				   -uskKey {0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0} \
				   -file_name {../../../sNVM_client_1.txt}  
# #exporting other client.
export_snvm_data -deviceName {MPF300TS} \
                   -client {INIT_STAGE_2_3_SNVM_CLIENT} \
				   -startpage {0} -endpage {8} \
				   -uskKey {0:0:0:0:0:0:0:0:0}\
				   -file_name {../../../sNVM_client_2.txt} 
				   

# [ii]exporting data in page view.  
export_snvm_data -startpage {0} -endpage {9} \
				   -uskKey {0:0:0:0:0:0:0:0:0:0}\
				   -file_name {../../../sNVM_client_3.txt}  
