#!/usr/bin/env python

import os
import logging
logger = logging.getLogger()
# cab set level of logging
# DEBUG, INFO, WARNING, ERROR, CRITICAL
# https://docs.python.org/3/howto/logging.html
logger.setLevel(logging.INFO)

# the name of this function must match the name of the function defined in serverless.yml
def hello(event, context):
    # TODO implement
    logger.info('## THIS IS info LEVEL')
    logger.info(event)
    return "Hello from Lambda"
    logger.debug('## THIS IS debug LEVEL')
    logger.debug(event)
    return "Hello from Lambda"
    logger.warning('## THIS IS warning LEVEL')
    logger.warning(event)
    return "Hello from Lambda"
    logger.error('## THIS IS error LEVEL')
    logger.error(event)
    return "Hello from Lambda"
    logger.critical('## THIS IS critical LEVEL')
    logger.critical(event)
    return "Hello from Lambda"

# allows the "handler" function to be called via command line
# so this can be run via either lambda or via ./hello_world.py
if __name__ == "__main__":
    handler()
