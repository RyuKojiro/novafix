OBJS=spi.o
LDFLAGS=-dynamiclib

libNova.A.dylib: spi.o
	$(CC) $(LDFLAGS) $(OBJS) -o libNova.A.dylib

clean:
	rm -rf $(OBJS)
