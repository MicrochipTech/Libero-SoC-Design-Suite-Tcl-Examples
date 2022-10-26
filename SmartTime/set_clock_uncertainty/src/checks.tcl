#Clock Uncertainity Check
grepPattern "clock uncertainty.*0.400" 0

#Input Delay Constraint Check
grepPattern "Input Delay Constraint.*2.100" 1 

#Output Delay Constraint Check
grepPattern "Output Delay Constraint.*1.200" 2


if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}