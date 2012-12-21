#!/bin/bash

TARGET="$1"

if [ ! -e "$TARGET" ]; then
	echo Target $TARGET does not exist
	exit
fi

setfacl -R -m group::---,default:group::---,default:other::---,other::---,mask::rxw "$TARGET"
