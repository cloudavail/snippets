#!/bin/bash

apt update
apt -y install default-jdk
# resolve issue with certificates when using aws-java-sdk classes
# apt-get -y install ca-cacert

cd /usr/local/bin

# note: file download is 203 MB
wget --quiet https://www-us.apache.org/dist/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz
tar xf hadoop-3.2.0.tar.gz
ln -s /usr/local/bin/hadoop-3.2.0 /usr/local/bin/hadoop

# note: the value __hadoop-x.y.z reflects the /lowest/ version of hadoop that must be installed
# __hadoop-1.0.0 means any version /newer/ than version 1 - although I do not know if
# this includes version 2.0 of hadoop
# __hadoop-2.0.4 /may/ mean any version of hadoop newer than 2.0.4
wget --quiet https://www-us.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
tar xf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
ln -s /usr/local/bin/sqoop-1.4.7.bin__hadoop-2.6.0/bin/sqoop /usr/local/bin/sqoop
cd /var/tmp/
wget --quiet https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.38.tar.gz
tar xf mysql-connector-java-5.1.38.tar.gz
cp /var/tmp/mysql-connector-java-5.1.38/mysql-connector-java-5.1.38-bin.jar /usr/local/bin/sqoop-1.4.7.bin__hadoop-2.6.0/lib/

# Copy required libraries into existing Classpath
# I could find no method of modifying classpath when running sqoop
# modifying $HADOOP_CLASSPATH an option - but making this change not viable because I'm not sure what changing it does
cp /usr/local/bin/hadoop-3.2.0/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.375.jar /usr/local/bin/sqoop-1.4.7.bin__hadoop-2.6.0/lib/
cp /usr/local/bin/hadoop-3.2.0/share/hadoop/tools/lib/hadoop-aws-3.2.0.jar /usr/local/bin/sqoop-1.4.7.bin__hadoop-2.6.0/lib/

# set environment variables required to run sqoop
cat > /etc/profile.d/hadoop_env_variables.sh <<EOF
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export HADOOP_HOME=/usr/local/bin/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_COMMON_HOME/bin
export PATH=$PATH:$HADOOP_COMMON_HOME/sbin
EOF
source /etc/profile.d/hadoop_env_variables.sh
