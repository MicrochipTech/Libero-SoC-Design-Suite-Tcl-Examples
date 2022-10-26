#Clock Constraint Check
grepPattern "clk_group.*CLKIN" 0

grepPattern "clk_group.*CLKIN1" 1

if { $err !=0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}