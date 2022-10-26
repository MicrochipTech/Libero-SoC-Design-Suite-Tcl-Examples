set err 0
set found 0

set max_violations_report "./exprj/designer/top/top_max_timing_multi_corner.csv"
set min_violations_report "./exprj/designer/top/top_min_timing_multi_corner.csv"

set map_var(0) "Min Delay Constraint"
set map_var(1) "Input Delay Constraint"
set map_var(2) "Output Delay Constraint"

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
	global max_violations_report
	global min_violations_report
	global map_var
	global found
	global err
		
	set f_id_2 [open $min_violations_report]
	while {[eof $f_id_2]==0} \
	{
		set line_tokens [gets $f_id_2]
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

proc countPattern { ex dumped_file } \
{
	set f_id [open $dumped_file]
        set i 0
	while {[eof $f_id]==0} \
	{
		set line_tokens [gets $f_id]
		if {[regexp $ex "$line_tokens"]==1} \
		{
		    incr i
		}
	}
	#puts "$i occurences of $ex were found"
	close $f_id
	return $i
}
