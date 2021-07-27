#-------------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
# This script creates a new Libero project and builds IOD design by importing the verilog source files and instantiating required components in SmartDesign.  
# Runs synthesis, place and route, Generate FPGA Array data, generate bitstream and program design. This script calls SmartDebug_IOD_Debug.tcl which runs the debug commands in SmartDebug tool.
# The device is set to MPF300T in this TCL but can be changed to any desired PolarFire device (if changing device, modify io.pdc file under src folder as per the new device). 
#
# Usage: <Libero install path>libero script:libero.tcl
#-------------------------------------------------------------------------------

# Setup variables for the new_project command.
#
source custom/parameters.tcl;

set libero_cmd "new_project \
                -location {./IOD_2bit_1400} -name {IOD_2bit_1400} \
                -family {$prj_family} -die {$prj_die} -package {$prj_package} \
                -speed {$prj_speed} \
                -hdl {VERILOG}";

# Remove any existing project first.
eval file delete -force ./IOD_2bit_1400;

# Create new project
eval $libero_cmd;


# Import the HDL file(s)

import_files -library work -hdl_source ./src/debounce.v
import_files -library work -hdl_source ./src/prbscheck_parallel_fab.v
import_files -library work -hdl_source ./src/prbsgen_parallel_fab.v
import_files -library work -hdl_source ./src/rev_bits.v
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level

source components/CORERXIODBITALIGN_C0.tcl 
source components/PF_CCC_C0.tcl 
source components/PF_IOD_TX_CCC_C0.tcl 
source components/PF_OSC_C1.tcl 
source components/PF_IOD_GENERIC_RX_C1_TR.tcl 
source components/PF_IOD_GENERIC_RX_C1.tcl 
source components/PF_IOD_GENERIC_TX_C0.tcl 
source components/IOG_IOD_DDRX4_COMP.tcl 
build_design_hierarchy

# importing PDC file for IO placement
import_files -io_pdc {./src/io.pdc};

# Select the top module as root.

build_design_hierarchy;

set_root IOG_IOD_DDRX4_COMP;


organize_tool_files -tool {PLACEROUTE} -file "./IOD_2bit_1400/constraint/io/io.pdc" -input_type {constraint};
# Now run the flow


# Run synthesis with default options
puts "Run SYNTHESIS ..."
if {[catch {run_tool -name {SYNTHESIZE}  }] } {
	  puts "SYNTHESIZE FAILED \n"
   } else {
	  puts "SYNTHESIZE PASSED \n"
   }       

# Configure Place and route tool
configure_tool -name {PLACEROUTE} -params {EFFORT_LEVEL:true} -params {REPAIR_MIN_DELAY:true} -params {TDPR:true} -params {IOREG_COMBINING:true}


# Run Place and Route

puts "Run PLACE & ROUTE ..."
if {[catch {run_tool -name {PLACEROUTE}  }] } {
	  puts "PLACEROUTE FAILED \n"
   } else {
	  puts "PLACEROUTE PASSED \n"
   }       

# Run Timing Verification 

puts "Run VERIFYTIMING ..."
if {[catch {run_tool -name {VERIFYTIMING}  }] } {
	  puts "VERIFYTIMING FAILED \n"
   } else {
	  puts "VERIFYTIMING PASSED \n"
   }       

# Generate Programming Data

puts "Run GENERATEPROGRAMMINGDATA ..."
if {[catch {run_tool -name {GENERATEPROGRAMMINGDATA}  }] } {
	  puts "GENERATEPROGRAMMINGDATA FAILED \n"
   } else {
	  puts "GENERATEPROGRAMMINGDATA PASSED \n"
   }       

save_project

# Generate initialization data

generate_design_initialization_data 


# Configure Generate Bitstream to enable/disable the components to program

configure_tool \
         -name {GENERATEPROGRAMMINGFILE} \
         -params {program_fabric:true} \
         -params {program_security:false} \
	    -params {sanitize_snvm:false} 


# Run Generate Bitstream - This step generates all the internal files needed to run programming flow in Libero. 

puts "Run GENERATEPROGRAMMINGFILE ..."
if {[catch {run_tool -name {GENERATEPROGRAMMINGFILE}  }] } {
	  puts "GENERATEPROGRAMMINGFILE FAILED \n"
   } else {
	  puts "GENERATEPROGRAMMINGFILE PASSED \n"
   }       

# Generate Debug Data - This step generates all the internal files needed to run SmartDebug flow in Libero.

puts "Run GENERATEDEBUGDATA ..."
if {[catch {run_tool -name {GENERATEDEBUGDATA} }]} {
	puts  "GENERATE DEBUG DATA FAILED \n"
   } else {
	  puts "GENERATE DEBUG DATA PASSED \n"
   }       

# Program Device - This step programs the MPF300T device with the generated bitstream 


configure_tool -name {PROGRAMDEVICE} -params {prog_action:PROGRAM}
if {[catch {run_tool -name {PROGRAMDEVICE} }]} {
	puts  "PROGRAMDEVICE FAILED \n"
   } else {
	  puts "PROGRAMDEVICE PASSED \n"
   }       

catch { run_tool -name {SMARTDEBUG} -script {./SmartDebug_IOD_Debug.tcl} }

save_project
close_project
