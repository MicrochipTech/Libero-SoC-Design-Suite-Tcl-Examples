#Clock Constraint Check
grepPattern "CLKIN.*dout\_q" 0

if { $err !=0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}