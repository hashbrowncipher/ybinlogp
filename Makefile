

.PHONY: flakes tests clean docs build install modules


all: build

build: modules
	make -C build all

debug:
	make -C build debug

modules:
	/usr/bin/python2.7 -m compileall src/ybinlogp/

install:
	make -C build install

flakes:
	find -name "*.py" -print0 | xargs -0 pyflakes

test: tests

tests: all
	LD_LIBRARY_PATH=build \
	PYTHONPATH=src \
	testify --summary --exclude-suite=disabled --verbose tests

clean:
	make -C build clean
	find . -iname '*.pyc' -delete
