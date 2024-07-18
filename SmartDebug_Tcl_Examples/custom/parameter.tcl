#==============================================================================
#File: libero.tcl
#
# Description:
# This file defines project variables required for libero.tcl.
#
# Usage: source custom/parameters.tcl
#
#
#==============================================================================
# #Set Core Version
set PF_XCVR_REF_CLKver {1.0.103}
set PF_TX_PLLver {2.0.304}
set PF_DDR4ver {2.5.111}
set CORESMARTBERTver {2.10.100}
set PF_CCCver {2.2.220}
set PF_OSCver {1.0.102}
set PF_INIT_MONITORver {2.0.307}
set CORERESET_PFver {2.3.100}
set PF_URAMver {1.1.107}
set PF_UPROMver {1.0.109}
set PF_DPSRAMver {1.1.110}

#Set tool profiles
set synprofile1 {Synplify_pro}

#Set the top level project name and location where project needs to be created

set Prjname "Libero_Project"
set PrjLocation "./$Prjname"

#Set design specific parameters like HDL language, device & package, speedgrade

 set Hdl {VERILOG}
 set Fam {PolarFire}
 set Die {MPF300TS}
 set Pkg {FCG1152}
 set Spd {-1}
 set Vtg {1.05}
 set Part {IND}
 
 
#variable used in the design
set SimTime 10us
set Effort_Level false
set Repair_Min_Delay false
set Multi_Pass_Layout false
