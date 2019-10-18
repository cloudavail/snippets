# Objective

The objective of this snippet is to create an ECS Service that utilizes AWS' Auto Scaling and Cloudwatch.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_service_autoscaling.yaml`

# Create the ECSwithServiceAutoscaling Stack

`aws cloudformation create-stack --stack-name ECSwithServiceAutoscaling --capabilities CAPABILITY_IAM --template-body file://ecs_with_service_autoscaling.yaml`

# Update the ECSwithServiceAutoscaling Stack

`aws cloudformation update-stack --stack-name ECSwithServiceAutoscaling --capabilities CAPABILITY_IAM --template-body file://ecs_with_service_autoscaling.yaml`

# Delete the ECSwithServiceAutoscaling Stack

`aws cloudformation delete-stack --stack-name ECSwithServiceAutoscaling`
