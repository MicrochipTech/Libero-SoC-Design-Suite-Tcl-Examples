# remove_clock_latency

## Description 

This Tcl command removes a clock source latency from the specified clock and from all edges of the clock. If the specified name does not match a generated clock constraint in the current scenario, or if the specified ID does not refer to a generated clock constraint, this command fails.

Do not specify both the clock and port names and the constraint ID.

```
remove_clock_latency -source clock_name | -id constraint_ID
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|source|string|Specifies either the clock name or source name of the clock constraint from which to remove the clock source latency. You must specify either a clock name or an ID.|
|id|integer|Specifies the ID of the clock constraint to remove from the current scenario. You must specify either an ID or a clock name that exists in the current scenario.|

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

You cannot use wildcards when specifying the clock names.

