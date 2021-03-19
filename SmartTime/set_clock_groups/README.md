# set_clock_groups

## Description

This is an SDC command which disables timing analysis between the specified clock groups. No paths are reported between the clock groups in both directions. Paths between clocks in the same group continue to be reported.

**Note:** If you use the same name and the same exclusive flag of a previously defined clock group to create a new clock group, the previous clock group is removed and a new one is created in its place. The exclusive flags for the arguments above are all mutually exclusive. Only one can be specified.

```
set_clock_groups [-name name ] \
[-physically exclusive | -logically exclusive | -asynchronous] \
[-comment comment_string ] \
-group clock_list
```

## Arguments

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Name given to the clock group. Optional.|
|physically_exclusive|None|Specifies that the clock groups are physically exclusive with respect to each other. Examples are multiple clocks feeding a register clock pin. The exclusive flags are all mutually exclusive. Only one can be specified.|
|logically_exclusive|None|Specifies that the clocks groups are logically exclusive with respect to each other. Examples are clocks passing through a mux.|
|asynchronous|None|Specifies that the clock groups are asynchronous with respect to each other, as there is no phase relationship between them. <br /><br />**Note:** The exclusive flags are all mutually exclusive. Only one can be specified.|
|group|list of strings|Specifies a list of clocks. There can any number of groups specified in the set_clock_groups command.|

|Return Type|Description|
|-----------|-----------|
|integer|Returns the ID of the clock group.|

## Error Codes

|Error Code|Description|
|----------|-----------|
|None|Invalid set_clock_groups constraint - only one of -physically_exclusive, -logically_exclusive or -asynchronou should be used.|

## Supported Families

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|
