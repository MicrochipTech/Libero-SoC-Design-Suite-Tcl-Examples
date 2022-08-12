#-------------------------------------------------------------------------------
# File: custom/parameters.tcl
#
# Description:
#  This file defines project variables required for libero.tcl.
#
# Usage: source custom/parameters.tcl
#-------------------------------------------------------------------------------

# Setup device paremeters for the new_project command.
#
set prj_family     "PolarFire";
set prj_die        "MPF300T";
set prj_package    "FCG1152";
set prj_speed      "-1";


#PolarFire Core Versions used in Design 

# PolarFire SgCore versions  
set PF_CCCver 2.2.100
set PF_OSCver 1.0.102
set PF_CLK_DIVver 1.0.103
set PF_NGMUX_Ver 1.0.101
set PF_INIT_MONITORver 2.0.302
set PF_CRYPTOver 1.0.106
set PF_TAMPERver 1.0.203
set PF_TVSver 1.0.110
set PF_SYSTEMSERVICESver 3.0.101
set PF_SYSTEM_SERVICESver 3.0.101

# PolarFire RAM and ROM core versions 
set PF_DPSRAMver 1.1.110
set PF_TPSRAMver 1.1.108
set PF_URAMver 1.1.107
set PF_UPROMver 1.0.109
set PF_SRAM_AHBL_AXIver 1.2.108

#PolarFire DDR core versions
set PF_DDR3ver 2.4.117
set PF_DDR4ver 2.5.105
set PF_LPDDR3ver 2.3.114
set PF_QDRver 1.8.203

# PolarFire XCVR and PCIe solution core versions 
set PF_PCIEver 2.0.116
set PF_TX_PLLver 2.0.300
set PF_XCVRver 2.1.101
set PF_XCVR_ERMver 3.1.200
set PF_XCVR_REF_CLKver 1.0.103
set PF_DRIver 1.1.104
set PF_CORESMARTBERTver 2.8.101

# PolarFire IO Interfaces core versions
set PF_CLK_DIV_DELAYver 1.1.101
set PF_IOD_CDRver 2.4.103
set PF_IOD_CDR_CCCver 2.1.107
set PF_IOD_TX_CCCver 1.0.123
set PF_IOD_GENERIC_TXver 2.0.113
set PF_IOD_GENERIC_RXver 2.1.106
set PF_RGMII_TO_GMIIver 1.3.104
set PF_IOD_OCTAL_DDRver 2.0.103
set PF_IO 2.0.104
set PF_IOver 2.0.104

# PolarFire hidden or old core versions (can probably be removed)
set PF_IODver 1.0.203
set PF_LANECTRLver 0.0.060
set PF_IOD_LVDS7_RXver 1.0.104
set PF_IOD_LVDS7_TXver 1.0.104
set PF_IOD_GENERICver 1.0.101
set PF_CoreDDRMemCtrlrver 2.1.103
set PF_CoreAXI4Interconnect_wver 2.1.3
set CORECDR_TIPver 2.1.101
set PF_CORECDR_TIPver 2.1.101
set PF_COREAXI4SRAMver 2.5.103
set COREAXI4SRAMver 2.5.103
set PF_COREAHBLSRAM_PFver 2.5.104
set COREAHBLSRAM_PFver 2.5.104

# PolarFire macro core versions
set RAMver 1.0
set RAM1K20_Ver {1.0}
set RAM64x12_Ver {1.0}
set MACC_PA_Ver {1.0}
set MACC_PA_BC_ROM_Ver {1.0}

