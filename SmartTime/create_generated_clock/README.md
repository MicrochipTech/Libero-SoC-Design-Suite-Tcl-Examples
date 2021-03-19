# create_generated_clock

## Description

This Tcl command creates a generated clock in the current design at a declared source by defining its frequency with respect to the frequency at the reference pin. The static timing analysis tool uses this information to compute and propagate its waveform across the clock network to the clock pins of all sequential elements driven by this source.

The generated clock information is also used to compute the slacks in the specified clock domain that drive optimization tools such as place-and-route.

```
create_generated_clock [-name clock_name ] [–add] [-master_clock clock_name ] -source reference_pin
[- divide_by divide_factor ] [-multiply_by multiply_factor ] [-invert] source [-edges values ]
[-edge_shift values ]
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the clock constraint. If the `-name` option is not used, the generated clock receives the same name specified in the source. The clock name is used to refer to the clock in other commands. You can specify `-name {my_gen_clk}` or `-name my_gen_clk`.|
|add|None|Specifies that the generated clock constraint is a new clock constraint in addition to the existing one at the same source. Use this option to capture the case where multiple generated clocks must be specified on the same source, because multiple clocks fan into the master pin. If you specify this option, you must also use the `-name` option. The name of the clock constraint should be different from the existing clock constraint. With this option, `-master_clock` option and `-name` options must be specified.|
|master_clock|string|Specifies the master clock used for the generated clock when multiple clocks fan into the master pin. This option must be used in conjunction with `-add` option of the generated clock. <br />**Note:**<br />1.  The `master_clock` option is used only with the `-add` option for the generated clocks.<br />2.  If there are multiple master clocks fanning into the same reference pin, the first generated clock specified will always use the first master clock as its source clock.<br />3.  The subsequent generated clocks specified with the -add option can choose any of the master clocks as their source clock (including the first master clock specified).|
|source|string|Specifies the reference pin in the design from which the clock waveform is to be derived. You must specify `-source` reference pin.|
|divide_by|integer|Specifies the frequency division factor. This option cannot be used with `-egde` list. If `-egde` is specified, `divide_by` value defaults to one. For instance, if the `divide_factor` is equal to `2`, the generated clock period is twice the reference clock period. If you set `divide_by` value as `1.2` or `4/2` or `8a2` then it is being truncated as `1` or `4` or `8`, and no warning is reported.|
|multiply_by|integer|Specifies the frequency multiplication factor. This option cannot be used with `-egde` list. If `egde` is specified, `multiply_by` and `divide_by` values defaults to one. For instance, if the `multiply_factor` is equal to `2`, the generated clock period is half the reference clock period. If you set `multiply_by` value as `1.2` or `4/2` or `8a2` then it is being truncated as `1` or `4` or `8`, and no warning is reported.|
|invert|None|Specifies that the generated clock waveform is inverted with respect to the reference clock.|
|source|list of strings|Specifies the source of the clock constraint on internal pins of the design. If you specify a clock constraint on a pin that already has a clock, the new clock replaces the existing clock. Only one source is accepted. Wildcards are accepted as long as the resolution shows one pin. You must specify a source.|
|edges|list of integers|Specifies a list of positive integers that represents the edges from the source clock that are to form the edges of the generated clock. Three values must be specified to generate the clock. If you specify less than three, a tool tip indicates an error. This option cannot be used with `-divide_by/-multiply_by` factor.|
|edge_shift|list of floating point numbers|Specify a list of three floating point numbers that represents the amount of shift, in nanoseconds, that the specified edges are to undergo to yield the final generated clock waveform. These floating point values can be positive or negative. Positive value indicates a shift later in time, while negative indicates a shift earlier in time. With this option `-edges` option must be specified.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the generated clock constraint.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|Error: SDC0004|Invalid generated clock constraint: name does not match any clock name or source.|
|Error: SDC0015|Invalid generated clock constraint: port list is incorrect.|
|Error: SDC0016|Invalid generated clock constraint: port list is empty.|
|Error: SDC0061|Invalid generated clock constraint: `-edges` argument is empty invoked from within command.|
|Error: SDC0062|Invalid generated clock constraint: `-edges`list size must be three.|
|Error: SDC0063|Invalid generated clock constraint: -edges list elements are not in increasing order.|
|Error: SDC0065|Invalid generated clock constraint: -edges cannot be used with `-multiply_by` or `-divide_by`.|
|Error: SDC0066|Invalid generated clock constraint: `-edge_shift` does not have accompanying `-edges`.|
|Error: SDC0069|Invalid clock constraint: Need to specify clock name with `-add` option.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
