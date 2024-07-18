#==============================================================================
#File: libero.tcl
#
#Description:
#This TCL scripts runs the following flow in Libero: 
#Creates a new Libero project by executing all the required core configuration TCLs with necessary user HDL files from src folder.
#Also, Imports all the constraints which are required for the design. 
#Runs synthesis, place and route, verify timing, generate bitstream, Programs the device and runs smartdebug.tcl script.
#
#The device is set to MPF300TS in this TCL
#
#
#==============================================================================

# Setup variables for the new_project command.
source ./custom/parameter.tcl

# Delete the project if it already exists at the specified location on disk

file delete -force $PrjLocation

# Create and configure new project
new_project \
    -name "$Prjname" \
    -location "$PrjLocation" \
    -family $Fam \
    -die $Die \
    -package $Pkg \
    -die_voltage $Vtg \
    -speed $Spd \
    -part_range $Part \
    -hdl $Hdl


# Import the HDL Source file(s)
import_files -library work -hdl_source ./src/hdls/AXI_IF.v
import_files -library work -hdl_source ./src/hdls/CMD_Decoder.v
import_files -library work -hdl_source ./src/hdls/count_chk.v
import_files -library work -hdl_source ./src/hdls/count.v
import_files -library work -hdl_source ./src/hdls/match_data.v
import_files -library work -hdl_source ./src/hdls/uprom_chk.v
build_design_hierarchy


file copy -force "./src/sram.hex" "./$Prjname/sram.hex"
file copy -force "./src/uprom.mem" "./$Prjname/uprom.mem"

# Sourcing the Tcl files for creating individual components under the top level

source ./components/AXI_IF.tcl 
source ./components/DDR4_Splash.tcl 
source ./components/PF_RESET.tcl 
source ./components/DDR4_Interface.tcl 
source ./components/DPSRAM.tcl 
source ./components/Micro_ROM.tcl 
source ./components/URAM.tcl 
source ./components/Fabric_Debug.tcl 
source ./components/PF_CCC_0.tcl 
source ./components/PF_INIT_MON.tcl 
source ./components/SMARTBERT_XCVR_CHK.tcl 
source ./components/TX_PLL_XCVR_0.tcl 
source ./components/XCVR_REF_CLK_0.tcl 
source ./components/XCVR_Debug.tcl 
source ./components/reset_des_sync.tcl 
source ./components/top.tcl 
build_design_hierarchy 

# Select the top module as root.
set_root -module {top::work} 

set_option -synth 1 -fhb 1 -physynth 0 -module {top::work} 

build_design_hierarchy 

save_project

puts "Design generated successfully\n"



# -------------------------------------------------------------------------------------------
# Link Floorplanning constraints (PDC) and associate constraints to Place and route tool
import_files -fp_pdc {./src/fp_constraints_FHB_EN_DDR_EN.pdc}

# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc

# Link user SDC constraints (not expressed by the derived constraints)
# and optionally associate to Synthesis, Place and Route and Timing Verification as needed
import_files -sdc {./src/timing_user_constraints_FHB_EN_DDR_EN.sdc}

# Link Netlist optimization constraints (NDC) and associate constraints to Synthesis tool
#   - NDC contains Libero netlist optimization attributes / constraints

import_files -convert_EDN_to_HDL 0 -ndc {./src/top_fhb.ndc}

# Link I/O constraints (PDC) and associate constraints to Place and route tool
import_files -io_pdc {./src/io_constraints_FHB_EN_DDR_EN.pdc}


organize_tool_files -tool {SYNTHESIZE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/top_fhb.ndc \
    -module {top::work} \
    -input_type {constraint}

organize_tool_files -tool {PLACEROUTE} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/timing_user_constraints_FHB_EN_DDR_EN.sdc \
    -file ${PrjLocation}/constraint/io/io_constraints_FHB_EN_DDR_EN.pdc \
    -file ${PrjLocation}/constraint/fp/fp_constraints_FHB_EN_DDR_EN.pdc \
    -module {top::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ${PrjLocation}/constraint/top_derived_constraints.sdc \
    -file ${PrjLocation}/constraint/timing_user_constraints_FHB_EN_DDR_EN.sdc \
    -module {top::work} \
    -input_type {constraint}

save_project
puts "Imported and derived constraints successfully\n"

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

# Configure and generate Design Initialization Data and Memories
run_tool -name {DEV_MEM_INIT}


configure_snvm -cfg_file {./src/SNVM.cfg} 
configure_ram -cfg_file {./src/RAM.cfg}

generate_design_initialization_data

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

# Export SmartDebug Data - This step exports ddc file required to run debug in standalone SmartDebug tool. 
export_smart_debug_data \
         -file_name {SASD} \
         -export_dir {./src} \
         -probes 1 \
         -package_pins 0 \
         -memory_blocks 1 \
         -security_data 1 \
         -dpk_security 0 \
         -upk1_security 0 \
         -display_security_in_smartdebug 0 \
         -chain 1 \
         -programmer_settings 1 \
         -ios_states 1 \
         -generate_bitstream 1 \
         -bitstream_format {PPD} \
         -bitstream_security 0 \
         -bitstream_fabric 1 \
         -bitstream_snvm 1 \
         -sanitize_snvm 0 \
         -master_include_plaintext_passkey 0 \
         -snvm_data 1 

# Program Device - This step programs the MPF300T device with the generated bitstream 
configure_tool -name {PROGRAMDEVICE} -params {prog_action:PROGRAM}

if {[catch {run_tool -name {PROGRAMDEVICE} }]} {
	puts  "PROGRAMDEVICE FAILED \n"
   } else {
	  puts "PROGRAMDEVICE PASSED \n"
   }       


# Run the SmartDebug tool and source the script to perform Debug on Active Probes, Live Probes, FHB, Probe Insertion, Memories and DDR.

run_tool -name {SMARTDEBUG} -script {./smartdebug.tcl} 

save_project
close_project