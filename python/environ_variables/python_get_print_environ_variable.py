#!/usr/bin/env python

# objective: print environment variable

import os

print os.environ['MY_VAR']

# usage:
# export MY_VAR=apple
# ./python_get_print_environ_variable.py
# return:
# apple