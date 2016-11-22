horses=$(shell nproc)

all: update qemu

config:
	cp -v qemux86-config buildroot/.config

update:
	git submodule update --init --recursive .

qemu: config
	cd buildroot && make -j$(horses)

purge: clean
	cd buildroot && make distclean

clean:
	cd buildroot && make clean

rootfs:
	#- rm -rvf buildroot/output/target/*
	cd buildroot && make rootfs-ext2

.PHONY: all update qemu config purge rootfs clean
.DEFAULT_GOAL=all
