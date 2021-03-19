# remove_generated_clock

## Description 

This Tcl command removes the specified generated clock constraint from the current scenario. If the specified name does not match a generated clock constraint in the current scenario, or if the specified ID does not refer to a generated clock constraint, this command fails.

Do not specify both the clock and port names and the constraint ID.

```
remove_generated_clock -name clock_name | -id constraint_ID
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the generated clock constraint to remove from the current scenario. You must specify either a clock name or an ID.|
|id|integer|Specifies the ID of the generated clock constraint to remove from the current scenario. You must specify either an ID or a clock name that exists in the current scenario.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Invalid clock name argument.|
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

You cannot use wildcards when specifying a clock names.

