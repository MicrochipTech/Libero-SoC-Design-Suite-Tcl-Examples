<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug PCIe Register Read Example Scripts</h1>
 </div>

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero and sdebug tools can be found under bin directory of Libero SoC installation. 

|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a PCIe EndPoint design(DG0756_PF_PCIe_EP) by instantiating required components in SmartDesign and by importing verilog files. It then executes the `synthesis`, `place and route`, `generate FPGA Array Data`, `generatebitstream` and `export smart debug data` files. The `libero.tcl` script runs programming on the `MPF300T` device and calls the `SmartDebug_PCIe_Register_read.tcl` script.|
|[SmartDebug_PCIe_Register_read.tcl](SmartDebug_PCIe_Register_read.tcl) | This Tcl script runs the `xcvr_read_register` commands to read the PCIe registers associated with the PCIe instance in the design.|
|[src](src) | This folder contains the verilog source files, and the `io_constraints.pdc` and the `fp_constraints.pdc` placement files.|

For more information on the Tcl commands supported by the Libero® SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](http://coredocs.s3.amazonaws.com/Libero/2022_2/Tool/libero_soc_tcl_cmd_ref_ug.pdf)

<hr/>
<p align="center"><sup>&copy;Copyright 2022 Microchip Technology Inc.</sup></p>

