# remove_clock_groups

## Description 

This Tcl command removes a clock group by specifying its name or its group ID. If the arguments do not match, or if the ID does not refer to a clock group, the command fails.

**Note:** The exclusive flag is not needed when removing a clock group by ID. These flags are mutually exclusive. Only one can be specified.

```
remove_clock_groups [-id constraint_ID | -name groupname ]  
[-physically_exclusive | -logically_exclusive | -asynchronous]
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|id|integer|Specifies the clock group by the ID. You must specify either a clock group ID or a clock group name that exists in the current scenario.|
|name|string|Specifies the clock group by name (to be always followed by the exclusive flag).|
|physically_exclusive|None|Specifies that the clock groups are physically exclusive with respect to each other.|
|logically_exclusive|None|Specifies that the clocks groups are logically exclusive with respect to each other.|
|asynchronous|None|Specifies that the clock groups are asynchronous with respect to each other.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Only one argument is needed.|
|None|Invalid clock Groups name argument.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions 

You cannot use wildcards when specifying a clock groups name.

