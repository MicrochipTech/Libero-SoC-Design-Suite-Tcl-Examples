# list_objects

## Description 

This Tcl command returns a list of object matching the parameter. Objects can be nets, pins, ports, clocks or instances.

```
list_objects <object>
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|objects|string|Any timing constraint parameter (object can be nets, pins, ports, clocks or instances). This is mandatory.|

|Return Type|Description|
|-----------|-----------|
|list of objects|Returns a list of nets, pins, ports, clocks or instances.|

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

