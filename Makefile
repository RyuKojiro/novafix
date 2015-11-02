OBJS=spi.o
CFLAGS+=-arch i386
LDFLAGS+=-dynamiclib -arch i386
LIB=libNova.A.dylib
EVROOT="/Applications/EV Nova.app/Contents/MacOS/"
EVBIN="Ev Nova"
LAUNCHER=launcher.sh

$(LIB): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(LIB)

install: $(LIB)
	mv $(EVROOT)/$(EVBIN) $(EVROOT)/$(EVBIN).original
	install $(LAUNCHER) $(EVROOT)/$(EVBIN)
	install $(LIB) $(EVROOT)

clean:
	rm -rf $(OBJS)
