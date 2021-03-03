#-------------------------------------------------------------------------------
#
#  File: create_scenario.tcl
#        Example Libero script.
#
#-------------------------------------------------------------------------------

puts "===== In create_scenario.tcl =====\n";

# Setup variables for the new_project command.
# Not all arguments are mandatory.
#

set prj_location   "./myprj";
set prj_name       "myprj";
set prj_family     "PolarFire";
set prj_die        "MPF100T";
set prj_package    "FCSG325";
set prj_speed      "-1";
set prj_hdl        "VERILOG";

set libero_cmd "new_project \
                -location {$prj_location} -name {$prj_name} \
                -family {$prj_family} -die {$prj_die} -package {$prj_package} \
                -speed {$prj_speed} \
                -hdl {$prj_hdl}";


# Remove any existing project first.
#
eval file delete -force $prj_location;

eval $libero_cmd;

# Import the HDL and constraint file to the project.
#
import_files -hdl_source {./src/Top.v};
import_files -sdc {./src/user.sdc};


#Select a root before running organize_tool_files -tool command.
#
build_design_hierarchy
set_root -module {Top::work}
build_design_hierarchy


# Associate the constraint file in the project with differet Libero steps.
# Note: Associate the imported file in the constraint directory,
# not the orginal source file.
#
organize_tool_files -tool {SYNTHESIZE} \
    -file "$prj_location/constraint/user.sdc" -input_type {constraint};
organize_tool_files -tool {PLACEROUTE} \
    -file "$prj_location/constraint/user.sdc" -input_type {constraint};
organize_tool_files -tool {VERIFYTIMING} \
    -file "$prj_location/constraint/user.sdc" -input_type {constraint};


# Now run the flow
#
puts "===== SYNTHESIZE =====\n";
run_tool -name {SYNTHESIZE};
puts "===== COMPILE =====\n";
run_tool -name {COMPILE};
puts "===== PLACEROUTE =====\n";
run_tool -name {PLACEROUTE};
puts "===== VERIFYTIMING =====\n";
run_tool -name {VERIFYTIMING} -script {./create_scenario.tcl};


# Save and close the project
#
close_project -save 1 

