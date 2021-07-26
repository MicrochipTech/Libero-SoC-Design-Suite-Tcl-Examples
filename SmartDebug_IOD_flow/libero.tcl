#==============================================================================
# This TCL scripts runs the following flow in Libero: 
# Opens the IOD design in Libero
# Runs synthesis, place and route, verify timing, generate bitstream, program bitstream, generate debug data and export smart debug data
#This Libero project uses MPF300T device
#==============================================================================

# Set the top level project name and location where project needs to be created

set Prjname "IOD_2bit_1400"


open_project -file {./src/IOD_2bit_1400/IOD_2bit_1400.prjx} -do_backup_on_convert 0



# Generate Programming Data - This step generates database files used in the subsequent tools:

if {[catch {run_tool -name {GENERATEPROGRAMMINGDATA}}]} { 
	puts  "GENERATE PROGRAMMING DATA failed."
    puts  "${Prjname} GENERATE PROGRAMMING DATA -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
	
}

# Generate Bitstream - This step generates all the internal files needed to run programming flow in Libero. 

if {[catch {run_tool -name {GENERATEPROGRAMMINGFILE} }]} {
	puts  "GENERATEPROGRAMMINGFILE failed."
    puts  "${Prjname}GENERATEPROGRAMMINGFILE -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
}

# Generate Debug Data - This step generates all the internal files needed to run SmartDebug flow in Libero.

if {[catch {run_tool -name {GENERATEDEBUGDATA} }]} {
	puts  "GENERATE DEBUG DATA failed."
    puts  "${Prjname} GENERATE DEBUG DATA -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
}


# Program Device - This step programs the MPF300T device with the generated bitstream 


configure_tool -name {PROGRAMDEVICE} -params {prog_action:PROGRAM}
run_tool -name {PROGRAMDEVICE}

catch { run_tool -name {SMARTDEBUG} -script {./SmartDebug_IOD_Debug.tcl} }

