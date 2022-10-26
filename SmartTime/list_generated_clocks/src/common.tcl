set err 0
set found 0

set list_generated_clocks_report "./list_generated_clocks.txt"
set map_var(0) "DIVCLKIN"

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
	global list_generated_clocks_report
	global map_var
	set f_id_1 [open $list_generated_clocks_report]

	while {[eof $f_id_1]==0} \
	{
		set line_tokens [gets $f_id_1]
		if {[regexp $ex "$line_tokens"]==1} \
		{
			puts "\nINFO:_TC $map_var($num) is reported \n"
			set found 1	
		}
	}
	
	if { $found == 0 } {
	puts "\nERROR:_TC Issue with list_generated_clocks output"
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