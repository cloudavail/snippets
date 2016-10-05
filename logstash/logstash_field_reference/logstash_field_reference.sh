#!/usr/bin/env bash

yum -y install java-1.8.0-openjdk

# install logstash
## install logstash repository
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
cat > /etc/yum.repos.d/logstash.repo <<EOF
[logstash-2.4]
name=Logstash repository for 2.4.x packages
baseurl=https://packages.elastic.co/logstash/2.4/centos
gpgcheck=1
gpgkey=https://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOF
# install logstash
yum -y install logstash

# create a testing file
# note that %{host} in this case is going to evaluate to "logstash"
cat > /etc/logstash/conf.d/testing.conf <<EOF
input {
  file {
    path => [ "/var/log/*.log" ]
  }
}
output {
  file {
    path => "/var/log/logstash/%{host}/test-%{+YYYY-MM-dd}.txt"
  }
}
EOF

# /opt/logstash/bin/logstash --config /etc/logstash/conf.d/testing.conf --debug
