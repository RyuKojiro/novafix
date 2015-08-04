OBJS=spi.o
CFLAGS+=-arch i386
LDFLAGS+=-dynamiclib -arch i386

libNova.A.dylib: spi.o
	$(CC) $(LDFLAGS) $(OBJS) -o libNova.A.dylib

clean:
	rm -rf $(OBJS)
