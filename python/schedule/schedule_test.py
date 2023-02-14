#!/usr/bin/env python3

import schedule
import time

def job_1_minute():
    print("Run 1x Minute")

def job_2_minute():
    print("Run Every 2 Minutes")

schedule.every(1).minutes.do(job_1_minute)
schedule.every(2).minutes.do(job_2_minute)

while True:
    schedule.run_pending()
    time.sleep(1)
