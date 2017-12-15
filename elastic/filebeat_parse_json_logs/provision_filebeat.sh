curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.0-amd64.deb
dpkg -i filebeat-6.1.0-amd64.deb

chmod 777 /var/log/
cat > /etc/filebeat/filebeat.yml << EOF
filebeat.prospectors:
- type: log
  enabled: true
  paths:
    - /var/log/benji-optimizer.log
processors:
 - decode_json_fields:
     fields: ['message']
     # merges fields into json root
     target: ""
     overwrite_keys: false
output.elasticsearch:
  hosts: ["127.0.0.1:9200"]
EOF

chmod go-w /etc/filebeat/filebeat.yml

service filebeat start
