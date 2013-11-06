#!/usr/bin/env python

import datetime

# Reference: http://docs.python.org/2/library/time.html

# Reference: http://docs.python.org/2/library/time.html

print 'Output of datetime.datetime.today(): {!s}'.format(datetime.datetime.today())
print 'Class of datetime.datetime.today(): {!s}'.format(datetime.datetime.today().__class__)
print ''
print 'Output of datetime.datetime.now(): {!s}'.format(datetime.datetime.now())
print 'Class of datetime.datetime.now(): {!s}'.format(datetime.datetime.now().__class__)
print ''
print 'Output of datetime.datetime.utcnow() with UTC timezone: {!s}'.format(datetime.datetime.utcnow())
print 'Class of datetime.datetime.utcnow(): {!s}'.format(datetime.datetime.utcnow().__class__)
print ''