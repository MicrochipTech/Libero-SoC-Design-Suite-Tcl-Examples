<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug IOD Debug Flow Example Scripts</h1>
 </div>

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero and sdebug tools can be found under bin directory of Libero SoC installation. 



|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script opens Libero project which has IOD configuration. It then executes the `generate FPGA Array Data` `generatebitstream` and `export smart debug data` files. It runs programming on the device and calls the SmartDebug_IOD_Debug tcl.|
|[SmartDebug_IOD_Debug.tcl](SmartDebug_IOD_Debug.tcl) | This TCL script runs debug_iod command in SmartDebug tool within Libero.
|[src](src) | This folder contains Libero project for IOD design.
|[custom](custom) | This folder contains the parameters.tcl file.

For more information on the Tcl commands supported by the Libero&reg; SoC Design Suite, see:
- [Libero SoC v12.6 Tcl Commands Reference Guide for SmartFusion2, IGLOO2, and RTG4](https://www.microsemi.com/document-portal/doc_download/1245481-libero-soc-v12-6-tcl-commands-reference-guide-for-smartfusion2-igloo2-and-rtg4)
- [Libero SoC v12.6 Tcl Commands Reference Guide for PolarFire](https://www.microsemi.com/document-portal/doc_download/1245482-libero-soc-v12-6-tcl-commands-reference-guide-for-polarfire) 


<hr/>
<p align="center"><sup>&copy;Copyright 2020 Microchip Technology Inc.</sup></p>
