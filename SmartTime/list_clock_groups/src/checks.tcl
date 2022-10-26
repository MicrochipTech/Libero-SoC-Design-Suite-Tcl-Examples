#Clock Constraint Check
grepPattern ".*get\_clocks.*CLKIN" 0

grepPattern ".*get\_clocks.*CLKIN1" 1

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}