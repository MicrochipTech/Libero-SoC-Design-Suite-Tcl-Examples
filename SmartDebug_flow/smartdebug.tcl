#==============================================================================
#This TCL scripts runs the following flow in SmartDebug: 
#Creates a new job project by importing ddc file exported from Libero.
#Runs programming action and then reads the uprom memory content.
#==============================================================================


#set the project name, name of the programmer connected to the board.

set Proj "SASD"
set Prog {E200424DOX}

#Set the location where the project needs to be created

set loc "."

#Delete the project if it already exists at the specified location on disk

file delete -force $Proj

#Create a new project using ddc file exported from Libero

new_project -location "./" -name {SASD} -import_ddc [glob -type f $loc/SASD.ddc] -auto_construct 0 -set_programmer $Prog

#Program all the features selected in export_smart_debug_data command (in libero.tcl)onto the device. 

set_programming_action -name {MPF300T} -action {PROGRAM} 
run_selected_actions 

#command to read device ID code
read_id_code 

#Command to read the uprom memory content, the report is saved under current directory

read_uprom_memory -startaddress {0} -words 96 -fileName "./client.txt"


