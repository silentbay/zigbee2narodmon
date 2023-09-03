#!/bin/sh
#Requirements: mosquitto-client, jq, wget, retain option for sub_topic
#Crontab */5 * * * * [path to script]

#Set MQTT broker address and port
broker="###"
port=1883

#Set topics to subscribe
sub_topic="###"

#Set Narodmon options
DEVICE_MAC="###"
OWNER="###"
NAME="###"

rawdata="$(mosquitto_sub -h $broker -p $port -t "$sub_topic" -C 1)"
sleep 1
temp=$(echo "$rawdata" | jq '.temperature')
sleep 1
humid=$(echo "$rawdata" | jq '.humidity')
sleep 1
#Uncomment for debug
#echo $(date +%F" "%T) "temp=$temp , humid=$humid" >> /tmp/zigbee2narodmon-debug.log
wget -q -O /dev/null "https://narodmon.ru/get?ID=$DEVICE_MAC&OWNER=$OWNER&NAME=$NAME&TEMP=$temp&HUMID=$humid"
exit 0