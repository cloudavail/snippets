# Overview
This stack provides infrastructure which limits data egress _only_ to a specific AWS S3 Bucket.

1. Creates a Security Group that allows access _only_ to given VPC endpoint.
2. Configures the given VPC endpoint to allow access _only_ to a given S3 bucket (named "Access Allowed").
3. Creates a second S3 bucket (named "Access Denied") - which allows testing if these restrictions are written properly.

# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_endpoint_with_controlled_egress_via_allowed_route.yaml`

# Create VPCEndpointToS3Only Stack
`aws cloudformation create-stack --stack-name VPCEndpointToS3Only --capabilities CAPABILITY_IAM --template-body file://vpc_endpoint_with_controlled_egress_via_allowed_route.yaml`

# Test

If testing using CentOS (which this stack currently uses) you'll need to install:

1. epel-release
2. awscli
3. bind-utils

# Test - No Internet Connectivity

1. Login to server, `curl http://www.google.com` - should fail with a timeout.

# Test - access to S3 Buckets

## Test Access to an Allowed S3 Bucket

Test Command: `aws s3 ls vpcendpointtos3only-alloweds3bucket-4y2qk5vwec0g`
Expected Result: a list of the objects in the given bucket, if any.

## Test Access to a Denied S3 Bucket

Test Command: `aws s3 ls vpcendpointtos3only-denieds3bucket-1tasoj8tbu9wf`
Exepected Result: `An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied`

# Debug

If needed, you can view the debug output from a given command by running `aws s3 ls vpcendpointtos3only-alloweds3bucket-4y2qk5vwec0g --debug`