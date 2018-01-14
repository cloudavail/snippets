#!/usr/bin/env python
import logging
import my_module

# provide a tutorial for understanding how a logger can be used to enable
# logging in an imported module
# to test - simply change the level set on the root logger
# example
# logger.setLevel(logging.DEBUG)
# becomes
# logger.setLevel(logging.WARNING)
# 
#
# create a root logger - creating a logger by itself would fail - there is no handler for the logger yet
logger = logging.getLogger()
# sets the log level for this module AND all imported modules
logger.setLevel(logging.DEBUG)
# create a StreamHandler - this will output to console
console_handler = logging.StreamHandler()
# apply the console_handler to the root logger we just created - without this there is no output
logger.addHandler(console_handler)

module_name = __name__

logging.critical('Log message at CRITICAL from {}'.format(module_name))
logging.error('Log message at ERROR from {}'.format(module_name))
logging.warning('Log message at WARNING from {}'.format(module_name))
logging.info('Log message at INFO from {}'.format(module_name))
logging.debug('Log message at DEBUG from {}'.format(module_name))

# calls my_function that is contained within my_module
my_module.my_function()