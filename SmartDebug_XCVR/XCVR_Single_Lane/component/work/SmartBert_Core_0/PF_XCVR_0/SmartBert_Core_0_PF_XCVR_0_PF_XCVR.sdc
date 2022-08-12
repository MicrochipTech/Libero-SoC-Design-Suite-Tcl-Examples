set_component SmartBert_Core_0_PF_XCVR_0_PF_XCVR
# Microsemi Corp.
# Date: 2022-May-16 17:00:18
#

create_clock -period 6.4 [ get_pins { LANE0/REF_CLK_P } ]
create_clock -period 16 [ get_pins { LANE0/TX_CLK_R } ]
create_clock -period 16 [ get_pins { LANE0/RX_CLK_R } ]
