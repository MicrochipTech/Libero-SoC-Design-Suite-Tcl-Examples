# -------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
# This script creates a new Libero project and builds XCVR Single Lane design by importing the verilog source files and instantiating required components in SmartDesign.  
# Runs synthesis, place and route, Generate FPGA Array data, generate bitstream and program design. This script calls SmartDebug_XCVR_Debug.tcl which runs the debug commands in SmartDebug tool.
# The device is set to MPF300T in this TCL but can be changed to any desired PolarFire/PolarFirSoc devices (if changing device, modify io_constraints.pdc and  fp_constraints.pdc files under src folder as per the new device). 
#
# Usage: <Libero install path>libero script:libero.tcl
# -------------------------------------------------------------------------------

# Setup variables for the new_project command.
#
source custom/parameters.tcl;

set libero_cmd "new_project \
                -location {./XCVR_Single_Lane} -name {XCVR_Single_Lane} \
                -family {$prj_family} -die {$prj_die} -package {$prj_package} \
                -speed {$prj_speed} \
                -hdl {VERILOG}";

# Remove any existing project first.
eval file delete -force ./XCVR_Single_Lane;

# Create new project
eval $libero_cmd;


#Sourcing the Tcl files for creating individual components under the top level

source components/PF_TX_PLL_0.tcl 
source components/PF_XCVR_REF_CLK_0.tcl 
source components/SmartBert_Core_0.tcl 
source components/top.tcl 


build_design_hierarchy


# -------------------------------------------------------------------------------------------
# Link I/O constraints (PDC) and associate constraints to Place and route tool
    
import_files -io_pdc {./src/io_constraints.pdc}
 
# -------------------------------------------------------------------------------------------
# Link Floorplanning constraints (PDC) and associate constraints to Place and route tool
# Below is an example
import_files -fp_pdc {./src/fp_constraints.pdc}


# Select the top module as root.
build_design_hierarchy;

set_root top

# -------------------------------------------------------------------------------------------
# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc



# -------------------------------------------------------------------------------------------
# Link user SDC constraints (not expressed by the derived constraints)
# and optionally associate to Synthesis, Place and Route and Timing Verification as needed
# Below is an example
#import_files -sdc {./src/src_constraints/timing_user_constraints.sdc}
organize_tool_files -tool {SYNTHESIZE} \
    -file ./XCVR_Single_Lane/constraint/top_derived_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file ./XCVR_Single_Lane/constraint/top_derived_constraints.sdc \
    -file ./XCVR_Single_Lane/constraint/io/io_constraints.pdc \
    -file ./XCVR_Single_Lane/constraint/fp/fp_constraints.pdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ./XCVR_Single_Lane/constraint/top_derived_constraints.sdc \
    -module {top::work} \
    -input_type {constraint}


save_project
puts "Imported and derived constraints successfully\n"


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


# Run the SmartDebug tool and source the script to read the error counter .

catch { run_tool -name {SMARTDEBUG} -script {./SmartDebug_XCVR_Debug.tcl} }

save_project
close_project