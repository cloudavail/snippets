#!/usr/bin/env python

import boto3

client = boto3.client('ce')

cost_and_usage_parameters = {
    'TimePeriod': {
        'Start': '2021-02-01',
        'End': '2021-03-01'
    },
    'Granularity': 'MONTHLY',
    'Filter': {
        'Dimensions': {
             'Key': 'SERVICE',
             'Values': [ 'AmazonCloudWatch' ],
             # 'Values': [ 'Amazon Elastic Block Store' ],
             # 'Values': [ 'Amazon Elastic Compute Cloud - Compute' ],
             'MatchOptions': [ 'EQUALS' ]
        }
    },
    'Metrics': [
        'UnblendedCost',
    ],
}

response = client.get_cost_and_usage(**cost_and_usage_parameters)

print(response)
