#-------------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
# This script creates new project, imports src/top.v design and timing constraint file.
# Runs synthesis, place and route, configures SPI Flash client, runs generate bitstream, export bitstream, export FPExpress job and export SPI Flash image.
# configures programming actions and runs device and SPI Flash programming if hardware is connected
# The device is set to MPF100TS in this TCL but can be changed to any desired PolarFire device
#
# Usage: <Libero install path>libero script:libero.tcl
#-------------------------------------------------------------------------------


# Setup variables for the new_project command.
#
source custom/parameters.tcl;

set libero_cmd "new_project \
                -location {./exprj} -name {exprj} \
                -family {$prj_family} -die {$prj_die} -package {$prj_package} \
                -speed {$prj_speed} \
                -hdl {VERILOG}";


# Remove any existing project first.
#
eval file delete -force ./exprj;

# Create new project
eval $libero_cmd;

# Import the HDL file(s) and SDC file(s)
#
import_files -hdl_source {./src/top.v};
import_files -sdc {./src/example.sdc};

# Select the top module as root.
#
build_design_hierarchy;
set_root top;

# Associate the constraint file in the project with Verify Timing.
#
organize_tool_files -tool {VERIFYTIMING} \
    -file "./exprj/constraint/example.sdc" -input_type {constraint};


# Configure VERIFYTIMING tool to generate a txt file report
#
configure_tool -name {VERIFYTIMING} -params {FORMAT:TEXT};


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

# Configure SPI Flash client

configure_spiflash -cfg_file {./src/spiflash.cfg}


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

# Generate SPI Flash Image

puts "Run GENERATESPIFLASHIMAGE ..."
if {[catch {run_tool -name {GENERATE_SPI_FLASH_IMAGE} }] } {
	  puts "Generate SPI_FLASH_IMAGE FAILED \n"
   } else {
	  puts "Generate SPI_FLASH_IMAGE PASSED \n"
   }       


# Run Export Bitstream to export programming files in any of the desired formats - stp,dat,svf.

puts "Run EXPORTPROGRAMMINGFILE ..."	
export_bitstream_file \
         -file_name {test} \
         -format {STP DAT PPD } \
         -limit_SVF_file_size 0 \
         -limit_SVF_file_by_max_filesize_or_vectors {SIZE} \
         -svf_max_filesize {1024} \
         -svf_max_vectors {1000} \
         -trusted_facility_file 1 \
         -trusted_facility_file_components {FABRIC SNVM} \
         -zeroization_likenew_action 0 \
         -zeroization_unrecoverable_action 0
         

# Run Export programming job to export job file that can be used to do programming using standalone FPExpress
# set -program_spi_flash 1 if you want to include SPI Flash image in the exported job

export_prog_job \
         -job_file_name {test} \
         -bitstream_file_type {TRUSTED_FACILITY} \
         -bitstream_file_components {FABRIC SNVM} \
         -zeroization_likenew_action 0 \
         -zeroization_unrecoverable_action 0 \
         -program_design 1 \
         -program_spi_flash 0 \
         -design_bitstream_format {PPD}

# Export SPI Flash image file

puts "Run EXPORTSPIFLASHIMAGE.."
if {[catch {export_spiflash_image -file_name {test} }] } {
	  puts "Export SPI_FLASH_IMAGE FAILED \n"
   } else {
	  puts "Export SPI_FLASH_IMAGE PASSED \n"
   }       


# Uncomment the below commands if you have hardware connected and plan on running programming. 
# Use configure_tool command to select the programming actions - program,verify etc

#configure_tool -name {PROGRAMDEVICE} -params #{prog_action:PROGRAM}  
#if {[catch {run_tool -name {PROGRAMDEVICE} }]} {
#	puts "PROGRAM_FAILED"
#	} else {
#	puts "PROGRAM_SUCCESSFUL" }


#configure_tool -name {PROGRAMDEVICE} -params #{prog_action:VERIFY}  
#if {[catch {run_tool -name {PROGRAMDEVICE} }]} {
#	puts "VERIFY_FAILED"
#	} else {
#	puts "VERIFY_SUCCESSFUL" }

#configure_tool -name {PROGRAMDEVICE} -params #{prog_action:DEVICE_INFO} 
#if {[catch {run_tool -name {PROGRAMDEVICE} }]} {
#	puts "DEVICE_INFO_FAILED"
#	} else {
#	puts "DEVICE_INFO_SUCCESSFUL" }


# Command to run SPI Flash Programming in Libero

#configure_tool -name {PROGRAM_SPI_FLASH_IMAGE} \
#if {[catch {run_tool -name {PROGRAM_SPI_FLASH_IMAGE} }]} {
#	puts "PROGRAMSPIFLASH_FAILED"
#	} else {
#	puts "PROGRAMSPIFLASH_SUCCESSFUL" }


# Save and close project
save_project
close_project








