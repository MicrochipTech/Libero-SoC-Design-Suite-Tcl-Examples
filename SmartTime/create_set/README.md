# create_set

## Description

This Tcl command creates a set of paths to be analyzed. Use the arguments to specify which paths to include. To create a set that is a subset of a clock domain, specify it with the `-clock` and `-type` arguments. To create a set that is a subset of an inter-clock domain set, specify it with the `-source_clock` and `-sink_clock` arguments. To create a set that is a subset (filter) of an existing named set, specify the set to be filtered with the `-parent_set` argument.

```
create_set -name <name> -parent_set <name> -type <set_type> -clock <clock name>  -
source_clock <clock name> -sink_clock <clock name> -in_to_out -source <port/pin pattern> \
-sink <port/pin pattern>
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies a unique name for the newly created path set.|
|parent_set|string|Specifies the name of the set to filter from.|
|clock|string|Specifies that the set is to be a subset of the given clock domain. This argument is valid only if you also specify the `-type` argument.|
|type|string|Specifies the predefined set type on which to base the new path set. You can only use this argument with the `-clock` argument, not by itself. <br />-   reg_to_reg - paths between registers in the design.<br />-   async_to_reg - paths from asynchronous pins to registers.<br />-   reg_to_async - paths from registers to asynchronous pins.<br />-   external_recovery - the set of paths from inputs to asynchronous pins.<br />-   external_removal - the set of paths from inputs to asynchronous pins.<br />-   external_setup - paths from input ports to registers.<br />-   external_hold - paths from input ports to registers.<br />-   clock_to_out - paths from registers to output ports.|
|in_to_out|None|Specifies that the set is based on the "Input to Output" set, which includes paths that start at input ports and end at output ports.|
|source_clock|string|Specifies that the set will be a subset of an inter-clock domain set with the given source clock. You can only use this option with the `-sink_clock` argument.|
|sink_clock|string|Specifies that the set will be a subset of an inter-clock domain set with the given sink clock. You can only use this option with the `-source_clock` argument.|
|source|string|Specifies a filter on the source pins of the parent set. If you do not specify a parent set, this option filters all pins in the current design.|
|sink|string|Specifies a filter on the sink pins of the parent set. If you do not specify a parent set, this option filters all pins in the current design.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
