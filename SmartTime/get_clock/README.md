# get_clocks

## Description 

This Tcl command returns an object representing the clock(s) that match those specified in the current timing scenario. Wildcards can be used to select multiple clocks at once. If no objects match the criteria, the empty string is returned.

-   If this command is used as a `-from` argument in either the set maximum (`set_max_delay`), or set minimum delay (`set_min_delay`), false path (`set_false_path`), and multicycle constraints (`set_multicycle_path`), the clock pins of all the registers related to this clock are used as path start points.
-   If this command is used as a `-to` argument in either the set maximum (`set_max_delay`), or set minimum delay (`set_min_delay`), false path (`set_false_path`), and multicycle constraints (`set_multicycle_path`), the synchronous pins of all the registers related to this clock are used as path endpoints.

```
get_clocks pattern
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|pattern|string|Mandatory. Specifies the pattern to match to the SmartTime on which a clock constraint has been set.|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing the clock(s) that match those specified in the pattern argument.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter _AtclParam0_ is missing|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

