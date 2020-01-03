# Run a Docker Container with Labels

`docker run --publish 80:80 --label name=nginx --label git_sha=b7fe0b6 --log-driver json-file --log-opt labels=name,git_sha nginx:latest`

# Confirm the Logs Have Labels Applied

`docker logs fbe131fc1d91 --details`
