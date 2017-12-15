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

# curl --request GET http://localhost:9200/filebeat-*/_search?size=1000&q=*:*
