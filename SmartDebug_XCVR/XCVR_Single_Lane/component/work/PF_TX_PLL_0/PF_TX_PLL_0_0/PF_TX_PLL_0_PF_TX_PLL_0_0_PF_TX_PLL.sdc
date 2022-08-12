set_component PF_TX_PLL_0_PF_TX_PLL_0_0_PF_TX_PLL
# Microsemi Corp.
# Date: 2022-May-16 16:59:20
#

create_clock -period 6.4 [ get_pins { txpll_isnt_0/REF_CLK_P } ]
create_clock -period 8 [ get_pins { txpll_isnt_0/DIV_CLK } ]
