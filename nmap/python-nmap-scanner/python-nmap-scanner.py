#!/usr/bin/env python3

import nmap

nm = nmap.PortScanner()
# -sn disable Port Scan (i.e. perform a "ping" scan)
hosts='192.168.200.0/24'

nm.scan(hosts=hosts, arguments='-sn')

for host in nm.all_hosts():
    print(host)
