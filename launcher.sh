#!/bin/sh

DYLD_INSERT_LIBRARIES=libNova.A.dylib
DYLD_FORCE_FLAT_NAMESPACE=1

/Applications/EV Nova.app/Contents/MacOS/EV Nova
