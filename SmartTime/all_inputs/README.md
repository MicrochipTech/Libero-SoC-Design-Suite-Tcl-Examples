# all_inputs

## Description 

This Tcl command returns an object representing all input and inout pins in the current design. This command is usually used with a command which puts the same attributes on input ports. If you want only certain ports, use get_ports.

```
all_inputs
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|None|None|None|

|Return Type|Description|
|-----------|-----------|
|object|Returns an object representing all input and inout pins in the current design.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

## Exceptions 

You can only use this command as part of a `-from`, `-to` argument in the following Tcl commands: `set_min_delay`, `set_max_delay`, `set_multicycle_path`, and `set_false_path`. It cannot be used with `-through` option.

