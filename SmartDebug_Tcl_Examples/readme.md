<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/> 
 <h1>SmartDebug Tcl Examples</h1>
 </div>
The following table describes the files in this example. Click on the file that you are interested to view the source code. Libero with integrated SmartDebug and SmartDebug standalone tools can be found under the bin directory of the Libero SoC installation folder. 

|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a new Libero project, configures and instantiates cores in the SmartDesign. The script builds the design hierarchy and sets the top level design. It then executes the `synthesis`, `place and route`, `timing verification`, `generatebitstream` and `exportsmartdebugfiles` commands. It runs programming on the MPF300T device and calls smartdebug.tcl. |
|[smartdebug.tcl](smartdebug.tcl)|This Tcl script executes Debug Tcls on active probes, live probes, FHB, DDR, memories (LSRAMS, UPROM, sNVM), probe insertion in smartdebug for MPF300T device from the smartdebug_tcls folder.|
|[src](src) | This folder contains all the HDLs/Verilog source files (.v), Netlist constraint file for FHB (.ndc), I/O and Floor Planner (FP) placement files (io_constraints.pdc and fp_constraints.pdc), user timing file (.sdc), sample (.hex/.mem) files, and UPROM, sNVM, RAM config file (.cfg) that is required for Tcl scripts.|
|[custom](custom)|This folder contains the project parameter settings.|
|[components](components)|This folder contains the component configuration Tcl files.|


For more information on the Tcl commands supported by the Libero&reg; SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](https://onlinedocs.microchip.com/v2/literature/DS50003101?version=latest&redirect=true).


<hr/>
<p align="center"><sup>&copy;Copyright 2024 Microchip Technology Inc.</sup></p>
