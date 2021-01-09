# Overview

This document describes how to install (istio)[https://istio.io/] on an AWS EKS Cluster.

# Installation Steps

Reference: https://istio.io/latest/docs/setup/install/helm/

```
kubectl create namespace istio-system
helm install -n istio-system istio-base manifests/charts/base
helm install --namespace istio-system istiod manifests/charts/istio-control/istio-discovery \
    --set global.hub="docker.io/istio" --set global.tag="1.8.1"
helm install --namespace istio-system istio-ingress manifests/charts/gateways/istio-ingress \
    --set global.hub="docker.io/istio" --set global.tag="1.8.1"
helm install --namespace istio-system istio-egress manifests/charts/gateways/istio-egress \
    --set global.hub="docker.io/istio" --set global.tag="1.8.1"
```

# Testing Installation

To be written.

# Debugging Steps

To be written.
