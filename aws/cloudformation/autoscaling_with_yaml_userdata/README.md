# Validate Stack
`aws cloudformation validate-template --template-body file://autoscaling_with_yaml_userdata.yaml`

# Create AutoScalingWithYAML Stack
`aws cloudformation create-stack --stack-name AutoScalingWithYAML --template-body file://autoscaling_with_yaml_userdata.yaml`
