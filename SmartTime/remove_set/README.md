# remove_set

## Description 

This Tcl command removes a set of paths from analysis. Only user-created sets can be deleted.

```
remove_set -name name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the set of paths to delete.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter -name is missing.|
|None|Unable to find set.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions 

You cannot use wildcards when specifying a set name.

