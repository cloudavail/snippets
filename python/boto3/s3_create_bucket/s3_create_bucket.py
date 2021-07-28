#!/usr/bin/env python3

# objective:
# create s3 bucket

import boto3

client = boto3.client('s3')

response = client.create_bucket(
    Bucket='string'
	)
print(response)
