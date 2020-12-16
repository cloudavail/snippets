# Overview

This snippet describes how to launch a Sumologic Docker file collector.

# Run

docker run --volume $(pwd)/logs:/tmp/clogs --env SUMO_ACCESS_ID='' --env SUMO_ACCESS_KEY='' sumologic/collector:latest-file
