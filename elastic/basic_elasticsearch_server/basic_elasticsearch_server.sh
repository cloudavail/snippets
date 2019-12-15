# https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# add the elastic.co Repository Definition
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
apt-get update && apt-get install elasticsearch

systemctl restart elasticsearch
