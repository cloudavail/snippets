#!/bin/bash

# objective:
# to output logs from Docker to splunk
splunk_token=""
# note that the Splunk URL may be different depending on the type of Splunk installation you are using.
# http://docs.splunk.com/Documentation/SplunkCloud/6.5.1/User/AdddatausingHTTPeventcollector
# in particular:
# for Splunk Light Cloud Instance: https://prd-p-32qdqp6x3ktt.cloud.splunk.com
# the HTTP Event Collector URL will prepend "input-" to the host part of the FQDN
# https://input-prd-p-32qdqp6x3ktt.cloud.splunk.com:8088/services/collector/event
splunk_url=""

# install Docker
apt -y install docker.io

docker pull nginx:latest
# the command below is described by:
# --log-driver=splunk = utilize the splunk log driver
# --log-opt splunk-token=$splunk_token = use the splunk token defined for the given HTTP Event Collector
# --log-opt splunk-url=$splunk_url = send events to the given URL
# NOTE: the below is strongly discouraged from Production systems
# --log-opt splunk-insecureskipverify=True = will disregard a fatal error if the certificate is self-signed
# https://docs.docker.com/engine/admin/logging/splunk/

docker run --log-driver=splunk --log-opt splunk-token=$splunk_token \
           --log-opt splunk-url=$splunk_url \
           --log-opt splunk-insecureskipverify=True \
           --name docker-nginx --detach --publish 8080:80 nginx
