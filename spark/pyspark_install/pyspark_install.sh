#!/bin/bash

# http://spark.apache.org/docs/latest/quick-start.html

# apt update
apt update
apt -y install default-jre
apt -y install python-pip
pip --no-cache-dir install pyspark
