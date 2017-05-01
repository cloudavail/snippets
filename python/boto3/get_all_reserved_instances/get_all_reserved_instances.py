#!/usr/bin/env python

import boto3

ec2_client = boto3.client('ec2')

reserved_instances_filters = [ { 'Name': 'state', 'Values': [ 'active' ] } ]
reserved_instance_results = ec2_client.describe_reserved_instances(Filters=reserved_instances_filters)

print reserved_instance_results['ReservedInstances']
