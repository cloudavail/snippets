#!/usr/bin/env python
import logging
 
# objective: log at INFO level to file and WARNING level to console
# http://docs.python.org/2/howto/logging.html#logging-advanced-tutorial

# create logger
logger = logging.getLogger('simple_example')
logger.setLevel(logging.DEBUG)

# create console handler and set level to debug
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.WARNING)

# create console handler and set level to debug
file_handler = logging.FileHandler('./log_file_out.log')
file_handler.setLevel(logging.DEBUG)

# add console_handler to logger - this handler is added at WARNING level
logger.addHandler(console_handler)
# add file_handler to logger - this handler is added at DEBUG level
logger.addHandler(file_handler)

# 'application' code
logger.debug('debug message')
logger.info('info message')
logger.warn('warn message')
logger.error('error message')
logger.critical('critical message')