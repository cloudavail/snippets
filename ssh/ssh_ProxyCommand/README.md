# Overview
The objective of this set of files is to build infrastructure suitable for testing the use of an ssh Proxy.

# Validate the Template

`aws cloudformation validate-template --template-body file://sshProxyServers.cloudformation.json`

# Launch the Template

`aws cloudformation create-stack --stack-name sshProxy --parameters ParameterKey=KeyName,ParameterValue=sshProxy --template-body file://sshProxyServers.cloudformation.json`

# Setup an ssh Connection

bastion_public_ip=$(aws cloudformation describe-stacks --stack-name sshProxy --query 'Stacks[0].Outputs[?OutputKey==`BastionInstancePublicIp`].OutputValue' --output text)

target_private_ip=$(aws cloudformation describe-stacks --stack-name sshProxy --query 'Stacks[0].Outputs[?OutputKey==`TargetInstancePrivateIp`].OutputValue' --output text)

ssh -A -t ec2-user@$bastion_public_ip ssh ec2-user@$target_private_ip

# What is "-t" in this Example
When you specify a command to run (example: `ssh -A -t ec2-user@$bastion_public_ip 'ls -la') no pseudo-tty is allocated. The `-t` option in `ssh -A -t ec2-user@$bastion_public_ip ssh -A ec2-user@$target_private_ip` forces a pseudo-tty.


