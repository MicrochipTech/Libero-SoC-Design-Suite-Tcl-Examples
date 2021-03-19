# list_paths

## Description

This SmartTime-specific Tcl command returns a list of the n worst paths matching the arguments. The number of paths returned can be changed using the `set_options -limit_max_paths` <value> command.

```
list_paths \
-analysis <max | min> \
-format <csv | text> \
-set <name> \
-clock <clock name> \
-type <set_type> \
-from_clock <clock name> \
-to_clock <clock name> \
-in_to_out \
-from <port/pin pattern> \
-to <port/pin pattern>
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|analysis|string|Specifies whether the timing analysis is done for `max-delay` (setup check) or `min-delay` (hold check). Valid values are: max or min.|
|format|string|Specifies the list format. It can be either text (default) or csv (comma separated values). Text format is better for display and csv format is better for parsing.|
|set|string|Returns a list of paths from the named set. You can either use the `-set` option to specify a user set by its name or use both `-clock` and `-type` to specify a set.|
|clock|string|Returns a list of paths from the specified clock domain. This option requires the `-type` option. You cannot use wildcards when specifying a clock name.|
|type|string|Specifies the type of paths to be included. It can only be used along with `-clock`. Valid values are: <br /><br />-   `reg_to_reg` -paths between registers in the design. <br />-   `async_to_reg` -paths from asynchronous pins to registers.<br />-   `reg_to_async` -paths from registers to asynchronous pins of registers.<br />-   `external_recovery` -paths from input ports to asynchronous pins of registers.<br />-   `external_removal` -paths from input ports to asynchronous pins of registers.<br />-   `external_setup` -paths from input ports to data pins of registers.<br />-   `external_hold` -paths from input ports to data pins of registers.<br />-   `clock_to_out` -paths from registers to output ports.|
|from_clock|string|Used along with `-to_clock` to get the list of paths of the inter-clock domain between the two clocks.|
|to_clock|string|Used along with `-from_clock` to get the list of paths of the inter-clock domain between the two clocks.|
|in_to_out|None|Used to get the list of path between input and output ports.|
|from|string|Filter the list of paths to those starting from ports or pins matching the pattern.|
|to|string|Filter the list of paths to those ending at ports or pins matching the pattern.|

|Return Type|Description|
|-----------|-----------|
|list of strings|Returns a list of the n worst paths matching the arguments.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
