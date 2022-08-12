#smartbert_test 

# The complete command from Smartdebug Unfied user guide is 

# smartbert_test -start -pattern {pattern name} \
 # -lane {Physical Location} \
 # [-smartbert_ip {TRUE | FALSE}] \
 # [-EQ-NearEndLoopback] 

# User can have different patterns (Embedded patterns and CoreSmartBERT patterns selected in IP)
# Please refer to SmartDebug Unified user guide for more details around this command and arguments .

# ---------------------------------------------------------------------------------------------------------------
#Example 1
# Transceiver lane without SmartBert IP without EQ-NearEndLoopback and prbs pattern = 7.

smartbert_test -start -pattern {prbs7} -lane {Q2_LANE0}

#The following example reads and prints error count of a "Q2_LANE0" lane during selected pattern test.
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