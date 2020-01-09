#!/usr/bin/python

import boto3

client = boto3.client('ecs')

response = client.run_task(
    cluster='ecs-cluster-ECSCluster-ENMU0REIYR5N',
    taskDefinition='ecs-cluster-ExampleTaskDefinition-1F5XYW6OB7U8G:1'
)
