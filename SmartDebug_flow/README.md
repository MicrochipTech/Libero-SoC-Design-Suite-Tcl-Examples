<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug Flow Example Scripts</h1>
 </div>

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero and sdebug tools can be found under bin directory of Libero SoC installation. 



|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a new Libero project, configures and instantiates uPROM core in the Smartdesign. The script builds design hierarchy and sets the top level design. It then executes the `synthesis`, `place and route`, `timing verification`, `generatebitstream` and `export smart debug data` files.|
|[smartdebug.tcl](smartdebug.tcl) | This TCL script creates a new project using the ddc exported from Libero&reg; and runs the programming actions. This script needs to be run within the `sdebug` tool.|
|[source](source) | This folder contains a sample hex file and UPROM config file required to execute the Tcl scripts.|

For more information on the Tcl commands supported by the Libero&reg; SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](http://coredocs.s3.amazonaws.com/Libero/2022_2/Tool/libero_soc_tcl_cmd_ref_ug.pdf)



<hr/>
<p align="center"><sup>&copy;Copyright 2022 Microchip Technology Inc.</sup></p>
