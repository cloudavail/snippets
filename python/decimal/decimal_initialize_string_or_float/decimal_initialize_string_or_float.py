#!/usr/bin/env python

import decimal

print ''
number_as_float = 0.1
print 'number_as_float is class: {}'.format(number_as_float.__class__)
print 'Printed with no float formatting applied: {}'.format(number_as_float)
print 'Printed to 64 trailing digits: {:.64f}'.format(number_as_float)

number_as_decimal_from_float = decimal.Decimal(number_as_float)
print 'Printed after Decimal conversion: {}'.format(number_as_decimal_from_float)
print 'Notice the trailing 0\'s have been removed but the number remains a float conversion to decimal.'
print ''

number_as_string = '0.1'
print 'number_as_string is class: {}'.format(number_as_string.__class__)
print 'Printed with no formatting: {}'.format(number_as_string)
print 'Printed to 64 digits: {}'.format(number_as_string)
number_as_decimal_from_string = decimal.Decimal(number_as_string)
print 'Printed after Decimal conversion: {}'.format(number_as_decimal_from_string)
print ''

print 'Testing Multiplication with Floats'
number_as_float_multiplicand = 0.1
number_as_float_multiplier = 9999999999999999
number_as_float_product = number_as_float_multiplicand * number_as_float_multiplier
print '{:.12f}'.format(number_as_float_product)


print 'Testing Multiplication with Decimals'
number_as_decimal_multiplicand = decimal.Decimal('0.1')
number_as_decimal_multiplier = 9999999999999999
number_as_decimal_product = number_as_decimal_multiplicand * number_as_decimal_multiplier
print number_as_decimal_product
print ''