# objective:
# create a docstring that produces valid sphinx output
# References:
# http://raxcloud.blogspot.com/2013/02/documenting-python-code-using-sphinx.html

# Run this one time:
# make html

import sys


def add(x, y):
    '''
    Given two numbers, returns the sum of these two numbers.

    Returns:

    - ``Result``: the sum of the two numbers.
    - ``False``: An error occurred

    CLI Example:

    .. code-block:: bash

        python ./basic_sphinx.py 2 2

    '''
    if x.isdigit() and y.isdigit():
        return int(x) + int(y)
    else:
        return False

addend_one = sys.argv[1]
addend_two = sys.argv[2]

result = add(addend_one, addend_two)

print result
