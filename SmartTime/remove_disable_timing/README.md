# remove_disable_timing

## Description

This Tcl command removes a disable timing constraint by specifying its arguments, or its ID. If the arguments do not match a disable timing constraint, or if the ID does not refer to a disable timing constraint, the command fails.

```
remove_disable_timing -from value -to value name -id constraint_ID
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|from|string|Specifies the starting port. The `-from` and `-to` arguments must either both be present or both ommitted for the constraint to be valid.|
|name|string|Specifies the cell(instance) name where the disable timing constraint will be removed. It is an error to supply both a cell name and a constraint ID, as they are mutually exclusive. No wildcards are allowed when specifying a clock name, either alone or in an accessor command1.|
|to|string|Specifies the ending port. The `-from` arguments must either both be present or both ommitted for the constraint to be valid.|
|id|string|Specifies the constraint name where the disable timing constraint will be removed. It is an error to supply both a cell name and a constraint ID, as they are mutually exclusive. No wildcards are allowed when specifying a clock name, either alone or in an accessor command1.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|None|Required parameter _AtclParam0_ is missing.|
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

You cannot use wildcards when specifying a clock name, either alone or in an accessor command such as `get_pins` or `get_ports`.
