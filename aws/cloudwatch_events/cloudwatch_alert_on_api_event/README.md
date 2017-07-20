# Overview
The CloudFormation file `cloudwatch_alert_on_api_event.yaml` in this directory will:

1. Create an S3 bucket to receive CloudTrail events
2. Configure a "Global" CloudTrail to receive events from _all_ AWS Regions
3. Configure one "Event Rule" per AWS Region - "Event Rules" only monitor events in one region.
4. Configure an SNS Topic in the given region - this allows email notifications.

# Validate the Template

`aws cloudformation validate-template --template-body file://cloudwatch_alert_on_api_event.yaml`

# Create a MonitorAPIEvents with CloudTrail

We only need to create one MonitorAPIEvents Stack that has CloudTrail - the othe

`aws cloudformation create-stack --parameters ParameterKey=CreateCloudTrail,ParameterValue=true --stack-name MonitorAPIEventsIncludeCloudTrail --template-body file://cloudwatch_alert_on_api_event.yaml --region us-west-2`

`aws cloudformation create-stack --stack-name MonitorAPIEvents --template-body file://cloudwatch_alert_on_api_event.yaml --region us-west-1`

`aws cloudformation create-stack --stack-name MonitorAPIEvents --template-body file://cloudwatch_alert_on_api_event.yaml --region us-east-1`

`aws cloudformation create-stack --stack-name MonitorAPIEvents --template-body file://cloudwatch_alert_on_api_event.yaml --region us-east-2`
