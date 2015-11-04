#!/bin/sh
WD=`dirname "$0"`
EVBIN="Ev Nova"

export DYLD_FORCE_FLAT_NAMESPACE=1
export DYLD_INSERT_LIBRARIES="$WD/libNova.A.dylib"

if [ -e "$WD/$EVBIN.original" ]
then
	"$WD/$EVBIN.original"
else
	"/Applications/EV Nova.app/Contents/MacOS/$EVBIN"
fi
