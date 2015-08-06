#!/bin/tcsh

setenv DYLD_INSERT_LIBRARIES ${PWD}/libNova.A.dylib
setenv DYLD_FORCE_FLAT_NAMESPACE 1

/Applications/EV\ Nova.app/Contents/MacOS/EV\ Nova
