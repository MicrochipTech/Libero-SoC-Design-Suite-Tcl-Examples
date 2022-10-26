#Clock Constraint Check
grepPattern "DIVCLKIN.*get\_ports.*clk_out.*get\_ports.*clk" 0

if { $err !=0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}