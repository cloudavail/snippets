# Validate CloudFormation for Web Application Firewall (WAF)

`aws cloudformation validate-template --template-body file://wafv2_with_elbv2_block_by_ip_set.yaml`

# Create a WAFv2WithCloudFront Stack

`aws cloudformation create-stack --stack-name wafv2-elbv2 --template-body file://wafv2_with_elbv2_block_by_ip_set.yaml`

# Update a WAFv2WithCloudFront Stack with a Change-Set

`aws cloudformation create-change-set --stack-name wafv2-elbv2 --change-set-name wafv2-change-set-$(date +%s) --template-body file://wafv2_with_elbv2_block_by_ip_set.yaml`

# Update a WAFv2WithCloudFront Stack

`aws cloudformation update-stack --stack-name wafv2-elbv2 --template-body file://wafv2_with_elbv2_block_by_ip_set.yaml`

# Delete a WAFv2WithCloudFront Stack

`aws cloudformation delete-stack --stack-name wafv2-elbv2`
