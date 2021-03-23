# Overview

The CloudFormation file `eks_cluster.yaml` in this directory will create a basic MSK cluster.

# Create/Update/Delete an MSK Cluster

## Set Variables as Required:
Example variables are provided below:

```
export AWS_PROFILE='cloudavail'
environment=dev # or stg, prd, etc
```

## Validate Template

`aws cloudformation validate-template --template-body file://eks_cluster.yaml`

## Create a eks-cluster Stack

`aws cloudformation create-stack --stack-name eks-cluster-$environment --parameters ParameterKey=Environment,ParameterValue=$environment --capabilities CAPABILITY_NAMED_IAM --template-body file://eks_cluster.yaml`

## Create an eks-cluster Change Set

`aws cloudformation create-change-set --stack-name eks-cluster-$environment  --parameters ParameterKey=Environment,ParameterValue=$environment  --capabilities CAPABILITY_NAMED_IAM --change-set-name eks-cluster-$environment-$(date +%s) --template-body file://eks_cluster.yaml`

## Update a eks-cluster Stack

`aws cloudformation update-stack --stack-name eks-cluster-$environment --parameters ParameterKey=Environment,ParameterValue=$environment  --capabilities CAPABILITY_NAMED_IAM --template-body file://eks_cluster.yaml`

## Delete a eks-cluster Stack

`aws cloudformation delete-stack --stack-name eks-cluster-$environment`

## Notes and References

### Administration Issues

The initial creator of the EKS Cluster is assigned permissions that are not defined in the `aws-auth` `configmap` file. AWS is not clear on guidance if the cluster should be created using a specific IAM user or using a role which different users could assume.

### Outstanding Tagging Issues

There are a number of issues presently outstanding where particular resources are not tagged:

- [Apply Tags to EKS created security group](https://github.com/aws/containers-roadmap/issues/977)
- [Give EC2 instances a Name tag](https://github.com/aws/containers-roadmap/issues/781)
- [Nodegroup should support tagging ASGs](https://github.com/aws/containers-roadmap/issues/608)
- [Support for tags in Cloudformation](https://github.com/aws/containers-roadmap/issues/506)
- [EKS Cluster Tagging Propagation](https://github.com/aws/containers-roadmap/issues/374)

# Enable EKS Cluster Logging

Amazon EKS control plane logging provides audit and diagnostic logs directly from the Amazon EKS control plane to CloudWatch Logs in your account.

```
aws eks --region us-west-2 update-cluster-config --name eks-${environment} \
--logging '{"clusterLogging":[{"types":["api","controllerManager","scheduler"],"enabled":true}]}'
```

## Reference

[Amazon EKS User Guide: Amazon EKS control plane logging](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)

# Add EKS Cluster to local Kube Config

`aws eks --region us-west-2 update-kubeconfig --name eks-${environment}`

# Add IAM User Authentication

See document here: https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html

`kubectl describe configmap -n kube-system aws-auth`

- cp aws-auth-cm.yaml ./aws-auth-cm-dev.yaml

- enter IAM Instance ROLE from output of `kubectl describe configmap -n kube-system aws-auth`

`kubectl apply -f aws-auth-cm-${environment}.yaml`

# Install the [AWS LoadBalancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/)

One note: the AWS LoadBalancer Controller IAM Policy document is actually created within the file `./eks_cluster.yaml`.

## Set Variables as Required:
Example variables are provided below:

```
export AWS_PROFILE='cloudavail' # or 'cloudavail'
environment=dev # or stg, prd, etc
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
echo $AWS_ACCOUNT_ID
```

## Configure IAM

### Create IAM OIDC Provider

```
eksctl utils associate-iam-oidc-provider \
  --region us-west-2 \
  --cluster eks-${environment} \
  --approve
```

### Attach the AWS LoadBalancer Controller IAM Policy to the aws-load-balancer-controller

```
eksctl create iamserviceaccount \
  --cluster=eks-${environment} \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::${AWS_ACCOUNT_ID}:policy/EKSAWSLoadBalancerControllerPolicy-${environment} \
  --override-existing-serviceaccounts \
  --approve
```

## Install the AWS LoadBalancer Controller using Helm

### Add the AWS EKS Charts Repository to Helm

```
helm repo add eks https://aws.github.io/eks-charts
```

### Add the AWS LoadBalancer Controller CRDS

```
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
```

### Upgrade or Install the AWS LoadBalancer Controller

```
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=eks-${environment} --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller
```

Note that the above command is copied from (eks-charts)[https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controllereks-charts]. This command is modified such that the Helm chart _does not_ try to create the `iamserviceaccount` which was previously created using `eksctl`.

### Create a Fargate Profile (shouldn't need this if not using Fargate)
```
eksctl create fargateprofile --cluster eks-dev --region us-west-2 --name nginx --namespace default
```

### Deploy to EKS
```
kubectl apply -f nginx-ingress.yaml
```

### Verify Ingress resource was created
```
kubectl get ingress/ingress-nginx -n nginx
```

## Reference

See instructions at: https://kubernetes-sigs.github.io/aws-load-balancer-controller/latest/deploy/installation/

# Notes and References

## Administration Issues

The initial creator of the EKS Cluster is assigned permissions that are not defined in the `aws-auth` `configmap` file. AWS is not clear on guidance if the cluster should be created using a specific IAM user or using a role which different users could assume.

## Outstanding Logging Issues

- [[EKS] Cloudformation support for control plane logging and endpoint access control](https://github.com/aws/containers-roadmap/issues/242)

## Outstanding Tagging Issues

There are a number of issues presently outstanding where particular resources are not tagged:

- [Apply Tags to EKS created security group](https://github.com/aws/containers-roadmap/issues/977)
- [Give EC2 instances a Name tag](https://github.com/aws/containers-roadmap/issues/781)
- [Nodegroup should support tagging ASGs](https://github.com/aws/containers-roadmap/issues/608)
- [Support for tags in Cloudformation](https://github.com/aws/containers-roadmap/issues/506)
- [EKS Cluster Tagging Propagation](https://github.com/aws/containers-roadmap/issues/374)
