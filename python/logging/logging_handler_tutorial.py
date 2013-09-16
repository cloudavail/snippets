#!/usr/bin/env python
import logging
 
# provide a template for working with a logging Handler
# provides statements at various log levels

# create a root logger - creating a logger by itself would fail - there is no handler for the logger yet
logger = logging.getLogger()
print 'The logger\'s name is ' + logger.name
print 'The logger\'s class is ' + str(logger.__class__)

# sets the level for the root logger to INFO
logger.setLevel(logging.INFO)
print 'The logger\'s level is ' + str(logger.level) + ' where log level is 0 to 50 - with 0 as unset and 50 as critical'

# creates a handler - in this case the StreamHanlder object outputs to std.err
console_handler = logging.StreamHandler()

# adds the console handler to the root logger object
logger.addHandler(console_handler)

# logs statements at various log levels for experimentation
logger.critical('This is a log at CRITICAL level')
logger.error('This is a log at ERROR level')
logger.warning('This is a log at WARNING level')
logger.info('This is a log at INFO level')
logger.debug('This is a log at DEBUG level')