OBJS=spi.o
CFLAGS+=-arch i386
LDFLAGS+=-dynamiclib -arch i386
LIB=libNova.A.dylib
EVROOT="/Applications/EV Nova.app/Contents/MacOS/"
EVBIN="Ev Nova"
LAUNCHER=launcher.sh

install: $(LIB)
	mv $(EVROOT)/$(EVBIN) $(EVROOT)/$(EVBIN).original
	install $(LAUNCHER) $(EVROOT)/$(EVBIN)
	install $(LIB) $(EVROOT)

$(LIB): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(LIB)

clean:
	rm -rf $(OBJS)
