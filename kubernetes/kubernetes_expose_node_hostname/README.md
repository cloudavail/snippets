# Overview

This snippet will:

1. Create a Kubernetes Pod that exposes the hostname of the container it is running on.

# Run Container

`kubectl apply -f pod_echo_node_hostname.yaml`

# Examine Logs

You'll need to wait for a while (Docker image has to be downloaded and pod has to start), then run:

`kubectl logs echo-node-hostname`
