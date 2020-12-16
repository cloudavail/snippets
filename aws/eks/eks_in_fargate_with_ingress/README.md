# Overview

This document creates an nginx container as an EKS Fargate task.

# Understanding

- a "Fargate Profile" specifies which pods should use Fargate when launched
- each profile can have 5 "selectors"
- pods running on Fargate must be in "private" subnets


# Create, Update and Delete an EKS Cluster

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://eks_in_fargate.yaml`

## Create the VPC and EKS Cluster

`aws cloudformation create-stack --stack-name eks-fargate --capabilities CAPABILITY_IAM --template-body file://eks_in_fargate.yaml`

## Update the VPC and EKS Cluster

`aws cloudformation update-stack --stack-name eks-fargate --capabilities CAPABILITY_IAM --template-body file://eks_in_fargate.yaml`

## Delete the VPC and EKS Cluster

`aws cloudformation delete-stack --stack-name eks-fargate`

# Setup kubectl

`aws eks update-kubeconfig --name EKSCluster-Cifzgz8kkQhz`

```
colinjohnson@cjohnson07 eks_in_fargate % kubectl get svc

NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   172.20.0.1   <none>        443/TCP   49m
```

# Run a Service

`kubectl apply -f nginx.yaml`
