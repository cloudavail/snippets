# Overview

This document describes the use of the "mount" option to mount a directory into a Docker container.

# Using Mount with Type=Bind

```
docker run -it --mount type=bind,source=$(pwd),target=/opt/test \
  ubuntu:latest /bin/bash
```
