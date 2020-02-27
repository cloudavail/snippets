# Validate CloudFormation for Web Application Firewall (WAF)

`aws2 cloudformation validate-template --template-body file://wafv2_with_elbv2.yaml`

# Create a WAFv2WithCloudFront Stack

`aws2 cloudformation create-stack --stack-name wafv2-elbv2 --template-body file://wafv2_with_elbv2.yaml`

# Update a WAFv2WithCloudFront Stack with a Change-Set

`aws2 cloudformation create-change-set --stack-name wafv2-elbv2 --change-set-name wafv2-change-set-$(date +%s) --template-body file://wafv2_with_elbv2.yaml`

# Update a WAFv2WithCloudFront Stack

`aws2 cloudformation update-stack --stack-name wafv2-elbv2 --template-body file://wafv2_with_elbv2.yaml`

# Delete a WAFv2WithCloudFront Stack

`aws2 cloudformation delete-stack --stack-name wafv2-elbv2`
