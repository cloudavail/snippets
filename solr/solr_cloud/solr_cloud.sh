#!/bin/bash

version="5.5.5"

sudo apt-get -y update

# SOLRO 5.5.5 requires 1.8 or 1.9 - will not work with new versions of Java
# You will need the Java Runtime Environment (JRE) version 1.7 or higher
# You will need the JDK to run bin/solr start
apt-get -y install openjdk-8-jdk

# Install instructions from:
# https://cwiki.apache.org/confluence/display/solr/Installing+Solr
curl --output solr-${version}.tgz http://archive.apache.org/dist/lucene/solr/${version}/solr-${version}.tgz
tar zxf solr-${version}.tgz
cd solr-${version}/

# Run Solr
# https://cwiki.apache.org/confluence/display/solr/Running+Solr
touch server/logs/solr.log
# get IP address of enp0s8 interface
ip_address=$(ip -4 address show dev enp0s8 | grep inet | awk '{print $2}' | cut -d '/' -f 1)
bin/solr start -z 192.168.50.19:2181 -h $ip_address
