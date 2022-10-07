<div class="header"align="center">
<img src="https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png"/>
 <h1>SmartDebug XCVR Debug Flow Example Scripts
</h1>
 </div>

The following table describes the files in this example. Click on the file you are interested to view the source code. Libero (`libero.exe`) and SmartDebug (`sdebug.exe`) tools can be found under the bin directory of the Libero SoC installation.



|Folder/File|Description|
|-----------|-----------|
|[libero.tcl](libero.tcl) | This Tcl script creates a new project, imports component configurations, HDLs, user constraints files and builds the design hierachy. It then executes the full flow - `synthesis`, `place and route`, `generate FPGA Array Data`, `generate bitstream` and `export smartdebug data` files. It runs programming on the MPF300T device and calls smartdebug.tcl.|
|[src](src) | This folder contains the verilog source files, I/O and Floor Planner (FP) placement files (`io_constraints.pdc` and `fp_constraints.pdc`), and smartdebug tcl file (This Tcl script runs `smartbert_test -read_counter` command in SmartDebug tool within Libero).|
| [custom](custom)  |  This folder contains the project parameter settings and the component configuration tcl files. |

For more information on the Tcl commands supported by the Libero&reg; SoC Design Suite, see the [Libero SoC Tcl Commands Reference Guide](https://onlinedocs.microchip.com/v2/literature/DS50003101?version=latest&redirect=true).



<hr/>
<p align="center"><sup>&copy;Copyright 2022 Microchip Technology Inc.</sup></p>

