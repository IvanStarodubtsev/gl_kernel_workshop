#!/bin/bash

qemu-system-i386	-nographic 								\
			-boot c 								\
			-kernel buildroot/output/images/bzImage					\
			-drive 	file=buildroot/output/images/rootfs.ext2,format=raw,media=disk 	\
			-netdev user,id=vmnic -device virtio-net,netdev=vmnic			\
			-append "root=/dev/sda rw console=ttyS0 init=/sbin/init"

