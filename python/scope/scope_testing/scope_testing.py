#!/usr/bin/env python
# http://simeonfranklin.com/blog/2012/jul/1/python-decorators-in-12-steps/


def test_function():
    print 'test_function called'
    variable_in_local_scope = 'red'
    print variable_in_local_scope
    # the test_function() has access to variables in the global scope
    print variable_in_global_scope
    print locals()


variable_in_global_scope = 'orange'
# print globals returns only variable in global scope
print 'printing globals'
print globals()

print 'calling test_function'
test_function()
