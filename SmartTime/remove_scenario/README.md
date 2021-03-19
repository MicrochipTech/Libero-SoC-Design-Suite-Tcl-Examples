# remove_scenario

## Description 

This Tcl command removes a scenario from the constraint database and removes it to the list of scenarios.

```
remove_scenario name
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|name|string|Specifies the name of the scenario to delete. This is mandatory.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|None|Required parameter _AtclParam0_ is missing.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions 

You cannot use wildcards when specifying a set name to remove.

