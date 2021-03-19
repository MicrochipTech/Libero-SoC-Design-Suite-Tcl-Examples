# set_options

## Description

This SmartTime-specific Tcl command sets options for timing analysis which can be changed in the SmartTime Options dialog box in the SmartTime GUI. All of the options from SmartTime are passed on to place-and-route tool, and some affect timing-driven place-and-route.

```
set_options \
[-max_opcond value ] \
[-min_opcond value ] \
[-interclockdomain_analysis value ] \
[-use_bibuf_loopbacks value ] \
[-enable_recovery_removal_checks value ] \
[-break_at_async value ] \
[-filter_when_slack_below value ] \
[-filter_when_slack_above value ] \
[-remove_slack_filters] \
[-limit_max_paths value ] \
[-expand_clock_network value ] \
[-expand_parallel_paths value ] \
[-analysis_scenario value ] \
[-tdpr_scenario value ] \
[-reset]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|max_opcond|string|Sets the operating condition to use for Maximum Delay Analysis. The acceptable values for max_opcond for PolarFire can be the following: <br />-   slow_lv_ht - use slow_lv_ht conditions for maximum delay analysis <br />-   slow_lv_lt - use slow_lv_lt conditions for maximum delay analysis <br />-   fast_hv_lt - use fast_hv_lt conditions for maximum delay analysis. <br /> Default is slow_lv_lt. <br /><br /> ```max_opcond``` for SmartFusion2, IGLOO2 and RTG4 can be as following:<br />-   worst - use worst case conditions for maximum delay analysis<br />-   typical - use typical conditions for maximum delay analysis <br />-   best - use best case conditions for maximum delay analysis <br /> Default is worst|
|min_opcond|string|Sets the operating condition to use for Minimum Delay Analysis. The acceptable values for min_opcond for PolarFire can be the following: <br />-   slow_lv_ht - use slow_lv_ht conditions for minimum delay analysis<br />-   slow_lv_lt - use slow_lv_lt conditions for minimum delay analysis<br />-   fast_hv_lt - use fast_hv_lt conditions for minimum delay analysis <br />Default is fast_hv_lt. <br /><br /> ```min_opcond``` for SmartFusion2, IGLOO2 and RTG4 can be as following:<br />-   worst - use worst case conditions for minimum delay analysis <br />-   typical - use typical conditions for minimum delay analysis <br />-   best - use best case conditions for minimum delay analysis <br /> Default is best.|
|interclockdomain_analysis|string|Enables or disables inter-clock domain analysis. Value can be the following:<br />-   yes - enables inter-clock domain analysis <br />-   no - disables inter-clock domain analysis<br />Default is no.<br /><br />Timing-driven place-and-route is affected by this option.|
|use_bibuf_loopbacks|string|Instructs the timing analysis whether to consider loopback path in bidirectional buffers (D->Y, E->Y) as false-path {no}. Default is no; i.e., loopback are false paths. Values can be the following:<br />-   yes - enables loopback in bibufs <br />-   no - disables loopback in bibufs|
|enable_recovery_removal_checks|string|Enables recovery checks to be included in max-delay analysis and removal checks in min-delay analysis. Default is no. Values can be the following:<br />-   yes - enables recovery an removal checks <br />-   no - disables recovery and removal checks |
|break_at_async|string|Specifies whether or not timing analysis is allowed to cross asynchronous pins (clear, reset of sequential elements). Default is yes. Values can be the following:<br />-   yes - enables breaking paths at asynchronous ports <br />-   no - disables breaking paths at asynchronous ports.<br /><br />Timing-driven place-and-route is affected by this option.|
|filter_when_slack_below|floating point|Specifies a minimum slack value for paths reported by list_paths. Not set by default.|
|filter_when_slack_above|floating point|Specifies a maximum slack value for paths reported by list_paths. Not set by default.|
|remove_slack_filters|None|Removes the slack minimum and maximum set using `-filter_when_slack_below` and `-filter_when_slack_above`.|
|limit_max_paths|integer|Specifies the maximum number of paths reported by list_paths. Default is 20. Number must be greater than 0.|
|expand_clock_network|string|Specify whether or not clock network details are reported in expand_path. Default is yes. Values can be the following:<br />-   yes - enables expanded clock network information in paths <br />-   no - disables expanded clock network information in paths.|
|expand_parallel_paths|integer|Specify the number of parallel paths {paths with the same ends} to include in expand_path. Default is 1. Number must be greater than 0.|
|analysis_scenario|string|Specify the constraint scenario to be used for timing analysis. Default scenario is Primary.|
|tdpr_scenario|string|Specify the constraint scenario to be used for timing-driven place-and-route. Default scenario is Primary. Timing-driven place-and-route is affected by this option.|
|reset|None|Reset all options to the default values, except those for analysis and TDPR scenarios, which remain unchanged.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
