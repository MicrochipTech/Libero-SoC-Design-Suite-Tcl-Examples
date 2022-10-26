#External Setup Constraint Check
grepPattern "CLKIN.*External Setup Constraint.*0.200" 3 

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}