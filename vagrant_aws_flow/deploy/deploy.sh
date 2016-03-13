#!/bin/bash
apt-get -y install apache2

mv /var/www/html/ /var/www/html.bak
ln -s /srv/vaf/html /var/www/html
