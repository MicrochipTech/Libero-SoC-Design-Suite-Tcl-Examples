set err 0
set found 0

set sdc_file "./exprj/example_1.sdc"
set map_var(0) "create_clock constraint"
set map_var(1) "set_input_delay constraint"
set map_var(2) "set_output_delay constraint"

##########################################################
# Procedure: grepPattern                                 #
# Args: ex -> pattern ex                                 #
#       dumped_file -> file dumped_file                  #
# Description:                                           #
# Search the pattern ex in file dumped_file              #
# Returns 0 if the pattern has not been found and 1 else #
##########################################################

proc grepPattern { ex num} \
{
	#Timing Reports Check
	global sdc_file
	global map_var
	global found
	global err
	set f_id_1 [open $sdc_file]

	while {[eof $f_id_1]==0} \
	{
		set line_tokens [gets $f_id_1]
		if {[regexp $ex "$line_tokens"]==1} \
		{
			
			puts "\nINFO: $map_var($num) is written in example_1.sdc"
			set found 1	
		}
	}
	
	if { $found == 0 } {
	puts "\nINFO: $map_var($num) is not written in example_1.sdc"
	incr err
	set found 0	
	}
}
##########################################################
# Procedure: countPattern                                #
# Args: ex -> pattern ex                                 #
#       dumped_file -> file dumped_file                  #
# Description:                                           #
# Search the pattern ex in file dumped_file              #
# Returns the number of pattern occurences               #
########################################################## 

proc countPattern { ex num } \
{
	#Timing Reports Check
	global max_violations_report
	global min_violations_report
	global map_var
	set f_id_1 [open $max_violations_report]
	set i 0
	while {[eof $f_id_1]==0} \
	{
		set line_tokens [gets $f_id_1]
		if {[regexp $ex "$line_tokens"]==1} \
		{
		    incr i
		}
	}
	puts "\n$i occurences of $map_var($num) were found in max analysis"
	close $f_id_1
	#return $i
}
