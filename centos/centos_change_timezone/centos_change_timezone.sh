#!/usr/bin/env bash

# list timezones:
# timedatectl list-timezones
# timezone files are stored in:
# /usr/share/zoneinfo/

date
ls -l /etc/localtime
timedatectl set-timezone America/Los_Angeles
ls -l /etc/localtime
date