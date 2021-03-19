# set_multicycle_path

## Description

Defines a path that takes multiple clock cycles in the current scenario. Setting multiple cycle paths constraint overrides the single cycle timing relationships between sequential elements by specifying the number of cycles that the data path must have for setup or hold checks. If you change the multiplier, it affects both the setup and hold checks.

False path information always takes precedence over multiple cycle path information. A specific maximum delay constraint overrides a general multiple cycle path constraint. If you specify more than one object within one `-through` option, the path passes through any of the objects.

You must specify at least one of the `-from` , `-to`, or `-through` arguments for this constraint to be valid.

```
set_multicycle_path ncycles [-setup] [-hold] [-setup_only] [-from from_list] \
[-through through_list ] [-to to_list]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|ncycles|integer|Specifies an integer value that represents a number of cycles the data path must have for setup or hold check. The value is relative to the starting point or ending point clock, before data is required at the ending point. Number of cycles must be greater than `1`. If you set ncycles as `2.2` or `4/2` or `"8a"` then it is being truncated as `2` or `4` or `8`, and no warning is reported.|
|setup|None|Optional. Applies the cycle value for the setup check only. This option does not affect the hold check. The default hold check will be applied unless you have specified another set_multicycle_path command for the hold value.|
|hold|None|Optional. Applies the cycle value for the hold check only. This option does not affect the setup check. <br /><br />**Note:** If you do not specify `-setup` or `-hold`, the cycle value is applied to the setup check and the default hold check is 0 not ncycles -1 .|
|setup_only|None|Optional. Specifies that the path multiplier is applied to setup paths only. The default value for hold check (which is 0) is applied.|
|from|list of strings|Specifies a list of timing path starting points. A valid timing starting point is a clock, a primary input, an inout port, or a clock pin of a sequential cell.|
|through|list of strings|Specifies a list of pins or nets through which the multiple cycle paths must pass.|
|to|list of strings|Specifies a list of timing path ending points. A valid timing ending point is a clock, a primary output, an inout port, or a data pin of a sequential cell.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|Error: SDC0004|clk does not match any clock name or source.|
|Error: SDC0015|port list [get_ports { CLK_0_D }] is incorrect.|
|Error: SDC0054|Invalid IO delay constraint: the min delay is greater than max delay.|
|Error: SDC0061|Parameter _AtclParam0_ has illegal value.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions

Multiple priority management is not supported in Microchip SoC designs. All multiple cycle path constraints are handled with the same priority.
