# Microchip Tcl Script
# These tcl commands read the all register associated with PCIe Instance in the design .
# The register set description is in "PolarFire® FPGA and PolarFire SoC FPGA PCI Express" Handbook.

#TCL commands user in file

# ---------------------------------------------------------------------------------------------------------------
#Command : read_device_status 
#Description : This Tcl command displays a summary of the device. Device status like ID code, design information, digest information, security and programmer information can be know using this command. Returns a log that can be saved to a file or printed)
#Format 
#read_device_status [-deviceName "device name"] [-file "filename"]

#Paramaters 
# deviceName  -> Optional user-defined device name.
# file        -> Specify path and the name of file where device status will besaved. This parameter is optional.

read_device_status

# ----------------------------------------------------------------------------------------------------------------

# Command: xcvr_add_register 
# Desctiption: This Tcl command adds transceiver registers details to the SmartDebug register access interface
# Format
# xcvr_add_register [-deviceName {device name} \
 [-reg_name {Add Register Names}]

#Paramaters 
# deviceName  -> Optional user-defined device name.
# reg name    -> Name of the register 

xcvr_add_register -reg_name {SERDES0:PCIE_CTRL_1:TEST_BUS_IN_63_32,SERDES0:PCIE_CTRL_1:TEST_BUS_IN_31_0,SERDES0:PCIE_CTRL_1:SPARE,SERDES0:PCIE_CTRL_1:SOFT_RESET_DEBUG_INFO,SERDES0:PCIE_CTRL_1:SOFT_RESET_CTLR,SERDES0:PCIE_CTRL_1:SOFT_RESET,SERDES0:PCIE_CTRL_1:SEC_ERROR_INT_MASK,SERDES0:PCIE_CTRL_1:SEC_ERROR_INT,SERDES0:PCIE_CTRL_1:SEC_ERROR_EVENT_CNT,SERDES0:PCIE_CTRL_1:RAM_POWER_CONTROL,SERDES0:PCIE_CTRL_1:RAM_MARGIN_2,SERDES0:PCIE_CTRL_1:RAM_MARGIN_1,SERDES0:PCIE_CTRL_1:PL_WAKECLKREQ,SERDES0:PCIE_CTRL_1:PL_TX_LANEIF_0,SERDES0:PCIE_CTRL_1:PL_RX_LANEIF_0,SERDES0:PCIE_CTRL_1:PHY_COMMON_INTERFACE,SERDES0:PCIE_CTRL_1:PCIE_PEX_SPC,SERDES0:PCIE_CTRL_1:PCIE_PEX_DEV_LINK_SPC2,SERDES0:PCIE_CTRL_1:PCIE_EVENT_INT,SERDES0:PCIE_CTRL_1:PCIE_BAR_WIN,SERDES0:PCIE_CTRL_1:PCIE_BAR_45,SERDES0:PCIE_CTRL_1:PCIE_BAR_23,SERDES0:PCIE_CTRL_1:PCIE_BAR_01,SERDES0:PCIE_CTRL_1:PCIE_AXI_MASTER_ATR_CFG2,SERDES0:PCIE_CTRL_1:PCIE_AXI_MASTER_ATR_CFG1,SERDES0:PCIE_CTRL_1:PCIE_AXI_MASTER_ATR_CFG0,SERDES0:PCIE_CTRL_1:PCICONF_PCI_IDS_OVERRIDE,SERDES0:PCIE_CTRL_1:PCICONF_PCI_IDS_95_64,SERDES0:PCIE_CTRL_1:PCICONF_PCI_IDS_63_32,SERDES0:PCIE_CTRL_1:PCICONF_PCI_IDS_31_0,SERDES0:PCIE_CTRL_1:LTSSM_STATE,SERDES0:PCIE_CTRL_1:ECC_ERR_LOC,SERDES0:PCIE_CTRL_1:ECC_CONTROL,SERDES0:PCIE_CTRL_1:DEV_CONTROL,SERDES0:PCIE_CTRL_1:DED_ERROR_INT_MASK,SERDES0:PCIE_CTRL_1:DED_ERROR_INT,SERDES0:PCIE_CTRL_1:DED_ERROR_EVENT_CNT,SERDES0:PCIE_CTRL_1:DEBUG_SEL,SERDES0:PCIE_CTRL_1:CLOCK_CONTROL,SERDES0:PCIE_CTRL_1:AXI_SLAVE_PCIE_ATR_CFG2,SERDES0:PCIE_CTRL_1:AXI_SLAVE_PCIE_ATR_CFG1,SERDES0:PCIE_CTRL_1:AXI_SLAVE_PCIE_ATR_CFG0} 

# ----------------------------------------------------------------------------------------------------------------

# Command :xcvr_read_register 
# Description : This Tcl command reads SCB registers and their field values. Read value is in hex format

#Format
# xcvr_read_register [-deviceName {device name}] \
# -inst_name {instanse name} \
# -reg_name [<reg_name> | <reg_name:field_name>]

#Paramaters 
# deviceName  -> Optional user-defined device name.
# inst_name   -> Specify the lane instance name used in the design
# reg name    -> Specify the <reg_name> for register name 

xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_AXI_SLAVE_PCIE_ATR_CFG0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_AXI_SLAVE_PCIE_ATR_CFG1} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_AXI_SLAVE_PCIE_ATR_CFG2} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_CLOCK_CONTROL} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_DEBUG_SEL} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_DED_ERROR_EVENT_CNT} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_DED_ERROR_INT} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_DED_ERROR_INT_MASK} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_DEV_CONTROL} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_ECC_CONTROL} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_ECC_ERR_LOC} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_LTSSM_STATE} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCICONF_PCI_IDS_31_0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCICONF_PCI_IDS_63_32} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCICONF_PCI_IDS_95_64} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCICONF_PCI_IDS_OVERRIDE} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_AXI_MASTER_ATR_CFG0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_AXI_MASTER_ATR_CFG1} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_AXI_MASTER_ATR_CFG2} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_BAR_01} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_BAR_23} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_BAR_45} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_BAR_WIN} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_EVENT_INT} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_PEX_DEV_LINK_SPC2} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PCIE_PEX_SPC} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PHY_COMMON_INTERFACE} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PL_RX_LANEIF_0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PL_TX_LANEIF_0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_PL_WAKECLKREQ} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_RAM_MARGIN_1} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_RAM_MARGIN_2} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_RAM_POWER_CONTROL} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SEC_ERROR_EVENT_CNT} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SEC_ERROR_INT} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SEC_ERROR_INT_MASK} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SOFT_RESET} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SOFT_RESET_CTLR} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SOFT_RESET_DEBUG_INFO} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_SPARE} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_TEST_BUS_IN_31_0} 
xcvr_read_register -inst_name {PF_PCIE_C0_0/PF_PCIE_C0_0/LANE2} -reg_name {PCIE_CTRL_1_TEST_BUS_IN_63_32} 

# ---------------------------------------------------------------------------------------------------------------------------------
