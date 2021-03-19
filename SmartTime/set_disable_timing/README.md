# set_disable_timing

## Description 

This Tcl command disables timing arcs within a cell(instance) and returns the ID of the created constraint if the command succeeded. To specify a Disable Timing constraint, open the Set Constraint to Disable Timing Arcs dialog box in the following way: Choose Disable Timing from the Constraints drop-down menu (Constraints > Disable Timing).

**Note:** This constraint is for the Place and Route tool and the Verify Timing tool. It is ignored by the Synthesis tool.

```
set_disable_timing -from value -to value name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|from|string|Specifies the starting point for the timing arc. The `-from` and `-to` arguments must either both be present or both omitted for the constraint to be valid.|
|to|string|Specifies the ending point for the timing arc. The `-from` and `-to` arguments must either both be present or both omitted for the constraint to be valid.|
|name|string|Specifies the instance(cell) name for which the disable timing arc constraint will be created.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of created constraint.|

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

