# get_ports

## Description 

This Tcl command returns an object representing the port(s) that match those specified in the pattern argument. Wildcards can be used to select multiple ports at once. If no objects match the criteria, the empty string is returned.

```
get_ports pattern
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|pattern|string|Specifies the pattern to match the ports.|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing the port(s) that match those specified in the pattern argument.|

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

