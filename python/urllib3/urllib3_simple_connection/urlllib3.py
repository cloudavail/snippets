#!/usr/bin/env python3

import urllib3
http = urllib3.PoolManager()
request = http.request('GET', 'https://www.cloudavail.com/')
print(request.data)
