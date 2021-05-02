# Overview

This document describes how to install the CloudWatch agent to collect prometheus metrics and ship to both _CloudWatch Logs and CloudWatch Metrics_ . There are _at least_ three types of metrics that the CloudWatch agent can collect:

- kubernetes
- metrics
- prometheus (this configuration is in the file `cwagent_in_fargate_with_metrics.yaml` and within the `prometheus-cwagentconfig` ConfigMap and within the section `cwagentconfig.json:logs:metrics_collected:prometheus`).

These metrics are shipped to _CloudWatch Logs_ (as json format logs) and, optionally, _CloudWatch Metrics_.

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

# Test CloudWatch Agent Shipping

## CloudWatch Agent Prometheus Metrics

By default, CloudWatch agent sends these metrics to CloudWatch Logs. Our particular configuration will send these metrics to the Log Group `/aws/containerinsights/eks-introduction/prometheus`.

## CloudWatch Agent Metrics

This snippet has also configured the CloudWatch agent to send metrics to CloudWatch Metrics. These metrics are available within the namespace `ContainerInsights/Prometheus`. There are at least two areas that a user of the CloudWatch agent should look at to ensure proper delivery:

- CloudWatch Metrics: obviously, the metrics shipped from CloudWatch agent should be delivered to `ContainerInsights/Prometheus`.
- CloudWatch Logs: metrics that are shipped to CloudWatch Metrics are _also_ shipped to CloudWatch Logs. Metrics that are shipped to both CloudWatch Logs _and_ CloudWatch Metrics have a `CloudWatchMetrics` key within the message. An example is below:

```
{
    "CloudWatchMetrics": [
        {
            "Metrics": [
                {
                    "Name": "apiserver_request_total"
                }
            ],
            "Dimensions": [
                [
                    "ClusterName",
                    "Service"
                ]
            ],
            "Namespace": "ContainerInsights/Prometheus"
        }
    ],
    "ClusterName": "eks-introduction",
    "Namespace": "default",
    "Service": "kubernetes",
    "Timestamp": "1619975763997",
    "Version": "0",
    "apiserver_request_total": 0,
    "code": "0",
    "component": "apiserver",
    "contentType": "application/json",
    "instance": "10.0.0.82:443",
    "job": "kubernetes-apiservers",
    "prom_metric_type": "counter",
    "resource": "endpoints",
    "scope": "cluster",
    "verb": "WATCH",
    "version": "v1"
}
{"CloudWatchMetrics":[{"Metrics":[{"Name":"apiserver_request_total"}],"Dimensions":[["ClusterName","Service"]],"Namespace":"ContainerInsights/Prometheus"}],"ClusterName":"eks-introduction","Namespace":"default","Service":"kubernetes","Timestamp":"1619975763997","Version":"0","apiserver_request_total":0,"code":"0","component":"apiserver","contentType":"application/json","instance":"10.0.0.82:443","job":"kubernetes-apiservers","prom_metric_type":"counter","resource":"endpoints","scope":"cluster","verb":"WATCH","version":"v1"}
```


# Troubleshooting Log Sending

To be written.
