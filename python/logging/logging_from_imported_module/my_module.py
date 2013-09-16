#!/usr/bin/env python
import logging

#__name__ evaluates to the name of the module that contains __name__
module_name = __name__

def my_function():
	# logs messages at each log level
    logging.critical('Log message at CRITICAL from ' + module_name)
    logging.error('Log message at ERROR from ' + module_name)
    logging.warning('Log message at WARNING from ' + module_name)
    logging.info('Log message at INFO from ' + module_name)
    logging.debug('Log message at DEBUG from ' + module_name)