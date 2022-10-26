#Max delays check
grepPattern ".*get\_ports.*\{din\_b\}.*1" 0


if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}