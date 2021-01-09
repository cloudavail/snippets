# Install Kubernetes Dashboard

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml`

`kubectl proxy`

`kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')`

`http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login`

# Deployment

- install with strict mTLS 
- install with permissive mTLS


# Install istio

```
curl -L https://git.io/getLatestIstio | sh
```

```
for i in install/kubernetes/helm/istio-init/files/crd*yaml ; do kubectl apply -f $i; done
```

`kubectl api-resources | grep istio`

`kubectl apply -f install/kubernetes/istio-demo.yam`

`./istioctl proxy-status`


# Helm Install

```
set global.controlPlaneSecurityEnabled=true \
set mixer.adapters.useAdapterCRDs=false \
set grafana.enabled=true set grafana.security.enabled=true \
set tracing.enabled=true \
set kiali.enabled=true 
```