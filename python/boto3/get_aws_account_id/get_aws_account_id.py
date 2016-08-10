#!/usr/bin/env python

import boto3

aws_client = boto3.client('iam')

user = aws_client.get_user()

# not required - printing the User object - just to see content of object
print 'User Object Content is below:'
print user

account_id = aws_client.get_user()['User']['Arn'].split(':')[4]

print 'Account ID is below:'
print account_id
