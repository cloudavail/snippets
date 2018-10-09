# Overview

This snippet will create a deployment where no more than one pod is ever running at a given time. The use case here is an instance of a single pod where _no more_ than one pod can be running at a time and where downtime can be tolerated.

# Perform a "Recreated" Deployment

- Create initial deployment running nginx:1.14: `kubectl apply -f nginx_114.yaml`
- Confirm 1.14 deployment running: `kubectl describe pods` should return one pod running `nginx:1.14`
- Update the deployment to nginx 1.15: `kubectl apply -f nginx_115.yaml`
- Expected behavior: nginx:1.14 pod is terminated, then nginx:1.15 pod is started - in the case of nginx, this can take between 5 and 10 seconds if the images are already present on machine.
- Confirm 1.15 deployment running: `kubectl describe pods` should return one pod running `nginx:1.15`

# Reference

- https://github.com/ContainerSolutions/k8s-deployment-strategies/tree/master/recreate
