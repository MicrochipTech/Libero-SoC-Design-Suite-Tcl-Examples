read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {C:/ALL_OLD_DATA/20211/IOD_2bitERR/designer/IOG_IOD_DDRX4_COMP/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP_layout_combinational_loops.xml}
report -type slack {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\IOG_IOD_DDRX4_COMP_place_and_route_constraint_coverage.xml}]
set reportfile {C:\ALL_OLD_DATA\20211\IOD_2bitERR\designer\IOG_IOD_DDRX4_COMP\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp