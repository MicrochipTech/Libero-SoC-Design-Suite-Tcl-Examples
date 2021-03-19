# clone_scenario

## Description 

This Tcl command creates a timing scenario with the new_scenario_name, which includes a copy of all constraints in the original scenario. The new scenario is then added to the list of scenarios. You must provide a unique name (that is, it cannot already be used by another timing scenario).

**Note:** It is recommended to use the organize_tool_files command instead of clone_scenario.

```
clone_scenario original new_scenario_name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|original|string|Specifies the name of the source timing scenario to clone (copy). The source must be a valid, existing timing scenario.|
|new_scenario_name|string|Specifies the name of the new scenario to be created.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

