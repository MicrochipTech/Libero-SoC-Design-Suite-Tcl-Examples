# create_scenario

## Description 

This Tcl command creates a new timing scenario with the specified name. You must provide a unique name (that is, it cannot already be used by another timing scenario).

A timing scenario is a set of timing constraints used with a design. Scenarios enable you to easily refine the set of timing constraints used for Timing-Driven Place-and-Route, so as to achieve timing closure more rapidly.

This command creates an empty timing scenario with the specified name and adds it to the list of scenarios.

**Note:** It is recommended to use the organize_tool_files command instead of this command.

```
create_scenario name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the new timing scenario. This is mandatory.|

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

