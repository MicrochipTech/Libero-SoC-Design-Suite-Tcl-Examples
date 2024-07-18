#==============================================================================
#File: Active_Probe.tcl
#
#Description:
#This Tcl script performs debug activities on probes.
#The active probes design debug option reads and writes to one or many probe points in the design through JTAG
#
#
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#==============================================================================


# [1]select_active_probe:It manages the current selection of active probe points to be used by active probe READ operations.
# select_active_probe [-name "Specifies the name of the probe" ] \
 [-reset "This optional parameter resets all previously selected probe points true|false" ]

# syntax:
# select_active_probe [-name "name"]* \
        [-reset "TRUE | FALSE"]
# We can select probes using wildcards as shown in example below and can assign to a variable say "selected_probes" to check which probes are added from the design to debug.
set selected_probes [select_active_probe \
         -name {*coutB*} \
		 -reset 0 ]	
		 
# To get the list of probes in selected_probe1 here, colonString varianle is used as a tokenizer/identifier of bus or nodes identification in selected probes. 
set colonString :
foreach m $selected_probes {
if {[string first $colonString $m] == -1} {
    puts "found bus \"$m\""
} else { 
	puts "found node \"$m\"" 
}
}

		 
# Another example of selecting probes using wildcards
set selected_probe1 [select_active_probe \
         -name {*coutA*} \
		 -reset 0 ]	
		 
# To get the list of probes in selected_probe1 here, colonString varianle is used as a tokenizer/identifier of bus or nodes identification in selected probes. 
set colonString :
foreach i $selected_probe1 {
if {[string first $colonString $i] == -1} {
    puts "found bus \"$i\""
} else { 
	puts "found node \"$i\"" 
}
}

# [2]save_active_probe_list: This command saves the list of active probes to a file.
# save_active_probe_list [-deviceName "Parameter is optional if only one device is available in the current configuration"] \
 -file "path to the file"

# syntax:
# save_active_probe_list [-deviceName "device name"] -file "filename"
# This command saves the list of above selected probes in a text file.
save_active_probe_list -deviceName {MPF300TS} -file {../../../save_active_probe_list.txt}


# [3] create_probe_group: This command creates a new probe group.
# create_probe_group -name {Specifies the name of the new probe group}
 
# syntax:
# create_probe_group -name "group name"
create_probe_group -name Mygroup1
create_probe_group -name Mygroup2


# We can now retrieve the probes required for certain operations from the save_active_probe_list.txt file, which we saved in step 2. 
# [4]add_to_probe_group:This command adds the specified probe points to the specified probe group.
# add_to_probe_group -name {Specifies one or more probes to add} -group {Specifies name of the probe group}

# syntax:
# add_to_probe_group [-name "name"]+ \
        -group "group name"
add_to_probe_group \
         -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[1]:Fabric_Debug_0/count_0/coutA[1]:Q} \
         -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[2]:Fabric_Debug_0/count_0/coutA[2]:Q}\
		 -group {Mygroup1} 
add_to_probe_group \
         -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[0]:Fabric_Debug_0/count_0/coutA[0]:Q}\
		 -group {Mygroup2} 


# [5]move_to_probe_group: The `move_to_probe_group` command moves the specified probe points to the designated probe group.
# move_to_probe_group -name {Specifies one or more probes to move} -group {Specifies name of the probe group}

# syntax:
# move_to_probe_group [-name "name"]+ \
        -group "group name"
move_to_probe_group \
         -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[2]:Fabric_Debug_0/count_0/coutA[2]:Q} \
         -group {Mygroup2}


# [6]read_active_probe:This command reads active probe values from the device.The target probe points are selected by the `select_active_probe` command.
# read_active_probe \
 [-deviceName "Parameter is optional if only one device is available in the current configuration" ] \
 [-name probe_name ] \
 [-group_name "Reads only the specified buses or groups instead of all probes" ] \
 [-value_type "Specifies the format of the read value when stored into a variable: 'b' for binary, 'h' for hexadecimal. This parameter is optional."] \
 [-file "Redirects output with probe point values read from the device to the specified file. This parameter is optional." ]

# syntax:
# read_active_probe [-deviceName "device name"] \
        [-file "filename"] \
        [-name "name"]* \
        [-value_type "value type"]* \
        [-group_name "Group or Bus Name"]* \
        [-silent "TRUE | FALSE"]
