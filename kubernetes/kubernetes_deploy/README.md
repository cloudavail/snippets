# Overview

The objective of this snippet is to create a a kubernetes-deployment template that:

1. Sets a ConfigMap for a particular application.
2. Runs a pre-deploy container.
3. Performs a deployment

# Create Require Namespace

`kubectl apply -f config/namespaces/dev.yaml`

# Run Kubernetes Deploy

## Set Variables

- `export ENVIRONMENT='dev'`
- Create or Determine the Current Deployment sha `commit_sha=$(git rev-parse HEAD)`
- `export REVISION=$commit_sha`
- `export KUBECONFIG=~/.kube/config`

## Deploy!

`kubernetes-deploy $ENVIRONMENT minikube`
