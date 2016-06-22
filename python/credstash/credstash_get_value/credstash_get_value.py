#!/usr/bin/env python

import credstash

secret_value = credstash.getSecret('secret_key', region='us-west-2', table='credstash-table')

print secret_value
