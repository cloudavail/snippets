#!/usr/bin/env python3

from decimal import Decimal

print('Creating a number of type Integer')
integer = 12
print('Integer Value: {}'.format(integer))
print('Integer Class: {}'.format(integer.__class__))

print('Integer Formatted as Float {:.2f}'.format(integer))
print('Integer Can Not be Formatted as follows: {:.2d}')
print('Integer Formatted as Decimal: {:2d}'.format(integer))
print('')

print('Creating a number of type Float')
float_format_number = 12.00
print('Float Value: {}'.format(float_format_number))
print('Float Class: {}'.format(float_format_number.__class__))

print('Float Formatted as Float with Two Decimal Places {:.2f}'.format(float_format_number))
print('Float Formatted as Decimal: {:.2d}')
print('  This Results in the Following Error: ValueError: Unknown format code \'d\' for object of type \'float\'')
print('')

print('Creating a number of type Decimal')
decimal_format_number = Decimal('12.00')
print('Decimal Value: {}'.format(decimal_format_number))
print('Decimal Class: {}'.format(decimal_format_number.__class__))

print('Decimal Formatted as Float with Two Decimal Places {:.2f}'.format(decimal_format_number))


