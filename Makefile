horses=$(shell nproc)

all: update qemu

config:
	cp -v qemux86-config buildroot/.config

update:
	git submodule update --init --recursive .

qemu: config
	cd buildroot && make -j$(horses)

purge:
	cd buildroot && make clean distclean

.PHONY: all update qemu config purge
.DEFAULT_GOAL=all
