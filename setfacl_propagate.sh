#!/bin/bash

TARGET="$1"

if [ ! -e "$TARGET" ]; then
	echo Target $TARGET does not exist
fi

getfacl $TARGET | setfacl -R -M - $TARGET
