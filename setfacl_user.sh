#!/bin/bash

USER="$1"
TARGET="$2"

USER_EXISTS=$(id $USER)

if [ "$USER" == "" ]; then
	echo Especify a username
	exit
fi
if [ "$USER_EXISTS" == "" ]; then
	echo User $USER does not exist
	exit
fi

if [ ! -e "$TARGET" ]; then
	echo Target $TARGET does not exist
	exit
fi

setfacl -R -m user:$USER:rwx,default:user:$USER:rwx,mask::rxw "$TARGET"
