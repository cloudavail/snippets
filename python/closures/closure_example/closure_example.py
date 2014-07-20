#!/usr/bin/env python

# objective: create and explain closures and free variables

def add_x(x):
    def adder(num):
        # closure:
        # adder is a closure
        #
        # free variable:
        # x is a free variable
        # x is not defined within "adder" - if "x" was defined within adder
        # if would be local and would be printed by "local()"
        # x is not a parameter, either, only "num" is passed in
        return x + num
    return adder

add_5 = add_x(5)
# sets add_5 equal to the return value of add_x(5)
# the return value of add_x(5) is a function
# that returns x (which we defined as 5) + an num
#
#    def adder(num):
#        return 5 + num
#
# add_5 is a function
print 'add_5 is a {}.'.format(add_5.__class__)
print add_5(10)

# and another example, generating a function "add_10" with the x
# variable closed over
add_10 = add_x(10)
print 'add_10 is a {}.'.format(add_10.__class__)
print add_10(21)
# the functions add_5 and add_10 have closed over the "x"
# which is bound for each function
