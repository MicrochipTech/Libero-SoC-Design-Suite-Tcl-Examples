# write_sdc

## Description 

This Tcl command writes timing constraints into an SDC file. If multiple constraint scenarios are defined, `-scenario` allows the user to specify which scenario to write. By default, the current scenario is written.

```
write_sdc \
-scenario scenario_name \
-pin_separator ( : | / ) \
file name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|scenario|string|Specifies the scenario to write. By default the current scenario is used.|
|pin_separator|char|Specify the pin separator used in the SDC file. It can be either ':' or '/'.|
|file name|string|Specify the SDC file name.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

