# Overview

This snippet installs the [AWS Secrets Controller PoC](https://aws.amazon.com/blogs/containers/aws-secrets-controller-poc/) in a Kubernetes cluster using Helm.

# Create, Update and Delete an EKS Cluster

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://eks_introduction.yaml`

## Create the VPC and EKS Cluster

`aws cloudformation create-stack --stack-name eks-introduction --capabilities CAPABILITY_NAMED_IAM --template-body file://eks_introduction.yaml`

## Update the VPC and EKS Cluster

`aws cloudformation update-stack --stack-name eks-introduction --capabilities CAPABILITY_NAMED_IAM --template-body file://eks_introduction.yaml`

## Delete the VPC and EKS Cluster

`aws cloudformation delete-stack --stack-name eks-introduction`

# Configure kubectl

## Configure the kubectl Config File (Tool Assistted Method)

Run the following `aws eks update-kubeconfig --name eks-introduction`.

# Test EKS Cluster Configuration

## Confirm Node Registration

Run `kubectl get nodes`

## Confirm Additional Pods Running

Healthy worker nodes run a number of pods - launching these pods requires node registration.

Run: `kubectl get pods --namespace kube-system`

## Troubleshooting

### Node Registration Failure:

1. Confirm Proper Node Registration Authentication. See step "Configure Kubernetes to Allow Node Registration"
2. Review Logs `journalctl -u kubelet.service`

# Add AWS Secret Controller

## Add Helm Repository

`helm repo add secret-inject https://aws-samples.github.io/aws-secret-sidecar-injector/`

## Install the AWS Secret Controller

`helm install secret-inject secret-inject/secret-inject`

## Confirm the aws-secret-inject Webhook was Installed

`kubectl get mutatingwebhookconfiguration`

Should return:

```
NAME                            WEBHOOKS   AGE
aws-secret-inject               1          26s
istio-sidecar-injector          1          4h36m
pod-identity-webhook            1          5h45m
vpc-resource-mutating-webhook   1          5h45m
```

# Configure an Application

## Create a Role

`aws iam create-role --role-name nginx-secrets-role --assume-role-policy-document file://trust.json`

## 