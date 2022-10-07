# Microchip Tcl Script

#TCL commands used in file

# ----------------------------------------------------------------------------------------------------------------

#Command :smartbert_test
#Description : This Tcl command is used for the following:
              # Start a Smart BERT test - Start a test with a specified PRBS patterns on a specified SmartBERT lane.
              # Stop a Smart BERT test - Stop SmartBERT/PRBS test on a specified lane.
              # Reset error count - Reset counter of a lane during selected pattern test.
              # Inject error - Inject error into a SmartBERT IP lane.

#Format 
# smartbert_test -start -pattern {pattern name} \
# -lane {Physical Location} \
# [-smartbert_ip {TRUE | FALSE}] \
# [-EQ-NearEndLoopback] 
 
#Parameters:
# lane     -> Specify the physical location of the lane
# start    -> Start the Smart BERT test.
# Pattern  -> Specify the pattern type of the Smart BERT test. Valid valueso f pattern type are: PRBS7, PRBS9, PRBS15, PRBS23 and PRBS31.
# EQ-NearEndLoopback  -> Enable EQ-Near End Loopback on specified lane.
# reset_counter -> Reset lane error counter on hardware and cumulative error count on the UI.
# inject_error  ->  Specifies to inject error into a SmartBERT IP. Valid values are: TRUE or FALSE.
# stop     -> Stop the smart BERT test.

 
# ---------------------------------------------------------------------------------------------------------------

#Example 1
# Transceiver lane without SmartBert IP without EQ-NearEndLoopback and prbs pattern = 7.

smartbert_test -start -pattern {prbs7} -lane {Q2_LANE0}

# The following example reads and prints error count of a "Q2_LANE0" lane during selected pattern test.
# The correct usage of read error counter is between start and stop (i.e when Traffic is running)

smartbert_test -read_counter -lane {Q2_LANE0}


#The following stops Smart BERT/PRBS test on a "Q2_LANE0" SmartBERT lane:
smartbert_test -stop -lane {Q2_LANE0}

# --------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------
#Example 2
# Transceiver lane with SmartBert IP pattern = 7 and without EQ-NearEndLoopback


smartbert_test -smartbert_ip -start -pattern {prbs7IP} -lane {Q2_LANE0} 


#The following example reads and prints error count of a "Q0_LANE0" lane during selected pattern test.
# The correct usage of read error counter is between start and stop (i.e when Traffic is running)

smartbert_test -read_counter -lane {Q2_LANE0}


#The following stops Smart BERT/PRBS test on a "Q0_LANE0" SmartBERT lane:
smartbert_test -smartbert_ip -stop -lane {Q2_LANE0}

# --------------------------------------------------------------------------------------------------------------