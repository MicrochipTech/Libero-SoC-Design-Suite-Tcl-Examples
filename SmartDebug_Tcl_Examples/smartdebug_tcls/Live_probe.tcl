#==============================================================================
#File: Live_probe.tcl
#
#Description:
#This TCL script performs debugging activities on live probes.
#Live Probes monitor two internal signals simultaneously in the design, eliminating the need to repeat the place-and-route process. 
#For analyzing signals assigned to a Live Probe, use an external analyzer or oscilloscope.
#
#
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#==============================================================================


# [1]set_live_probe: This command assigns channels A and/or B to the specified probe point(s).
#  set_live_probe [-deviceName "This parameter is optional if only one device is available in the current configuration."] \
 [–probeA "Specifies the target probe point for probe channel A."] \
 [–probeB "Specifies the target probe point for probe channel B."]

# Syntax:
#set_live_probe -deviceName "device name" -probeA "probe point A" -probeB "probe point B"
set_live_probe \
-deviceName {MPF300TS} \
-probeA {Fabric_Debug_0/count_0_coutB[7]:Fabric_Debug_0/count_0/coutB[7]:Q} \
-probeB {Fabric_Debug_0/count_0_coutB[0]:Fabric_Debug_0/count_0/coutB[0]:Q} 

# Here, pins H6 and G6 of the PolarFire MPF300TS device are dedicated to two live probe channels. These pins are specific to device used.

# [2]unset_live_probe: This command clears both live probe channels.
# unset_live_probe [-deviceName "This parameter is optional if only one device is available in the current configuration."] \
 [-probeA "Specify 1 or TRUE to unset the live probe on Channel A, otherwise specify 0 or FALSE."] \
 [-probeB "Specify 1 or TRUE to unset the live probe on Channel B, otherwise specify 0 or FALSE."]  

# Syntax:
# unset_live_probe -deviceName "device name" -probeA "TRUE | FALSE" -probeB "TRUE | FALSE"

unset_live_probe -deviceName MPF300TS -probeA 1 
unset_live_probe -deviceName MPF300TS -probeB TRUE

