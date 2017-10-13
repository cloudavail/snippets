#!/usr/bin/env python

# objective:
# given Decimal format numbers in python
# one number with a single digit fractional part (10.0)
# one number with a three digit fractional part (10.000)
# one number with three digit fractional part (10.006)
# print numbers that are expressed as currency:
# case 1: 10.00
# case 2: 10.00
# case 3: 10.00 with the third digit of the fractional part removed
# case 4: 10.01 with the third digit of the fractional part utilized to "round up"

from decimal import Decimal
from jinja2 import Environment
from jinja2 import FileSystemLoader


env = Environment(loader=FileSystemLoader('my_templates'))
decimals_template = env.get_template('jinja2_decimal_formatting.j2')

decimals = { 'case_one': Decimal('10.0'),
             'case_two': Decimal('10.000'),
             'case_three': Decimal('10.006'),
             'case_four': Decimal('10.006') }

decimals_rendered = decimals_template.render(decimals=decimals)

print(decimals_rendered)