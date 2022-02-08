# Overview

This snippet describes how to run a local DataDog agent in Docker. Note for when running locally: the
collection of data has not yet been tested. 

#Prerequisites

1. Have a DataDog [API Key](https://app.datadoghq.com/organization-settings/api-keys?_gl=1*1idzuq7*_gcl_aw*R0NMLjE2NDM5MzY2NzAuQ2p3S0NBaUFsLTZQQmhCQ0Vpd0FjMkdPVkZBeXFIS2J0OEJxUGZRQjRSdV90MXYyNEJlNy1JTFJKaHlEX0cwdzZHNHNoU2RhMXBOcExSb0NBWHdRQXZEX0J3RQ..*_ga*MTcyNzYyMzc5OC4xNjQzODQzNzk3*_ga_KN80RDFSQK*MTY0NDI3MTAyOS4xMS4xLjE2NDQyNzM2OTkuMA..)

# Running

## Install Datadog Agent in Docker

```
docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=<DATADOG_API_KEY> gcr.io/datadoghq/agent:7
```
## Run agent

```
docker run --publish 8126:8216 --env DD_API_KEY=<DATADOG_API_KEY> datadog/agent 
```
# Confirming

Confirm that the container is successfully running:

```
docker ps
```

# References

1. DataDog’s [Docker Agent Documentation](https://docs.datadoghq.com/agent/docker/?tab=standard)