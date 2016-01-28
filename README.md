# novafix

A quick and dirty fix for EV Nova on OS X El Capitan.

A super-automatic installer resides [here](https://dl.dropboxusercontent.com/u/80746794/novafix.pkg), for those of you that stumbled upon this and don't have Xcode installed.

## tl;dr

If you want it to fix the application bundle so that you can just launch EV Nova as you normally would:

1. Clone the repo
2. Run `make install`

If you don't want to touch the application bundle (even though you can always `make uninstall`):

1. Clone the repo
2. Run `make`
3. Run `./launcher.sh`

If your copy of EV Nova happens to not be in `/Applications/EV Nova.app`, you'll need adjust the `EVROOT` variable in both the `Makefile` and the `launcher.sh` to contain the path to your bundle.

## The Problem

	2015-10-07 22:52:07.530 EV Nova[17753:652894] 22:52:07.530 WARNING:  140: This application, or a library it uses, is using the deprecated Carbon Component Manager for hosting Audio Units. Support for this will be removed in a future release. Also, this makes the host incompatible with version 3 audio units. Please transition to the API's in AudioComponent.h.
	2015-10-07 22:52:32.576 EV Nova[17753:652894] Error loading /Applications/EV Nova.app/Contents/Frameworks/ASWCarbonSparkleBridge.bundle/Contents/MacOS/ASWCarbonSparkleBridge:  dlopen(/Applications/EV Nova.app/Contents/Frameworks/ASWCarbonSparkleBridge.bundle/Contents/MacOS/ASWCarbonSparkleBridge, 262): Symbol not found: _NewOTProcessUPP
	  Referenced from: /Applications/EV Nova.app/Contents/Frameworks/ASWCarbonSparkleBridge.bundle/Contents/MacOS/ASWCarbonSparkleBridge
	  Expected in: /System/Library/Frameworks/CoreServices.framework/Versions/A/CoreServices
	dyld: lazy symbol binding failed: Symbol not found: _CGSSetWindowDepthLimit
	  Referenced from: /Applications/EV Nova.app/Contents/MacOS/EV Nova
	  Expected in: /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices
	
	dyld: Symbol not found: _CGSSetWindowDepthLimit
	  Referenced from: /Applications/EV Nova.app/Contents/MacOS/EV Nova
	  Expected in: /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices
	
	Trace/BPT trap

Particularly the last bit about `CGSSetWindowDepthLimit`. That's what keeps it from running, since it appears this function (which seems to not be public API) was silently removed from El Capitan.

## The Solution

The Console message above lets you know exactly what it needs. By disassembling `CGSSetWindowDepthLimit` on a machine that still has it, you can see it's a no-op (see below), so injecting one doesn't hurt.

	(lldb) disass -n CGSSetWindowDepthLimit
	CoreGraphics`CGSSetWindowDepthLimit:
	CoreGraphics[0x3bed8a]:  pushq  %rbp
	CoreGraphics[0x3bed8b]:  movq   %rsp, %rbp
	CoreGraphics[0x3bed8e]:  xorl   %eax, %eax
	CoreGraphics[0x3bed90]:  popq   %rbp
	CoreGraphics[0x3bed91]:  retq   

libNova.A.dylib is a dylib containing just a function named `CGSSetWindowDepthLimit`. Using dyld's environment variables, it is injected before anything else, and the namespace is flattened, via launcher.sh.
