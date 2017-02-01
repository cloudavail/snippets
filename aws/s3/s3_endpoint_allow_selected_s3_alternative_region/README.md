# Validate Stacks
`aws cloudformation validate-template --template-body file://s3_endpoint_allow_specific_bucket.yaml`

`aws cloudformation validate-template --template-body file://s3_buckets_alternative_region.yaml`

# Create Stacks
`aws cloudformation create-stack --stack-name VPCwithS3Endpoint --parameters ParameterKey=ServerKeyName,ParameterValue=test --capabilities CAPABILITY_IAM --template-body file://s3_endpoint_allow_specific_bucket.yaml --region us-west-2`

`aws cloudformation create-stack --stack-name AltRegionS3Buckets --template-body file://s3_buckets_alternative_region.yaml --region us-west-1`

# Test

## us-west-2 Region Tests

- Should run correctly: `aws s3 ls cloudavail-allowed-us-west-2`
- Should fail with error:
  - `An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied` 
  - `aws s3 ls cloudavail-denied-us-west-2`

## us-west-1 Region Tests

- Should run correctly: `aws s3 ls cloudavail-allowed-us-west-1`
- Should fail with error:
  - `An error occurred (AccessDenied) when calling the ListObjects operation: Access Denied` 
  - `aws s3 ls cloudavail-denied-us-west-1`
