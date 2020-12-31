# Overview

This snippet will create a pod and expose a configmap as environment variables.

# Create a Base64 Encoded Secrets File

`cat secrets.txt | base64`

And copy the output into the file `secrets.yaml`

# Launch

```
kubectl apply -f secrets.yaml
kubectl apply -f pod.yaml
```

# Test

The test below will login to the ubuntu container and run the `env` command.

`kubectl exec ubuntu -- cat /etc/secret/secrets.yaml`

Expected outcome:

```
{
  "host": "db01.cloudavail.com:3306",
  "dbname": "cloudavail",
  "username": "cloudavail",
  "password": "hsdfjkshdjk"
}
```
