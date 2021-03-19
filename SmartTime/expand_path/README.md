# expand_path

## Description

This is SmartTime-specific Tcl command displays expanded path information (path details) for paths. The paths to be expanded are identified by the parameters required to display these paths with list_paths. For example, to expand the first path listed with list_paths `-clock {MYCLOCK} -type {register_to_register}`, use the command expand_path `-clock {MYCLOCK}` `-type {register_to_register}`. Path details contain the pin name, type, net name, cell name, operation, delay, total delay, and edge as well as the arrival time, required time, and slack. These details are the same as details available in the SmartTime Expanded Path window.

```
expand_path \
-index value \
-set name \
-clock clock_name \
-type set_type \
-analysis {max| min} \
-format {csv | text} \
-from_clock clock_name \
-to_clock clock_name
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|index value|list of integers|Specify the index of the path to be expanded in the list of paths and display them. The index starts at 1, and defaults to 1. If index value is less than 1, then it is considered as 1. List of specified indexes can be not sequential. Only the paths with indices lower than the max_paths option value will be expanded.|
|analysis {min \| max}|string|Specify whether the timing analysis is done via max-delay (setup check) or min-delay (hold check). Valid values are - min/max or mindelay/maxdelay.|
|format {csv \| text}|string|Specify the file format of the output. It can be either text - ASCII text format (default) or csv (comma separated values).|
|set|string|Displays a list of paths from the named set. You can either use the `-set` option to specify a user set by its name or use both `-clock` and `-type` to specify a set.|
|clock|string|Displays the set of paths belonging to the specified clock domain. You can either use this option along with `-type` to specify a set or use the `-set` option to specify the name of the set to display.|
|type|string|Specifies the type of paths in the clock domain to display in a list. You can only use this option with the `-clock` option. You can either use this option along with `-clock` to specify a set or use the `-set` option t specify a set name. <br />-   reg_to_reg - paths between registers in the design. <br />-   async_to_reg - path from asynchronous pins to registers.<br />-   reg_to_async - path from registers to asynchronous pins.<br />-   external_recovery - set of paths from input ports to asynchronous pins.<br />-   external_removal - set of paths from input ports to asynchronous pins.<br />-   external_setup - path from input ports to registers.<br />-   external_hold - path from input ports to registers.<br />-   clock_to_out - path from registers to output ports.|
|from_clock|string|Displays a list of timing paths for an inter-clock domain set belonging to the source clock specified. You can only use this option with the `-to_clock` option, not by itself.|
|to_clock|string|Displays a list of timing paths for an inter-clock domain set belonging to the sink clock specified. You can only use this option with the `-from_clock` option, not by itself.|

|Return Type|Description|
|-----------|-----------|
|string|Displays expanded path information (path details) for paths.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
