# set_input_delay

## Description 

This Tcl command creates an input delay on a port list by defining the arrival time of an input relative to a clock in the current scenario.

The `set_input_delay` command sets input path delays on input ports relative to a clock edge. This usually represents a combinational path delay from the clock pin of a register external to the current design. For in/out (bidirectional) ports, you can specify the path delays for both input and output modes. The tool adds input delay to path delay for paths starting at primary inputs.

A clock is a singleton that represents the name of a defined clock constraint. This can be:

-   a single port name used as source for a clock constraint.
-   a single pin name used as source for a clock constraint; for instance `reg1:CLK`. This name can be hierarchical (for instance, `toplevel/block1/reg2:CLK`).
-   an object accessor that will refer to one clock: `[get_clocks {clk}]`.

**Note:**

-   The behavior of the -add_delay option is identical to that of PrimeTime(TM).
-   If, using the `-add_delay` mechanism, multiple constraints are otherwise identical, except they specify different `-max` or `-min` values
    -   the surviving `-max` constraint will be the maximum of the `-max` values.
    -   the surviving `-min` constraint will be the minimum of the `-min` values.

```
set_input_delay delay_value -clock clock_ref [–max] [–min] [–clock_fall] [-rise] [-fall] [-add_delay] \
input_list
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|delay_value|real|Specifies the arrival time in nanoseconds that represents the amount of time for which the signal is available at the specified input after a clock edge.|
|clock|string|Specifies the clock reference to which the specified input delay is related. This is a mandatory argument. If you do not specify `-max` or `-min` options, the tool assumes the maximum and minimum input delays to be equal.|
|max|None|Specifies that the `delay_value`refers to the longest path arriving at the specified input. If you do not specify `-max` or `-min` options, the tool assumes maximum and minimum input delays to be equal.|
|min|None|Specifies that the `delay_value` refers to the shortest path arriving at the specified input. If you do not specify `-max` or `-min` options, the tool assumes maximum and minimum input delays to be equal.|
|clock_fall|None|Specifies that the delay is relative to the falling edge of the clock reference. The default is the rising edge.|
|rise|None|Specifies that the delay is relative to a rising transition on the specified port(s). If `-rise` or `-fall` is not specified, then rising and falling delays are assumed to be equal.|
|fall|None|Specifies that the delay is relative to a falling transition on the specified port(s). If `-rise` or `-fall` is not specified, then rising and falling delays are assumed to be equal.|
|add_delay|None|Specifies that this input delay constraint should be added to an existing constraint on the same port(s). The `-add_delay` option is used to capture information on multiple paths with different clocks or clock edges leading to the same input port(s).|
|input_list|list of string|Provides a list of input ports in the current design to which `delay_value` is assigned. If you need to specify more than one object, enclose the objects in braces ({}).|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock input delay constraint.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|Error: SDC0004|clk does not match any clock name or source.|
|Error: SDC0015|port list [get_ports {CLK_0_D}] is incorrect.|
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

