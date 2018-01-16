#!/usr/bin/env python
import logging

#__name__ evaluates to the name of the module that contains __name__
logger = logging.getLogger(__name__)

def my_function():
    # logs messages at each log level
    print ('The parent of logger: {} is: {}'.format(logger.name, logger.parent.name))
    logger.critical('Log message at CRITICAL')
    logger.error('Log message at ERROR')
    logger.warning('Log message at WARNING')
    logger.info('Log message at INFO')
    logger.debug('Log message at DEBUG')
