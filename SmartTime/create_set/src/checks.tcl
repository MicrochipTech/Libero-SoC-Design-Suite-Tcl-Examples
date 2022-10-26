#Clock Constraint Check
grepPattern "From: clk" 0

grepPattern "To: din_a_q:CLK" 0

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}