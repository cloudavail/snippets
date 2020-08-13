#!/usr/bin/env python3

# https://github.com/DavidMuller/aws-requests-auth

import requests
from aws_requests_auth.boto_utils import BotoAWSRequestsAuth

auth = BotoAWSRequestsAuth(aws_host='4f4ldfr0oe.execute-api.us-west-2.amazonaws.com',
                           aws_region='us-west-2',
                           aws_service='execute-api')


response = requests.get('https://4f4ldfr0oe.execute-api.us-west-2.amazonaws.com/test/iamauth', auth=auth)
print(response.request.headers)
print(response.content)
