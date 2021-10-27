# Overview

The purpose of this snippet is to run Redis Insight using docker.

# Starting the Redis Container and the Redis Insights Container

## Redis Container
`docker-compose up redis`

## Redis Insight Container
`docker-compose up redisinsight`

## Both 
`docker-compose up`

# Connecting to the Redis Container locally

`redis-cli -h localhost`

# Connecting to the Redis Insights App

Open a web browser and go to `localhost:8001`.
