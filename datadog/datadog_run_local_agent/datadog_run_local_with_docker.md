# Overview

This snippet describes how to run a local DataDog agent in Docker. Note for when running locally: the
collection of data has not yet been tested. 

#Prerequisites

1. Have a DataDog [API Key](https://app.datadoghq.com/organization-settings/api-keys)

# Running

## Run agent

```
docker run --publish 8126:8216 --env DD_API_KEY=<DATADOG_API_KEY> datadog/agent 
```
# Confirming

Confirm that the container is successfully running:

```
docker ps
```

Expected output for a successful run: 
1. _datadog/agent_ under the **Image** column 
2. _(healthy)_ under the **Status** column. 

# References

1. DataDog’s [Docker Agent Documentation](https://docs.datadoghq.com/agent/docker)