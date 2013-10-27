#!/usr/bin/env python

# objective: perform two unit tests, return success/failure of entire suite
# objective: publish an xunit unit test report
# objective: publish 2 packages of tests

# reference: http://showmedo.com/videotutorials/video?name=2840000&fromSeriesID=284

import logging
import platform
import sys
import unittest

logging.basicConfig(level='WARNING')

class Tests(unittest.TestCase):
    # methods must begin with "test" in order to be executed
    def test_hostname(self):
        logging.info('test_hostname Test Called')
        user_defined_hostname = 'my_hostname'
        script_defined_hostname = return_hostname()
        self.assertEqual(user_defined_hostname, script_defined_hostname)

    # methods must begin with "test" in order to be executed
    def skip_test_hostname(self):
        logging.info('skip_test_hostname Test Called')
        self.assertEqual(user_defined_hostname, script_defined_hostname)

    # methods must begin with "test" in order to be executed
    def test_executable_name(self):
        logging.info('return_executable_name Test Called')
        user_defined_executable_name = './basic_unittest.py'
        script_defined_executable_name = return_executable_name()
        self.assertEqual(user_defined_executable_name, script_defined_executable_name)


def return_executable_name():
    logging.info('return_executable_name method called')
    exectuable_name = sys.argv[0]
    return exectuable_name


def return_hostname():
    logging.info('return_hostname method called')
    hostname = platform.uname()[1]
    return hostname


exectuable_name = return_executable_name()
hostname = return_hostname()

# unittest.main() runs unit tests
unittest.main()
