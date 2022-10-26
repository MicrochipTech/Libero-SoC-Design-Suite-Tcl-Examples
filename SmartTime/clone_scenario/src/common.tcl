set err 0
set found 0

set list_scenarios_report "./list_scenarios.txt"
set map_var(0) "Name of the timing scenarios"

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
	global list_scenarios_report
	global map_var
	set f_id_1 [open $list_scenarios_report]

	while {[eof $f_id_1]==0} \
	{
		set line_tokens [gets $f_id_1]
		if {[regexp $ex "$line_tokens"]==1} \
		{
			
			puts "\nINFO: $map_var($num) is reported and indicates that the scenario has been created and cloned"
			set found 1	
		}
	}
	
	if { $found == 0 } {
	puts "\nERROR: $map_var($num) is not reported and indicates that the scenario has not been created"
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
