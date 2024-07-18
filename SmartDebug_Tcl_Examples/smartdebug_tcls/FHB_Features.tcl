#==============================================================================
#File: FHB_Features.tcl
#
#Description:
#This Tcl script performs debugging activities on FHB.
#The controls for FHB in the SmartDebug UI enable us to manage the debugging cycle.
#The FPGA Hardware Breakpoints (FHB) auto-instantiation feature automatically creates an FHB instance for each clock domain that utilizes clocks (GL0, GL1, GL2, and GL3) from an FCCC instance. 
#
#The device is set to MPF300TS in this TCL but can be changed to any desired PolarFire device
#
#==============================================================================


# ####### FHB instances control the gating of the clock domain in which they are implemented. They can be used to forcibly halt the design. After pausing a selected clock domain, or all clock domains, 
# we have the option to either continue ('play'/'run') or step through the clock domains that have been selected or all of them.
# (1)arm trigger: It is used to halt the DUT at the next positive edge occurring on the signal connected to Live Probe PROBE_A.
#fhb_control [-deviceName "Specify device name. This parameter is optional if only one device is available in the current configuration."] \
  -arm_trigger "Specifies to arm FHB configuration for the specified clock domain" \
  –trigger_signal {Set the trigger signal to arm the FHBs.} \
  –trigger_edge_select {Specifies the trigger signal edge to arm the FHBs,FHBs will be armed on rising edge of trigger signal}\
  -delay {Sepcifies the value between 0 to 255 of delay cycles before halt} \
  -clock_domain {Specifies clock domain names to halt|run|step|reset|disarm|,can be single or multiple clock domains, halted in order specified by user} \
  -clock_domain_status {Specifies to read and display status of specified clock domain(s),can be single or multiple clock domains} \
  -disarm_trigger {Specifies to disarm FHB configuration for the specified clock domain}

# Syntax:
# fhb_control -deviceName "device name" \
  -arm_trigger \
  –trigger_signal {probe point signal to trigger the HALT operation} \
  –trigger_edge_select {rising}\
  -delay { delay cycles} \
  -clock_domain {clock domain name(s)/all} \
  -clock_domain_status \
  -disarm_trigger 
fhb_control -deviceName {MPF300TS} \
-arm_trigger -trigger_signal {Fabric_Debug_0/count_0_coutA[2]:Fabric_Debug_0/count_0/coutA[2]:Q} \
-trigger_edge_select {rising} -delay 8 \
-clock_domain {"DDR4_Interface_0/DDR4_0/CCC_0/clkint_4" "PF_CCC_0_0/PF_CCC_0_0/clkint_0"} \
-clock_domain_status \
-disarm_trigger\
-trigger_edge_select {rising} 

# We add signals to Active Probes and read them to verify the design's functionality with the help of 'select_active_probe' command.
# Probes are selected using wildcards, as demonstrated below.
set selected_probes [select_active_probe \
         -name {*coutA[*]:*} \
		 -reset 0 ]	

read_active_probe 
 

# (2)Force halt: This function allows us to stop a clock domain immediately, without the need to wait for a trigger signal from a live probe.
# fhb_control -deviceName {Parameter is optional if only one device is available in the current configuration} \
-halt {Specifies to halt the clock} -clock_domain {clock domain name(s)/all}


# Syntax:
# fhb_control -deviceName "device name" -halt \
 -clock_domain {clock domain name(s)/all}
fhb_control -halt -clock_domain {"DDR4_Interface_0/DDR4_0/CCC_0/clkint_4" "PF_CCC_0_0/PF_CCC_0_0/clkint_0"} 
read_active_probe 
 
 
# (3)step:Once the clock domain is in a halted state (due to a live probe halt or a forced halt), we can click the 'Step' button to advance the clock domain by one clock cycle and hold its state.# fhb_control -deviceName {Parameter is optional if only one device is available in the current configuration} \
-step {Specifies to step the clock "number of steps" times. Minimum value is 1} -clock_domain {clock domain name(s)/all}

# Syntax:
# fhb_control -deviceName "device name" -step {number of steps} \
 -clock_domain {clock domain name(s)/all}
fhb_control -step 1 -clock_domain {"DDR4_Interface_0/DDR4_0/CCC_0/clkint_4" "PF_CCC_0_0/PF_CCC_0_0/clkint_0"} 
read_active_probe 
 
# (4)Run: using run on the FPGA Hardware Breakpoint controls will resume the clock domain from its halted state.
# fhb_control -deviceName {Parameter is optional if only one device is available in the current configuration} \
-run {Specifies to run the clock} -clock_domain {clock domain name(s)/all}


# Syntax: 
# fhb_control -deviceName "device name" -run \
  -clock_domain {clock domain name(s)/all}
fhb_control -run -clock_domain {"DDR4_Interface_0/DDR4_0/CCC_0/clkint_4" "PF_CCC_0_0/PF_CCC_0_0/clkint_0"} 
read_active_probe 
 
# (5)Waveform capture: We can save the waveform view of the selected active probes using using "capture_waveform" 
# fhb_control -deviceName {Parameter is optional if only one device is available in the current configuration} \
 -capture_waveform {Specifies to capture waveform of all the added signals to active probes in the specified clock domain for "number of steps"} \
 -vcd_file {Target file to save the data and see the waveform}

#Syntax:
#fhb_control -deviceName "device name" \
 -capture_waveform "integer value" \
 -vcd_file "Waveform File"
fhb_control -capture_waveform 10 -vcd_file {../../../waveform_1.vcd} 

#To view the signals exported by the SmartDebug in the .vcd file, use the Modelsim Waveform window.


# ###Some of the FHB-related features run on signals that are assigned to Channel A through the Live Probe feature, such as 'event_counter'.
set_live_probe -deviceName {MPF300TS} -probeA {Fabric_Debug_0/count_0_coutA[0]:Fabric_Debug_0/count_0/coutA[0]:Q} -probeB {} 

# Enabling FHB auto-instantiation enables the Event Counter.
# (6)event counter:It counts the number of positive-edge transitions.
# event_counter -run "Run event counter" -stop "Stop event counter" -after {duration in seconds}

# Syntax:
# event_counter -deviceName "device name" -run "TRUE | FALSE" -stop "TRUE| FALSE" -after "integer value"

event_counter -run 
event_counter -stop -after 20 


# (7)get_user_clk_frequency:It shows the frequencies that have been configured from the FCCC block.
# get_user_clock_frequencies [-deviceName "Specify device name. This parameter is optional if only one device is available in the current configuration."]

# Syntax:
# get_user_clock_frequencies -deviceName "device name"
get_user_clock_frequencies -deviceName {MPF300TS}

