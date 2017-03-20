#!/usr/bin/env python

import boto3

# return a list of s3 buckets from a given account
def describe_all_instances(client):
    '''
    input: a boto3 client object
    output: a list of all ec2 ojects in a region
    '''
    print client._endpoint
    all_ec2_instances = []
    next_token = 'start'
    while next_token is not '':
        ec2_reponse = client.describe_instances()
        reservations = ec2_reponse['Reservations']
        for reservation in reservations:
            instance = reservation['Instances']
            all_ec2_instances.extend(instance)
        if 'NextToken' in ec2_reponse:
            next_token = ec2_reponse['NextToken']
        else:
            next_token = ''
    return all_ec2_instances


if __name__ == '__main__':
    # export AWS_PROFILE='profile_name'
    # export AWS_DEFAULT_REGION='us-west-2'
    client = boto3.client('ec2')
    all_instances = describe_all_instances(client)
    print all_instances
