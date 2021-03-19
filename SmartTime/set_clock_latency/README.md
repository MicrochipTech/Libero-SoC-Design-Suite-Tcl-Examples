# set_clock_latency

## Description 

This Tcl command defines the delay between an external clock source and the definition pin of a clock within SmartTime.

Clock source latency defines the delay between an external clock source and the definition pin of a clock within SmartTime. It behaves much like an input delay constraint. You can specify both an "early" delay and a "late" delay for this latency, providing an uncertainty which SmartTime propagates through its calculations. Rising and falling edges of the same clock can have different latencies. If only one value is provided for the clock source latency, it is taken as the exact latency value, for both rising and falling edges.

```
set_clock_latency -source [-rise] [-fall] [-early] [-late] delay clock
```

## Arguments 

|Parameter|Type|Description|
|---------|----|-----------|
|source|None|Specifies the source latency on a clock pin, potentially only on certain edges of the clock.|
|rise|None|Specifies the edge for which this constraint will apply. If neither or both rise and fall are passed, the same latency is applied to both edges.|
|fall|None|Specifies the edge for which this constraint will apply. If neither or both fall and rise are passed, the same latency is applied to both edges.|
|invert|None|Specifies that the generated clock waveform is inverted with respect to the reference clock.|
|late|None|Optional. Specifies that the latency is late bound on the latency. The appropriate bound is used to provide the most pessimistic timing scenario. However, if the value of `-late` is less than the value of `-early`, optimistic timing takes place which could result in incorrect analysis. If neither or both `-early` and `-late` are provided, the same latency is used for both bounds, which results in the latency having no effect for single clock domain setup and hold checks.|
|early|None|Optional. Specifies that the latency is early bound on the latency. The appropriate bound is used to provide the most pessimistic timing scenario. However, if the value of `-late` is less than the value of `-early`, optimistic timing takes place which could result in incorrect analysis. If neither or both `-early` and `-late` are provided, the same latency is used for both bounds, which results in the latency having no effect for single clock domain setup and hold checks.|
|delay|floating point|Specifies the latency value for the constraint.|
|clock|string|Specifies the clock to which the constraint is applied. This clock must be constrained.|

## Error Codes 

|Error Code|Description|
|----------|-----------|
|Error: SDC0061|Invalid clock latency constraint: Parameter has illegal value invoked from within command.|

## Supported Families 

|Supported Families|Supported Libero SoC Versions|
|------------------|-----------------------------|
|PolarFire|v12.4+|
|PolarFire SoC|v12.4+|
|RTG4|v12.4+|
|SmartFusion2|v12.4+|
|IGLOO2|v12.4+|

