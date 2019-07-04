# Objective

The objective of this snippet is to create an ECS Cluster that utilizes both a fluentd collector and a task/container that sends data to this image.

# Validate CloudFormation

`aws cloudformation validate-template --template-body file://ecs_with_fluentd_collector.yaml`

# Create the VPC and ECS Cluster
`aws cloudformation create-stack --stack-name ECSWithFluentdCollector --capabilities CAPABILITY_IAM --template-body file://ecs_with_fluentd_collector.yaml`


# Update the VPC and ECS Cluster
`aws cloudformation update-stack --stack-name ECSWithFluentdCollector --capabilities CAPABILITY_IAM --template-body file://ecs_with_fluentd_collector.yaml`

# Perform Tests

## Confirm fluentd Container is Listening

```
sudo yum -y install lsof
sudo lsof -i -P | grep 24224
```

Should return output similar to:

`docker-pr 4051     root    4u  IPv6  17873      0t0  TCP *:24224 (LISTEN)`


## Optional?

`aws ecs describe-container-instances --cluster ECSWithFluentdCollector-ECSCluster-19DKKKUPF07QE --container-instances 0306e95f-c0d4-439b-8594-5d415796add2 | grep -i log`


# Delete the VPC and ECS Cluster
`aws cloudformation delete-stack --stack-name ECSWithIAMTaskRole
