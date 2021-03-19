# set_current_scenario

## Description 

This Tcl command specifies the timing scenario for the Timing Analyzer to use. All commands that follow this command will apply to the specified timing scenario. A timing scenario is a set of timing constraints used with a design. If the specified scenario is already the current one, this command has no effect.

After setting the current scenario, constraints can be listed, added, or removed, the checker can be invoked on the set of constraints, and so on.

This command uses the specified timing scenario to compute timing analysis.

**Note:** It is recommended to use the organize_tool_files command instead of this command.

```
set_current_scenario name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the timing scenario to which to apply all commands from this point on.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

