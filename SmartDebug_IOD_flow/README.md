<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug IOD Debug Flow Example Scripts</h1>
 </div>

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero and sdebug tools can be found under bin directory of Libero SoC installation. 



|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a IOD design by instantiating required components in SmartDesign and by importing verilog files. It then executes the full flow - `synthesis`, `place and route`, `generate FPGA Array Data` `generatebitstream` and `export smart debug data` files. It runs programming on the device and calls the SmartDebug_IOD_Debug tcl. This design uses MPF300T device.|
|[SmartDebug_IOD_Debug.tcl](SmartDebug_IOD_Debug.tcl) | This Tcl script runs debug_iod command in SmartDebug tool within Libero.
|[src](src) | This folder contains the verilog source files and io placement file (io.pdc)
|[custom](custom) | This folder contains the parameters.tcl file.
|[components](components) | This folder contains the Tcl scripts to configure the cores required for this design. 

For more information on the Tcl commands supported by the Libero&reg; SoC Design Suite, see [Libero SoC Tcl Commands Reference Guide](https://coredocs.s3.amazonaws.com/Libero/2021_2/Tool/libero_soc_tcl_cmd_ref_ug.pdf)

<hr/>
<p align="center"><sup>&copy;Copyright 2020 Microchip Technology Inc.</sup></p>
