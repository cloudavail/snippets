# Overview

The objective of this snippet is to create a a kubernetes-deployment template that:

1. Sets a ConfigMap for a particular application.

# Usage

- `export ENVIRONMENT='dev'`
- Create or Determine the Current Deployment sha `commit_sha=$(git rev-parse HEAD)`
- `export REVISION=$commit_sha`
- `export KUBECONFIG=~/.kube/config`

kubernetes-deploy $ENVIRONMENT minikube

kubernetes-deploy <app's namespace> <kube context>

kubernetes-deploy default minikube
