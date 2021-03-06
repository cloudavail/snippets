# Create, Update and Delete an EKS Cluster

## Validate CloudFormation

`aws cloudformation validate-template --template-body file://eks_introduction.yaml`

## Create the VPC and EKS Cluster

`aws cloudformation create-stack --stack-name eks-introduction --capabilities CAPABILITY_IAM --template-body file://eks_introduction.yaml`

## Update the VPC and EKS Cluster

`aws cloudformation update-stack --stack-name eks-introduction --capabilities CAPABILITY_IAM --template-body file://eks_introduction.yaml`

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

# Troubleshooting

## Node Registration Failure:

1. Confirm Proper Node Registration Authentication. See step "Configure Kubernetes to Allow Node Registration"
2. Review Logs `journalctl -u kubelet.service`
