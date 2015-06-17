VPATH := ../src
SOURCES := $(wildcard *.c *.h)
TARGETS := libybinlogp.so.1 libybinlogp.so ybinlogp

prefix := /usr

CFLAGS += -Wall -ggdb -Wextra --std=c99 -pedantic
LDFLAGS += -L.

# Enable for debugging
debug: CFLAGS += -DDEBUG
debug: all

all: $(TARGETS)

ybinlogp: ybinlogp.o libybinlogp.so
	gcc $(CFLAGS) $(LDFLAGS) -o $@ $< -lybinlogp

libybinlogp.so: libybinlogp.so.1
	ln -fs $< $@

libybinlogp.so.1: libybinlogp.o
	gcc $(CFLAGS) $(LDFLAGS) -shared -Wl,-soname,$@ -o $@ $^

libybinlogp.o: libybinlogp.c ybinlogp-private.h
	gcc $(CFLAGS) $(LDFLAGS) -c -fPIC -o $@ $<

clean:
	rm -f $(TARGETS) *.o

ybinlogp.o: ybinlogp.c ybinlogp.h

install: $(TARGETS)
	install -d $(DESTDIR)/usr/bin $(DESTDIR)/usr/lib $(DESTDIR)/usr/lib/python2.7/dist-packages/ybinlogp
	install libybinlogp.so* $(DESTDIR)/usr/lib
	install ybinlogp $(DESTDIR)/usr/bin
	install $(VPATH)/ybinlogp/*.py* $(DESTDIR)/usr/lib/python2.7/dist-packages/ybinlogp
