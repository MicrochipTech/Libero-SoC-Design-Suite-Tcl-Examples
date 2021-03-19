# report

## Description

This SmartTime-specific tcl command specifies the type of reports to be generated and the type of Analysis(Max Delay or Min Delay) Performed to generate the reports. Using this command you can generate the following types of reports:

-   Timer report – This report displays the timing information organized by clock domain.
-   Timing Violations report – This flat slack report provides information about constraint violations.
-   Bottleneck report – This report displays the points in the design that contribute to the most timing violations.
-   Datasheet report – This report describes the characteristics of the pins, I/O technologies, and timing properties in the design.
-   Constraints Coverage report – This report displays the overall coverage of the timing constraints set on the current design.
-   Combinational Loop report – This report displays loops found during initialization.
-   Clock Domain Crossing report – This report analyzes timing paths that cross from one clock domain (the source clock) to another clock domain (the destination clock).

If the specified parameter/value is not correct incorrect this command fails.

```
report -type (timing | violations | datasheet | bottleneck | constraints_coverage |
combinational_loops | cdc) \
-analysis <max|min> \
-format (csv|text) \
<filename> \
timing options \
-max_parallel_paths <number> \
-max_paths <number> \
-print summary (yes|no) \
-use_slack_threshold (yes|no) \
-slack threshold <double> \
-print_paths (yes|no) \
-max_expanded_paths <number> \
-include_user_sets (yes|no) \
-include_clock_domains (yes|no) \
-select_clock_domains <clock name list> \
-limit_max_paths (yes|no) \
-include_pin_to_pin (yes|no) \
bottleneck options  
-cost_type (path_count|path_cost) \
-max_instances <number> \
-from <port/pin pattern> \
-to <port/pin pattern> \
-set_type <set_type> \
-set_name <set name> \
-clock <clock name> \
-from_clock <clock name> \
-to_clock <clock name> \
-in_to_out \
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|type|string|Specifies the type of the report to be generated. It is mandatory.<br />-   timing - Timing Report <br />-   violations - Timing Violation Report <br />-   datasheet - Datasheet Report<br />-   bottleneck - Bottleneck Report<br />-   constraints_coverage - Constraints Coverage Report<br />-   combinational_loops - Combinational Loops Report|
|analysis|string|Specifies the type of Analysis(Max Delay or Min Delay) Performed to generate the reports. It is optional.<br /><br />**Note:** This argument should not be used to generate datasheet reports. The command may fail if this argument is used to generate datasheet report. <br />-   max - Timing report considers maximum analysis (default).<br />-   min - Timing report considers minimum analysis.|
|format|string|Specifies the format in which the report is generated. It is optional.<br />-   text - Generates a text report (default).<br />-   csv - Generates the report in a comma-separated value format which you can import into a spreadsheet.<br /><br />**Note:** CDC type generates report in CSV format only.|
|filename|string|Specifies the file name of the generated report. It is mandatory.|

|Parameter/Value|Description|
|---------------|-----------|
|max_parallel_paths <number>|Specifies the max number of parallel paths. Parallel paths are timing paths with the same start and end points.|
|max_paths <number>|Specifies the max number of paths to display for each set. This value is a positive integer value greater than zero. Default is 100.|
|print_summary (yes\|no)|Yes to include and No to exclude the summary section in the timing report.|
|use_slack_threshold (yes\|no)|Yes to include slack threshold and no to exclude threshold in the timing report. The default is to exclude slack threshold.|
|slack_threshold <double>|Specifies the threshold value to consider when reporting path slacks. This value is in nanoseconds (ns). By default, there is no threshold (all slacks reported).|
|print_paths <yes\|no>|Specifies whether the path section (clock domains and in-to-out paths) will be printed in the timing report. Yes to include path sections (default) and no to exclude path sections from the timing report.|
|max_expanded_paths <number>|Specifies the max number of paths to expand per set. This value is a positive integer value greater than zero. Default is 100.|
|include_user_sets (yes\|no)|If yes, the user set is included in the timing report. If no, the user set is excluded in the timing report.|
|include_clock_domains (yes\|no)|Yes to include and no to exclude clock domains in the timing report.|
|select_clock_domains <clock_name_list>|Defines the clock domain to be considered in the clock domain section. The domain list is a series of strings with domain names separated by spaces. Both the summary and the path sections in the timing report display only the listed clock domains in the clock_name_list.|
|limit_max_paths (yes\|no)|Yes to limit the number of paths to report. No to specify that there is no limit to the number of paths to report (the default).|
|include_pin_to_pin (yes\|no)|Yes to include and no to exclude pin-to-pin paths in the timing report.|
|cost_type <path_count\|path_cost>|Specifies the cost_type as either path_count or path_cost. For path_count, instances with the greatest number of path violations will have the highest bottleneck cost. For path_cost, instances with the largest combined timing violations will have the highest bottleneck cost.|
|max_instances <number>|Specifies the maximum number of instances to be reported. Default is 10.|
|from <port/pin pattern>|Reports only instances that lie on violating paths that start at locations specified by this option.|
|to <port/pin pattern>​|Reports only instances that lie on violating paths that end at locations specified by this option.|
|​clock <clock name>|This option allows pruning based on a given clock domain. Only instances that lie on these violating paths are reported.|
|set_name <set name>|Displays the bottleneck information for the named set. You can either use this option or use both -clock and -type. This option allows pruning based on a given set. Only paths that lie within the named set will be considered towards bottleneck.|
|set_type <set_type>|This option can only be used in combination with the -clock option, and not by itself. The options allows you to filter which type of paths should be considered towards the bottleneck:<br />-   reg_to_reg - Paths between registers in the design<br />-   async_to_reg - Paths from asynchronous pins to registers<br />-   reg_to_async - Paths from registers to asynchronous pins<br />-   external_recovery - The set of paths from inputs to asynchronous pins<br />-   external_removal - The set of paths from inputs to asynchronous pins<br />-   external_setup - Paths from input ports to registers<br />-   external_hold - Paths from input ports to registers<br />-   clock_to_out - Paths from registers to output ports|
|from_clock <clock name>|Reports only bottleneck instances that lie on violating timing paths of the inter-clock domain that starts at the source clock specified by this option. This option can only be used in combination with - to_clock.|
|to_clock <clock name>|Reports only instances that lie on violating paths that end at locations specified by this option.|
|in_to_out|Reports only instances that lie on violating paths that begin at input ports and end at output ports.|

|Return Type|Description|
|-----------|-----------|
|file|Generates SmartTime report file with the specified format.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|None|Parameter -type has illegal value|
|None|Required parameter -type is missing|
|None|Required parameter _AtclParam0_ is missing|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
