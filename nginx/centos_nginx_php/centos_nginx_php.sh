#!/bin/bash

yum -y update
# install epel to allow the install of nginx
yum -y install epel-release
# install the nginx webserver
yum -y install nginx
# install php
yum -y install php php-fpm
# confirm php-fpm is install correctly by running
# ls -la /var/run/php-fpm

# a better option here is to disable this file
# and install your own file in
# /etc/nginx/conf.d/*
cp /vagrant/nginx.conf /etc/nginx/nginx.conf

cat > /usr/share/nginx/html/index.php <<EOF
<?php
phpinfo();
?>
EOF

# modify the php-fpm listener to listen on all IP addresses on port 9000
# the could be improved by listening on only a specific IP address
# or possibly by using a Unix socket as a listener instead
sed -i 's/listen =.*/listen = 9000/g' /etc/php-fpm.d/www.conf

/bin/systemctl restart nginx.service
/bin/systemctl restart php-fpm.service

# once complete, visit
# localhost:8080/index.php