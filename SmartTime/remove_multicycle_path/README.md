# remove_multicycle_path

## Description

This Tcl command removes a multicycle path constraint from the current timing scenario by specifying either its exact arguments or its ID. If the arguments do not match a multicycle path constraint in the current scenario, or if the specified ID does not refer to a multicycle path constraint, this command fails.

**Note:** Do not specify both multicycle path arguments and the constraint ID.

```
remove_multicycle_path [-from from_list] [-to to_list] [-through through_list]
```

```
remove_multicycle_path -id constraint_ID
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|from|list of strings|Specifies a list of timing path starting points. A valid timing starting point is a clock, a primary input, an inout port, or a clock pin of a sequential cell.|
|through|list of strings|Specifies a list of pins, ports, cells, or nets through which the disabled paths must pass.|
|to|list of strings|Specifies a list of timing path ending points. A valid timing ending point is a clock, a primary output, an inout port, or a data pin of a sequential cell.|
|id|string|Specifies the ID of the multicycle path constraint to remove from the current scenario. You must specify either the exact multicycle path arguments to remove or the constraint ID that refers to the multicycle path constraint to remove.|

## Error Codes

|Error Code|Description|
|----------|-----------|
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
