# remove_input_delay

## Description

This Tcl command removes an input delay by specifying both the clocks and port names or the ID of the input delay constraint to remove. If the clocks and port names do not match an input delay constraint in the current scenario, or if the specified ID does not refer to an input delay constraint, this command fails.

Do not specify both the clock and port names and the constraint ID.

```
remove_input_delay -clock clock_name port_pin_list | -id constraint_ID
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|clock|string|Specifies the clock name to which the specified input delay value is assigned. <br /><br /> **Note:** you must specify clock name as ```{CLK}```, and not ```[get_clocks {CLK}]```.|
|port_pin_list|list of strings|Specifies the port names to which the specified input delay value is assigned.|
|id|integer|Specifies the ID of the clock with the input_delay value to remove from the current scenario. You must specify either both a clock name and list of port names or the input_delay constraint ID.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|None|Parameter -clock has illegal value.|
|None|Invalid clock/port arguments.|
|None|Only one argument is needed.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions

You cannot use wildcards when specifying a clock or port names, either alone or in an accessor command.