# Example to read group values:
read_active_probe -deviceName {MPF300TS} -group_name {Mygroup2} -value_type {h} -file {../../../probes_read.txt}
# Example to read single probe value:
read_active_probe -name {Fabric_Debug_0/count_0_coutB.Fabric_Debug_0/count_0_coutB[6]:Fabric_Debug_0/count_0/coutB[6]:Q}


# With the help of the example below, we are returning the value of the read result. To do this, we are storing the value in a variable and then printing its value.
# Here, we are extracting the group_name:
set grep_group_name "read_active_probe -group_name {Fabric_Debug_0/count_0_coutA}"
regexp {(\{[A-Za-z]*.*)} "$grep_group_name" groupname
# Here, we are extracting the group values:
set read_value [read_active_probe -group_name {Fabric_Debug_0/count_0_coutA}]
# We are returning the group value along with its group name.
puts "$groupname = $read_value"

# As we are debugging probes of a free-running counter, we are halting the clock to write to these probes using FHB.
fhb_control -halt -clock_domain {"PF_CCC_0_0/PF_CCC_0_0/clkint_0"}

# [7] write_active_probe: This command sets the target probe point on the device to the specified value.
# write_active_probe [-deviceName "The parameter is optional if only one device is available in the current configuration."] \
 -name "Specifies the name of the target probe point." \
 -value "Specifies the values to be written. 'True' for High, 'False' for Low." \
 -group_name "Specifies the group or bus name to write to the complete group or bus." \
 -group_value "Specifies the value for the complete group or bus in hex-value or binary-value format."

# Syntax:
# write_active_probe [-deviceName "device name"] \
        [-name "Probe point name"]* \
        [-value "TRUE | FALSE"]* \
        [-group_name "Group or Bus Name"]* \
        [-group_value "Group or Bus value"]* \
        [-silent "TRUE | FALSE"]
# Example of writing to individual probe points:
write_active_probe -deviceName {MPF300TS}\
         -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[0]:Fabric_Debug_0/count_0/coutA[0]:Q} \
         -value 1  
# Example of writing to a group:
write_active_probe -deviceName {MPF300TS} -group_name {Mygroup2} -group_value {2'h2}

# Reading it back to check whether it is written correctly:
read_active_probe

# By clicking 'run' in the FPGA Hardware Breakpoint controls, the clock domain is resumed from the halted state, and when read, it shows the updated probe values.
# fhb_control -run {Specifies to run the clock} -clock_domain {Specify the clock domain name(s) or 'all'}
fhb_control -run -clock_domain {"PF_CCC_0_0/PF_CCC_0_0/clkint_0"} 

 
# [8] remove_from_probe_group: This command removes the specified probe points from a group.
# Usage: remove_from_probe_group -name {group_name.probe_point_name}

#syntax:
#remove_from_probe_group [-name "name"]+
remove_from_probe_group \
         -name {Mygroup1.Fabric_Debug_0/count_0_coutA[2]:Fabric_Debug_0/count_0/coutA[2]:Q}
		 
# [9] delete_active_probe: This command deletes all active probes or selected ones.
# Usage: delete_active_probe -deviceName "Specify device name" (optional if only one device is present) -all | -name {probe name}

#syntax:
#delete_active_probe [-deviceName "device name"] \
        [-all "TRUE | FALSE"] \
        [-name "name"]*
delete_active_probe -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[0]:Fabric_Debug_0/count_0/coutA[0]:Q} -name {Fabric_Debug_0/count_0_coutA.Fabric_Debug_0/count_0_coutA[3]:Fabric_Debug_0/count_0/coutA[3]:Q}  

# Deleting probe CoutA[4] from Mygroup2
delete_active_probe -name {Mygroup2.Fabric_Debug_0/count_0_coutA[0]:Fabric_Debug_0/count_0/coutA[0]:Q}

# To delete any group let's say group1
delete_active_probe -name {Mygroup1}

# Deleting all probes present in the active probe window
delete_active_probe \
         -all 
		 
# [10]load_active_probe_list: It loads the list of probes from the specified file.
# load_active_probe_list [-deviceName "The parameter is optional if only one device is available in the current configuration."] -file "path to the file"

# syntax:
# load_active_probe_list [-deviceName "device name"] -file "filename"
load_active_probe_list -file {../../../save_active_probe_list.txt}


