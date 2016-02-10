#!/bin/bash

apt-get -y update
# install the nginx webserver
apt -y install nginx
apt-get -y install php5-fpm

cp /vagrant/etc/nginx/sites-available/default /etc/nginx/sites-available/default

service php5-fpm restart
service nginx restart

mv /var/www/html /var/www/html.bak
ln -s /vagrant/php_site /var/www/html

# request a page:
# http://localhost:8080/index.php