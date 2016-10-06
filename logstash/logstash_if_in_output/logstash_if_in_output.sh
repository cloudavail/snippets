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
# note (1) %{host} in this case is going to evaluate to "logstash"
# note (2) you'd almost /never/ do this as you could use some mechanism for dynamically naming files
# but there are cases where you'd need to do something similar
cat > /etc/logstash/conf.d/testing.conf <<EOF
input {
  file {
    path => [ "/var/log/*.log", "/var/log/audit/*.log", "/var/log/secure", "/var/log/secure" ]
  }
}
output {
  if [path] == "/var/log/yum.log" {
    file {
      path => "/var/log/logstash/%{host}/yum-%{+YYYY-MM-dd}.txt"
    }
  } else if [path] == "/var/log/messages" {
    file {
      path => "/var/log/logstash/%{host}/messages-%{+YYYY-MM-dd}.txt"
    }
  } else if [path] == "/var/log/secure" {
    file {
      path => "/var/log/logstash/%{host}/secure-%{+YYYY-MM-dd}.txt"
    }
  } else {
    file {
      path => "/var/log/logstash/%{host}/unknown-%{+YYYY-MM-dd}.txt"
    }
  }
}
EOF

# /opt/logstash/bin/logstash --config /etc/logstash/conf.d/testing.conf --debug
