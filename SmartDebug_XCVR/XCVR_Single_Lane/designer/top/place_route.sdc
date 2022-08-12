# Microsemi Corp.
# Date: 2022-May-16 17:07:22
# This file was generated based on the following SDC source files:
#   Z:/Pramod/Github_Examples/SmartDebug_XCVR/XCVR_Single_Lane/constraint/top_derived_constraints.sdc
#

create_clock -name {REF_CLK_PAD_P} -period 6.4 [ get_ports { REF_CLK_PAD_P } ]
create_clock -name {SmartBert_Core_0_0/PF_XCVR_0/LANE0/TX_CLK_R} -period 16 [ get_pins { SmartBert_Core_0_0/PF_XCVR_0/LANE0/TX_CLK_R } ]
create_clock -name {SmartBert_Core_0_0/PF_XCVR_0/LANE0/RX_CLK_R} -period 16 [ get_pins { SmartBert_Core_0_0/PF_XCVR_0/LANE0/RX_CLK_R } ]
set_clock_uncertainty 0.000592741 [ get_clocks { REF_CLK_PAD_P } ]
set_clock_uncertainty 0.000592741 [ get_clocks { SmartBert_Core_0_0/PF_XCVR_0/LANE0/RX_CLK_R } ]
set_clock_uncertainty 0.000100953 [ get_clocks { SmartBert_Core_0_0/PF_XCVR_0/LANE0/TX_CLK_R } ]
