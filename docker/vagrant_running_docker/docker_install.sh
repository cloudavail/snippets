#!/bin/bash

# references:
# http://blog.docker.com/2014/04/docker-in-ubuntu-ubuntu-in-docker/

apt-get -y install docker.io

# pull a specific docker image
docker.io pull ubuntu:14.04

# run a command within docker
# docker.io run -t -i ubuntu:14.04 /bin/bash
# docker.io run -t -i ubuntu:14.04 /bin/ls -la