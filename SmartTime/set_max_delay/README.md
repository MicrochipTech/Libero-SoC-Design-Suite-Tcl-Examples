# set_max_delay

## Description

This Tcl command specifies the required maximum delay for timing paths in the current design. The path length for any startpoint in `from_list` to any endpoint in `to_list` must be less than the `delay_value`. The timing engine automatically derives the individual maximum delay targets from clock waveforms and port input or output delays. For more information, refer to the `create_clock, set_input_delay`, and `set_output_delay` commands. The maximum delay constraint is a timing exception. This constraint overrides the default single cycle timing relationship for one or more timing paths. This constraint also overrides a multi-cycle path constraint.

You must specify at least one of the `-from` , `-to`, or `-through` arguments for this constraint to be valid.

```
set_max_delay delay_value [-from from_list ] [-to to_list ] [-through through_list ]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|delay_value|floating point|Specifies a floating point number in nanoseconds that represents the required maximum delay value for specified paths. -   If the path starting point is on a sequential device, the tool includes clock skew in the computed delay. <br />-   If the path starting point has an input delay specified, the tool adds that delay value to the path delay. <br />-   If the path ending point is on a sequential device, the tool includes clock skew and library setup time in the computed delay. <br />-   If the ending point has an output delay specified, the tool adds that delay to the path delay.|
|from|list of strings|Specifies a list of timing path starting points. A valid timing starting point is a clock, a primary input, an inout port, or a clock pin of a sequential cell.|
|to|list of strings|Specifies a list of timing path ending points. A valid timing ending point is a clock, a primary output, an inout port, or a data pin of a sequential cell.|
|through|list of strings|Specifies a list of pins or nets through which the timing paths must pass.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock maximum delay constraint.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|Error: SDC0021|Invalid max delay constraint: the `-from` value is incorrect.|
|Error: SDC0022|Invalid max delay constraint: the `-from` is empty.|
|Error: SDC0023|Invalid max delay constraint: the `-to` value is incorrect.|
|Error: SDC0024|Invalid max delay constraint: the `-to` is empty.|
|Error: SDC0026|Invalid max delay constraint: the `-through` is empty|
|Error: SDC0061|Invalid max delay constraint: Missing or Illegal parameter/value.|
|Warning|cell (get_cells) is incorrect type;"`-through`" objects must be of type net (`get_nets`), or pin (`get_pins`).<br /><br />**Note:** Constraint will be disabled.|
|Warning|port (get_ports) is incorrect type;"`-through`" objects must be of type net (`get_nets`), or pin (`get_pins`). <br /><br />**Note:** Constraint will be disabled.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
