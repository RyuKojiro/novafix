#!/bin/sh

EVROOT="/Applications/EV Nova.app/Contents/MacOS/"
EVBIN="Ev Nova"

export DYLD_FORCE_FLAT_NAMESPACE=1

if [ -e "${EVROOT}/${EVBIN}.original" ]
then
	export DYLD_INSERT_LIBRARIES=${EVROOT}/libNova.A.dylib
	"${EVROOT}/${EVBIN}.original"
else
	export DYLD_INSERT_LIBRARIES=`dirname $0`/libNova.A.dylib
	"${EVROOT}/${EVBIN}"
fi
