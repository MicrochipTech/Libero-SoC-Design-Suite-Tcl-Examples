# read_sdc

## Description

The read_sdc Tcl command evaluate an SDC file, adding all constraints to the specified scenario (or the current/default one if none is specified). Existing constraints are removed if -add is not specified.

```
read_sdc \
-add \
-scenario scenario_name \
-netlist ( user | optimized ) \
-pin_separator ( : | / ) \
-ignore_errors file_name
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|add|None|Specifies that the constraints from the SDC file will be added on top of the existing ones, overriding them in case of a conflict. If not used, the existing constraints are removed before the SDC file is read.|
|scenario|string|Specifies the scenario to add the constraints to. The scenario is created if none exists with this name.|
|netlist|string|Specifies whether the SDC file contains object defined at the post-synthesis netlist (user) level or physical (optimized) netlist (used for timing analysis).|
|pin_separator|char|Specify the pin separator used in the SDC file. It can be either ':' or '/'.|
|ignore_errors|None|Optional. Specifies whether to avoid reporting errors for derived constraints targeting the logic that becomes invalid due to logic optimization. It is an optional argument. Some IPs may have extra logic present depending on other IPs used in the design but the synthesis tool will remove this logic if fewer IPs were used. In such cases, the implementation flow will halt without -ignore_errors flag. <br /><br />**Note:** It is not recommended to use this flag outside similar use cases.

|
|file|string|Specify the SDC file name.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
