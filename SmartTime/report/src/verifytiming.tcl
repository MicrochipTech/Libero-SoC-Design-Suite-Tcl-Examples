#------------------------------------------------------------
# File: verifytiming.tcl
# Description: Demonstrate usage of report command.
#------------------------------------------------------------

# Generate timing report with text format named example.txt
report -type timing \
       -analysis max \
       -max_paths 10000 \
       -format text \
       "./exprj/timing_report.txt"
