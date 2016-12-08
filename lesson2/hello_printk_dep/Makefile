PWD	= $(realpath .)
obj-m 	+= hello_printk_dep.o

all:
	make -C $(BUILD_KERNEL) M=$(PWD) modules

clean:
	make -C $(BUILD_KERNEL) M=$(PWD) clean
