#clock to output Constraint Check
grepPattern "CLKIN.*Clock To Out Constraint.*0.200" 4 

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}