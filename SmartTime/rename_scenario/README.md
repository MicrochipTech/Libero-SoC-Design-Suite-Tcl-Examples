# rename_scenario

## Description 

This Tcl command renames an existing timing scenario to a new name. You must provide a unique name (that is, it cannot already be used by another timing scenario) for the new name.

**Note:** It is recommended to use the organize_tool_files command instead of this command.

```
rename_scenario old_name new_name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|old_name|string|Specifies the name of the existing timing scenario to be renamed.|
|new_name|string|Specifies the new name for the new scenario.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

