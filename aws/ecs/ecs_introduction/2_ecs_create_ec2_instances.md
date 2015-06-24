# Overview:
This document details how to:

1. Create ECS EC2 Cluster Instances
2. Register these EC2 Cluster Instances with an ECS Cluster, Automatically

# Prerequisites:
You'll need to create an IAM Profile for your EC2 instance - in particular, this role will need to be able to perform particular ECS actions so that a given instance can be registered with your ECS cluster. The easiest method of cluster regisration is to create an IAM Profile. This will be detailed in a seperate set of steps.

1. IAM Profile ARN: `iam_profile_arn=arn:aws:iam::111111111111:instance-profile/ecsInstanceRole`
2. VPC ID: `vpc_id=vpc-a1b2c3d4`
3. Subnet ID: `subnet_id=subnet-a1b2c3d4`

# Create EC2 Instances for the Cluster

## Get the AMI for the EC2 Image
Amazon makes an "ECS Optimized" AMI for use with ECS. We will build two EC2 instances using this AMI. To get the AMI ID, you'll Use the `aws ec2 describe-images` command.

## Get Most Recent 2015 ECS Optimized AMI
`ecs_optimized_ami=$(aws ec2 describe-images --filters Name=name,Values=amzn-ami-2015.03.d-amazon-ecs-optimized --query 'Images[*]'.ImageId --output text)`

echo $ecs_optimized_ami

## Create an ECS Security Group

`ecs_security_group=$(aws ec2 create-security-group \
--group-name ngnix \
--description nginx \
--vpc-id $vpc_id)`

`aws ec2 authorize-security-group-ingress \
--group-id $ecs_security_group \
--protocol tcp \
--port 22 \
--cidr 0.0.0.0/0`

`aws ec2 authorize-security-group-ingress \
--group-id $ecs_security_group \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0`

## Create Two ECS Optimized Instances

`ec2_instance_ids=$(aws ec2 run-instances \
--image-id $ecs_optimized_ami \
--key-name prod \
--security-group-ids $ecs_security_group \
--instance-type t2.micro \
--subnet-id $subnet_id \
--count 2 \
--iam-instance-profile Arn=$iam_profile_arn \
--associate-public-ip-address \
--user-data file://ecs_agent_config.sh \
--query 'Instances[*]'.InstanceId --output text)`

## Want to See Some Magic?
Once these commands are run you can login to the newly created EC2 ECS optimized instances and confirm that they have registered with the ECS Service and your previously created cluster.

1. ssh Into Instance.
2. Run `less /var/log/ecs/ecs-agent.log.*`

# Reference:
1. http://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html