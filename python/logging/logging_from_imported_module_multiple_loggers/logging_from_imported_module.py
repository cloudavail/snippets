#!/usr/bin/env python
import logging
import my_module

logging.basicConfig()
# logging.basicConfig() _or_ adding a handler is required to avoid the following error:
# No handlers could be found for logger "root"
logger = logging.getLogger()

logger.critical('Log message at CRITICAL')
logger.error('Log message at ERROR')
logger.warning('Log message at WARNING')
logger.info('Log message at INFO')

# calls my_function that is contained within my_module
my_module.my_function()
