#!/bin/sh

EV="/Applications/EV Nova.app/Contents/MacOS/EV Nova"

export DYLD_INSERT_LIBRARIES=`dirname $0`/libNova.A.dylib
export DYLD_FORCE_FLAT_NAMESPACE=1

if [ -e "${EV}.original" ]
then
	${EV}.original
else
	"${EV}"
fi
