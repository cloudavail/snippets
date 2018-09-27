# Overview

This snippet will provide understanding of how the `exec` liveness probe works in Kubernetes. The snippet is taken from https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#define-a-liveness-command. I've modified to use ubuntu for reasons of familiarity.

# Process of Liveness Probe

1. A pod will be launched.
2. The `touch` command will be used to create the file `/tmp/healthy`.
3. The `sleep` command will be used to create a period of 30 seconds of inactivity - during which the liveness probes will succeed.
4. The `rm -f` command will be used to remove the file `/tmp/healthy`.
5. The `sleep` command will be used to create a period of 600 seconds of inactivity - althogh the "liveness probe" should identify the failed pod within 5 seconds.

# Running

- Start Pod: `kubectl apply -f pod_liveness_probe_with_exec.yaml`
- Run `get pods`: `kubectl get pods` - you should see a pod running
- Run `describe pods`: `kubectl describe pods` 