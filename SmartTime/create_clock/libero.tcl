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

#Timing Reports Check
set max_violations_report "./exprj/designer/top/top_max_timing_multi_corner.csv"

set min_violations_report "./exprj/designer/top/top_min_timing_multi_corner.csv"

if {[countPattern "CLKIN,Clock Constraint.*10.000" ${max_violations_report} ] == 3 } {
	puts "\nINFO:_TC Clock Constraint Value CLKIN = 10 ns is Matched with SDC Value in max analysis"	
} else {
	puts "\nERROR:_TC Clock Constraint Value is not Matched with SDC Value in max analysis"
	incr err
}

if {[grepPattern "Input Delay Constraint.*2.100" ${max_violations_report} ] == 1 } {
	puts "\nINFO:_TC Input Delay Constraint Value = 2.1 ns is Matched with SDC Value in max analysis"	
} else {
	puts "\nERROR:_TC Input Delay Constraint Value is not Matched with SDC Value in max analysis"
	incr err
}

if {[grepPattern "Output Delay Constraint.*1.200" ${max_violations_report} ] == 1 } {
	puts "\nINFO:_TC Output Delay Constraint Value = 1.2 ns is Matched with SDC Value in max analysis"	
} else {
	puts "\nERROR:_TC Output Delay Constraint Value is not Matched with SDC Value in max analysis"
	incr err
}

if {[grepPattern "Input Delay Constraint.*2.100" ${min_violations_report} ] == 1 } {
	puts "\nINFO:_TC Input Delay Constraint Value = 2.1 ns is Matched with SDC Value in min analysis"	
} else {
	puts "\nERROR:_TC Input Delay Constraint Value is not Matched with SDC Value in min analysis"
	incr err
}

if {[grepPattern "Output Delay Constraint.*1.200" ${min_violations_report} ] == 1 } {
	puts "\nINFO:_TC Output Delay Constraint Value = 1.2 ns is Matched with SDC Value in min analysis"	
} else {
	puts "\nERROR:_TC Output Delay Constraint Value is not Matched with SDC Value in min analysis"
	incr err
}

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}
save_log -file {./test_log_file.txt} 

close_project -save 1;
