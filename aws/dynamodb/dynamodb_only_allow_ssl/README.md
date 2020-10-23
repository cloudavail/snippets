# Validate CloudFormation

`aws cloudformation validate-template --template-body file://dynamodb_only_allow_ssl.yaml`

# Create the DynamoDBOnlyAllowSSL

`aws cloudformation create-stack --stack-name dynamodb-ssl-only --capabilities CAPABILITY_IAM --template-body file://dynamodb_only_allow_ssl.yaml`

# Update the DynamoDBOnlyAllowSSL

`aws cloudformation update-stack --stack-name dynamodb-ssl-only --capabilities CAPABILITY_IAM --template-body file://dynamodb_only_allow_ssl.yaml`

# Delete the DynamoDBOnlyAllowSSL

`aws cloudformation delete-stack --stack-name dynamodb-ssl-only`
