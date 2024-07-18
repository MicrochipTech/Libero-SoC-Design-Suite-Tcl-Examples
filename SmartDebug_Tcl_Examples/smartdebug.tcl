#==============================================================================
#File: smartdebug.tcl
#
#Description:
#This TCL scripts runs the following Debug Activites in SmartDebug: 
#Debug on Active Probes
#Debug on Live Probes
#Debug on FHB
#Debug on DDR
#Debug on Memories (LSRAMS,UPROM,sNVM)
#Debug on probe Insertion
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#
#==============================================================================

# Command : read_device_status 
# Description : This Tcl command displays a summary of the device. Device status like ID code, design information, digest information, security and programmer information can be know using this command. Returns a log that can be saved to a file or printed)
# Syntax:
# read_device_status [-deviceName "device name"] [-file "filename"]
# deviceName  -> Optional user-defined device name.
# file        -> Specify path and the name of file where device status will besaved. This parameter is optional.

set loc "../../.."
read_device_status -deviceName "MPF300TS" -file "$loc/device_status.txt"


# To debug Live Probe
source $loc/smartdebug_tcls/Live_probe.tcl

# To debug Active_Probe
source $loc/smartdebug_tcls/Active_Probe.tcl

# To debug Memories
source $loc/smartdebug_tcls/Debug_memories.tcl

# To debug FHB_Features
source $loc/smartdebug_tcls/FHB_Features.tcl

# To debug DDR
source $loc/smartdebug_tcls/DDR.tcl

# To debug Probe_insertion for only Integrated smartdebug_tcls. This feature doesnt work in standalone smartdebug_tcls
source $loc/smartdebug_tcls/Probe_Insertion.tcl

save_log -file $loc/log.txt