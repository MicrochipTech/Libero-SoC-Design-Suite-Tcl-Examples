<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug XCVR Debug Flow Example Scripts </h1>
 </div>
 

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero and sdebug tools can be found under bin directory of Libero SoC installation.

|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a XCVR design by instantiating required components in SmartDesign and by importing verilog files. It then executes the `synthesis`, `place and route`, `generate FPGA Array Data`, `generatebitstream` and `export smart debug data` files. The `libero.tcl` script runs programming on the `MPF300T` device and calls the `SmartDebug_XCVR_Debug.tcl` script.|
|[SmartDebug_XCVR_Debug.tcl](SmartDebug_XCVR_Debug.tcl) | This Tcl script runs the `smartbert_test -read_counter` command SmartDebug tool within Libero.|
|[src](src) | This folder contains the verilog source files, and the `io_constraints.pdc` and the `fp_constraints.pdc` placement files.|
|[custom](custom) | This folder contains the `parameters.tcl` file.|
|[components](components) | This folder contains the Tcl scripts to configure the cores required for this design.|

For more information on the Tcl commands supported by the Libero® SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](http://coredocs.s3.amazonaws.com/Libero/2022_2/Tool/libero_soc_tcl_cmd_ref_ug.pdf)

<hr/>
<p align="center"><sup>&copy;Copyright 2022 Microchip Technology Inc.</sup></p>
