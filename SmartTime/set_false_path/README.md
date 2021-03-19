# set_false_path

## Description

This Tcl command identifies paths that are considered false and excluded from the timing analysis in the current timing scenario. The `set_false_path` command identifies specific timing paths as being false. The false timing paths are paths that do not propagate logic level changes. This constraint removes timing requirements on these false paths so that they are not considered during the timing analysis. The path starting points are the input ports or register clock pins, and the path ending points are the register data pins or output ports. This constraint disables setup and hold checking for the specified paths.

The false path information always takes precedence over multiple cycle path information and overrides maximum delay constraints. If more than one object is specified within one `-through` option, the path can pass through any objects.

You must specify at least one of the `–from`, `-to`, or `–through` arguments for this constraint to be valid.

```
set_false_path [-ignore_errors] [-from from_list ] [-through through_list ] [-to to_list ]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|ignore_errors|None|Specifies to avoid reporting errors for derived constraints targeting the logic that becomes invalid due to logic optimization. It is an optional argument. Some IPs may have extra logic present depending on other IPs used in the design but the synthesis tool will remove this logic if fewer IPs were used. In such cases, the implementation flow will halt without `-ignore_errors` flag. **Note:** It is not recommended to use this flag outside similar use cases.|
|from|list of strings|Specifies a list of timing paths starting points. A valid timing starting point is a clock, a primary input, an inout port, or a clock pin of a sequential cell.|
|through|list of strings|Specifies a list of pins or nets through which the disabled paths must pass.|
|to|list of strings|Specifies a list of timing paths ending points. A valid timing ending point is a clock, a primary output, an inout port, or a data pin of a sequential cell.|

|Return Type|Description|
|-----------|-----------|
|None|None|

## Error Codes

|Error Code|Description|
|----------|-----------|
|Error: SDC0021|Invalid false path constraint: the `-from` value is incorrect.|
|Error: SDC0022|Invalid false path constraint: the `-from` is empty.|
|Error: SDC0024|Invalid false path constraint: the `-to` is empty.|
|Error: SDC0026|Invalid false path constraint: the `-through` is empty.|
|Warning:|cell (`get_cells`) is incorrect type; `-through` objects must be of type net (`get_nets`), or pin (`get_pins`). <br /><br />**Note:** Constraint will be disabled.|
|Warning:|port (`get_ports`) is incorrect type; `-through` objects must be of type net (`get_nets`), or pin (`get_pins`). <br /><br />**Note:** Constraint will be disabled.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
