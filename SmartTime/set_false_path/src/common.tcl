set err 0
set found_max 0
set found_min 0

set max_violations_report "./exprj/designer/top/top_max_timing_multi_corner.csv"
set min_violations_report "./exprj/designer/top/top_min_timing_multi_corner.csv"

set map_var(0) "dout_q"
set map_var(1) "CLKIN"

##########################################################
# Procedure: grepPattern                                 #
# Args: ex -> pattern ex                                 #
#       dumped_file -> file dumped_file                  #
# Description:                                           #
# Search the pattern ex in file dumped_file              #
# Returns 0 if the pattern has not been found and 1 else #
##########################################################

proc grepPattern { ex num num1} \
{
	#Timing Reports Check
	global max_violations_report
	global min_violations_report
	global map_var
	global found_max
	global found_min
	global err
	
	set f_id_1 [open $max_violations_report]

	while {[eof $f_id_1]==0} \
	{	
		set line_tokens [gets $f_id_1]
		
		if {[regexp $ex "$line_tokens"]==1} \
		{	
			puts "\nERROR: Paths between $map_var($num1) to $map_var($num) has not been set to false path in max analysis."
			set found_max 1 
			incr err
		}
		
	}
	
	if { $found_max == 0 } {
	puts "\nINFO: Paths between $map_var($num1) to $map_var($num) has been set to false path in max analysis."
	set found_max 0	
	}
	
	set f_id_2 [open $min_violations_report]
	while {[eof $f_id_2]==0} \
	{
		set line_tokens [gets $f_id_2]
		
		if {[regexp $ex "$line_tokens"]==1} \
		{	
			puts "\nERROR: Paths rbetween $map_var($num1) to $map_var($num) has not been set to false path in min analysis."
			set found_min 1
			incr err
		}
		
	}
	
	if { $found_min == 0 } {
	puts "\nINFO: Paths between $map_var($num1) to $map_var($num) has been set to false path in min analysis."
	set found_min 0	
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
