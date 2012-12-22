#!/bin/bash

if [ "$1" == "" ]; then
	echo Redirects all connections intended to go to HOST1 to HOST2
	echo
	echo Params: HOST1 HOST2 [remove=any value marks to remove]
	echo Example:
	echo "    "$(basename $0) 192.168.1.45 88.77.66.55
	exit
fi

HOST1="$1"
HOST2="$2"

if [ "$3" == "" ]; then
	ACTION="-I"
else
	ACTION="-D"
fi

#ip addr add dev eth0 192.168.1.45/255.255.255.0
iptables -t nat $ACTION OUTPUT -s 0/0 -d $HOST1 -j DNAT --to-destination $HOST2
