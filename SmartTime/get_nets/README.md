# get_nets

## Description 

This Tcl command returns a collection of nets matching the pattern you specify. You can only use this command as source objects in create clock (`create_clock`) or create generated clock (`create_generated_clock`) constraints and as `-through` arguments in the set false path, set minimum delay, set maximum delay, and set multicycle path constraints. Wildcards can be used to select multiple nets at once. If no objects match the criteria, the empty string is returned.

```
get_nets pattern
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|pattern|string|Specifies the pattern to match the names of the nets to return. For example, `get_nets N_255*` returns all nets starting with the characters `N_255`, where `*` is a wildcard that represents any character string. This is mandatory.|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing the nets that match those specified in the pattern argument.|

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

