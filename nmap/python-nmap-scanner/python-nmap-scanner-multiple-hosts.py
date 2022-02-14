#!/usr/bin/env python3

import nmap

nm = nmap.PortScanner()
# -sn disable Port Scan (i.e. perform a "ping" scan)
# multiple networks can be scanned by utilizing a string containing multiple networks
hosts='192.168.200.0/25 192.168.200.128/25'
# the can above returns
# 192.168.200.1
# 192.168.200.11
# 192.168.200.113
# 192.168.200.240
# 192.168.200.3
nm.scan(hosts=hosts, arguments='-sn')

for host in nm.all_hosts():
    print(host)
