#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE( "GPL" );
MODULE_AUTHOR( "Ivan Ivanov" );
MODULE_DESCRIPTION("A simple Linux driver");
MODULE_VERSION("0.1");

extern u16 shared_data;

static int __init hello_init( void ) {
      shared_data++;
      printk( "Hello, world! %d \n", shared_data);
      return 0;
}

static void __exit hello_exit( void ) {
      printk( "Goodbye, world! \n" );
}

module_init( hello_init );
module_exit( hello_exit );
