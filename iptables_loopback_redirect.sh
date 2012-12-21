#!/bin/bash

if [ "$1" == "" -o "$2" == "" -o "$3" == "" ]; then
	echo Redirects a loopback connection to another host/if_device.
	echo
	echo Params: protocol local_port destination [remove=any value marks to remove]
	echo Example:
	echo "    "$(basename $0) tcp 8088 192.168.1.2:8088
	exit
fi

PROTOCOL="$1"
LOCAL_PORT="$2"
DESTINATION="$3"
if [ "$4" == "" ]; then
	ACTION="-I"
else
	ACTION="-D"
fi

iptables -t nat $ACTION OUTPUT --src 127.0.0.1/0 -p $PROTOCOL --dport $LOCAL_PORT -j DNAT --to-destination $DESTINATION
