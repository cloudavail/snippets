#!/bin/bash

apt -y update
apt -y install apache2
a2enmod ssl
a2ensite default-ssl.conf
service apache2 reload
