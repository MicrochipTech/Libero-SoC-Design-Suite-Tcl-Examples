#Max delay check
grepPattern ".*get\_ports.*dout\_q.*3\.8" 0


if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}