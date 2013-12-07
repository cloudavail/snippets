#!/usr/bin/env python

# objective: use try/catch to identify if environment variable exists
import logging
import os

env_variable_not_exist = 'VARIABLE_NOT_EXIST'
env_variable_exists = 'USER'

try:
    my_variable = os.environ[env_variable_not_exist]
except KeyError as exception:
    logging.critical('Environment Variable {!s} must be set.'.format (env_variable_not_exist))
    print exception.__class__
    print dir(exception)
else:
    print 'env_variable_not_exist is {!s}'.format(env_variable_not_exist)

try:
    my_variable = os.environ[env_variable_exists]
except KeyError as exception:
    logging.critical('Environment Variable {!s} must be set.'.format (env_variable_not_exist))
    print exception.__class__
    print dir(exception)
else:
    logging.info('Environment Variable my_variable is: {!s}.'.format (env_variable_not_exist))
    print 'my_variable is {!s}'.format(my_variable)

