#!/usr/bin/python

# objective:
# - create an IAM user
# - create an Access Key / Secret Key Pair
# - create an Inline Policy and Assign to a User

import boto3

aws_client = boto3.client('iam')

username = 'ec2_read_only'

# should format correctly
iam_user_policy = '{ "Version":"2012-10-17", "Statement":[ { "Effect":"Allow", "Action":"ec2:Describe*", "Resource":"*" }, { "Effect":"Allow", "Action":"elasticloadbalancing:Describe*", "Resource":"*" }, { "Effect":"Allow", "Action":[ "cloudwatch:ListMetrics", "cloudwatch:GetMetricStatistics", "cloudwatch:Describe*" ], "Resource":"*" }, { "Effect":"Allow", "Action":"autoscaling:Describe*", "Resource":"*" } ] }'

iam_user = aws_client.create_user(Path='/', UserName=username)
iam_user_credentials = aws_client.create_access_key(UserName=username)
iam_user_create_policy_result = aws_client.put_user_policy(UserName=username,
                                                           PolicyName='ec2_read_only',
                                                           PolicyDocument=iam_user_policy)

print 'Username: {}'.format(iam_user_credentials['AccessKey']['UserName'])
print 'Access Key: {}'.format(iam_user_credentials['AccessKey']['AccessKeyId'])
print 'Secret Key: {}'.format(iam_user_credentials['AccessKey']['SecretAccessKey'])
