#!/usr/bin/env bash

yum -y install java-1.8.0-openjdk

# install logstash
## install logstash repository
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cat > /etc/yum.repos.d/logstash.repo <<EOF
[logstash-5.x]
name=Elastic repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
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

# /usr/share/logstash/bin/logstash --path.config /etc/logstash/conf.d/testing.conf --log.level=debug
