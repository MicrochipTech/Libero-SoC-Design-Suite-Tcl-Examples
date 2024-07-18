#==============================================================================
#File: Probe_Insertion.tcl
#
#Description:
# This TCL script used for inserting probes through incremental routing to user-specified I/Os. This feature works in integrated smartdebug only in libero.
#
#
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#==============================================================================

# The Probe Insertion feature is not supported in the SmartDebug Demo and Standalone modes.


# [1]add_probe_insertion_point:It adds a probe point to be connected to user-specified I/Os for probe insertion flow \
  add_probe_insertion_point -net {Specify the name of the existing net to be added to the probe insertion list} \
 -driver {Specify the driver name of the net} \
 -pin {Specify the package pin name (i.e., the I/O to which the net will be routed during probe insertion)} \
 -port {Specify a user-defined name for the probe insertion point}


# syntax:
# add_probe_insertion_point \
         -net "net_name" \
         -driver "driver_name" \
         -pin "pin_name" \
         -port "port_name"
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[5]} \
         -driver {Fabric_Debug_0/count_0/coutA[5]:Q} \
         -pin {AD15} \
         -port {Probe_Insert0} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[4]} \
         -driver {Fabric_Debug_0/count_0/coutA[4]:Q} \
         -pin {A2} \
         -port {Probe_Insert1} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[3]} \
         -driver {Fabric_Debug_0/count_0/coutA[3]:Q} \
         -pin {AA2} \
         -port {Probe_Insert2} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[7]} \
         -driver {Fabric_Debug_0/count_0/coutA[7]:Q} \
         -pin {AB9} \
         -port {Probe_Insert3} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[1]} \
         -driver {Fabric_Debug_0/count_0/coutA[1]:Q} \
         -pin {AC9} \
         -port {Probe_Insert4} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[2]} \
         -driver {Fabric_Debug_0/count_0/coutA[2]:Q} \
         -pin {AD3} \
         -port {Probe_Insert5} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[6]} \
         -driver {Fabric_Debug_0/count_0/coutA[6]:Q} \
         -pin {A3} \
         -port {Probe_Insert6} 
add_probe_insertion_point \
         -net {Fabric_Debug_0/count_0_coutA[0]} \
         -driver {Fabric_Debug_0/count_0/coutA[0]:Q} \
         -pin {A4} \
         -port {Probe_Insert7} 
		 
# [2]remove_probe_insertion_point: Removes a probe point from the probe insertion list.
# remove_probe_insertion_point -net {Specify name of the existing net which is added in probe insertion list} -driver {Specify driver name}

# Syntax:
# remove_probe_insertion_point -net "net_name"\
                              -driver "driver_name"
remove_probe_insertion_point -net {Fabric_Debug_0/count_0_coutA[2]} -driver {Fabric_Debug_0/count_0/coutA[2]:Q} -net {Fabric_Debug_0/count_0_coutA[5]} -driver {Fabric_Debug_0/count_0/coutA[5]:Q}

 		 
# [3]program_probe_insertion:It is used to insert the probes through incremental routing, generate a new bitstream with inserted probe information, and program the device.

# Syntax:
# program_probe_insertion
program_probe_insertion 





