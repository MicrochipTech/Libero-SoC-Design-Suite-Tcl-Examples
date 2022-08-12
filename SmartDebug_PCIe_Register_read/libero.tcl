# -------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
# This script creates a new Libero project and builds PCIe EndPoint design (DG0756_PF_PCIe_EP) by importing the verilog source files and instantiating required components in SmartDesign.  
# Runs synthesis, place and route, Generate FPGA Array data, generate bitstream and program design. This script calls SmartDebug_PCIe_Register_read.tcl which runs the commands in SmartDebug tool to read the register associated with PCIe instance in Design.
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


# Import the HDL file(s)

import_files \
         -convert_EDN_to_HDL 0 \
         -hdl_source "./src/AXI_IO_CTRL.v" \
         -hdl_source "./src/AXI4DMA_INIT.v" \
         -hdl_source "./src/CMD_CTRLR.v" \
         -hdl_source "./src/Debounce.v" \
         -hdl_source "./src/PATTERN_GEN_CHECKER.v" \
         -hdl_source "./src/SW_Debounce.v" \

build_design_hierarchy


#Sourcing the Tcl files for creating individual components under the top level
# Note: For the G5SoC (PolarFireSoC) Device , change PF_INIT_MONITOR to PFSOC_INIT_Monitor in "PCIe_INIT_MONITOR.tcl" under component folder.

set components {axi4dma_init axi_io_ctrl pattern_gen_checker AHBtoAPB AXI4_Interconnect AXItoAHBL CCC_111MHz CLK_DIV2 CoreAXI4_Lite CoreDMA_Controller Core_AHBL Core_APB Core_UART NGMUX OSC_160MHz PCIe_INIT_MONITOR PCIe_TX_PLL PF_DDR3_SS PF_DDR4_SS PF_RESET SRAM_AXI tpsram UART_SD CoreDMA_IO_CTRL AXItoAPB PCIe_TL_CLK PCIe_EP PCIe_EP_Demo}



foreach component $components {
        source ./components/$component.tcl
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

set_root PCIe_EP_Demo

build_design_hierarchy;


# -------------------------------------------------------------------------------------------
# Derive SDC constraints from the design and the configured cores generated constraints
derive_constraints_sdc

# -------------------------------------------------------------------------------------------
# Link user SDC constraints (not expressed by the derived constraints)
# and optionally associate to Synthesis, Place and Route and Timing Verification as needed
# Below is an example
import_files -sdc {./src/timing_user_constraints.sdc}
organize_tool_files -tool {SYNTHESIZE} \
    -file ./PCIe_Register_Read/constraint/PCIe_EP_Demo_derived_constraints.sdc \
    -file ./PCIe_Register_Read/constraint/timing_user_constraints.sdc \
    -module {PCIe_EP_Demo::work} \
    -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file ./PCIe_Register_Read/constraint/PCIe_EP_Demo_derived_constraints.sdc \
    -file ./PCIe_Register_Read/constraint/timing_user_constraints.sdc \
    -file ./PCIe_Register_Read/constraint/io/io_constraints.pdc \
    -file ./PCIe_Register_Read/constraint/fp/fp_constraints.pdc \
    -module {PCIe_EP_Demo::work} \
    -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file ./PCIe_Register_Read/constraint/PCIe_EP_Demo_derived_constraints.sdc \
    -file ./PCIe_Register_Read/constraint/timing_user_constraints.sdc \
    -module {PCIe_EP_Demo::work} \
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
catch { run_tool -name {SMARTDEBUG} -script {./SmartDebug_PCIe_Register_read.tcl} }

save_project
close_project