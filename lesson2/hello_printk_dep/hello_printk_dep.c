#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE( "GPL" );
MODULE_AUTHOR( "Ivan Ivanov" );
MODULE_DESCRIPTION("A simple Linux driver");
MODULE_VERSION("0.1");

u16 shared_data = 0xf0f0;

EXPORT_SYMBOL(shared_data);

static int __init hello_init( void ) {
      printk( "Hello, world! %d \n", shared_data );
      shared_data++;
      return 0;
}

static void __exit hello_exit( void ) {
      printk( "Goodbye, world! \n" );
}

module_init( hello_init );
module_exit( hello_exit );
