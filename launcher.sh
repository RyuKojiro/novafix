#!/bin/sh

export DYLD_INSERT_LIBRARIES=${PWD}/libNova.A.dylib
export DYLD_FORCE_FLAT_NAMESPACE=1

/Applications/EV\ Nova.app/Contents/MacOS/EV\ Nova
