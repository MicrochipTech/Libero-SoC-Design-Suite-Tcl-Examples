# set_output_delay

## Description

This Tcl command defines the output delay of an output relative to a clock in the current scenario.

The `set_output_delay` command sets output path delays on output ports relative to a clock edge. Output ports have no output delay unless you specify it. For in/out (bidirectional) ports, you can specify the path delays for both input and output modes. The tool adds output delay to path delay for paths ending at primary outputs.

**Note:**

-   The behavior of the -add_delay option is identical to that of PrimeTime(TM).
-   If, using the `-add_delay` mechanism, multiple constraints are otherwise identical, except they specify different `-max` or `-min` values.
    -   the surviving `-max` constraint will be the maximum of the `-max` values.
    -   the surviving `-min` constraint will be the minimum of the `-min` values.

```
set_output_delay [-max] [-min] delay_value -clock clock_ref [-clock_fall] [-rise] [-fall] \
[-add_delay] output_list
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|delay_value|float|Specifies the amount of time before a clock edge for which the signal is required. This represents a combinational path delay to a register outside the current design plus the library setup time (for maximum output delay) or hold time (for minimum output delay).|
|clock|string|Specifies the clock reference to which the specified output delay is related. This is a mandatory argument.|
|max|None|Specifies that `delay_value` refers to the longest path from the specified output. If you do not specify `-max` or `-min` options, the tool assumes the maximum and minimum output delays to be equal.|
|min|None|Specifies that `delay_value` refers to the shortest path from the specified output. If you do not specify `-max` or `-min` options, the tool assumes the maximum and minimum output delays to be equal.|
|clock_fall|None|Specifies that the delay is relative to the falling edge of the clock reference. The default is the rising edge.|
|rise|None|Specifies that the delay is relative to a rising transition on the specified port(s). If `-rise` or `-fall` is not specified, then rising and falling delays are assumed to be equal.|
|fall|None|Specifies that the delay is relative to a falling transition on the specified port(s). If `-rise` or `-fall` is not specified, then rising and falling delays are assumed to be equal.|
|add_delay|None|Specifies that this output delay constraint should be added to an existing constraint on the same port(s). The `-add_delay` option is used to capture information on multiple paths with different clocks or clock edges leading to the same output port(s). <br /><br />**Note:** <br />-   The behavior of the `-add_delay` option is identical to that of PrimeTime(TM). <br />-   If, using the `-add_delay` mechanism, multiple commands are otherwise identical, except they specify different `-max` or `-min` values. <br />-   the surviving `-max` constraint will be the maximum of the `-max` values. <br />-   the surviving `-min` constraint will be the minimum of the `-min` values.|
|output_list|list of string|Provides a list of output ports in the current design to which `delay_value` is assigned. If you need to specify more than one object, enclose the objects in braces ({}).|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock output delay constraint.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|Error: SDC0004|Invalid output delay constraint: clk does not match any clock name or source.|
|Error: SDC0015|Invalid output delay constraint: port list is incorrect.|
|Error: SDC0054|Invalid IO delay constraint: the min delay is greater than max delay.|
|Error: SDC0061|Invalid output delay constraint: Missing or Illegal parameter/value.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
