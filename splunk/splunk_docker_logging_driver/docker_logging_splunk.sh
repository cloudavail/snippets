#!/bin/bash

# objective:
# to output logs from Docker to splunk
splunk_token=""
splunk_url=""

# install Docker
apt -y install docker.io

docker pull nginx:latest
# the command below will:
# utilize the splunk log driver
# configure the splunk log driver to send data to a splunk instance
# run a docker container running nginx
# publish that port to the "host" system
# more info:
# https://docs.docker.com/engine/admin/logging/splunk/

# test availability of port?
# curl --insecure $splunk_url

docker run --log-driver=splunk --log-opt splunk-token=$splunk_token \
           --log-opt splunk-url=$splunk_url \
           --name docker-nginx --detach --publish 8080:80 nginx
