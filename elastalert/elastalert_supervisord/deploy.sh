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
elastalert-create-index --host localhost --port 9200 --no-ssl --no-auth \
  --url-prefix '' --index elastalert_status --old-index ''

mkdir -p /etc/elastalert
mkdir -p /etc/elastalert/rules
mkdir -p /var/log/elastalert

cat > /etc/elastalert/config.yaml <<EOF
rules_folder: /etc/elastalert/rules/
run_every:
  seconds: 30
buffer_time:
  minutes: 15
es_host: 127.0.0.1
es_port: 9200
writeback_index: elastalert_status
EOF

curl --request POST 'http://localhost:9200/example' -d '{ "mappings": { "number": { "_timestamp" : { "enabled" : true } } } }'
# curl --request DELETE 'http://localhost:9200/example'
curl --request POST 'http://localhost:9200/example/number' -d '{ "value" : "1" }'
sleep 1
curl --request POST 'http://localhost:9200/example/number' -d '{ "value" : "2" }'
sleep 1
curl --request POST 'http://localhost:9200/example/number' -d '{ "value" : "3" }'
# curl --request GET 'http://localhost:9200/example/_search?pretty'

cat > /etc/elastalert/rules/config.yaml <<EOF
es_host: localhost
es_port: 9200
name: Example Rule
type: frequency
index: example
num_events: 1
timestamp_field: _timestamp
timestamp_type: unix
timeframe:
    seconds: 60
filter:
- term:
    value: "8"
alert:
- command
command: ["command"]
EOF


apt -y install supervisor
cat > /etc/supervisor/conf.d/elastalert.conf <<EOF
[supervisord]
logfile=/var/log/elastalert/supervisord.log
logfile_maxbytes=1MB
logfile_backups=2
loglevel=debug

[program:elastalert]
command = elastalert --config /etc/elastalert/config.yaml --debug
process_name=elastalert
autorestart=true
startsecs=15
stopsignal=INT
stopasgroup=true
killasgroup=true
stderr_logfile=/var/log/elastalert/stderr.log
stderr_logfile_maxbytes=5MB
EOF

service supervisor restart

supervisorctl restart elastalert