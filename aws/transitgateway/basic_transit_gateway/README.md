# Overview

This document explains how to build a Transit Gateway in Cloudformation using the (AWS CLI)[https://aws.amazon.com/cli/].

# Manage an AWS Transit Gateway Stack

## Set your AWS Profile and AWS Region

```
export AWS_REGION='us-east-1'
export AWS_PROFILE='cloudavail'
```

## Validate the Cloudformation Template

```bash
aws cloudformation validate-template --template-body file://transit_gateway.yaml
```

## Create a Transit Gateway Stack

```bash
aws cloudformation create-stack --stack-name transit-gateway --template-body file://transit_gateway.yaml
```

## Create a Transit Gateway change-set

```bash
aws cloudformation create-change-set --stack-name transit-gateway --template-body file://transit_gateway.yaml --change-set-name transit-gateway-${environment}-change-set-$(date +%s)
```

## Update a Transit Gateway Stack (if needed)

```bash
aws cloudformation update-stack --stack-name transit-gateway --template-body file://transit_gateway.yaml
```

## Delete a Transit Gateway Stack

```bash
aws cloudformation delete-stack --stack-name transit-gateway-$environment
```

# Test an AWS Transit Gateway Stack

```
Internal A Facing Load Balancer[ec2-user@ip-10-0-2-100 ~]$ curl internal-trans-Inter-1QUQPO755UEOE-1544014398.us-east-1.elb.amazonaws.com
Internal A Facing Load Balancer[ec2-user@ip-10-0-2-100 ~]$ 
```
