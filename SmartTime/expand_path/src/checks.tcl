#Clock Constraint Check
grepPattern "From: dout_q_Z:CLK" 0

grepPattern "To: dout_q" 0

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}