#!/usr/bin/env python

# objective: script will run for script_run_time seconds, during which time if
# a signal interupt is caught then the script will proceed with "script_interupted"
# and then exit with code 1

import time

def script_interupted():
	print '\nInterrupt Caught, exiting with return code 1.'
	exit(1)


script_run_time = 15

try:
    for seconds in range(script_run_time):
        print 'Run for {seconds!s} seconds'.format (seconds=seconds)
        time.sleep(1)
except KeyboardInterrupt:
	script_interupted()

