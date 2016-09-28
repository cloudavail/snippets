#!/usr/bin/env bash

curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.3.1_amd64.deb
dpkg -i filebeat_1.3.1_amd64.deb

mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.bak

cat > /etc/filebeat/filebeat.yml<<EOF
filebeat:
  prospectors:
    -
      paths:
        - "/var/log/*.log"
output:
  logstash:
    hosts: ["192.168.2.5:5044"]
EOF

systemctl start filebeat.service 

# debugging
# write to stdout
# /usr/bin/filebeat -e -d "*" -c /etc/filebeat/filebeat.yml