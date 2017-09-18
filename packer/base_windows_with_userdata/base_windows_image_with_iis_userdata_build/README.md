# Validate Stack
`aws cloudformation validate-template --template-body file://vpc_for_base_windows_image.yaml`

# Create WindowsAWSBuild Stack
`aws cloudformation create-stack --stack-name VPCForWindowsBuild --template-body file://vpc_for_base_windows_image.yaml`

# 