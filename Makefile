

.PHONY: flakes tests clean docs build


all: build

build:
	make -C build

flakes:
	find -name "*.py" -print0 | xargs -0 pyflakes

test: tests

tests: all
	PYTHONPATH=src testify --summary --exclude-suite=disabled --verbose tests

clean:
	make -C build clean
	find . -iname '*.pyc' -delete

