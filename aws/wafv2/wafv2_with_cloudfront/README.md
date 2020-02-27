# Set Required Parameters

It appears that `AWS::WAFv2::WebACL` resources with the property `Scope: CLOUDFRONT` must be built in the `us-east-1` AWS region.

`export AWS_DEFAULT_REGION='us-east-1'`

# Validate CloudFormation for Web Application Firewall (WAF)

`aws2 cloudformation validate-template --template-body file://wafv2_with_cloudfront.yaml`

# Create a WAFv2WithCloudFront Stack

`aws2 cloudformation create-stack --stack-name wafv2-cloudfront --template-body file://wafv2_with_cloudfront.yaml`

# Update a WAFv2WithCloudFront Stack with a Change-Set

`aws2 cloudformation create-change-set --stack-name wafv2-cloudfront --change-set-name wafv2-change-set-$(date +%s) --template-body file://wafv2_with_cloudfront.yaml`

# Update a WAFv2WithCloudFront Stack

`aws2 cloudformation update-stack --stack-name wafv2-cloudfront --template-body file://wafv2_with_cloudfront.yaml`

# Delete a WAFv2WithCloudFront Stack

`aws2 cloudformation delete-stack --stack-name wafv2-cloudfront`