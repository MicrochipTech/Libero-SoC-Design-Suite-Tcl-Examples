#clock to output Constraint Check
grepPattern "^Path.*dout_q,.*" 0 1

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}