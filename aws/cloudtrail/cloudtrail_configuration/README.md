# Overview
The CloudFormation file `cloudtrail_configuration.yaml` in this directory will create an S3 bucket to receive CloudTrail events and configure a "Global" CloudTrail to receive events from _all_ AWS Regions.

# Validate the Template

`aws cloudformation validate-template --template-body file://cloudtrail_configuration.yaml`

# Create a CloudTrail Trail
`aws cloudformation create-stack --stack-name CloudTrailEnabled --template-body file://cloudtrail_configuration.yaml --region us-west-2`