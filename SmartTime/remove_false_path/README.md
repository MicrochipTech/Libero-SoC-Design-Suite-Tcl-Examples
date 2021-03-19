# remove_false_path

## Description

This Tcl command removes a false path constraint from the current timing scenario by specifying either its exact arguments or its ID. If the arguments do not match a false path constraint in the current scenario, or if the specified ID does not refer to a false path constraint, this command fails.

**Note:** Do not specify both false path arguments and the constraint ID.

```
remove_false_path [-from from_list] [-to to_list] [-through through_list] | -id constraint_ID
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|from|list of strings|Specifies a list of timing path starting points. A valid timing starting point is a clock, a primary input, an inout port, or a clock pin of a sequential cell.|
|through|list of strings|Specifies a list of pins or nets through which the disabled paths must pass.|
|to|list of strings|Specifies a list of timing path ending points. A valid timing ending point is a clock, a primary output, an inout port, or a data pin of a sequential cell.|
|id|integer|Specifies the ID of the false path constraint to remove from the current scenario. You must specify either the exact false path arguments to remove or the constraint ID that refers to the false path constraint to remove.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|None|Invalid arguments -from/-to/-through.|
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
