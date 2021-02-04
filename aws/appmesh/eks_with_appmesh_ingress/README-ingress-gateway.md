# Resources

# Troubleshooting

Troubleshooting can follow a "request" flow process where each system in the flow is tested.

## Ingress Gateway Pod

```
colinjohnson@cjohnson07 eks_with_appmesh_egress % kubectl logs eks-with-appmesh-ingress-gw-7fdd8cd6d6-sv78w --namespace eks-with-appmesh-egress-namespace | grep 8088
[2021-02-01 01:13:09.929][1][info][upstream] [source/server/lds_api.cc:74] lds: add/update listener 'lds_ingress_0.0.0.0_8088'
```

## Nginx Service

### Health-Check via Proxy (i.e. proxy inside of mesh)

You can test the health of the nginx service by running the following:

```
kubectl proxy
http://127.0.0.1:8001/api/v1/namespaces/eks-with-appmesh-egress-namespace/services/nginx-service/proxy
```

Should return:

```
colinjohnson@cjohnson07 eks_with_appmesh_egress % curl http://127.0.0.1:8001/api/v1/namespaces/eks-with-appmesh-egress-namespace/services/nginx-service/proxy/ 
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

### Nginx Service Log Review

```
kubectl logs nginx-deployment-d46f5678b-cp72r envoy --namespace eks-with-appmesh-egress-namespace
```

# References

- https://github.com/aws/aws-app-mesh-examples/tree/master/walkthroughs/howto-k8s-ingress-gateway
- https://aws.amazon.com/blogs/containers/introducing-ingress-support-in-aws-app-mesh/
