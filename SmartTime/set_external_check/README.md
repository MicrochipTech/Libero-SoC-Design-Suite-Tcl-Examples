# set_external_check

## Description 

This SDC command defines the external setup and hold delays for an input relative to a clock.

```
set_external_check delay_value -clock clock_ref [–setup] [–hold] input_list
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|delay_value|integer|Specifies the clock to output delay in nanoseconds. This time represents the amount of time available inside the FPGA between the active clock edge and the data change at the output port.|
|clock|string|Specifies the reference clock to which the specified clock to output is related. This is a mandatory argument.|
|setup or hold|None|Specifies that delay_value refers to the setup/hold check at the specified input. This is a mandatory argument if `–hold` is not used. You must specify either the `–setup` or `–hold` option.|
|input_list|list of strings|Provides a list of input ports in the current design to which `delay_value` is assigned. If you need to specify more than one object, enclose the objects in braces ({}).|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the external setup and hold constraint.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter -clock is missing.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

