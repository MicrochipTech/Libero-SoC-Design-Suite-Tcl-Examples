#list_objects check
grepPattern ".*clk.*din\_b.*din\_a.*rst\_n" 0

grepPattern ".*din\_b\_ibuf\/U\_IOIN\:Y.*din\_b\_ibuf\/U\_IOIN\:YIN.*din\_a\_ibuf\/U\_IOPAD\:PAD din\_a\_ibuf\/U\_IOPAD\:Y.*dout\_q\_0\:A.*dout\_q\_0\:Y.*dout\_\q\_0\:B.*dout\_q1\:CLK.*dout\_q1\:Q.*dout\_q1\:D.*dout\_q\_Z\:CLK.*dout\_q\_Z\:Q.*dout\_q\_Z\:D.*dout\_q1\_0\:A.*dout\_q1\_0\:Y.*dout\_q1\_0\:C.*dout\_q1\_0\:B.*din\_b\_ibuf\/U\_IOPAD\:PAD.*din\_b\_ibuf\/U\_IOPAD\:Y.*din\_a\_ibuf\/U\_IOIN\:Y.*din\_a\_ibuf\/U\_IOIN\:YIN.*dout\_q\_obuf\/U\_IOTRI\:D.*dout\_q\_obuf\/U\_IOTRI\:EOUT.*dout\_q\_obuf\/U\_IOTRI\:DOUT.*din\_a\_q\_0\:A.*din\_a\_q\_0\:Y.*din\_a\_q\_0\:B.*din\_b\_q\:CLK.*din\_b\_q\:Q.*din\_b\_q\:D.*dout\_q\_obuf\/U\_IOPAD\:D.*dout\_q\_obuf\/U\_IOPAD\:PAD.*dout\_q\_obuf\/U\_IOPAD\:E.*din\_a\_q\:CLK.*din\_a\_q\:Q.*din\_a\_q\:D.*din\_b\_q\_0\:A.*din\_b\_q\_0\:Y.*din\_b\_q\_0\:B " 1

grepPattern ".*din\_b\_c.*dout\_q\_obuf\/DOUT.*din\_a\_ibuf\/YIN.*dout\_q\_0\_Z.*dout\_q1\_Z.*dout\_q1\_0\_Z.*dout\_q\_c.*din\_b.*din\_b\_q\_Z.*din\_a\_c.*din\_b\_ibuf\/YIN.*din\_b\_q\_0\_Z.*din\_a.*dout\_q.*din\_a\_q\_0\_Z.*din\_a\_q\_Z" 2

grepPattern ".*CLKIN" 3

if { $err == 0 } \
{
    puts "\nINFO:_TC Test run PASSED with 0 errors";
} \
else \
{
    puts "\nERROR:_TC Test run FAILED";
	
}