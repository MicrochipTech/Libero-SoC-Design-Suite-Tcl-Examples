# get_cells

## Description 

This Tcl command returns a collection of instance (cell) objects in the current design that match a specified search pattern. You can only use this command as part of a `-from`, `-to` argument in the following Tcl commands: `set_max delay`, `set_multicycle_path`, and `set_false_path`. Wildcards can be used to select multiple cells at once. If no objects match the criteria, the empty string is returned.

```
get_cells pattern
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|pattern|string|Specifies the pattern to match the instances to return. For example, `get_cells U18*` returns all instances starting with the characters `U18`, where `*` is a wild card character that represents any character string. This is mandatory.|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing the cells (instances) that match those specified in the pattern argument.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter _AtclParam0_ is missing.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

