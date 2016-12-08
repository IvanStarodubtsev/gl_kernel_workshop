horses=$(shell nproc)

PWD		= $(realpath .)

SUBMODULE	?= .

export BUILD_KERNEL	= $(PWD)/cache/kernel
export BUILD_ROOTFS	= $(PWD)/cache/buildroot

all: update config rootfs kernel

update: $(SUBMODULE)
	git submodule update --init --recursive $<

config:
	cd buildroot && make O=$(BUILD_ROOTFS) qemu_x86_defconfig
	cp -rvf buildroot-qemu-x86-config $(BUILD_ROOTFS)/.config

rootfs:
	cd $(BUILD_ROOTFS) && make -j$(horses)

rootfs-update:
	cd $(BUILD_ROOTFS) && make rootfs-ext2

kernel:
	cd linux-stable && make ARCH=i386 O=$(BUILD_KERNEL) defconfig
	cd $(BUILD_KERNEL) && make -j$(horses)

purge: clean
	cd $(BUILD_ROOTFS) && make distclean
	cd $(BUILD_KERNEL) && make distclean

clean:
	cd $(BUILD_ROOTFS) && make clean
	cd $(BUILD_KERNEL) && make clean

hello_printk:
	cd lesson2/hello_printk && make all

hello_printk_dep:
	cd lesson2/hello_printk_dep && make all

hello_printk_clean:
	cd lesson2/hello_printk && make clean
	cd lesson2/hello_printk_dep && make clean

.PHONY: all update config purge rootfs rootfs-update clean kernel
.DEFAULT_GOAL=all
