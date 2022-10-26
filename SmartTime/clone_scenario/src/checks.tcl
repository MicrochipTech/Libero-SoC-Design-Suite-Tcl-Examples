#Clock Constraint Check
grepPattern "scenario\_A.*scenario\_A\_1" 0

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}