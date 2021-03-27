#!/usr/bin/env python3

import datetime

today = datetime.date.today()
print('Today is: {}'.format(today))
# date.weekday() returns the current weekday as an integer
# Return the day of the week as an integer, where Monday is 0 and Sunday is 6.
# For example, date(2002, 12, 4).weekday() == 2, a Wednesday. See also isoweekday().
print('today.weekday is: {}'.format(today.weekday()))
last_monday = today - datetime.timedelta(days=today.weekday())
print('Last Monday is: {}'.format(last_monday))
