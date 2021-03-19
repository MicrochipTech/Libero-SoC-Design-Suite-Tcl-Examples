# set_clock_to_output

## Description 

This SDC command defines the timing budget available inside the FPGA for an output relative to a clock.

```
set_clock_to_output delay_value -clock clock_ref [–max] [–min] output_list
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|delay_value|integer|Specifies the clock to output delay in nanoseconds. This time represents the amount of time available inside the FPGA between the active clock edge and the data change at the output port.|
|clock|string|Specifies the reference clock to which the specified clock to output is related. This is a mandatory argument.|
|max|None|Specifies that delay_value refers to the maximum clock to output at the specified output. If you do not specify `–max` or `–min` options, the tool assumes maximum and minimum clock to output delays to be equal.|
|min|None|Specifies that delay_value refers to the minimum clock to output at the specified output. If you do not specify `–max` or `–min` options, the tool assumes maximum and minimum clock to output delays to be equal.|
|output_list|list of strings|Provides a list of output ports in the current design to which `delay_value` is assigned. If you need to specify more than one object, enclose the objects in braces ({}).|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter -clock is missing|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

