# Overview

The CloudFormation file `basic_msk_cluster.yaml` in this directory will create a basic MSK cluster.

# Validate Templates

`aws cloudformation validate-template --template-body file://basic_msk_cluster.yaml`

# Create a basic-msk-cluster Stack

`aws cloudformation create-stack --stack-name basic-msk-cluster --template-body file://basic_msk_cluster.yaml`

# Update a basic-msk-cluster Stack

`aws cloudformation update-stack --stack-name basic-msk-cluster --template-body file://basic_msk_cluster.yaml`


# Delete a basic-msk-cluster Stack

`aws cloudformation delete-stack --stack-name basic-msk-cluster`
