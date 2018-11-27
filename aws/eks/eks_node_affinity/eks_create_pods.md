# Create or Update the worker Deployment

## Create the worker Deployment

Run: `kubectl apply -f pod_definitions/worker_deployment.yaml`

## Confirm Running

Confirm that `kubectl get deployment` returns:
`NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
web-deployment   2         2         2            1           1m`

## Inspect the Deployment

`kubectl describe deployment worker-deployment`

# Create or Update the web Deployment

## Create the web Deployment

Run: `kubectl apply -f pod_definitions/worker_deployment.yaml`

## Confirm Running

Confirm that `kubectl get deployment` returns:
`NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
worker-deployment   2         2         2            1           1m`

## Inspect the Deployment

`kubectl describe deployment worker-deployment`
