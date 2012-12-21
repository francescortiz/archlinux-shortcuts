#!/bin/bash

# Propagate the applied acl on a folder to all its children

TARGET="$1"

if [ ! -e "$TARGET" ]; then
	echo Target $TARGET does not exist
fi

getfacl $TARGET | setfacl -R -M - $TARGET
