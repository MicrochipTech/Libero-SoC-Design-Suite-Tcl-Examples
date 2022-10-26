#Clock Constraint Check
grepPattern "Path 1" 0
grepPattern "dout_q_Z:CLK" 1
grepPattern ".*To.*dout_q" 2

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}