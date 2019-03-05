# Validate Stack
`aws cloudformation validate-template --template-body file://ssm_with_autoscaling_and_ec2_userdata.yaml`

# Create a SSMwithAutoScalingandEC2UserData Stack
`aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name SSMwithAutoScalingandEC2UserData --template-body file://ssm_with_autoscaling_and_ec2_userdata.yaml`

# Update a SSMwithAutoScalingandEC2UserData Stack
`aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name SSMwithAutoScalingandEC2UserData --template-body file://ssm_with_autoscaling_and_ec2_userdata.yaml`
