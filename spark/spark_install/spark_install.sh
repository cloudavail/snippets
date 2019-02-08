#!/bin/bash

# python, default-jre is required to run ./bin/pyspark
apt update
apt -y install default-jre python

# http://spark.apache.org/docs/latest/quick-start.html
wget -O /var/tmp/spark-2.4.0-bin-hadoop2.7.tgz http://apache.mirrors.pair.com/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
cd /var/tmp
tar xf spark-2.4.0-bin-hadoop2.7.tgz
cd spark-2.4.0-bin-hadoop2.7

# install requirements for using Spark Standalone Applications
apt update
apt -y install python-pip
pip --no-cache-dir install pyspark

# install tools required to use s3a File System
# note that dependencies for hadoop-aws seem to be defined via the following page:
# https://hadoop.apache.org/docs/r2.7.3/hadoop-aws/dependency-analysis.html
# it is likely possible to put JAR files in the following directories instead of the downloaded install
# I don't know how I feel about installing JAR files in a directory that should be modifiable by a tool such as python pip
# as an example - if you pip install pyspark, then add JAR files to pyspark/jars/* and then
# pip uninstall pyspark, pip install pyspark you'll likely have different outcomes
# /usr/local/lib/python2.7/dist-packages/pyspark/conf:/usr/local/lib/python2.7/dist-packages/pyspark/jars/*
apt -y install maven
mvn dependency:get -Dartifact=com.amazonaws:aws-java-sdk:1.7.4:jar
mvn dependency:copy -Dartifact=com.amazonaws:aws-java-sdk:1.7.4:jar -DoutputDirectory=/var/tmp/spark-2.4.0-bin-hadoop2.7/jars
mvn dependency:get -Dartifact=org.apache.hadoop:hadoop-aws:2.7.3:jar
mvn dependency:copy -Dartifact=org.apache.hadoop:hadoop-aws:2.7.3:jar -DoutputDirectory=/var/tmp/spark-2.4.0-bin-hadoop2.7/jars
