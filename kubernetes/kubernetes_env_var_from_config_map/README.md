# Overview

This snippet will:

1. Create a Kubernetes configmap.
2. Create a running container.
3. Utilize the configmap to expose environment variables to a container.

# Create a ConfigMap

- Upload configmap: `kubectl apply -f configmap/development.yaml`
- Confirm uploaded: `kubectl describe configmap env-variables-configmap`

# Run Container

`kubectl apply -f pods/nginx.yaml`

# Login to Container, Echo Environment Variables

- Login to Container: `kubectl exec -it nginx /bin/bash`
- Once Logged In: `echo $ENVIRONMENT` and `echo $LOG_LEVEL`