#!/usr/bin/env python3

import boto3

client = boto3.client('sns')

topic_arn = 'arn:aws:sns:us-west-2:187376578462:cloudavail-test-sns-topic'
message_attributes = {
  'criticality': {'DataType': 'String', 'StringValue': 'CRITICAL' },
  'image': { 'DataType': 'String', 'StringValue': 'nginx' }
}

# https://docs.aws.amazon.com/AmazonECR/latest/userguide/ecr-eventbridge.html
response = client.publish(TopicArn=topic_arn, Message='{"aps": {"alert": "Check out the new!", "sound": "default"}, "category": {"type": "sports"}}', MessageStructure='json', MessageAttributes=message_attributes, Subject='ECR Image Scan')

# if criticality = detail.finding-severity-counts.CRITICAL > 0
# string match on critical: CRITICAL
# number greater than on vulnerabilities = 1
# string match on detail.scan_status = COMPLETE
