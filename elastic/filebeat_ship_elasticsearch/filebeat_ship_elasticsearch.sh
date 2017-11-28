#!/bin/bash

apt -y update
# https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html#install-elasticsearch
# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

# install the repository Public Signing Key for elastic.co Products
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# add the elastic.co Repository Definition
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt -y update


# install elasticsearch
# resolve issue where JAVA_HOME must be set
# without this: elasticsearch[2634]: could not find java; set JAVA_HOME or ensure java is in PATH
apt -y install default-jre
apt -y install elasticsearch
systemctl start elasticsearch
# confirm running properly: journalctl -u elasticsearch

# install filebeat
apt -y install filebeat

# /etc/filebeat/filebeat.yml
# from: https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-configuration.html
# move default configuration file out of place
mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.bak
cat > /etc/filebeat/filebeat.yml <<EOF
filebeat.prospectors:
- type: log
  enabled: true
  paths:
    - /var/log/*.log
output.elasticsearch:
  hosts: ["127.0.0.1:9200"]
EOF
systemctl start filebeat
# confirm running properly: journalctl -u filebeat
# confirm data being sent:
# curl --request GET http://localhost:9200/_cat/indices
# should return similar to the following:
# yellow open filebeat-6.0.0-2017.11.28 YeS1h7BaQJikokH5O0ztNQ 5 1 2288 0 426.8kb 426.8kb
# return all documents: should be a small set because we just setup elasticsearch and filebeat in Vagrant
# curl --request GET http://localhost:9200/filebeat-6.0.0-2017.11.28/_search?size=1000&q=*:*
