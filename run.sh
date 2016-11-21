#!/bin/bash -evx

BR_KERNEL=buildroot/output/images/bzImage
BR_ROOTFS=buildroot/output/images/rootfs.ext2

qemu-system-i386	-nographic						\
			-M pc							\
			-boot c							\
		 	-kernel $BR_KERNEL					\
		 	-drive file=$BR_ROOTFS,if=virtio,format=raw 		\
		 	-append "root=/dev/vda rw console=ttyS0,115200"		\
		 	-net nic,model=virtio -net user

