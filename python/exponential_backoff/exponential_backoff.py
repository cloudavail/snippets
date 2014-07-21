#!/usr/bin/env python
# objective - write a simple function that waits an exponentially increasing
# amount of time before calling another function
# although simple, the backoff timed_wait function can be used to throttle
# or wait for requests from a third party service such as AWS

from time import sleep


def function():
    print 'function called'


def timed_wait(base=2, retries=0):
    # wait = time to wait, in seconds if a whole number
    wait = 1
    time_waited = 0
    retry_number = 0
    while retry_number < retries:
        print 'retry number {!s}.'.format(retry_number)
        wait_for = (wait * (base ** retry_number))
        print 'waiting for {!s} seconds.'.format(wait_for)
        sleep(wait_for)
        time_waited += wait_for
        function()
        retry_number += 1

# if base=2, queries will be run every 1, 2, 4, 8 and 16 seconds
# if base=3, queries will be run every 1, 3, 9, 27 and 81 seconds
timed_wait(base=2, retries=5)
