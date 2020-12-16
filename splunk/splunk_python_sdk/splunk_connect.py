#!/usr/bin/env python3

import splunklib.client as client

service = client.connect(
    host='prd-p-xxxxxxxxxxxx.cloud.splunk.com',
    port=8086,
    version=7.0,
    scheme='https',
    username='',
    password='')

print(service)
