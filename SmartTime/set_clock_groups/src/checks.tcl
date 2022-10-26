#clock to output Constraint Check
grepPattern ".*CLKIN.*CLKIN1" "No.*Path"

grepPattern ".*CLKIN1.*CLKIN" "No.*Path"

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}