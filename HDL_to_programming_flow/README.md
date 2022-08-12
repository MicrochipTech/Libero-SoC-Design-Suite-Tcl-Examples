<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>HDL to Programming Flow Example Scripts</h1>
 </div>
The following table describes the files in this example. Click on the file you are interested to view the source code. 

|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a new Libero project, imports HDL and constraint files. The script builds the design hierarchy and then executes the `synthesis`, `place and route`, `timing verification`, configures SPI Flash client, runs `generatebitstream` and `exportbitstreamfiles` commands. The script also has the `programdevice` and `programspiflash` commands. You can uncomment these commands if you plan to run programming.|
|[src](src) | This folder contains all the Verilog source files, timing and placement constraint files required to execute the Tcl script.|
|[custom](custom) | This folder contains project variables required for libero.tcl.|


For more information on the Tcl commands supported by the Libero® SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](http://coredocs.s3.amazonaws.com/Libero/2022_2/Tool/libero_soc_tcl_cmd_ref_ug.pdf)

<hr/>
<p align="center"><sup>&copy;Copyright 2022 Microchip Technology Inc.</sup></p>