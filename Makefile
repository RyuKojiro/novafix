OBJS=spi.o
CFLAGS+=-arch i386
LDFLAGS+=-dynamiclib -arch i386
LIB=libNova.A.dylib
EVROOT="/Applications/EV Nova.app/Contents/MacOS"
EVBIN="Ev Nova"
LAUNCHER=launcher.sh
EVBIN_ORIG="Ev Nova.original"

$(LIB): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(LIB)

install: $(LIB)
	if [ ! -e $(EVROOT)/$(EVBIN_ORIG) ];\
	then\
		mv $(EVROOT)/$(EVBIN) $(EVROOT)/$(EVBIN_ORIG);\
	fi;
	install $(LAUNCHER) $(EVROOT)/$(EVBIN)
	install $(LIB) $(EVROOT)

uninstall:
	mv $(EVROOT)/$(EVBIN).original $(EVROOT)/$(EVBIN)
	rm -f $(EVROOT)/$(LIB)

clean:
	rm -rf $(OBJS) $(LIB)
