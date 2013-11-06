#!/usr/bin/env python

import time


# Reference: http://docs.python.org/2/library/time.html
print 'Output of time(): {!s}'.format(time.time())
print 'Class of time(): {!s}'.format(time.time().__class__)
print ''
print 'Output of gmtime(): {!s}'.format(time.gmtime())
print 'Class of gmtime(): {!s}'.format(time.gmtime().__class__)
print ''
print 'Output of localtime(): {!s}'.format(time.localtime())
print 'Class of localtime(): {!s}'.format(time.localtime().__class__)
print ''
# time.timezone = 0 when timezone is UTC
# time.timezone = 28800 when timezone is Pacific Standard Time
print 'Output of time.timezone: {!s}'.format(time.timezone)
print 'Class of time.timezone: {!s}'.format(time.timezone.__class__)
