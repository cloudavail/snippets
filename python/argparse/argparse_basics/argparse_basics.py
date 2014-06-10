#!/usr/bin/env python

# objective (1):
# accept an argument and print the passed parameter - this is run as
# result (1)
# ./argparse_basics.py --argument-one sf_giants
# sf_giants
# objective (2):
# accept an argument with no parameter - this is run as
# result (2)
# ./argparse_basics.py --argument-two
# True


import argparse


parser = argparse.ArgumentParser()
parser.add_argument('--argument-one', dest='argument_one', default='No Value')
parser.add_argument('--argument-two', default=False, action='store_true',
                    dest='argument_two')


args = parser.parse_args()


print args.argument_one
print args.argument_two
