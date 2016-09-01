#!/bin/bash

# install java and keyfile
# required for both elasticsearch and logstash
apt -y install default-jre
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# install elasticsearch
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
apt -y update
apt -y install elasticsearch
# if needed: confirm status of elasticsearch
# systemctl status elasticsearch
service elasticsearch start

# install logstash
echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
apt -y update
apt -y install logstash
# configure logstash\
cat > /etc/logstash/conf.d/system_logs <<EOF
input {
  file {
    path => [ "/var/log/auth.log", "/var/log/syslog" ]
  }
}
output {
  elasticsearch {
    document_type => "system_logs"
    hosts => "http://127.0.0.1:9200"
    index => "elg"
  }
}
EOF

# test logstash by running manually
# /opt/logstash/bin/logstash -f /etc/logstash/conf.d/system_logs 
# curl 'http://localhost:9200/elg/_search?pretty=true&q=*:*'

# do not run usermod -a -G adm logstash on production system without
# evaluation of impact of change
usermod -a -G adm logstash
service logstash start

# install grafana latest
curl --silent --remote-name https://grafanarel.s3.amazonaws.com/builds/grafana_latest_amd64.deb
dpkg -i grafana_latest_amd64.deb
service grafana-server start
