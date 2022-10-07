# -------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
# This script creates a new Libero project and builds simple PCIe(Single Lane,Gen2)based design by instantiating required components in SmartDesign.  
# Runs synthesis, place and route, Generate FPGA Array data, generate bitstream and program design. This script calls .tcl which runs the commands in SmartDebug tool to read the register associated with PCIe instance in Design.
# The device is set to MPF300T in this TCL but can be changed to any desired PolarFire/PolarFireSoc devices (if changing device, modify io_constraints.pdc and fp_constraints.pdc file under src folder as per the new device). 
#
# Usage: <Libero install path>libero script:libero.tcl
# -------------------------------------------------------------------------------

# Setup variables for the new_project command.
#
source custom/parameters.tcl;


set libero_cmd "new_project \
                -location {./PCIe_Register_Read} -name {PCIe_Register_Read} \
                -family {$prj_family} -die {$prj_die} -package {$prj_package} \
                -speed {$prj_speed} \
                -hdl {VERILOG}";


set Proj "PCIe_Register_Read"

# Remove any existing project first.
eval file delete -force ./PCIe_Register_Read;

# Create new project
eval $libero_cmd;

#Sourcing the Tcl files for creating individual components under the top level

set components {PF_CCC_C0 PF_OSC_C0 PF_PCIE_C0 PF_TX_PLL_C0 TOP}

foreach component $components {
        source ./custom/$component.tcl
}

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

set_root TOP

build_design_hierarchy;


# -------------------------------------------------------------------------------------------
# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc

# -------------------------------------------------------------------------------------
# Link constraints and associate to Synthesis, Place and Route and Timing Verification 
# Below is an example

organize_tool_files -tool {SYNTHESIZE} \
    -file ./PCIe_Register_Read/constraint/TOP_derived_constraints.sdc \
    -module {TOP::work} \
    -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file ./PCIe_Register_Read/constraint/TOP_derived_constraints.sdc \
    -file ./PCIe_Register_Read/constraint/io/io_constraints.pdc \
    -file ./PCIe_Register_Read/constraint/fp/fp_constraints.pdc \
    -module {TOP::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ./PCIe_Register_Read/constraint/TOP_derived_constraints.sdc \
    -module {TOP::work} \
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
   
# Run the SmartDebug tool and source the script to read the PCIe registers.
catch { run_tool -name {SMARTDEBUG} -script {src/smartdebug.tcl} }

save_project
close_project