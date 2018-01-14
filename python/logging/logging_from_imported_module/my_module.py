#!/usr/bin/env python
import logging

#__name__ evaluates to the name of the module that contains __name__
module_name = __name__

def my_function():
	# logs messages at each log level
    logging.critical('Log message at CRITICAL from {}'.format(module_name))
    logging.error('Log message at ERROR from {}'.format(module_name))
    logging.warning('Log message at WARNING from {}'.format(module_name))
    logging.info('Log message at INFO from {}'.format(module_name))
    logging.debug('Log message at DEBUG from {}'.format(module_name))
