# Overview

This snippet will create a pod and expose a configmap as environment variables.

# Launch

```
kubectl apply -f configmap.yaml
kubectl apply -f pod.yaml
```

# Test

The test below will login to the ubuntu container and run the `env` command.

`kubectl exec ubuntu -- cat /etc/config/config.yaml`

Expected outcome:

```
ENVIRONMENT: development
LOG_LEVEL: warn
```
