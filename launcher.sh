#!/bin/sh
WD=`dirname "$0"`
EVBIN="Ev Nova"

export DYLD_FORCE_FLAT_NAMESPACE=1

if [ -e "/System/Library/Frameworks/OpenGL.framework/Resources/GLEngine.bundle/GLEngine" ]
then
	export DYLD_INSERT_LIBRARIES="$WD/libNova.A.dylib:/System/Library/Frameworks/OpenGL.framework/Resources/GLEngine.bundle/GLEngine"
else
	export DYLD_INSERT_LIBRARIES="$WD/libNova.A.dylib"
fi

if [ -e "$WD/$EVBIN.original" ]
then
	"$WD/$EVBIN.original"
else
	"/Applications/EV Nova.app/Contents/MacOS/$EVBIN"
fi
