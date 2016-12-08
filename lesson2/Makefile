# all needed makefile vars will be exported during call of sub-target

PWD	= $(realpath .)
obj-m 	+= 	hello_printk/hello_printk.o \
		hello_printk_dep/hello_printk_dep.o

all:
	make -C $(BUILD_KERNEL) M=$(PWD) modules

clean:
	make -C $(BUILD_KERNEL) M=$(PWD) clean
