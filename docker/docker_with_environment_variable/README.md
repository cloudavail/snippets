# Overview

This snippet attempts to create a Docker Image where the environment variable `TZ` is always set to `UTC`.

# Build Image

`docker build . -t docker_env_set`

# Run Image

`docker run -it docker_env_set /bin/bash`

# Understand Configuration

If you run `docker inspect` you can see the "Env" section contains the following:

```
"Env": [
    "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "TZ=UTC"
],
```
