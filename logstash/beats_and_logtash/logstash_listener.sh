#!/usr/bin/env bash

apt -y install default-jre

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/logstash/2.4/debian stable main" | sudo tee -a /etc/apt/sources.list
apt -y update
apt -y install logstash

cat > /etc/logstash/conf.d/beats_listener.conf <<EOF
input {
  beats {
    port => 5044
  }
}
output {
 file {
  path => "/var/log/from_beats_shipper.log"
 }
}
EOF

systemctl start logstash
