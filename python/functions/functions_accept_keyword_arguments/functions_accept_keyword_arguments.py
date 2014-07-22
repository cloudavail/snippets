#!/usr/bin/env python

# if a keyword argument does not exist it must have a default argument
#
# keyword_alpha has no default value - failure to provide this keyword when
# calling my_function would result in a failure
#
# keyword_beta has a default value of 'watermelon' but this will be overwritten
# by the passed in value 'pineapple'


def my_function(positional_arg, keyword_alpha, keyword_beta='watermelon'):
    print positional_arg
    print keyword_alpha
    print keyword_beta


my_function('apple', keyword_alpha='orange', keyword_beta='pineapple')
