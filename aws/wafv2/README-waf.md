# Set Required Variables to run WAFv2

```
export AWS_DEFAULT_REGION='us-east-1'
```

# Validate CloudFormation for Web Application Firewall (WAF)

`aws cloudformation validate-template --template-body file://wafv2.yaml`

# Create a WAF Stack

`aws cloudformation create-stack --stack-name wafv2 --template-body file://wafv2.yaml`

# Update a WAF Stack with a Change-Set

`aws cloudformation create-change-set --stack-name wafv2 --change-set-name wafv2-change-set-$(date +%s) --template-body file://wafv2.yaml`

# Update a WAF Stack

`aws cloudformation update-stack --stack-name wafv2 --template-body file://wafv2.yaml`

# Delete a WAF Stack

`aws cloudformation delete-stack --stack-name wafv2`