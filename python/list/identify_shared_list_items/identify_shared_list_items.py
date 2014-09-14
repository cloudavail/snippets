#!/usr/bin/env python

from sets import Set

previous_instances = ['i-1234abcd', 'i-2345bcde', 'i-3456cdef', 'i-4567defg']
desired_purged_instances = ['i-1234abcd', 'i-2345bcde']


current_instances_success = ['i-3456cdef', 'i-4567defg']
current_instances_fail = ['i-1234abcd', 'i-4567defg']

if Set(current_instances_success).intersection(Set(desired_purged_instances)):
    print 'Fail - an Element was Common in Both Sets'
else:
    print 'Success'

if Set(current_instances_fail).intersection(Set(desired_purged_instances)):
    print 'Fail - an Element was Common in Both Sets'
else:
    print 'Success'
