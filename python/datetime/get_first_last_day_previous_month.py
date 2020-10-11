#!/usr/bin/env python3

import datetime

# get the very first day of the givem month
# subtract one microsecond
last_microsecond_of_prev_month = datetime.datetime.today().replace(day=1, hour=0, minute=0, second=0, microsecond=0) - datetime.timedelta(microseconds=1)
print(last_microsecond_of_prev_month)

first_microsecond_of_prev_month = datetime.datetime.today().replace(day=1, hour=0, minute=0, second=0, microsecond=0) - datetime.timedelta(days=last_microsecond_of_prev_month.day)
print(first_microsecond_of_prev_month)
