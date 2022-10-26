#-------------------------------------------------------------------------------
# File: libero.tcl
#
# Description:
#  This script creates new project, imports src/top.v design and constraint files.
#  Configures VERIFYTIMING tool for all possible timing verifications.
#  Runs the following Libero steps: SYNTHESIZE, PLACEROUTE and VERIFYTIMING.
#  SmartTime command usage is described in src/example.sdc.
#
# Usage: <Libero install path>libero script:libero.tcl
#-------------------------------------------------------------------------------


# Setup variables for the new_project command.
#
source custom/parameters.tcl;
source src/common.tcl;					  

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
configure_tool -name {VERIFYTIMING} -params {FORMAT:CSV};


# Now run the flow
#
run_tool -name {SYNTHESIZE};
run_tool -name {PLACEROUTE};
run_tool -name {VERIFYTIMING};

source src/checks.tcl;
save_log -file {./test_log_file.txt}	
				  
close_project -save 1;
