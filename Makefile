OBJS=spi.o
CFLAGS+=-arch i386
LDFLAGS+=-dynamiclib -arch i386
LIB=libNova.A.dylib

$(LIB): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(LIB)

clean:
	rm -rf $(OBJS)
