#!/bin/bash -evx

#BR_KERNEL=buildroot/output/images/bzImage
#BR_ROOTFS=buildroot/output/images/rootfs.ext2
BR_KERNEL=cache/kernel/arch/x86/boot/bzImage
BR_ROOTFS=cache/buildroot/images/rootfs.ext3

#qemu-system-i386	-nographic						\
#			-M pc							\
#			-boot c							\
#		 	-kernel $BR_KERNEL					\
#		 	-drive file=$BR_ROOTFS,if=virtio,format=raw 		\
#		 	-append "root=/dev/vda rw console=ttyS0,115200"		\
#		 	-net nic,model=virtio -net user


qemu-system-i386	-nographic						\
			-kernel $BR_KERNEL					\
			-append "root=/dev/sda rw console=ttyS0,115200"		\
			-hda $BR_ROOTFS						\
			-redir tcp:8022::22

