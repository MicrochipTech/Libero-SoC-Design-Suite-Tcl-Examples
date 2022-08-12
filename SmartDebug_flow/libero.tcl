#==============================================================================
#This TCL scripts runs the following flow in Libero: 
#Creates a new Libero project by configuring and instantiating UPROM in SmartDesign. 
#Runs synthesis, place and route, verify timing, generate bitstream, generate debug data and export smart debug data
#==============================================================================


#Set UPROM Core Version
set PF_UPROMver 1.0.109

#Set the top level project name and location where project needs to be created

set Prjname "uPROM_Intel_Hex_1"
set Prjlocation "./$Prjname"

#Delete the project if it already exists at the specified location on disk

file delete -force $Prjlocation

#Set design specific parameters like HDL language, device & package, speedgrade

 set Hdl {VERILOG}
 set Fam {PolarFire}
 set Die {MPF300T}
 set Pkg {FCG1152}
 set Spd {-1}
 set Vtg {1.0}
 set Part {EXT}

#New_project command creates a project directory at the specified disk location. 
#This command is also used to specify the target device and package, as well as the HDL type.

new_project -location $Prjlocation -name $Prjname -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -use_enhanced_constraint_flow 1 -hdl $Hdl -family $Fam -die $Die -package $Pkg -speed $Spd -die_voltage $Vtg -part_range $Part -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:EXT} -adv_options {VCCI_1.2_VOLTR:EXT} -adv_options {VCCI_1.5_VOLTR:EXT} -adv_options {VCCI_1.8_VOLTR:EXT} -adv_options {VCCI_2.5_VOLTR:EXT} -adv_options {VCCI_3.3_VOLTR:EXT} -adv_options {VOLTR:EXT} 


#Create a new SmartDesign component and set it as the root
new_file -type {SmartDesign} -name {sd} 
set_root -module {sd::work} 

#Import UPROM configuration from source directory

add_to_storage \
    -component {sd} \
    -library {} \
    -stream {UPROM_CFG} -file "./src/UPROM.cfg"
	
#instantiate UPROM core in SmartDesign

add_vlnv_instance -component {sd} -library {} -vendor {Actel} -lib {SgCore} -name {PF_UPROM} -version $PF_UPROMver -instance_name {PF_UPROM_0} -promote_all 0 -file_name {} 

#Configure UPROM core instantiated in SmartDesign using the cfg file imported from source folder

configure_vlnv_instance -component {sd} -library {} -name {PF_UPROM_0} -params {"CFGFILE:$Prjlocation/component/work/PF_UPROM/PF_UPROM_0/UPROM.cfg"} -validate_rules 0 
fix_vlnv_instance -component {sd} -library {} -name {PF_UPROM_0} 
configure_design -component {sd} -library {} 

#Promote UPROM pins to top level and generate design

promote_pin_to_top -component {sd} -library {} -pin {PF_UPROM_0:BLK} -pin_create_new {} 
promote_pin_to_top -component {sd} -library {} -pin {PF_UPROM_0:DATAR} -pin_create_new {} 
promote_pin_to_top -component {sd} -library {} -pin {PF_UPROM_0:ADDR} -pin_create_new {} 
promote_pin_to_top -component {sd} -library {} -pin {PF_UPROM_0:BUSY} -pin_create_new {} 
save_design -component {sd} -library {} -file {} -rename 0 
generate_design -component {sd} -library {} -file {} -generator {} -recursive 0 

#Build the design hierarchy by parsing the HDL files and set the top level of the design

build_design_hierarchy

#Run Synthesis with default options. 

if {[catch {run_tool -name {SYNTHESIZE}}]} { 
	puts  "Synthesis failed."
    puts  "${Prjname} SYNTHESIZE -> FAILED"
	incr toolerr 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
	
}

#Run Place and Route with the default options.
 
if {[catch {run_tool -name {PLACEROUTE}}]} { 
	puts  "Place and Route failed."
    puts  "${Prjname} Place and Route -> FAILED"
	incr err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
    return 0
	
}

#Run Verify Timing with the default options.
 
if {[catch {run_tool -name {VERIFYTIMING}}]} { 
	puts  "VERIFYTIMING failed."
    puts  "${Prjname} VERIFYTIMING -> FAILED"
	incr Time_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
	
}

#Generate Programming Data - This step generates database files used in the subsequent tools:
#bitstream generation, configure design initialization and memory etc

if {[catch {run_tool -name {GENERATEPROGRAMMINGDATA}}]} { 
	puts  "GENERATE PROGRAMMING DATA failed."
    puts  "${Prjname} GENERATE PROGRAMMING DATA -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
	
}

#Generate Bitstream - This step generates all the internal files needed to run programming flow in Libero. 

if {[catch {run_tool -name {GENERATEPROGRAMMINGFILE} }]} {
	puts  "GENERATEPROGRAMMINGFILE failed."
    puts  "${Prjname}GENERATEPROGRAMMINGFILE -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
}

#Generate Debug Data - This step generates all the internal files needed to run SmartDebug flow in Libero.

if {[catch {run_tool -name {GENERATEDEBUGDATA} }]} {
	puts  "GENERATE DEBUG DATA failed."
    puts  "${Prjname} GENERATE DEBUG DATA -> FAILED"
	incr Gen_err 
	puts "TEST RUN FAILED";
	save_log -file log_file.txt 
	return 0
}

#Export SmartDebug Data - This step exports ddc file required to run debug in standalone SmartDebug tool. 
#The required parameters can be set directly in export_smart_debug_data tcl command or passed through a procedure as shown below. 

proc export_ddc_g5 { file_name file_location probes package_pins memory_blocks security_data chain programmer_settings ios_states generate_bitstream bitstream_security bitstream_fabric bitstream_snvm} {
export_smart_debug_data \
         -file_name $file_name \
		 -export_dir $file_location \
         -probes $probes \
         -package_pins $package_pins \
         -memory_blocks $memory_blocks \
         -security_data $security_data \
         -chain $chain \
         -programmer_settings $programmer_settings \
         -ios_states $ios_states \
         -generate_bitstream $generate_bitstream \
         -bitstream_security $bitstream_security \
         -bitstream_fabric $bitstream_fabric \
		 -bitstream_snvm  $bitstream_snvm
}

export_ddc_g5 "SASD" "./export" 1 0 1 1 1 1 1 1 0 1 1	
