set max_violations_report "./exprj/designer/top/top_max_timing_multi_corner.csv"

set min_violations_report "./exprj/designer/top/top_min_timing_multi_corner.csv"

set err 0

##########################################################
# Procedure: grepPattern                                 #
# Args: ex -> pattern ex                                 #
#       dumped_file -> file dumped_file                  #
# Description:                                           #
# Search the pattern ex in file dumped_file              #
# Returns 0 if the pattern has not been found and 1 else #
##########################################################
proc grepPattern { ex dumped_file } \
{
	set f_id [open $dumped_file]
	while {[eof $f_id]==0} \
	{
		set line_tokens [gets $f_id]
		if {[regexp $ex "$line_tokens"]==1} \
		{
			#puts "Pattern $ex found"
			close $f_id
			return 1	
		}
	}
	puts "Pattern $ex not found"
	close $f_id
	return 0
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
