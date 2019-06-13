# Overview
Running this template will create an IAM user with the ability to manage their own MFA device.

# Validate the Template

`aws cloudformation validate-template --template-body file://iam_manage_own_mfa.yaml`

# Create Required Variables

```
random_password=$(openssl rand -base64 24)
echo $random_password
```

# Launch the Template

`aws cloudformation create-stack --stack-name IAMMangeOwnMFA --parameters ParameterKey=IAMUserWithSelfManageMFAUserPassword,ParameterValue=$random_password --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_manage_own_mfa.yaml`

# Update the Template

`aws cloudformation update-stack --stack-name IAMMangeOwnMFA --parameters ParameterKey=IAMUserWithSelfManageMFAUserPassword,ParameterValue=$random_password --capabilities CAPABILITY_NAMED_IAM --template-body file://iam_manage_own_mfa.yaml`

# Test

Login URL: https://cloudavail.signin.aws.amazon.com/console (where $accountid is your account id)
Username: IAMUserWithManageMFA
Password: $random_password

There are multiple URLs where MFA devices can be managed:

IAM User URL: https://console.aws.amazon.com/iam/home?region=us-west-2#/users/IAMUserWithManageMFA - fails to render properly due to iam:ListUsers on resource: arn:aws:iam::187376578462:user/

If signed in as given user: https://console.aws.amazon.com/iam/home?region=us-west-2#/security_credentials