# DirectCore core versions
set PF_CORESYSSERVICES_PFver 2.3.116
set PF_CORECORTEXM1ver 3.0.100
set PF_CoreAHBLitever {5.4.102}
set PF_CoreAHBLitever_old {5.3.101}
set PF_COREAHBTOAPB3ver {3.2.101}
set PF_CoreAPB3ver {4.2.100}
set PF_CoreGPIOver 3.2.102
set PF_COREFIFOver {2.7.105}
set PF_COREFIFOver_old {2.6.108}
set PF_COREFIFOver_1 {3.0.108}
set PF_COREUARTver 5.7.100
set PF_CoreUARTapbver 5.7.100
set PF_COREABCver {3.8.102}
# set PF_CoreJESD204BRXver 3.0.126
# set PF_CoreJESD204BTXver 3.0.114
set PF_CoreJESD204BRXver 3.3.104
set PF_CoreJESD204BTXver 3.1.105
set PF_CoreSPIver 5.2.104
set PF_CoreSPIver_old 5.1.104
set PF_CoreAXITOAHBLver 3.3.102
set PF_COREAXI4DMACONTROLLERver 2.0.100
set PF_COREAHBL2AHBL_BRIDGEver_latest 2.2.100
set PF_COREAHBL2AHBL_BRIDGEver 2.1.108
set PF_CORESGMIIver 3.2.101
set PF_CORETSEver 3.1.102
set PF_CORETSE_AHBver 3.1.102
set PF_corepwmver 4.3.101
#latest version in the repo is the below one
set PF_COREAXI4INTERCONNECTver_latest 2.8.103
set PF_COREAXI4INTERCONNECTver 2.5.100
set PF_COREAXI4INTERCONNECTver_1 2.4.102
set PF_COREFIR_PFver 2.2.108
set PF_COREFFTver 7.0.104
set PF_CorePCSver 3.4.112
set PF_CORE10GMACver 2.3.101
set PF_CORE10GMACver_old {2.0.102}
set PF_CoreXAUIver 2.0.133

set CORERESET_PFver 2.1.100
set CORERESET_PFver_latest 2.3.100
#set CORERESET_PFver_latest 2.2.107

set CORESYSSERVICES_PFver 2.3.116
set CORECORTEXM1ver 3.0.100
set CoreAHBLitever {5.4.102}
set CoreAHBLitever_old {5.3.101}
set COREAHBTOAPB3ver {3.2.101}
set CoreAPB3ver {4.2.100}
set CoreAPB3_ver 4.2.100
set CoreGPIOver {3.2.102}
set CoreGPIOver_old {3.1.101}
set COREFIFOver_latest {3.0.101}
set COREFIFOver {2.7.105}
set COREFIFOver_old {2.6.108}
set COREFIFOver_1 {3.0.108}
set COREUARTver {5.7.100}
set CoreUARTapbver {5.7.100}
set CoreUARTapb_ver 5.7.100
set COREI2Cver {7.2.101}
set COREI2Cver_old {7.1.102}
set COREABCver {3.8.102}
# set CoreJESD204BRXver 3.0.126
# set CoreJESD204BTXver 3.0.114
set CoreJESD204BRXver 3.3.104
set CoreJESD204BTXver 3.1.105
set CoreSPIver 5.2.104
set CoreSPIver_old 5.1.104
set CoreAXITOAHBLver 3.3.102
set COREAXITOAHBLver 3.5.100
set COREAHBLTOAXIver 2.1.101
set COREAXI4DMACONTROLLERver 2.0.100
set COREAHBL2AHBL_BRIDGEver 2.1.108
set CORESGMIIver 3.2.101
set CORETSEver 3.1.102
set CORETSE_AHBver 3.1.102
set corepwmver 4.3.101
#latest version in the repo is the below one
set COREAXI4INTERCONNECTver_latest 2.8.103
set COREAXI4INTERCONNECTver 2.5.100
set COREAXI4INTERCONNECTver_1 2.4.102
set COREFIR_PFver 2.2.108
set COREFFTver 7.0.104
set CorePCSver 3.4.112
set CORE10GMACver 2.3.101
set CORE10GMACver_old {2.0.102}
set CoreXAUIver 2.0.133
set CORERXIODBITALIGNver 2.2.100
set CORELNSQRT 2.0.104
set COMPLEXMUL 1.0.26
set COREDDS 3.0.105
set COREDESver 3.0.106
set CORE3DESver 3.2.100

# Solution cores versions
set CPRIver {2.0.1}
set PF_mipi_csi2_tx 2.1.0
set mipi_csi2_tx 2.1.0

# Processor Core versions
set PF_CoreJTAGDebugver 3.1.100
set COREJTAGDEBUGver 3.1.100
set PF_MIV_RV32IMA_L1_AHBver 2.3.100
set MIV_RV32IMA_L1_AHBver 2.3.100
set MIV_RV32IMA_L1_AXIver 2.1.100
set MIV_RV32IMAF_L1_AHBver 2.1.100
set PF_CORERISCV_AXI4 2.0.102
set PF_CORERISCV_AXI4ver 2.0.102
set CORERISCV_AXI4 2.0.102
set CORERISCV_AXI4ver 2.0.102
set MIV_RV32IMCver 2.1.100
set MIV_RV32ver 3.0.100
