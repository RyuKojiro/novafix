#!/bin/sh
WD=`dirname "$0"`
EVBIN="Ev Nova"
GLENGINE="/System/Library/Frameworks/OpenGL.framework/Resources/GLEngine.bundle/GLEngine"

export DYLD_FORCE_FLAT_NAMESPACE=1
export DYLD_INSERT_LIBRARIES="$WD/libNova.A.dylib"

if [ -e $GLENGINE ]
then
	export DYLD_INSERT_LIBRARIES="$DYLD_INSERT_LIBRARIES:$GLENGINE"
fi

if [ -e "$WD/$EVBIN.original" ]
then
	"$WD/$EVBIN.original"
else
	"/Applications/EV Nova.app/Contents/MacOS/$EVBIN"
fi
