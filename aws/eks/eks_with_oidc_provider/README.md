# Overview

This document creates an EKS Cluster with OIDC Provider with an OIDC Provider. The OIDC Provider allows EKS Pods _within_ an EKS Cluster with OIDC Provider to, ultimately, issue AWS API commands to take actions such as creating load balancer.

# Notes

The specific purpose of this template is to create an OIDC Provider for an EKS, which some documentation suggests be created with the `eksctl` tool. This snippet can potentially be used to remove this requirement.

# Create, Update and Delete an EKS Cluster with OIDC Provider with an OIDC Provider

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://eks_with_oidc_provider.yaml`

## Create the VPC and EKS Cluster with OIDC Provider

`aws cloudformation create-stack --stack-name eks-with-oidc --capabilities CAPABILITY_IAM --template-body file://eks_with_oidc_provider.yaml`

## Update the VPC and EKS Cluster with OIDC Provider

`aws cloudformation update-stack --stack-name eks-with-oidc --capabilities CAPABILITY_IAM --template-body file://eks_with_oidc_provider.yaml`

## Delete the VPC and EKS Cluster with OIDC Provider

`aws cloudformation delete-stack --stack-name eks-with-oidc`

# Setup kubectl

`aws eks update-kubeconfig --name eks-with-oidc-provider`
