#!/usr/bin/env bash

yum -y install ntp
# will set "NTP syncronized: yes" when viewed in timedatectl
ntpdate pool.ntp.org
# will set "NTP enabled: yes" when viewed in timedatectl
systemctl enable ntpd
systemctl start ntpd
# if you need to check ntpsettings
# timedatectl
