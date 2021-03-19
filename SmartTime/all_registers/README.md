# all_registers

## Description 

This Tcl command returns an object representing register pins or register cells(default) in the current scenario based on the given parameters. If you do not specify an option, this command returns an object representing registers cells.

```
all_registers [-clock clock_name ] [-async_pins]  
[-output_pins] [-data_pins] [-clock_pins]
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|clock|string|Specifies the name of the clock domain to which the registers belong. If no clock is specified, all registers in the design will be targeted.|
|async_pins|None|Lists all register pins that are async pins for the specified clock (or all registers asynchronous pins in the design).|
|output_pins|None|Lists all register pins that are output pins for the specified clock (or all registers output pins in the design).|
|data_pins|None|Lists all register pins that are data pins for the specified clock (or all registers data pins in the design).|
|clock_pins|None|Lists all register pins that are clock pins for the specified clock (or all registers clock pins in the design).|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing register pins or cells in the current scenario based on the given parameters.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|Error: SDC0021|Invalid max delay constraint: the -from value is incorrect.|
|Error: SDC0023|Invalid max delay constraint: the -to value is incorrect.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions 

You can only use this command as part of a `–from`, `-to` argument in the following Tcl commands: `set_min_delay`, `set_max_delay`, `set_multicycle_path`, and `set_false_path`.

