#!/usr/bin/env python3

# objective:
# list s3 buckets

import boto3

client = boto3.client('s3')

response = client.create_bucket(
    Bucket='string'
	)
print(response)
