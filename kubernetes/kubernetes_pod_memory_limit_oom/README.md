# Overview

This snippet is copied from https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/. The snippet will most likely cause an OOM condition that is handled by the Linux operating system itself (although it is also possible that this snippet could cause an pod eviction). I suspect that you _really_ want to see Kubernetes evict a pod, not the Linux operating system itself kill a pod.

# Run the Pod

kubectl apply -f mem_stress.yaml
