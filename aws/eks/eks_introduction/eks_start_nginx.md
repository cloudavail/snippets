# Create or Update the nginx Deployment

## Create the nginx Deployment

Run: `kubectl apply -f application_definitions/nginx_deployment.yaml`

## Confirm Running

Confirm that `kubectl get deployment` returns:
`NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   2         2         2            1           1m`

## Inspect the Deployment

`kubectl describe deployment nginx-deployment`

# Create or Update the nginx Service - no ELB

## Create the nginx Service

`kubectl apply -f application_definitions/nginx_service.yaml`

## Confirm Service Creation

Confirm that `kubectl get service` returns:
`NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
kubernetes      ClusterIP   172.20.0.1      <none>        443/TCP   33m
nginx-service   ClusterIP   172.20.185.59   <none>        80/TCP    10s`

`kubectl describe service nginx-service`

The output of `kubectl describe service nginx-service` should show:

- Type: ClusterIP
- IP: an IP address that "load balances" amongst multiple endpoints using kube-proxy
- Endpoints: a comma seperated list of IP:Port values where all Kubernetes workers that are running the nginx service are listed. Example: `Endpoints: 10.0.0.101:80,10.0.0.233:80`


## Confirm Service Running and Configured Properly

### Examine IP Tables Configuration

IP Tables should be updated with the "ClusterIP" shown in the previous step.

Run `iptables-save` - this will dump the entire IP Tables configuration to screen. The "IP" show as a result of `kubectl describe service nginx-service` should be listed as follows:
`-A KUBE-SERVICES -d 172.20.185.59/32 -p tcp -m comment --comment "default/nginx-service: cluster IP" -m tcp --dport 80 -j KUBE-SVC-GKN7Y2BSGW4NJTYL`

### Curl Endpoints:

For the "IP" and "Endpoint:Port" combinations you should be able to curl and get a return from nginx. Examples:

curl 172.20.185.59
curl 10.0.0.102
curl 10.0.0.233

# Create or Update the nginx Service - with ELB

## Create the nginx Service - with ELB

Run: `kubectl apply -f application_definitions/nginx_service_with_elb.yaml`

# Reference
- https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
