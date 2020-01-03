#!/bin/bash -

echo "BLACKFIRE_SERVER_ID: $BLACKFIRE_SERVER_ID"
echo "BLACKFIRE_SERVER_TOKEN: $BLACKFIRE_SERVER_TOKEN"

yum update
yum -y install php php-fpm
yum -y install httpd

cat > /var/www/html/phpinfo.php <<EOF
<?php
  phpinfo();
?>
EOF

setenforce Permissive
getenforce

yum -y install wget
wget -O - "http://packages.blackfire.io/fedora/blackfire.repo" | sudo tee /etc/yum.repos.d/blackfire.repo 
yum -y install blackfire-agent 

blackfire-agent --register \
  --server-id=${BLACKFIRE_SERVER_ID} \
  --server-token=${BLACKFIRE_SERVER_TOKEN}

yum -y install blackfire-php

systemctl restart blackfire-agent
systemctl restart php-fpm
systemctl restart httpd
