#Clock Constraint Check
grepPattern "create_clock" 0
grepPattern "set_input_delay" 1
grepPattern "set_output_delay" 2

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}