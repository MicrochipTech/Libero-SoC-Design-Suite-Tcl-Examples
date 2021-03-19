# create_clock

## Description 

This Tcl command creates a clock constraint on the specified sources in the current design, or a virtual clock if no source other than a name is specified. It also defines its period and waveform. The static timing analysis tool uses this information to propagate the waveform across the clock network to the clock pins of all sequential elements driven by this clock source.

The clock information is also used to compute the slacks in the specified clock domain that drive optimization tools such as place-and-route.

```
create_clock [ -name clock_name ] [-add] -period period_value \
[ -waveform edge_list ][ source_objects ]
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the clock constraint. You must specify either a clock name or a source. If the `-name` option is not used, the clock name is specified as source name. The clock name is used to refer to the clock in other commands. You can specify name as: `-name {clk}` or `-name clk`.|
|add|None|Specifies that a new clock constraint is created at the same source port as the existing clock without overriding the existing constraint. The name of the new clock constraint with the `-add` option must be different than the existing clock constraint. Otherwise, it will override the existing constraint, even with the `-add` option. The `-name` option must be specified with the `-add` option.|
|period|real|Specifies the clock period in nanoseconds. The value you specify is the minimum time over which the clock waveform repeats. The `period_value`must be greater than zero.|
|waveform|real|Specifies the rise and fall times of the clock waveform in ns over a complete clock period. There must be exactly two transitions in the list, a rising transition followed by a falling transition. So in edge list falling edge value must be less then rising egde value. You can define a clock starting with a falling edge by providing an edge list where fall time is less than rise time otherwise constraint will be disabled. If you do not specify the `-waveform` option, the tool creates a default waveform, with a rising edge at instant 0.0 ns and a falling edge at instant (period_value/2) ns.|
|source_objects|list of string|Specifies the source of the clock constraint. The source can be ports, pins, or nets in the design. If you specify a clock constraint on a pin that already has a clock, the new clock replaces the existing one. You must specify either a source or a clock name.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock constraint.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|Error: SDC0001|Invalid clock constraint: clock source is incorrect.|
|Error: SDC0006|Invalid clock constraint: clock period is incorrect for the specified clock.|
|Error: SDC0007|Invalid clock constraint: waveform is incorrect.|
|Error: SDC0061|Invalid clock constraint: Missing or Illegal parameter/value.|
|Error: SDC0069|Invalid clock constraint: Need to specify clock name with `-add` option.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

