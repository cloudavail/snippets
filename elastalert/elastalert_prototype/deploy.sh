#!/bin/bash

# install java and keyfile
apt -y install default-jre
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# install elasticsearch
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
apt -y update
apt -y install elasticsearch

systemctl start elasticsearch

apt -y install python-pip
pip install elastalert


mkdir -p /etc/elastalert
touch /etc/elastalert/config.yaml

mkdir -p /etc/elastalert/rules/
# assumed: must cd to directory with config.yaml file
cd /etc/elastalert
# python -m elastalert.elastalert --verbose --rule /etc/elastalert/rules/random_number.yaml