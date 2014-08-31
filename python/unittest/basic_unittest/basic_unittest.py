#!/usr/bin/env python

# objective: perform two unit tests, return success/failure of entire suite
# objective: publish an xunit unit test report
# objective: publish 2 packages of tests

# reference: http://showmedo.com/videotutorials/video?name=2840000&fromSeriesID=284

import logging
import platform
import sys
import unittest

# change log level to level=INFO and run to better understand program flow
logging.basicConfig(level='WARNING')


# return_executable_name is one of the functions to be tested
def return_executable_name():
    logging.info('return_executable_name function called')
    exectuable_name = sys.argv[0]
    return exectuable_name


# return_hostname is one of the functions to be tested
def return_hostname():
    logging.info('return_hostname function called')
    hostname = platform.uname()[1]
    return hostname


class Tests(unittest.TestCase):
    # methods must begin with "test" in order to be executed
    # as the below method begins with "skip_" it will not be run
    def skip_test_hostname(self):
        user_defined_hostname = 'my_hostname'
        script_defined_hostname = return_hostname()
        logging.info('skip_test_hostname Test Called')
        self.assertEqual(user_defined_hostname, script_defined_hostname)

    def test_hostname(self):
        logging.info('test_hostname Test Called')
        user_defined_hostname = 'my_hostname'
        script_defined_hostname = return_hostname()
        self.assertEqual(user_defined_hostname, script_defined_hostname)

    def test_executable_name(self):
        logging.info('return_executable_name Test Called')
        user_defined_executable_name = './basic_unittest.py'
        script_defined_executable_name = return_executable_name()
        self.assertEqual(user_defined_executable_name, script_defined_executable_name)


# unittest.main() runs unit tests
unittest.main()
