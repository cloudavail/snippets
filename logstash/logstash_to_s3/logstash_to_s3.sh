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

cat > /etc/logstash/conf.d/output_to_s3.conf <<EOF
input {
  file {
    path => ["/var/log/*"]
  }
}
output {
  s3 {
    access_key_id => $AWS_ACCESS_KEY_ID
    secret_access_key => $AWS_SECRET_ACCESS_KEY
    endpoint_region => 'us-west-2'
    size_file => 2048
    bucket => 'logstashoutput.cloudavail.com'
  }
}
EOF

# /usr/share/logstash/bin/logstash --path.config /etc/logstash/conf.d/output_to_s3.conf --debug
