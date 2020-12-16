#!/usr/bin/env python3

import boto3

client = boto3.client('sns')

topic_arn = 'arn:aws:sns:us-west-2:187376578462:cloudavail-test-sns-topic'
message = "{\"version\":\"0\",\"id\":\"5b428ae3-5382-55ac-696c-6ddbd2ed3df1\",\"detail-type\":\"ECR Image Scan\",\"source\":\"aws.ecr\",\"account\":\"187376578462\",\"time\":\"2020-09-28T02:09:54Z\",\"region\":\"us-west-2\",\"resources\":[\"arn:aws:ecr:us-west-2:187376578462:repository/cloudavail/ecr-with-scan-test\"],\"detail\":{\"scan-status\":\"COMPLETE\",\"repository-name\":\"cloudavail/ecr-with-scan-test\",\"image-digest\":\"sha256:794275d96b4ab96eeb954728a7bf11156570e8372ecd5ed0cbc7280313a27d19\",\"image-tags\":[\"latest\"],\"finding-severity-counts\":{\"INFORMATIONAL\":56,\"LOW\":16,\"UNDEFINED\":26}}}"

# https://docs.aws.amazon.com/AmazonECR/latest/userguide/ecr-eventbridge.html
response = client.publish(TopicArn=topic_arn, Message=message)

# if criticality = detail.finding-severity-counts.CRITICAL > 0
# string match on critical: CRITICAL
# number greater than on vulnerabilities = 1
# string match on detail.scan_status = COMPLETE
