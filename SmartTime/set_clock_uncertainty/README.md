# set_clock_uncertainty

## Description

This Tcl command specifies simple clock uncertainty for single clock and clock-to-clock uncertainty between two clocks (from and to).

The `set_clock_uncertainty` command sets the timing uncertainty of clock networks. It can be used to model clock jitter or add guard band in the timing analysis. Either simple clock uncertainty or clock-to-clock uncertainty can be specified.

Simple clock uncertainty can be set on a clock or on any pin in the clock network. It will then apply to any path with the capturing register in the forward cone of the uncertainty. If multiple simple uncertainty applies to a register, the last one (in the propagation order from the clock source to the register) is used.

Clock-to-clock uncertainty applies to inter-clock paths. Both `from` clock and `to` clock must be specified. Clock-to-clock uncertainty has higher priority than simple uncertainty. If both are set (a clock-to-clock uncertainty and a simple clock uncertainty on the `to` clock), the simple clock uncertainty will be ignored for inter-clock paths, only the clock-to-clock uncertainty will be used.

```
set_clock_uncertainty [-setup] [-hold] uncertainty [object_list -from from_clock |
-rise_from rise_from_clock | -fall_from fall_from_clock -to to_clock | -rise_to rise_to_clock |
-fall_to fall_to_clock ]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|uncertainty|floating point|Specifies the time in nanoseconds that represents the amount of variation between two clock edges.|
|object_list|list of strings|Specifies a list of clocks, ports, or pins for simple uncertainty; the uncertainty is applied either to destination flops clocked by one of the clocks in the object list option, or destination flops whose clock pins are in the fanout of a port or a pin specified in the object_list option.|
|from|list of strings|Specifies that the clock-to-clock uncertainty applies to both rising and falling edges of the source clock list. Only one of the `-from`, `-rise_from`, or `-fall_from` arguments can be specified for the constraint to be valid.|
|rise_from|list of strings|Specifies that the clock-to-clock uncertainty applies only to rising edges of the source clock list. Only one of the `-from`, `-rise_from`, or `-fall_from` arguments can be specified for the constraint to be valid.|
|fall_from|list of strings|Specifies that the clock-to-clock uncertainty applies only to falling edges of source clock list. Only one of the `-from`, `-rise_from`, or `-fall_from` arguments can be specified for the constraint to be valid.|
|from_clock/rise_from_clock/fall_from_clock|list of strings|Specifies the list of clock names as the uncertainty source.|
|to|list of strings|Specifies that the clock-to-clock uncertainty applies to both rising and falling edges of the destination clock list. Only one of the `-to`, `-rise_to`, or `-fall_to` arguments can be specified for the constraint to be valid.|
|rise_to|list of strings|Specifies that the clock-to-clock uncertainty applies only to rising edges of the destination clock list. Only one of the `-to`, `-rise_to`, or `-fall_to` arguments can be specified for the constraint to be valid.|
|fall_to|list of strings|Specifies that the clock-to-clock uncertainty applies only to falling edges of the destination clock list. Only one of the `-to`, `-rise_to`, or `-fall_to` arguments can be specified for the constraint to be valid.|
|to_clock/rise_to_clock/fall_to_clock|list of strings|Specifies the list of clock names as the uncertainty destination.|
|setup|None|Specifies that the uncertainty applies only to setup checks. If none or both `-setup` and `-hold` are present, the uncertainty applies to both setup and hold checks.|
|hold|None|Specifies that the uncertainty applies only to hold checks. If none or both `-setup` and `-hold` are present, the uncertainty applies to both setup and hold checks.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock uncertainty constraint.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
