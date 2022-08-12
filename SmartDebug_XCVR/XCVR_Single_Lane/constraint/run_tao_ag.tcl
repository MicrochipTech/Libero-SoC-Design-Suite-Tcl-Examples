set_device -family {PolarFire} -die {MPF300T} -speed {-1}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\PF_TX_PLL_0\PF_TX_PLL_0_0\PF_TX_PLL_0_PF_TX_PLL_0_0_PF_TX_PLL.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\PF_TX_PLL_0\PF_TX_PLL_0.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\PF_XCVR_REF_CLK_0\PF_XCVR_REF_CLK_0_0\PF_XCVR_REF_CLK_0_PF_XCVR_REF_CLK_0_0_PF_XCVR_REF_CLK.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\PF_XCVR_REF_CLK_0\PF_XCVR_REF_CLK_0.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\Actel\SgCore\SB_GEN_CHKR\0.0.20\SB_PRBS_CHKR.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\Actel\SgCore\SB_GEN_CHKR\0.0.20\SB_PRBS_GEN.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\Actel\SgCore\SB_GEN_CHKR\0.0.20\SB_GEN_CHKR_TOP.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\SmartBert_Core_0\PF_XCVR_0\SmartBert_Core_0_PF_XCVR_0_PF_XCVR.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\Actel\SgCore\SB_VER_GEN\0.0.18\Four_stage_sync_latch.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\Actel\SgCore\SB_VER_GEN\0.0.18\SB_VER_GEN.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\SmartBert_Core_0\SmartBert_Core_0.v}
read_verilog -mode system_verilog {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\top\top.v}
set_top_level {top}
read_sdc -component {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\PF_TX_PLL_0\PF_TX_PLL_0_0\PF_TX_PLL_0_PF_TX_PLL_0_0_PF_TX_PLL.sdc}
read_sdc -component {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\component\work\SmartBert_Core_0\PF_XCVR_0\SmartBert_Core_0_PF_XCVR_0_PF_XCVR.sdc}
derive_constraints
write_sdc {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\constraint\top_derived_constraints.sdc}
write_ndc {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\constraint\top_derived_constraints.ndc}
write_pdc {Z:\Pramod\Github_Examples\SmartDebug_XCVR\XCVR_Single_Lane\constraint\fp\top_derived_constraints.pdc}
