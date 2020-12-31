# Overview

This snippet will create a pod and expose a configmap as environment variables.

# Launch

```
kubectl apply -f configmap.yaml
kubectl apply -f pod.yaml
```

# Test

The test below will login to the ubuntu container and run the `env` command.

`kubectl exec ubuntu -- env`

Expected outcome:

```
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=ubuntu
ENVIRONMENT=development
LOG_LEVEL=warn
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
HOME=/root
```
