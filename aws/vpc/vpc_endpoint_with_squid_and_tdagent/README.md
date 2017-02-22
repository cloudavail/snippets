# Overview
This stack creates a Squid Proxy and allows s3 operations to go through this proxy.

# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_endpoint_with_squid_and_tdagent.yaml`

# Create EC2withFluentdShipS3 Stack
`aws cloudformation create-stack --stack-name EC2withFluentdShipS3 --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_squid_and_tdagent.yaml`

# Update EC2withFluentdShipS3 Stack
`aws cloudformation update-stack --stack-name EC2withFluentdShipS3 --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_squid_and_tdagent.yaml`
