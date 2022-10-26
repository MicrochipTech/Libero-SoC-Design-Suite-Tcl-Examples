set err 0
set found 0

set min_violations_report "./exprj/designer/top/top_min_timing_multi_corner.csv"

set map_var(0) "Required Period"
set map_var(1) "Input Delay Constraint"
set map_var(2) "Output Delay Constraint"
set map_var(3) "External Setup Constraint"
set map_var(4) "Clock to Output Constraint"

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
	global min_violations_report
	global map_var
	global found
	set f_id_1 [open $min_violations_report]

	while {[eof $f_id_1]==0} \
	{
		set line_tokens [gets $f_id_1]
		if {[regexp $ex "$line_tokens"]==1} \
		{
			
			puts "\nINFO: $map_var($num) value is Matched with SDC Value in min analysis"
			set found 1	
		}
	}
	
	if { $found == 0 } {
	puts "\nERROR: $map_var($num) value is not Matched with SDC Value in min analysis"
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
