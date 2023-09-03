# zigbee2narodmon

Script to send data from broker to [narodmon.ru](https://narodmon.ru) 

## Requirements

* mosquitto-client
* jq
* wget
* **retain** option for **sub_topic**

Before run write your MAC, OWNER, NAME (see API Sensors Readings on narodmon.ru)

## Crontab

Send data every 5 minutes

	*/5 * * * * [path to script]
	
## Tuya TS0201

![ts0201](https://github.com/silentbay/zigbee2narodmon/raw/main/TS0201.jpg)

![shtc3](https://github.com/silentbay/zigbee2narodmon/raw/main/SHTC3.jpg)